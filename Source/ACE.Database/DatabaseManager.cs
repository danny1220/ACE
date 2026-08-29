using System;
using System.Collections.Concurrent;

using Microsoft.EntityFrameworkCore;

using log4net;

namespace ACE.Database
{
    public static class DatabaseManager
    {
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        public static AuthenticationDatabase Authentication { get; } = new AuthenticationDatabase();

        public static WorldDatabaseWithEntityCache World { get; } = new WorldDatabaseWithEntityCache();

        private static SerializedShardDatabase serializedShardDb;

        public static SerializedShardDatabase Shard { get; private set; }

        public static ShardConfigDatabase ShardConfig { get; } = new ShardConfigDatabase();

        public static PkAuditDatabase PkAudit { get; } = new PkAuditDatabase();

        public static bool InitializationFailure = false;

        public static void Initialize(bool autoRetry = true)
        {
            Authentication.Exists(true);

            if (Authentication.GetListofAccountsByAccessLevel(ACE.Entity.Enum.AccessLevel.Admin).Count == 0)
            {
                log.Warn("Authentication Database does not contain any admin accounts. The next account to be created will automatically be promoted to an Admin account.");
                AutoPromoteNextAccountToAdmin = true;
            }
            else
                AutoPromoteNextAccountToAdmin = false;

            World.Exists(true);

            if (!World.IsWorldDatabaseGuidRangeValid())
            {
                log.Fatal("World Database contains instance GUIDs outside of static range which will prevent GuidManager from properly assigning GUIDs and can result in GUID exhaustion prematurely.");
                InitializationFailure = true;
                return;
            }

            var playerWeenieLoadTest = World.GetCachedWeenie("human");
            if (playerWeenieLoadTest == null)
            {
                log.Fatal("World Database does not contain the weenie for human (1). Characters cannot be created or logged into until the missing weenie is restored.");
                InitializationFailure = true;
                return;
            }

            // By default, we hold on to player biotas a little bit longer to help with offline updates like pass-up xp, allegiance updates, etc...
            var shardDb = new ShardDatabaseWithCaching(TimeSpan.FromMinutes(Common.ConfigManager.Config.Server.ShardPlayerBiotaCacheTime), TimeSpan.FromMinutes(Common.ConfigManager.Config.Server.ShardNonPlayerBiotaCacheTime));
            serializedShardDb = new SerializedShardDatabase(shardDb);
            Shard = serializedShardDb;

            shardDb.Exists(true);

            // Initialize optional PK audit database if configured
            try
            {
                PkAudit.Exists(true);
            }
            catch (Exception ex)
            {
                log.Warn("PK Audit database initialization failed: " + ex.Message);
            }
        }

        public static bool AutoPromoteNextAccountToAdmin { get; set; }

        public static void Start()
        {
            serializedShardDb.Start();
            // PK audit background worker will be started during Exists() when configured; nothing to do here
        }

        public static void Stop()
        {
            if (serializedShardDb != null)
                serializedShardDb.Stop();
            try
            {
                PkAudit?.Stop();
            }
            catch (Exception ex)
            {
                log.Warn("Failed to stop PK audit database worker: " + ex.Message);
            }
        }

        private static readonly ConcurrentDictionary<string, ServerVersion> cachedServerVersions = new();

        public static ServerVersion CachedServerVersionAutoDetect(string database, string connectionString)
        {
            if (!cachedServerVersions.TryGetValue(database, out ServerVersion serverVersion))
            {
                serverVersion = ServerVersion.AutoDetect(connectionString);
                cachedServerVersions[database] = serverVersion;
            }
            return serverVersion;
        }
    }
}
