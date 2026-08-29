using System;

using ACE.Entity;
using ACE.Entity.Models;
using ACE.Entity.Enum;
using ACE.Entity.Enum.Properties;
using ACE.Server.Network.GameMessages.Messages;
using log4net;
using Microsoft.EntityFrameworkCore;

namespace ACE.Server.WorldObjects
{
    public class GenericObject : WorldObject
    {
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        /// <summary>
        /// A new biota be created taking all of its values from weenie.
        /// </summary>
        public GenericObject(Weenie weenie, ObjectGuid guid) : base(weenie, guid)
        {
            SetEphemeralValues();
        }

        /// <summary>
        /// Restore a WorldObject from the database.
        /// </summary>
        public GenericObject(Biota biota) : base(biota)
        {
            SetEphemeralValues();
        }

        private void SetEphemeralValues()
        {
            //StackSize = null;
            //StackUnitEncumbrance = null;
            //StackUnitValue = null;
            //MaxStackSize = null;

            // Linkable Item Generator (linkitemgen2minutes) fix
            if (WeenieClassId == 4142)
            {
                MaxGeneratedObjects = 0;
                InitGeneratedObjects = 0;
            }
        }

        public override void ActOnUse(WorldObject activator)
        {
            if (!(activator is Player player))
                return;

            if (UseSound > 0)
                player.Session.Network.EnqueueSend(new GameMessageSound(player.Guid, UseSound));

            // Handle luminous gems (consume on use and grant permanent +2% to the appropriate spell school)
            switch (WeenieClassId)
            {
                case 40000500u: // luminous of item
                    {
                        const long RequiredAccumulated = 5000000L;
                        var acc = player.GetProperty(PropertyInt64.AccumulatedLuminance) ?? 0L;
                        if (acc < RequiredAccumulated)
                        {
                            player.Session.Network.EnqueueSend(new GameMessageSystemChat($"You need {RequiredAccumulated:N0} accumulated luminance to use this item.", ChatMessageType.System));
                            log.Info($"Player {player.Name} attempted to use luminous item {WeenieClassId} but has only {acc} accumulated luminance.");
                            return;
                        }

                        player.LuminousItemSpellPercent += 2;
                        if (!player.TryConsumeFromInventoryWithNetworking(this, 1))
                        {
                            player.Session.Network.EnqueueSend(new GameMessageSystemChat("Failed to consume item.", ChatMessageType.Broadcast));
                            return;
                        }

                        // Deduct accumulated luminance cost
                        try
                        {
                            var newAcc = acc - RequiredAccumulated;
                            if (newAcc < 0) newAcc = 0;
                            player.SetProperty(PropertyInt64.AccumulatedLuminance, newAcc);
                            // notify client of accumulated luminance change
                            player.Session.Network.EnqueueSend(new GameMessagePrivateUpdatePropertyInt64(player, PropertyInt64.AccumulatedLuminance, newAcc));
                            // inform player server-side that luminous item was used and cost deducted
                            player.Session.Network.EnqueueSend(new GameMessageSystemChat($"Luminous item used: {RequiredAccumulated:N0} accumulated luminance consumed. Remaining: {newAcc:N0}.", ChatMessageType.System));
                            log.Info($"Player {player.Name} used luminous item {WeenieClassId}: deducted {RequiredAccumulated}, remaining {newAcc}");
                        }
                        catch (Exception ex)
                        {
                            log.Warn($"Failed to deduct accumulated luminance for {player.Name}: {ex.Message}");
                        }

                        player.Session.Network.EnqueueSend(new GameMessagePrivateUpdatePropertyInt(player, PropertyInt.LuminousItemSpellPercent, player.LuminousItemSpellPercent));
                        player.Session.Network.EnqueueSend(new GameMessageSystemChat($"Your Item Enchantment is now {player.LuminousItemSpellPercent}% stronger.", ChatMessageType.System));
                        try
                        {
                            using (var ctx = new ACE.Database.Models.World.WorldDbContext())
                            {
                                var sql = $"INSERT INTO player_permanent_modifiers (player_id, modifier_key, value) VALUES ({player.Guid.Full}, 'luminous:item', 2) ON DUPLICATE KEY UPDATE value = value + 2;";
                                ctx.Database.ExecuteSqlRaw(sql);
                            }
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine($"Failed to persist luminous item modifier for {player.Name}: {ex.Message}");
                        }

                        player.SaveBiotaToDatabase();
                        return;
                    }
                case 40000501u: // luminous of creature
                    {
                        const long RequiredAccumulated = 5000000L;
                        var acc = player.GetProperty(PropertyInt64.AccumulatedLuminance) ?? 0L;
                        if (acc < RequiredAccumulated)
                        {
                            player.Session.Network.EnqueueSend(new GameMessageSystemChat($"You do not have sufficient accumulated luminance to use this item (need {RequiredAccumulated:N0}).", ChatMessageType.Broadcast));
                            log.Info($"Player {player.Name} attempted to use luminous item {WeenieClassId} but has only {acc} accumulated luminance.");
                            return;
                        }

                        player.LuminousCreatureSpellPercent += 2;
                        if (!player.TryConsumeFromInventoryWithNetworking(this, 1))
                        {
                            player.Session.Network.EnqueueSend(new GameMessageSystemChat("Failed to consume item.", ChatMessageType.Broadcast));
                            return;
                        }

                        try
                        {
                            var newAcc = acc - RequiredAccumulated;
                            if (newAcc < 0) newAcc = 0;
                            player.SetProperty(PropertyInt64.AccumulatedLuminance, newAcc);
                            player.Session.Network.EnqueueSend(new GameMessagePrivateUpdatePropertyInt64(player, PropertyInt64.AccumulatedLuminance, newAcc));
                            player.Session.Network.EnqueueSend(new GameMessageSystemChat($"Luminous item used: {RequiredAccumulated:N0} accumulated luminance consumed. Remaining: {newAcc:N0}.", ChatMessageType.Broadcast));
                            log.Info($"Player {player.Name} used luminous item {WeenieClassId}: deducted {RequiredAccumulated}, remaining {newAcc}");
                        }
                        catch (Exception ex)
                        {
                            log.Warn($"Failed to deduct accumulated luminance for {player.Name}: {ex.Message}");
                        }

                        player.Session.Network.EnqueueSend(new GameMessagePrivateUpdatePropertyInt(player, PropertyInt.LuminousCreatureSpellPercent, player.LuminousCreatureSpellPercent));
                        player.Session.Network.EnqueueSend(new GameMessageSystemChat($"Your Creature Enchantment is now {player.LuminousCreatureSpellPercent}% stronger.", ChatMessageType.System));
                        try
                        {
                            using (var ctx = new ACE.Database.Models.World.WorldDbContext())
                            {
                                var sql = $"INSERT INTO player_permanent_modifiers (player_id, modifier_key, value) VALUES ({player.Guid.Full}, 'luminous:creature', 2) ON DUPLICATE KEY UPDATE value = value + 2;";
                                ctx.Database.ExecuteSqlRaw(sql);
                            }
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine($"Failed to persist luminous creature modifier for {player.Name}: {ex.Message}");
                        }

                        player.SaveBiotaToDatabase();
                        return;
                    }
                case 40000502u: // luminous of life
                    {
                        const long RequiredAccumulated = 5000000L;
                        var acc = player.GetProperty(PropertyInt64.AccumulatedLuminance) ?? 0L;
                        if (acc < RequiredAccumulated)
                        {
                            player.Session.Network.EnqueueSend(new GameMessageSystemChat($"You do not have sufficient accumulated luminance to use this item (need {RequiredAccumulated:N0}).", ChatMessageType.Broadcast));
                            log.Info($"Player {player.Name} attempted to use luminous item {WeenieClassId} but has only {acc} accumulated luminance.");
                            return;
                        }

                        player.LuminousLifeSpellPercent += 2;
                        if (!player.TryConsumeFromInventoryWithNetworking(this, 1))
                        {
                            player.Session.Network.EnqueueSend(new GameMessageSystemChat("Failed to consume item.", ChatMessageType.Broadcast));
                            return;
                        }

                        try
                        {
                            var newAcc = acc - RequiredAccumulated;
                            if (newAcc < 0) newAcc = 0;
                            player.SetProperty(PropertyInt64.AccumulatedLuminance, newAcc);
                            player.Session.Network.EnqueueSend(new GameMessagePrivateUpdatePropertyInt64(player, PropertyInt64.AccumulatedLuminance, newAcc));
                            player.Session.Network.EnqueueSend(new GameMessageSystemChat($"Luminous item used: {RequiredAccumulated:N0} accumulated luminance consumed. Remaining: {newAcc:N0}.", ChatMessageType.Broadcast));
                            log.Info($"Player {player.Name} used luminous item {WeenieClassId}: deducted {RequiredAccumulated}, remaining {newAcc}");
                        }
                        catch (Exception ex)
                        {
                            log.Warn($"Failed to deduct accumulated luminance for {player.Name}: {ex.Message}");
                        }

                        player.Session.Network.EnqueueSend(new GameMessagePrivateUpdatePropertyInt(player, PropertyInt.LuminousLifeSpellPercent, player.LuminousLifeSpellPercent));
                        player.Session.Network.EnqueueSend(new GameMessageSystemChat($"Your Life Magic is now {player.LuminousLifeSpellPercent}% stronger.", ChatMessageType.System));
                        try
                        {
                            using (var ctx = new ACE.Database.Models.World.WorldDbContext())
                            {
                                var sql = $"INSERT INTO player_permanent_modifiers (player_id, modifier_key, value) VALUES ({player.Guid.Full}, 'luminous:life', 2) ON DUPLICATE KEY UPDATE value = value + 2;";
                                ctx.Database.ExecuteSqlRaw(sql);
                            }
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine($"Failed to persist luminous life modifier for {player.Name}: {ex.Message}");
                        }

                        player.SaveBiotaToDatabase();
                        return;
                    }
                case 40000503u: // luminous of war
                    {
                        const long RequiredAccumulated = 5000000L;
                        var acc = player.GetProperty(PropertyInt64.AccumulatedLuminance) ?? 0L;
                        if (acc < RequiredAccumulated)
                        {
                            player.Session.Network.EnqueueSend(new GameMessageSystemChat($"You do not have sufficient accumulated luminance to use this item (need {RequiredAccumulated:N0}).", ChatMessageType.Broadcast));
                            log.Info($"Player {player.Name} attempted to use luminous item {WeenieClassId} but has only {acc} accumulated luminance.");
                            return;
                        }

                        player.LuminousWarSpellPercent += 2;
                        if (!player.TryConsumeFromInventoryWithNetworking(this, 1))
                        {
                            player.Session.Network.EnqueueSend(new GameMessageSystemChat("Failed to consume item.", ChatMessageType.Broadcast));
                            return;
                        }

                        try
                        {
                            var newAcc = acc - RequiredAccumulated;
                            if (newAcc < 0) newAcc = 0;
                            player.SetProperty(PropertyInt64.AccumulatedLuminance, newAcc);
                            player.Session.Network.EnqueueSend(new GameMessagePrivateUpdatePropertyInt64(player, PropertyInt64.AccumulatedLuminance, newAcc));
                            player.Session.Network.EnqueueSend(new GameMessageSystemChat($"Luminous item used: {RequiredAccumulated:N0} accumulated luminance consumed. Remaining: {newAcc:N0}.", ChatMessageType.Broadcast));
                            log.Info($"Player {player.Name} used luminous item {WeenieClassId}: deducted {RequiredAccumulated}, remaining {newAcc}");
                        }
                        catch (Exception ex)
                        {
                            log.Warn($"Failed to deduct accumulated luminance for {player.Name}: {ex.Message}");
                        }

                        player.Session.Network.EnqueueSend(new GameMessagePrivateUpdatePropertyInt(player, PropertyInt.LuminousWarSpellPercent, player.LuminousWarSpellPercent));
                        player.Session.Network.EnqueueSend(new GameMessageSystemChat($"Your War Magic is now {player.LuminousWarSpellPercent}% stronger.", ChatMessageType.Broadcast));
                        try
                        {
                            using (var ctx = new ACE.Database.Models.World.WorldDbContext())
                            {
                                var sql = $"INSERT INTO player_permanent_modifiers (player_id, modifier_key, value) VALUES ({player.Guid.Full}, 'luminous:war', 2) ON DUPLICATE KEY UPDATE value = value + 2;";
                                ctx.Database.ExecuteSqlRaw(sql);
                            }
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine($"Failed to persist luminous war modifier for {player.Name}: {ex.Message}");
                        }

                        player.SaveBiotaToDatabase();
                        return;
                    }
                default:
                    break;
            }
        }
    }
}
