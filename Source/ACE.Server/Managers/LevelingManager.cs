using System;
using System.IO;
using System.Linq;
using System.Text.Json;
using log4net;
using ACE.DatLoader;

namespace ACE.Server.Managers
{
    public class LevelingConfig
    {
        public int maxLevel { get; set; } = 1000;
        public int baseExtendFromLevel { get; set; } = 275;
        public double extraPercentPerLevel { get; set; } = 0.0001; // 0.01% default
        public int skillCreditEveryLevels { get; set; } = 25;
        // grant accumulated luminance at this level automatically
        public int luminanceGrantLevel { get; set; } = 200;
        // maximum luminance to set when granting
        public long maxLuminance { get; set; } = 100000000;
    }

    public static class LevelingManager
    {
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        private static readonly string configPath = Path.Combine(Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location) ?? ".", "config", "leveling.json");

        public static LevelingConfig Config { get; private set; } = new LevelingConfig();

        public static void Initialize()
        {
            LoadConfig();
            ExtendXpTableIfNeeded();
        }

        public static void ReloadConfig()
        {
            LoadConfig();
            ExtendXpTableIfNeeded();
        }

        private static void LoadConfig()
        {
            try
            {
                if (!File.Exists(configPath))
                {
                    log.Info($"LevelingManager: config not found at {configPath}, using defaults.");
                    Config = new LevelingConfig();
                    return;
                }

                var txt = File.ReadAllText(configPath);
                var cfg = JsonSerializer.Deserialize<LevelingConfig>(txt);
                if (cfg != null) Config = cfg;
                log.Info($"LevelingManager: loaded config maxLevel={Config.maxLevel}, baseExtendFromLevel={Config.baseExtendFromLevel}, extraPercentPerLevel={Config.extraPercentPerLevel}, skillCreditEveryLevels={Config.skillCreditEveryLevels}");
            }
            catch (Exception ex)
            {
                log.Warn($"LevelingManager: failed to load config: {ex.Message}");
                Config = new LevelingConfig();
            }
        }

        private static void ExtendXpTableIfNeeded()
        {
            try
            {
                var xpTable = DatManager.PortalDat.XpTable;

                var currentMax = xpTable.CharacterLevelXPList.Count - 1; // levels start at 0 index maybe 0/1
                if (Config.maxLevel <= currentMax)
                {
                    log.Info($"LevelingManager: current XP table already has max level {currentMax}, no extension needed.");
                    return;
                }

                // determine starting delta (XP to go from last-1 to last)
                var lastIndex = xpTable.CharacterLevelXPList.Count - 1;
                if (lastIndex < 1) return;

                var prevTotal = xpTable.CharacterLevelXPList[lastIndex - 1];
                var lastTotal = xpTable.CharacterLevelXPList[lastIndex];
                var lastDelta = (double)(lastTotal - prevTotal);

                var extraPercent = Config.extraPercentPerLevel;
                var baseLevel = Config.baseExtendFromLevel;

                // append levels up to maxLevel
                var total = (ulong)lastTotal;
                var delta = lastDelta;

                for (int lvl = lastIndex + 1; lvl <= Config.maxLevel; lvl++)
                {
                    // if level is just after baseExtendFromLevel, use lastDelta; else multiply by (1+extraPercent)
                    if (lvl > baseLevel)
                    {
                        delta = delta * (1.0 + extraPercent);
                    }

                    var add = (ulong)Math.Round(delta);
                    total += add;
                    xpTable.CharacterLevelXPList.Add(total);

                    // skill credit list: grant a credit every N levels after baseExtendFromLevel
                    if (xpTable.CharacterLevelSkillCreditList != null)
                    {
                        uint credit = 0;
                        if (lvl > baseLevel && ((lvl - baseLevel) % Config.skillCreditEveryLevels == 0))
                            credit = 1;
                        xpTable.CharacterLevelSkillCreditList.Add(credit);
                    }
                }

                log.Info($"LevelingManager: extended XP table from {currentMax} to {Config.maxLevel}");
            }
            catch (Exception ex)
            {
                log.Error($"LevelingManager: failed to extend XP table: {ex}");
            }
        }
    }
}
