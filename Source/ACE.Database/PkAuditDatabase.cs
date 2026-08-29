using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage;
using log4net;
using ACE.Database.Models.PkAudit;

namespace ACE.Database;

public class PkAuditDatabase
{
    private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

    private readonly ConcurrentQueue<object> queue = new ConcurrentQueue<object>();
    private CancellationTokenSource cts;
    private Task workerTask;

    private const int BatchSize = 50;
    private const int FlushIntervalMs = 1000;

    public bool Exists(bool retryUntilFound)
    {
        var config = Common.ConfigManager.Config.MySql.PkAudit;

        for (;;)
        {
            using (var context = new PkAuditDbContext())
            {
                try
                {
                    // Ensure database and tables are created if possible
                    context.Database.EnsureCreated();

                    log.InfoFormat("[DATABASE] Successfully ensured PK audit database {0} on {1}:{2}.", config.Database, config.Host, config.Port);

                    // Start background worker if not already running
                    StartWorker();

                    // Attempt one-time migration of existing PK state from shard DB into pk_player_state
                    try
                    {
                        MigrateFromShard();
                    }
                    catch (Exception ex)
                    {
                        log.Warn("PK audit migration from shard failed: " + ex.Message);
                    }

                    return true;
                }
                catch (Exception ex)
                {
                    log.Warn($"[DATABASE] PK audit DB check failed: {ex.Message}");
                }
            }

            log.Error($"[DATABASE] Attempting to reconnect to {config.Database} database on {config.Host}:{config.Port} in 5 seconds...");

            if (retryUntilFound)
                System.Threading.Thread.Sleep(5000);
            else
                return false;
        }
    }

    private void MigrateFromShard()
    {
        try
        {
            using (var shard = new ACE.Database.Models.Shard.ShardDbContext())
            {
                // Property type ids
                const ushort PlayerKillsPkType = (ushort)ACE.Entity.Enum.Properties.PropertyInt.PlayerKillsPk; // 208
                const ushort PlayerKillsPklType = (ushort)ACE.Entity.Enum.Properties.PropertyInt.PlayerKillsPkl; // 209
                const ushort PkLevelModifierType = (ushort)ACE.Entity.Enum.Properties.PropertyInt.PkLevelModifier; // 99
                const ushort PkTimestampType = (ushort)ACE.Entity.Enum.Properties.PropertyFloat.PkTimestamp; // 46

                // Get all character ids
                var chars = shard.Character.Select(c => c.Id).ToList();

                foreach (var charId in chars)
                {
                    int pk = 0;
                    int pkl = 0;
                    int pkLevelMod = 0;
                    double pkTimestamp = 0;

                    var intProps = shard.BiotaPropertiesInt.Where(x => x.ObjectId == charId && (x.Type == PlayerKillsPkType || x.Type == PlayerKillsPklType || x.Type == PkLevelModifierType)).ToList();
                    foreach (var p in intProps)
                    {
                        if (p.Type == PlayerKillsPkType)
                            pk = p.Value;
                        else if (p.Type == PlayerKillsPklType)
                            pkl = p.Value;
                        else if (p.Type == PkLevelModifierType)
                            pkLevelMod = p.Value;
                    }

                    var floatProp = shard.BiotaPropertiesFloat.FirstOrDefault(x => x.ObjectId == charId && x.Type == PkTimestampType);
                    if (floatProp != null)
                        pkTimestamp = floatProp.Value;

                    // Only insert if any value present
                    if (pk != 0 || pkl != 0 || pkLevelMod != 0 || pkTimestamp != 0)
                    {
                        var state = new PkPlayerState()
                        {
                            PlayerId = charId,
                            PlayerKillsPk = pk,
                            PlayerKillsPkl = pkl,
                            PkLevel = pkLevelMod,
                            PkTimestamp = pkTimestamp,
                            LastUpdated = DateTime.UtcNow
                        };

                        // Upsert immediately to ensure migration progress saved
                        try
                        {
                            using (var ctx = new PkAuditDbContext())
                            {
                                ctx.PkPlayerState.Update(state);
                                ctx.SaveChanges();
                            }
                        }
                        catch (Exception ex)
                        {
                            log.Warn($"Failed to upsert pk_player_state for {charId}: {ex.Message}");
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            log.Warn("Failed to migrate PK state from shard DB: " + ex.Message);
        }
    }

    private void StartWorker()
    {
        if (workerTask != null && !workerTask.IsCompleted)
            return;

        cts = new CancellationTokenSource();
        var token = cts.Token;
        workerTask = Task.Run(async () =>
        {
            var buffer = new List<object>(BatchSize);
            while (!token.IsCancellationRequested)
            {
                try
                {
                    buffer.Clear();
                    while (buffer.Count < BatchSize && queue.TryDequeue(out var item))
                        buffer.Add(item);

                    if (buffer.Count > 0)
                    {
                        await FlushBatchAsync(buffer);
                    }
                    else
                    {
                        await Task.Delay(FlushIntervalMs, token);
                    }
                }
                catch (OperationCanceledException) { break; }
                catch (Exception ex)
                {
                    log.Warn("PK audit background worker error: " + ex.Message);
                    await Task.Delay(FlushIntervalMs, token);
                }
            }

            // final flush
            try
            {
                var final = new List<object>();
                while (queue.TryDequeue(out var item))
                    final.Add(item);
                if (final.Count > 0)
                    FlushBatchAsync(final).GetAwaiter().GetResult();
            }
            catch (Exception ex)
            {
                log.Warn("PK audit final flush failed: " + ex.Message);
            }
        }, token);
    }

    public void Stop()
    {
        try
        {
            if (cts != null)
            {
                cts.Cancel();
                workerTask?.Wait(5000);
                cts.Dispose();
                cts = null;
            }
        }
        catch (Exception ex)
        {
            log.Warn("Error stopping PK audit worker: " + ex.Message);
        }
    }

    private async Task FlushBatchAsync(IEnumerable<object> items)
    {
        try
        {
            using (var context = new PkAuditDbContext())
            {
                foreach (var it in items)
                {
                    if (it is PkEvent pe)
                        context.PkEvent.Add(pe);
                    else if (it is TrophyAudit ta)
                        context.TrophyAudit.Add(ta);
                    else if (it is PkPlayerState ps)
                    {
                        // Upsert: Update will insert if not exist
                        context.PkPlayerState.Update(ps);
                    }
                }

                await context.SaveChangesAsync();
            }
        }
        catch (Exception ex)
        {
            log.Warn("Failed to flush PK audit batch: " + ex.Message);
            // if failed, re-enqueue items for retry
            foreach (var it in items)
                queue.Enqueue(it);
        }
    }

    public void WritePkEvent(PkEvent evt)
    {
        try
        {
            queue.Enqueue(evt);
        }
        catch (Exception ex)
        {
            log.Warn("Failed to enqueue PK event: " + ex.Message);
        }
    }

    public void WriteTrophyAudit(TrophyAudit audit)
    {
        try
        {
            queue.Enqueue(audit);
        }
        catch (Exception ex)
        {
            log.Warn("Failed to enqueue TrophyAudit: " + ex.Message);
        }
    }

    public void WritePlayerState(PkPlayerState state)
    {
        try
        {
            state.LastUpdated = DateTime.UtcNow;
            queue.Enqueue(state);
        }
        catch (Exception ex)
        {
            log.Warn("Failed to enqueue PkPlayerState: " + ex.Message);
        }
    }
}
