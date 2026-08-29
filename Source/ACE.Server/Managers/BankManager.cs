using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.Json;
using log4net;

using ACE.Server.WorldObjects;
using ACE.Server.Entity;
using Microsoft.EntityFrameworkCore;
using System.Data.Common;
using ACE.Database;

namespace ACE.Server.Managers
{
    public class BankAccount
    {
        public string AccountNumber { get; set; }
        public uint OwnerGuid { get; set; }
        public long BalancePyreals { get; set; }
        public long Luminance { get; set; }
        public List<StoredItem> StoredItems { get; set; } = new();
        public DateTime Created { get; set; } = DateTime.UtcNow;
    }
    public class StoredItem
    {
        public uint WeenieClassId { get; set; }
        public int Quantity { get; set; }
    }

    internal class BankableEntry
    {
        public string Name { get; set; }
        public string Type { get; set; }
        public string Description { get; set; }
        public uint? WeenieClassId { get; set; }
        public List<string> Aliases { get; set; } = new();
        public Dictionary<int, uint> Denominations { get; set; }
    }

    public static class BankManager
    {
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        private static readonly Dictionary<string, BankAccount> accountsByNumber = new(StringComparer.OrdinalIgnoreCase);
        private static readonly Dictionary<uint, string> accountByOwner = new();

        private static readonly string storeFile = Path.Combine(Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location) ?? ".", "bank_accounts.json");

        private static readonly Dictionary<string, BankableEntry> bankablesByName = new(StringComparer.OrdinalIgnoreCase);
        private static readonly Dictionary<uint, BankableEntry> bankablesByWcid = new();

        public static void Initialize()
        {
            // Ensure DB tables exist and attempt to load accounts from DB. If DB empty, fall back to JSON file.
            EnsureBankTablesAndLoadFromDb();
            LoadBankablesConfig();
        }

        private static void EnsureBankTablesAndLoadFromDb()
        {
            try
            {
                using var context = new ACE.Database.Models.Shard.ShardDbContext();

                    var createAccounts = @"CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `account_number` varchar(6) NOT NULL,
  `owner_guid` int unsigned NOT NULL,
  `balance_pyreals` bigint NOT NULL DEFAULT 0,
  `luminance` bigint NOT NULL DEFAULT 0,
  `created` datetime NOT NULL,
  PRIMARY KEY (`account_number`),
  UNIQUE KEY `owner_guid` (`owner_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;";

                    var createItems = @"CREATE TABLE IF NOT EXISTS `bank_stored_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_number` varchar(6) NOT NULL,
  `weenie_class_id` int unsigned NOT NULL,
  `quantity` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `account_number_idx` (`account_number`),
  CONSTRAINT `fk_bank_account` FOREIGN KEY (`account_number`) REFERENCES `bank_accounts` (`account_number`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;";

                    context.Database.ExecuteSqlRaw(createAccounts);
                    context.Database.ExecuteSqlRaw(createItems);

                    // load from DB if any accounts exist
                    using var conn = context.Database.GetDbConnection();
                    conn.Open();
                    using var cmd = conn.CreateCommand();
                    cmd.CommandText = "SELECT account_number, owner_guid, balance_pyreals, luminance, created FROM bank_accounts";
                    using var reader = cmd.ExecuteReader();
                    var any = false;
                    accountsByNumber.Clear(); accountByOwner.Clear();
                    while (reader.Read())
                    {
                        any = true;
                        var acct = new BankAccount();
                        acct.AccountNumber = reader.GetString(0);
                        acct.OwnerGuid = (uint)reader.GetInt32(1);
                        acct.BalancePyreals = reader.GetInt64(2);
                        acct.Luminance = reader.GetInt64(3);
                        acct.Created = reader.GetDateTime(4);
                        accountsByNumber[acct.AccountNumber] = acct;
                        accountByOwner[acct.OwnerGuid] = acct.AccountNumber;
                    }

                    if (any)
                    {
                        // load stored items
                        cmd.CommandText = "SELECT account_number, weenie_class_id, quantity FROM bank_stored_items";
                        using var reader2 = cmd.ExecuteReader();
                        while (reader2.Read())
                        {
                            var acctNum = reader2.GetString(0);
                            var wcid = (uint)reader2.GetInt32(1);
                            var qty = reader2.GetInt32(2);
                            if (accountsByNumber.TryGetValue(acctNum, out var account))
                            {
                                account.StoredItems.Add(new StoredItem { WeenieClassId = wcid, Quantity = qty });
                            }
                        }

                        SaveAccounts(); // also write JSON backup
                        return;
                    }
                }
            catch (Exception ex)
            {
                log.Warn($"BankManager: EnsureBankTablesAndLoadFromDb failed: {ex.Message}");
            }

            // fallback to existing JSON loader
            LoadAccounts();
        }

        private static void LoadBankablesConfig()
        {
            try
            {
                var exe = Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location) ?? ".";
                var configPath = Path.Combine(exe, "config", "bankables.json");
                if (!File.Exists(configPath))
                {
                    log.Warn($"BankManager: bankables.json not found at {configPath}");
                    return;
                }

                using var s = File.OpenRead(configPath);
                using var doc = JsonDocument.Parse(s);
                if (!doc.RootElement.TryGetProperty("bankables", out var bankables))
                    return;

                bankablesByName.Clear(); bankablesByWcid.Clear();

                foreach (var el in bankables.EnumerateArray())
                {
                    var entry = new BankableEntry();
                    if (el.TryGetProperty("name", out var name)) entry.Name = name.GetString();
                    if (el.TryGetProperty("type", out var type)) entry.Type = type.GetString();
                    if (el.TryGetProperty("weenieClassId", out var wcid)) entry.WeenieClassId = (uint?)wcid.GetInt32();
                    if (el.TryGetProperty("aliases", out var aliases))
                    {
                        foreach (var a in aliases.EnumerateArray())
                            entry.Aliases.Add(a.GetString());
                    }
                    if (el.TryGetProperty("denominations", out var denoms))
                    {
                        entry.Denominations = new Dictionary<int, uint>();
                        foreach (var kv in denoms.EnumerateObject())
                        {
                            if (int.TryParse(kv.Name, out var val))
                                entry.Denominations[val] = (uint)kv.Value.GetInt32();
                        }
                    }
                    // description or hint
                    if (el.TryGetProperty("description", out var desc))
                        entry.Description = desc.GetString();
                    else if (el.TryGetProperty("hint", out var hint))
                        entry.Description = hint.GetString();

                    if (!string.IsNullOrEmpty(entry.Name))
                    {
                        bankablesByName[entry.Name] = entry;
                        foreach (var alias in entry.Aliases)
                            bankablesByName[alias] = entry;
                    }

                    if (entry.WeenieClassId.HasValue)
                        bankablesByWcid[entry.WeenieClassId.Value] = entry;
                }
            }
            catch (Exception ex)
            {
                log.Warn($"BankManager: failed to parse bankables.json: {ex.Message}");
            }
        }

        /// <summary>
        /// Reload bankables from config file.
        /// </summary>
        public static void ReloadBankables()
        {
            LoadBankablesConfig();
        }

        /// <summary>
        /// Returns human-readable summaries of configured bankables.
        /// </summary>
        public static List<string> GetBankableSummaries()
        {
            var results = new List<string>();
                foreach (var kv in bankablesByName.OrderBy(k => k.Key))
            {
                var entry = kv.Value;
                if (results.Any(r => r.Contains($"Name: {entry.Name}")))
                    continue;

                var aliases = entry.Aliases != null && entry.Aliases.Count > 0 ? string.Join(", ", entry.Aliases) : "none";
                var wcid = entry.WeenieClassId.HasValue ? entry.WeenieClassId.Value.ToString() : "n/a";
                var denoms = entry.Denominations != null ? string.Join(", ", entry.Denominations.Select(d => d.Key + ":" + d.Value)) : "-";
                var desc = string.IsNullOrEmpty(entry.Description) ? "" : $" | Description: {entry.Description}";
                results.Add($"Name: {entry.Name} | Type: {entry.Type} | WCID: {wcid} | Aliases: {aliases} | Denominations: {denoms}{desc}");
            }
            return results;
        }

        private static void LoadAccounts()
        {
            try
            {
                if (!File.Exists(storeFile))
                    return;

                var text = File.ReadAllText(storeFile);
                var list = JsonSerializer.Deserialize<List<BankAccount>>(text);
                if (list == null) return;
                accountsByNumber.Clear(); accountByOwner.Clear();
                foreach (var a in list)
                {
                    accountsByNumber[a.AccountNumber] = a;
                    accountByOwner[a.OwnerGuid] = a.AccountNumber;
                }
            }
            catch (Exception ex)
            {
                log.Error($"BankManager: LoadAccounts failed: {ex}");
            }
        }

        private static void SaveAccounts()
        {
            // Always write JSON backup first
            try
            {
                var list = accountsByNumber.Values.ToList();
                var json = JsonSerializer.Serialize(list, new JsonSerializerOptions { WriteIndented = true });
                File.WriteAllText(storeFile, json);
            }
            catch (Exception ex)
            {
                log.Error($"BankManager: SaveAccounts (json) failed: {ex}");
            }

            // Then persist to DB (best-effort). Use ShardDbContext since these are per-character accounts.
            try
            {
                using var context = new ACE.Database.Models.Shard.ShardDbContext();
                using var conn = context.Database.GetDbConnection();
                conn.Open();
                using var tx = conn.BeginTransaction();

                // Upsert each account
                foreach (var acct in accountsByNumber.Values)
                {
                    using var cmd = conn.CreateCommand();
                    cmd.Transaction = tx;
                    cmd.CommandText = "INSERT INTO bank_accounts (account_number, owner_guid, balance_pyreals, luminance, created) VALUES (@acct, @owner, @balance, @luminance, @created) ON DUPLICATE KEY UPDATE owner_guid=VALUES(owner_guid), balance_pyreals=VALUES(balance_pyreals), luminance=VALUES(luminance), created=VALUES(created)";
                    var p1 = cmd.CreateParameter(); p1.ParameterName = "@acct"; p1.Value = acct.AccountNumber; cmd.Parameters.Add(p1);
                    var p2 = cmd.CreateParameter(); p2.ParameterName = "@owner"; p2.Value = acct.OwnerGuid; cmd.Parameters.Add(p2);
                    var p3 = cmd.CreateParameter(); p3.ParameterName = "@balance"; p3.Value = acct.BalancePyreals; cmd.Parameters.Add(p3);
                    var p4 = cmd.CreateParameter(); p4.ParameterName = "@luminance"; p4.Value = acct.Luminance; cmd.Parameters.Add(p4);
                    var p5 = cmd.CreateParameter(); p5.ParameterName = "@created"; p5.Value = acct.Created; cmd.Parameters.Add(p5);
                    cmd.ExecuteNonQuery();

                    // Replace stored items for this account: delete existing then insert current list
                    using var delCmd = conn.CreateCommand();
                    delCmd.Transaction = tx;
                    delCmd.CommandText = "DELETE FROM bank_stored_items WHERE account_number = @acct";
                    var dp = delCmd.CreateParameter(); dp.ParameterName = "@acct"; dp.Value = acct.AccountNumber; delCmd.Parameters.Add(dp);
                    delCmd.ExecuteNonQuery();

                    foreach (var si in acct.StoredItems)
                    {
                        using var icmd = conn.CreateCommand();
                        icmd.Transaction = tx;
                        icmd.CommandText = "INSERT INTO bank_stored_items (account_number, weenie_class_id, quantity) VALUES (@acct, @wcid, @qty)";
                        var ip1 = icmd.CreateParameter(); ip1.ParameterName = "@acct"; ip1.Value = acct.AccountNumber; icmd.Parameters.Add(ip1);
                        var ip2 = icmd.CreateParameter(); ip2.ParameterName = "@wcid"; ip2.Value = si.WeenieClassId; icmd.Parameters.Add(ip2);
                        var ip3 = icmd.CreateParameter(); ip3.ParameterName = "@qty"; ip3.Value = si.Quantity; icmd.Parameters.Add(ip3);
                        icmd.ExecuteNonQuery();
                    }
                }

                tx.Commit();
                conn.Close();
            }
            catch (Exception ex)
            {
                log.Error($"BankManager: SaveAccounts (db) failed: {ex}");
            }
        }
        // Expose persistence so other systems (shutdown) can force a flush
        public static void PersistAllAccounts()
        {
            SaveAccounts();
        }

        public static BankAccount GetAccountByOwner(uint ownerGuid)
        {
            if (accountByOwner.TryGetValue(ownerGuid, out var num) && accountsByNumber.TryGetValue(num, out var acct))
                return acct;
            return null;
        }

        public static BankAccount GetAccountByNumber(string accountNumber)
        {
            if (accountsByNumber.TryGetValue(accountNumber, out var acct))
                return acct;
            return null;
        }

        public static BankAccount CreateAccount(Player player)
        {
            var existing = GetAccountByOwner(player.Guid.Full);
            if (existing != null)
                return existing;

            var rnd = new Random();
            string acct;
            do { acct = rnd.Next(0, 1000000).ToString("D6"); } while (accountsByNumber.ContainsKey(acct));

            var a = new BankAccount { AccountNumber = acct, OwnerGuid = player.Guid.Full, BalancePyreals = 0, Luminance = 0 };
            accountsByNumber[acct] = a;
            accountByOwner[a.OwnerGuid] = acct;
            SaveAccounts();
            return a;
        }

        public static bool DepositPyreals(Player player, long amount)
        {
            if (amount <= 0) return false;
            var acct = GetAccountByOwner(player.Guid.Full);
            if (acct == null) return false;

            var coinWcid = (uint)ACE.Entity.Enum.WeenieClassName.W_COINSTACK_CLASS;
            if (!player.TryConsumeFromInventoryWithNetworking(coinWcid, (int)amount))
                return false;

            acct.BalancePyreals += amount;
            SaveAccounts();
            return true;
        }

        public static long DepositTradeNotesAsPyreals(Player player)
        {
            var acct = GetAccountByOwner(player.Guid.Full);
            if (acct == null) return 0;

            var total = 0L;
            var tradeNotes = player.GetTradeNotes();
            foreach (var tn in tradeNotes)
            {
                var val = tn.Value ?? 0;
                if (val <= 0) continue;
                if (player.TryRemoveFromInventoryWithNetworking(tn.Guid, out _, Player.RemoveFromInventoryAction.ConsumeItem))
                {
                    total += val;
                }
            }

            if (total > 0)
            {
                acct.BalancePyreals += total;
                SaveAccounts();
            }
            return total;
        }

        public static (bool success, string message) DepositByName(Player player, string name, string amountStr)
        {
            if (string.IsNullOrWhiteSpace(name))
                return (false, "No item specified");

            var acct = GetAccountByOwner(player.Guid.Full);
            if (acct == null) return (false, "No bank account. Create with /bank create");

            if (!bankablesByName.TryGetValue(name, out var bankable))
                return (false, $"Unknown bankable: {name}");

            if (bankable.Type == "currency")
            {
                if (amountStr.Equals("all", StringComparison.OrdinalIgnoreCase))
                {
                    var coinWcid = bankable.WeenieClassId ?? (uint)ACE.Entity.Enum.WeenieClassName.W_COINSTACK_CLASS;
                    var items = player.GetInventoryItemsOfWCID(coinWcid);
                    var total = items.Sum(i => i.StackSize ?? 0);
                    if (total <= 0) return (false, "No pyreals in inventory");
                    if (!player.TryConsumeFromInventoryWithNetworking(coinWcid, (int)total)) return (false, "Failed to remove pyreals from inventory");
                    acct.BalancePyreals += total;
                    SaveAccounts();
                    return (true, $"Deposited {total} pyreals");
                }

                if (!long.TryParse(amountStr, out var amount) || amount <= 0) return (false, "Invalid amount");
                // If player has enough coins, deposit normally. Otherwise, consume coins and also convert trade notes automatically to reach requested amount.
                var coinWcid2 = bankable.WeenieClassId ?? (uint)ACE.Entity.Enum.WeenieClassName.W_COINSTACK_CLASS;
                var coinStacks = player.GetInventoryItemsOfWCID(coinWcid2).ToList();
                var availableCoins = coinStacks.Sum(i => i.StackSize ?? 0);

                if (availableCoins >= amount)
                {
                    // consume requested amount
                    if (!player.TryConsumeFromInventoryWithNetworking(coinWcid2, (int)amount)) return (false, "Failed to remove pyreals from inventory");
                    acct.BalancePyreals += amount;
                    SaveAccounts();
                    return (true, $"Deposited {amount} pyreals");
                }

                // consume all coins first
                if (availableCoins > 0)
                {
                    if (!player.TryConsumeFromInventoryWithNetworking(coinWcid2, (int)availableCoins)) return (false, "Failed to remove pyreals from inventory");
                    acct.BalancePyreals += availableCoins;
                }

                var remaining = amount - availableCoins;

                // Attempt to convert trade notes to fill the remaining amount
                var converted = DepositTradeNotesAsPyreals(player);
                if (converted >= remaining)
                {
                    // we deposited availableCoins + remaining (converted)
                    SaveAccounts();
                    return (true, $"Deposited {amount} pyreals (used {availableCoins} coins and converted trade notes)");
                }

                // Partial: converted whatever was available
                SaveAccounts();
                var totalDeposited = availableCoins + converted;
                if (totalDeposited == 0) return (false, "No pyreals or trade notes available to deposit");
                return (true, $"Deposited {totalDeposited} pyreals (requested {amount}; insufficient funds)");
            }

            if (bankable.Type == "luminance")
            {
                if (amountStr.Equals("all", StringComparison.OrdinalIgnoreCase))
                {
                    var available = player.AvailableLuminance ?? 0;
                    if (available <= 0) return (false, "No luminance available");
                    player.AvailableLuminance = 0;
                    acct.Luminance += available;
                    SaveAccounts();
                    player.SaveBiotaToDatabase();
                    return (true, $"Deposited {available} luminance");
                }
                if (!long.TryParse(amountStr, out var lam) || lam <= 0) return (false, "Invalid amount");
                var avail2 = player.AvailableLuminance ?? 0;
                if (avail2 < lam) return (false, "Not enough luminance");
                player.AvailableLuminance = avail2 - lam;
                acct.Luminance += lam;
                SaveAccounts();
                player.SaveBiotaToDatabase();
                return (true, $"Deposited {lam} luminance");
            }

            if (bankable.Type == "trade_note")
            {
                if (amountStr.Equals("all", StringComparison.OrdinalIgnoreCase))
                {
                    var total = DepositTradeNotesAsPyreals(player);
                    return (true, $"Converted trade notes and deposited {total} pyreals");
                }
                if (!int.TryParse(amountStr, out var num) || num <= 0) return (false, "Invalid amount");
                var notes = player.GetTradeNotes();
                var count = 0; long totalVal = 0;
                foreach (var tn in notes)
                {
                    if (count >= num) break;
                    var val = tn.Value ?? 0;
                    if (player.TryRemoveFromInventoryWithNetworking(tn.Guid, out _, Player.RemoveFromInventoryAction.ConsumeItem))
                    {
                        totalVal += val; count++;
                    }
                }
                if (count == 0) return (false, "No matching trade notes found");
                acct.BalancePyreals += totalVal; SaveAccounts();
                return (true, $"Converted {count} trade notes and deposited {totalVal} pyreals");
            }

            if (bankable.Type == "item" || bankable.WeenieClassId.HasValue)
            {
                uint wcid = bankable.WeenieClassId ?? 0;
                if (wcid == 0) return (false, "Bankable item missing weenieClassId");

                if (amountStr.Equals("all", StringComparison.OrdinalIgnoreCase))
                {
                    var items = player.GetInventoryItemsOfWCID(wcid).ToList();
                    if (items.Count == 0) return (false, "No matching items in inventory");
                    var totalQty = 0;
                    foreach (var it in items)
                    {
                        var qty = it.StackSize ?? 1;
                        if (!player.TryRemoveFromInventoryWithNetworking(it.Guid, out _, Player.RemoveFromInventoryAction.GiveItem)) continue;
                        totalQty += qty;
                    }
                    if (totalQty == 0) return (false, "Failed to remove items");
                    var stored = acct.StoredItems.FirstOrDefault(i => i.WeenieClassId == wcid);
                    if (stored == null) { stored = new StoredItem { WeenieClassId = wcid, Quantity = totalQty }; acct.StoredItems.Add(stored); }
                    else stored.Quantity += totalQty;
                    SaveAccounts();
                    return (true, $"Deposited {totalQty} x {bankable.Name}");
                }

                if (!int.TryParse(amountStr, out var amt) || amt <= 0) return (false, "Invalid amount");
                var toRemove = amt;
                var stacks = player.GetInventoryItemsOfWCID(wcid).ToList();
                foreach (var st in stacks)
                {
                    if (toRemove <= 0) break;
                    var take = Math.Min(toRemove, st.StackSize ?? 1);
                    if (!player.TryConsumeFromInventoryWithNetworking(st.WeenieClassId == 0 ? (uint)0 : st.WeenieClassId, take))
                    {
                        if (!player.TryRemoveFromInventoryWithNetworking(st.Guid, out _, Player.RemoveFromInventoryAction.GiveItem)) continue;
                        take = st.StackSize ?? 1;
                    }
                    toRemove -= take;
                    var stored = acct.StoredItems.FirstOrDefault(i => i.WeenieClassId == wcid);
                    if (stored == null) { acct.StoredItems.Add(new StoredItem { WeenieClassId = wcid, Quantity = take }); }
                    else stored.Quantity += take;
                }
                var deposited = amt - toRemove;
                if (deposited == 0) return (false, "No items deposited");
                SaveAccounts();
                return (true, $"Deposited {deposited} x {bankable.Name}");
            }

            return (false, "Unsupported bankable type");
        }

        public static bool DepositAllBankables(Player player, out List<string> results)
        {
            results = new List<string>();
            var acct = GetAccountByOwner(player.Guid.Full);
            if (acct == null) { results.Add("No account"); return false; }

            // deposit pyreals
            if (bankablesByName.TryGetValue("pyreals", out var py))
            {
                var coinWcid = py.WeenieClassId ?? (uint)ACE.Entity.Enum.WeenieClassName.W_COINSTACK_CLASS;
                var items = player.GetInventoryItemsOfWCID(coinWcid).ToList();
                var total = items.Sum(i => i.StackSize ?? 0);
                if (total > 0)
                {
                    player.TryConsumeFromInventoryWithNetworking(coinWcid, (int)total);
                    acct.BalancePyreals += total;
                    results.Add($"Deposited {total} pyreals");
                }
            }

            var tnotes = DepositTradeNotesAsPyreals(player);
            if (tnotes > 0) results.Add($"Converted and deposited {tnotes} pyreals from trade notes");

            var inv = player.GetAllPossessions();
            foreach (var wo in inv.ToList())
            {
                if (wo.IsTradeNote) continue;
                if (bankablesByWcid.TryGetValue(wo.WeenieClassId, out var entry))
                {
                    var qty = wo.StackSize ?? 1;
                    if (player.TryRemoveFromInventoryWithNetworking(wo.Guid, out _, Player.RemoveFromInventoryAction.GiveItem))
                    {
                        var stored = acct.StoredItems.FirstOrDefault(i => i.WeenieClassId == wo.WeenieClassId);
                        if (stored == null) { acct.StoredItems.Add(new StoredItem { WeenieClassId = wo.WeenieClassId, Quantity = qty }); }
                        else stored.Quantity += qty;
                        results.Add($"Deposited {qty} x {entry.Name}");
                    }
                }
            }

            SaveAccounts();
            return results.Count > 0;
        }

        public static bool WithdrawToPlayer(Player player, string name, int amount, out string message)
        {
            message = null;
            var acct = GetAccountByOwner(player.Guid.Full);
            if (acct == null) { message = "No bank account"; return false; }

            if (string.IsNullOrWhiteSpace(name)) { message = "No item specified"; return false; }
            if (!bankablesByName.TryGetValue(name, out var bankable)) { message = "Unknown bankable"; return false; }

            if (bankable.Type == "currency")
            {
                if (amount <= 0) { message = "Invalid amount"; return false; }
                if (acct.BalancePyreals < amount) { message = "Insufficient funds"; return false; }

                long givePyreals = Math.Min(amount, 250000);
                long remainder = amount - givePyreals;
                var coinWcid = bankable.WeenieClassId ?? (uint)ACE.Entity.Enum.WeenieClassName.W_COINSTACK_CLASS;

                // Before creating items, verify player has space/burden capacity for the items to be given
                var itemsToReceive = new ACE.Server.Entity.ItemsToReceive(player);
                if (givePyreals > 0)
                    itemsToReceive.Add(coinWcid, (int)givePyreals);

                if (remainder > 0 && bankable.Denominations != null && bankable.Denominations.Count > 0)
                {
                    var denoms = bankable.Denominations.Keys.OrderByDescending(k => k).ToList();
                    long left = remainder;
                    foreach (var denom in denoms)
                    {
                        var wcid = bankable.Denominations[denom];
                        var count = (int)(left / denom);
                        if (count > 0)
                        {
                            itemsToReceive.Add(wcid, count);
                            left -= (long)count * denom;
                        }
                    }
                    if (left > 0)
                        itemsToReceive.Add(coinWcid, (int)left);
                }

                if (itemsToReceive.PlayerExceedsLimits)
                {
                    message = "Withdraw would exceed inventory limits or available burden";
                    return false;
                }

                // Safe to give items now
                if (givePyreals > 0)
                {
                    var stack = ACE.Server.Factories.WorldObjectFactory.CreateNewWorldObject(coinWcid);
                    stack.SetStackSize((int)givePyreals);
                    if (!player.TryCreateInInventoryWithNetworking(stack)) { stack.Destroy(); message = "Failed to give coins"; return false; }
                }

                if (remainder > 0 && bankable.Denominations != null && bankable.Denominations.Count > 0)
                {
                    var denoms = bankable.Denominations.Keys.OrderByDescending(k => k).ToList();
                    long left = remainder;
                    foreach (var denom in denoms)
                    {
                        while (left >= denom)
                        {
                            var wcid = bankable.Denominations[denom];
                            var note = ACE.Server.Factories.WorldObjectFactory.CreateNewWorldObject(wcid);
                            note.Value = denom;
                            note.SetStackSize(1);
                            if (!player.TryCreateInInventoryWithNetworking(note)) { note.Destroy(); message = "Failed to give trade note"; return false; }
                            left -= denom;
                        }
                    }
                    if (left > 0)
                    {
                        var coin = ACE.Server.Factories.WorldObjectFactory.CreateNewWorldObject(coinWcid);
                        coin.SetStackSize((int)left);
                        if (!player.TryCreateInInventoryWithNetworking(coin)) { coin.Destroy(); message = "Failed to give coin leftover"; return false; }
                    }
                }

                acct.BalancePyreals -= amount;
                SaveAccounts();
                message = $"Withdrew {amount} pyreals";
                return true;
            }

            if (bankable.Type == "luminance")
            {
                if (amount <= 0) { message = "Invalid amount"; return false; }
                if (acct.Luminance < amount) { message = "Insufficient luminance"; return false; }
                acct.Luminance -= amount;
                player.GrantLuminance(amount, ACE.Entity.Enum.XpType.Admin, ACE.Entity.Enum.ShareType.None);
                SaveAccounts();
                message = $"Withdrew {amount} luminance";
                return true;
            }

            if (bankable.Type == "item" || bankable.WeenieClassId.HasValue)
            {
                uint wcid = bankable.WeenieClassId ?? 0;
                if (wcid == 0) { message = "No weenie id"; return false; }
                var stored = acct.StoredItems.FirstOrDefault(i => i.WeenieClassId == wcid);
                if (stored == null || stored.Quantity <= 0) { message = "No stored items"; return false; }
                var take = Math.Min(amount, stored.Quantity);
                for (int i = 0; i < take; i++)
                {
                    var item = ACE.Server.Factories.WorldObjectFactory.CreateNewWorldObject(wcid);
                    item.SetStackSize(1);
                    if (!player.TryCreateInInventoryWithNetworking(item)) { item.Destroy(); message = "Failed to give withdrawn item"; return false; }
                }
                stored.Quantity -= take;
                if (stored.Quantity <= 0) acct.StoredItems.Remove(stored);
                SaveAccounts();
                message = $"Withdrew {take} x {bankable.Name}";
                return true;
            }

            message = "Unsupported withdraw type";
            return false;
        }

        // convenience overload to withdraw pyreals by amount
        public static bool WithdrawToPlayer(Player player, int amount, out string message)
        {
            return WithdrawToPlayer(player, "pyreals", amount, out message);
        }

        public static bool TransferBetweenAccounts(string fromAccount, string toAccount, long amount)
        {
            if (string.IsNullOrEmpty(fromAccount) || string.IsNullOrEmpty(toAccount) || amount <= 0) return false;
            if (!accountsByNumber.TryGetValue(fromAccount, out var a1)) return false;
            if (!accountsByNumber.TryGetValue(toAccount, out var a2)) return false;
            if (a1.BalancePyreals < amount) return false;
            a1.BalancePyreals -= amount;
            a2.BalancePyreals += amount;
            SaveAccounts();
            return true;
        }

        // Transfer named bankable (currency or stored item) between accounts
        public static bool TransferBetweenAccounts(string fromAccount, string toAccount, string itemName, long amount, out string message)
        {
            message = null;
            if (string.IsNullOrEmpty(fromAccount) || string.IsNullOrEmpty(toAccount) || amount <= 0) { message = "Invalid parameters"; return false; }
            if (!accountsByNumber.TryGetValue(fromAccount, out var a1)) { message = "Source account not found"; return false; }
            if (!accountsByNumber.TryGetValue(toAccount, out var a2)) { message = "Destination account not found"; return false; }
            if (!bankablesByName.TryGetValue(itemName, out var bankable)) { message = "Unknown item"; return false; }

            if (bankable.Type == "currency")
            {
                if (a1.BalancePyreals < amount) { message = "Insufficient funds"; return false; }
                a1.BalancePyreals -= amount;
                a2.BalancePyreals += amount;
                SaveAccounts();
                message = $"Transferred {amount} pyreals to account {toAccount}";
                return true;
            }

            if (bankable.Type == "trade_note")
            {
                // trade notes treated as currency-like stored items? We treat via stored items table: use stored items with trade-note WCID if configured
                var noteWcid = bankable.WeenieClassId ?? 0u;
                if (noteWcid == 0) { message = "Trade-note mapping missing"; return false; }

                var storedFrom = a1.StoredItems.FirstOrDefault(i => i.WeenieClassId == noteWcid);
                if (storedFrom == null || storedFrom.Quantity < amount) { message = "Insufficient stored trade notes"; return false; }
                storedFrom.Quantity -= (int)amount;
                if (storedFrom.Quantity <= 0) a1.StoredItems.Remove(storedFrom);

                var storedTo = a2.StoredItems.FirstOrDefault(i => i.WeenieClassId == noteWcid);
                if (storedTo == null) { a2.StoredItems.Add(new StoredItem { WeenieClassId = noteWcid, Quantity = (int)amount }); }
                else storedTo.Quantity += (int)amount;

                SaveAccounts();
                message = $"Transferred {amount} trade notes to account {toAccount}";
                return true;
            }

            // item transfer: adjust stored items lists
            if (bankable.Type == "item" || bankable.WeenieClassId.HasValue)
            {
                var wcid = bankable.WeenieClassId ?? 0u;
                if (wcid == 0) { message = "Item mapping missing"; return false; }

                var storedFrom = a1.StoredItems.FirstOrDefault(i => i.WeenieClassId == wcid);
                if (storedFrom == null || storedFrom.Quantity < amount) { message = "Insufficient stored items"; return false; }

                storedFrom.Quantity -= (int)amount;
                if (storedFrom.Quantity <= 0) a1.StoredItems.Remove(storedFrom);

                var storedTo = a2.StoredItems.FirstOrDefault(i => i.WeenieClassId == wcid);
                if (storedTo == null) a2.StoredItems.Add(new StoredItem { WeenieClassId = wcid, Quantity = (int)amount });
                else storedTo.Quantity += (int)amount;

                SaveAccounts();
                message = $"Transferred {amount} x {bankable.Name} to account {toAccount}";
                return true;
            }

            message = "Unsupported transfer type";
            return false;
        }

        public static string GetBalanceReport(BankAccount account)
        {
            // Multi-line plain-text report: one value per line, no symbols.
            // Example lines:
            // Account 000123
            // Pyreals 100000
            // Luminance 0
            // StoredItemTypes 3
            // <ItemNameOrWcid> <Quantity>
            if (account == null) return "No account";

            var lines = new List<string>();
            lines.Add($"Account {account.AccountNumber}");
            lines.Add($"Pyreals {account.BalancePyreals}");
            lines.Add($"Luminance {account.Luminance}");

            var storedCount = account.StoredItems?.Count ?? 0;
            lines.Add($"StoredItemTypes {storedCount}");

            if (storedCount > 0)
            {
                foreach (var st in account.StoredItems)
                {
                    string name = st.WeenieClassId.ToString();
                    try
                    {
                        var weenie = DatabaseManager.World.GetCachedWeenie(st.WeenieClassId);
                        if (weenie != null && !string.IsNullOrEmpty(weenie.ClassName))
                            name = weenie.ClassName;
                    }
                    catch
                    {
                        // ignore lookup failures and fall back to wcid
                    }

                    lines.Add($"{name} {st.Quantity}");
                }
            }

            return string.Join("\n", lines);
        }
    }
}
