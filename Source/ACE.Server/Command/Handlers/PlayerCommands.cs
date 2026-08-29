using System;
using System.Collections.Generic;
using System.Linq;

using log4net;

using ACE.Common;
using ACE.Database;
using ACE.Entity;
using ACE.Entity.Enum;
using ACE.Server.Entity;
using ACE.Server.Entity.Actions;
using ACE.Server.Managers;
using ACE.Server.Network;
using ACE.Server.Network.GameEvent.Events;
using ACE.Server.Network.GameMessages.Messages;
using ACE.Server.WorldObjects;


namespace ACE.Server.Command.Handlers
{
    public static class PlayerCommands
    {
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        // Register bank aliases: /b /d /w /s /bal

        // pop
        [CommandHandler("pop", AccessLevel.Player, CommandHandlerFlag.None, 0,
            "Show current world population",
            "")]
        public static void HandlePop(Session session, params string[] parameters)
        {
            CommandHandlerHelper.WriteOutputInfo(session, $"Current world population: {PlayerManager.GetOnlineCount():N0}", ChatMessageType.Broadcast);
        }

        // /b is the canonical bank command. Use /b <subcommand> where subcommand may be abbreviated:
        // d = deposit, w = withdraw, s = send, b = balance
        [CommandHandler("b", AccessLevel.Player, CommandHandlerFlag.RequiresWorld, "Player bank shorthand: /b <d|w|s|b>")]
        public static void HandleBank_shorthand(Session session, params string[] parameters)
        {
            if (session?.Player == null)
                return;

            if (parameters.Length == 0)
            {
                // show help matching /bank help
                session.Network.EnqueueSend(new GameMessageSystemChat("Bank commands: /b d <amount|name amount|all> | /b withdraw <amount> | /b send <acct> <amount> | /b b (balance)", ChatMessageType.Broadcast));
                return;
            }

            // Map single-letter subcommands to full names
            var sub = parameters[0]?.ToLower() ?? string.Empty;
            string expanded;
            if (sub == "d") expanded = "deposit";
            else if (sub == "w") expanded = "withdraw";
            else if (sub == "s") expanded = "send";
            else if (sub == "b" || sub == "bal") expanded = "balance";
            else if (sub == "c") expanded = "create";
            else expanded = sub; // allow full words as well

            var newParams = new string[parameters.Length];
            newParams[0] = expanded;
            for (int i = 1; i < parameters.Length; i++) newParams[i] = parameters[i];

            HandleBank(session, newParams);
        }

        [CommandHandler("bank", AccessLevel.Player, CommandHandlerFlag.RequiresWorld, "Player bank commands: create, deposit, deposit-notes, withdraw, send, balance")]
        public static void HandleBank(Session session, params string[] parameters)
        {
            if (session?.Player == null)
                return;

            if (parameters.Length == 0)
            {
                session.Network.EnqueueSend(new GameMessageSystemChat("Bank commands: /bank create | /bank deposit <amount> | /bank deposit-notes | /bank withdraw <amount> | /bank send <acct> <amount> | /bank balance", ChatMessageType.Broadcast));
                return;
            }

            var cmd = parameters[0].ToLower();
            // map short aliases
            if (cmd == "d") cmd = "deposit";
            if (cmd == "w") cmd = "withdraw";
            if (cmd == "s") cmd = "send";
            if (cmd == "bal") cmd = "balance";
            var player = session.Player;

            try
            {
                switch (cmd)
                {
                    case "create":
                        var acct = Managers.BankManager.CreateAccount(player);
                        session.Network.EnqueueSend(new GameMessageSystemChat($"Bank account created: {acct.AccountNumber}", ChatMessageType.Broadcast));
                        break;
                    case "deposit":
                        // support: /bank deposit <amount>
                        // or: /bank deposit <name> <amount>
                        // or: /bank deposit all
                        if (parameters.Length == 1)
                        {
                            session.Network.EnqueueSend(new GameMessageSystemChat("Usage: /bank deposit <amount|name amount|all>", ChatMessageType.Broadcast));
                            break;
                        }

                        if (parameters.Length == 2)
                        {
                            var p1 = parameters[1];
                            if (p1.Equals("all", StringComparison.OrdinalIgnoreCase))
                            {
                                var accall = Managers.BankManager.GetAccountByOwner(player.Guid.Full);
                                if (accall == null) { session.Network.EnqueueSend(new GameMessageSystemChat("You must create a bank account first with /bank create", ChatMessageType.Broadcast)); break; }
                                if (Managers.BankManager.DepositAllBankables(player, out var res))
                                {
                                    foreach (var r in res) session.Network.EnqueueSend(new GameMessageSystemChat(r, ChatMessageType.Broadcast));
                                }
                                else session.Network.EnqueueSend(new GameMessageSystemChat("No bankables deposited.", ChatMessageType.Broadcast));
                                break;
                            }

                            if (long.TryParse(p1, out var amt1))
                            {
                                var accd = Managers.BankManager.GetAccountByOwner(player.Guid.Full);
                                if (accd == null) { session.Network.EnqueueSend(new GameMessageSystemChat("You must create a bank account first with /bank create", ChatMessageType.Broadcast)); break; }
                                if (!Managers.BankManager.DepositPyreals(player, amt1))
                                    session.Network.EnqueueSend(new GameMessageSystemChat("Deposit failed: not enough pyreals in inventory.", ChatMessageType.Broadcast));
                                else
                                    session.Network.EnqueueSend(new GameMessageSystemChat($"Deposited {amt1} pyreals to account {accd.AccountNumber}", ChatMessageType.Broadcast));
                                break;
                            }

                            session.Network.EnqueueSend(new GameMessageSystemChat("Invalid deposit parameters.", ChatMessageType.Broadcast));
                            break;
                        }

                        // parameters.Length >=3: name may be multi-word; amount is last token
                        var amountStr = parameters.Last();
                        var nameParts = parameters.Skip(1).Take(parameters.Length - 2).ToArray();
                        var name = string.Join(" ", nameParts);
                        var accx = Managers.BankManager.GetAccountByOwner(player.Guid.Full);
                        if (accx == null) { session.Network.EnqueueSend(new GameMessageSystemChat("You must create a bank account first with /bank create", ChatMessageType.Broadcast)); break; }
                        var (depOk, msg) = Managers.BankManager.DepositByName(player, name, amountStr);
                        session.Network.EnqueueSend(new GameMessageSystemChat(msg, ChatMessageType.Broadcast));
                        break;
                    case "deposit-notes":
                        var accn = Managers.BankManager.GetAccountByOwner(player.Guid.Full);
                        if (accn == null) { session.Network.EnqueueSend(new GameMessageSystemChat("You must create a bank account first with /bank create", ChatMessageType.Broadcast)); break; }
                        var total = Managers.BankManager.DepositTradeNotesAsPyreals(player);
                        session.Network.EnqueueSend(new GameMessageSystemChat($"Converted trade notes and deposited {total} pyreals to account {accn.AccountNumber}", ChatMessageType.Broadcast));
                        break;
                    case "withdraw":
                        if (parameters.Length < 2)
                        {
                            session.Network.EnqueueSend(new GameMessageSystemChat("Usage: /bank withdraw <amount|name amount>", ChatMessageType.Broadcast));
                            break;
                        }

                        // if single parameter and numeric -> withdraw pyreals
                        if (parameters.Length == 2 && long.TryParse(parameters[1], out var wam2))
                        {
                            var accw2 = Managers.BankManager.GetAccountByOwner(player.Guid.Full);
                            if (accw2 == null) { session.Network.EnqueueSend(new GameMessageSystemChat("You must create a bank account first with /bank create", ChatMessageType.Broadcast)); break; }
                            if (!Managers.BankManager.WithdrawToPlayer(player, (int)wam2, out var msgw))
                                session.Network.EnqueueSend(new GameMessageSystemChat($"Withdraw failed: {msgw}", ChatMessageType.Broadcast));
                            else
                                session.Network.EnqueueSend(new GameMessageSystemChat(msgw, ChatMessageType.Broadcast));
                            break;
                        }

                        // parameters >=3: name may be multi-word; amount is last
                        var amtStr = parameters.Last();
                        var nmParts = parameters.Skip(1).Take(parameters.Length - 2).ToArray();
                        var nm = string.Join(" ", nmParts);
                        if (!int.TryParse(amtStr, out var wamt) || wamt <= 0)
                        {
                            session.Network.EnqueueSend(new GameMessageSystemChat("Invalid amount", ChatMessageType.Broadcast)); break;
                        }
                        var accw3 = Managers.BankManager.GetAccountByOwner(player.Guid.Full);
                        if (accw3 == null) { session.Network.EnqueueSend(new GameMessageSystemChat("You must create a bank account first with /bank create", ChatMessageType.Broadcast)); break; }
                        if (!Managers.BankManager.WithdrawToPlayer(player, nm, wamt, out var withdrawMsg))
                            session.Network.EnqueueSend(new GameMessageSystemChat($"Withdraw failed: {withdrawMsg}", ChatMessageType.Broadcast));
                        else
                            session.Network.EnqueueSend(new GameMessageSystemChat(withdrawMsg, ChatMessageType.Broadcast));
                        break;
                    case "send":
                        // Support two formats:
                        // /b s <account> <amount>          -- send pyreals
                        // /b s <account> <item> <amount>   -- send named item (e.g., pyreals) or stored item
                        if (parameters.Length < 3)
                        {
                            session.Network.EnqueueSend(new GameMessageSystemChat("Usage: /b s <account> <amount>  OR  /b s <account> <item> <amount>", ChatMessageType.Broadcast));
                            break;
                        }

                        var fromAcct = Managers.BankManager.GetAccountByOwner(player.Guid.Full);
                        if (fromAcct == null) { session.Network.EnqueueSend(new GameMessageSystemChat("You must create a bank account first with /bank create", ChatMessageType.Broadcast)); break; }

                        if (parameters.Length == 3 && long.TryParse(parameters[2], out var sendAmount))
                        {
                            var transferOk = Managers.BankManager.TransferBetweenAccounts(fromAcct.AccountNumber, parameters[1], sendAmount);
                            if (!transferOk)
                                session.Network.EnqueueSend(new GameMessageSystemChat("Transfer failed. Check account numbers and balance.", ChatMessageType.Broadcast));
                            else
                                session.Network.EnqueueSend(new GameMessageSystemChat($"Transferred {sendAmount} pyreals to account {parameters[1]}", ChatMessageType.Broadcast));
                            break;
                        }

                        if (parameters.Length >= 4 && long.TryParse(parameters[3], out var itemAmount))
                        {
                            var toAccount = parameters[1];
                            var itemName = parameters[2];
                            if (!Managers.BankManager.TransferBetweenAccounts(fromAcct.AccountNumber, toAccount, itemName, itemAmount, out var transferMsg))
                                session.Network.EnqueueSend(new GameMessageSystemChat($"Send failed: {transferMsg}", ChatMessageType.Broadcast));
                            else
                                session.Network.EnqueueSend(new GameMessageSystemChat(transferMsg, ChatMessageType.Broadcast));
                            break;
                        }

                        session.Network.EnqueueSend(new GameMessageSystemChat("Usage: /b s <account> <amount>  OR  /b s <account> <item> <amount>", ChatMessageType.Broadcast));
                        break;
                    case "balance":
                    case "b":
                        var acb = Managers.BankManager.GetAccountByOwner(player.Guid.Full);
                        if (acb == null) { session.Network.EnqueueSend(new GameMessageSystemChat("No bank account. Create one with /bank create", ChatMessageType.Broadcast)); break; }
                        var report = Managers.BankManager.GetBalanceReport(acb);
                        // Always list pyreals and luminance even if 0
                        session.Network.EnqueueSend(new GameMessageSystemChat(report, ChatMessageType.Broadcast));
                        break;
                    default:
                        session.Network.EnqueueSend(new GameMessageSystemChat("Unknown bank command. Use /bank for help", ChatMessageType.Broadcast));
                        break;
                }
            }
            catch (Exception ex)
            {
                log.Error("HandleBank error", ex);
                session.Network.EnqueueSend(new GameMessageSystemChat("Bank command failed due to server error.", ChatMessageType.Broadcast));
            }
        }

        // quest info (uses GDLe formatting to match plugin expectations)
        [CommandHandler("myquests", AccessLevel.Player, CommandHandlerFlag.RequiresWorld, "Shows your quest log")]
        public static void HandleQuests(Session session, params string[] parameters)
        {
            if (!PropertyManager.GetBool("quest_info_enabled").Item)
            {
                session.Network.EnqueueSend(new GameMessageSystemChat("The command \"myquests\" is not currently enabled on this server.", ChatMessageType.Broadcast));
                return;
            }

            var quests = session.Player.QuestManager.GetQuests();

            if (quests.Count == 0)
            {
                session.Network.EnqueueSend(new GameMessageSystemChat("Quest list is empty.", ChatMessageType.Broadcast));
                return;
            }

            foreach (var playerQuest in quests)
            {
                var text = "";
                var questName = QuestManager.GetQuestName(playerQuest.QuestName);
                var quest = DatabaseManager.World.GetCachedQuest(questName);
                if (quest == null)
                {
                    //Console.WriteLine($"Couldn't find quest {playerQuest.QuestName}");
                    continue;
                }

                var minDelta = quest.MinDelta;
                if (QuestManager.CanScaleQuestMinDelta(quest))
                    minDelta = (uint)(quest.MinDelta * PropertyManager.GetDouble("quest_mindelta_rate").Item);

                text += $"{playerQuest.QuestName.ToLower()} - {playerQuest.NumTimesCompleted} solves ({playerQuest.LastTimeCompleted})";
                text += $"\"{quest.Message}\" {quest.MaxSolves} {minDelta}";

                session.Network.EnqueueSend(new GameMessageSystemChat(text, ChatMessageType.Broadcast));
            }
        }

        /// <summary>
        /// For characters/accounts who currently own multiple houses, used to select which house they want to keep
        /// </summary>
        [CommandHandler("house-select", AccessLevel.Player, CommandHandlerFlag.RequiresWorld, 1, "For characters/accounts who currently own multiple houses, used to select which house they want to keep")]
        public static void HandleHouseSelect(Session session, params string[] parameters)
        {
            HandleHouseSelect(session, false, parameters);
        }

        public static void HandleHouseSelect(Session session, bool confirmed, params string[] parameters)
        {
            if (!int.TryParse(parameters[0], out var houseIdx))
                return;

            // ensure current multihouse owner
            if (!session.Player.IsMultiHouseOwner(false))
            {
                log.Warn($"{session.Player.Name} tried to /house-select {houseIdx}, but they are not currently a multi-house owner!");
                return;
            }

            // get house info for this index
            var multihouses = session.Player.GetMultiHouses();

            if (houseIdx < 1 || houseIdx > multihouses.Count)
            {
                session.Network.EnqueueSend(new GameMessageSystemChat($"Please enter a number between 1 and {multihouses.Count}.", ChatMessageType.Broadcast));
                return;
            }

            var keepHouse = multihouses[houseIdx - 1];

            // show confirmation popup
            if (!confirmed)
            {
                var houseType = $"{keepHouse.HouseType}".ToLower();
                var loc = HouseManager.GetCoords(keepHouse.SlumLord.Location);

                var msg = $"Are you sure you want to keep the {houseType} at\n{loc}?";
                if (!session.Player.ConfirmationManager.EnqueueSend(new Confirmation_Custom(session.Player.Guid, () => HandleHouseSelect(session, true, parameters)), msg))
                    session.Player.SendWeenieError(WeenieError.ConfirmationInProgress);
                return;
            }

            // house to keep confirmed, abandon the other houses
            var abandonHouses = new List<House>(multihouses);
            abandonHouses.RemoveAt(houseIdx - 1);

            foreach (var abandonHouse in abandonHouses)
            {
                var house = session.Player.GetHouse(abandonHouse.Guid.Full);

                HouseManager.HandleEviction(house, house.HouseOwner ?? 0, true);
            }

            // set player properties for house to keep
            var player = PlayerManager.FindByGuid(keepHouse.HouseOwner ?? 0, out bool isOnline);
            if (player == null)
            {
                log.Error($"{session.Player.Name}.HandleHouseSelect({houseIdx}) - couldn't find HouseOwner {keepHouse.HouseOwner} for {keepHouse.Name} ({keepHouse.Guid})");
                return;
            }

            player.HouseId = keepHouse.HouseId;
            player.HouseInstance = keepHouse.Guid.Full;

            player.SaveBiotaToDatabase();

            // update house panel for current player
            var actionChain = new ActionChain();
            actionChain.AddDelaySeconds(3.0f);  // wait for slumlord inventory biotas above to save
            actionChain.AddAction(session.Player, session.Player.HandleActionQueryHouse);
            actionChain.EnqueueChain();

            Console.WriteLine("OK");
        }

        [CommandHandler("debugcast", AccessLevel.Player, CommandHandlerFlag.RequiresWorld, "Shows debug information about the current magic casting state")]
        public static void HandleDebugCast(Session session, params string[] parameters)
        {
            var physicsObj = session.Player.PhysicsObj;

            var pendingActions = physicsObj.MovementManager.MoveToManager.PendingActions;
            var currAnim = physicsObj.PartArray.Sequence.CurrAnim;

            session.Network.EnqueueSend(new GameMessageSystemChat(session.Player.MagicState.ToString(), ChatMessageType.Broadcast));
            session.Network.EnqueueSend(new GameMessageSystemChat($"IsMovingOrAnimating: {physicsObj.IsMovingOrAnimating}", ChatMessageType.Broadcast));
            session.Network.EnqueueSend(new GameMessageSystemChat($"PendingActions: {pendingActions.Count}", ChatMessageType.Broadcast));
            session.Network.EnqueueSend(new GameMessageSystemChat($"CurrAnim: {currAnim?.Value.Anim.ID:X8}", ChatMessageType.Broadcast));
        }

        [CommandHandler("fixcast", AccessLevel.Player, CommandHandlerFlag.RequiresWorld, "Fixes magic casting if locked up for an extended time")]
        public static void HandleFixCast(Session session, params string[] parameters)
        {
            var magicState = session.Player.MagicState;

            if (magicState.IsCasting && DateTime.UtcNow - magicState.StartTime > TimeSpan.FromSeconds(5))
            {
                session.Network.EnqueueSend(new GameEventCommunicationTransientString(session, "Fixed casting state"));
                session.Player.SendUseDoneEvent();
                magicState.OnCastDone();
            }
        }

        [CommandHandler("castmeter", AccessLevel.Player, CommandHandlerFlag.RequiresWorld, "Shows the fast casting efficiency meter")]
        public static void HandleCastMeter(Session session, params string[] parameters)
        {
            if (parameters.Length == 0)
            {
                session.Player.MagicState.CastMeter = !session.Player.MagicState.CastMeter;
            }
            else
            {
                if (parameters[0].Equals("on", StringComparison.OrdinalIgnoreCase))
                    session.Player.MagicState.CastMeter = true;
                else
                    session.Player.MagicState.CastMeter = false;
            }
            session.Network.EnqueueSend(new GameMessageSystemChat($"Cast efficiency meter {(session.Player.MagicState.CastMeter ? "enabled" : "disabled")}", ChatMessageType.Broadcast));
        }

        private static List<string> configList = new List<string>()
        {
            "Common settings:\nConfirmVolatileRareUse, MainPackPreferred, SalvageMultiple, SideBySideVitals, UseCraftSuccessDialog",
            "Interaction settings:\nAcceptLootPermits, AllowGive, AppearOffline, AutoAcceptFellowRequest, DragItemOnPlayerOpensSecureTrade, FellowshipShareLoot, FellowshipShareXP, IgnoreAllegianceRequests, IgnoreFellowshipRequests, IgnoreTradeRequests, UseDeception",
            "UI settings:\nCoordinatesOnRadar, DisableDistanceFog, DisableHouseRestrictionEffects, DisableMostWeatherEffects, FilterLanguage, LockUI, PersistentAtDay, ShowCloak, ShowHelm, ShowTooltips, SpellDuration, TimeStamp, ToggleRun, UseMouseTurning",
            "Chat settings:\nHearAllegianceChat, HearGeneralChat, HearLFGChat, HearRoleplayChat, HearSocietyChat, HearTradeChat, HearPKDeaths, StayInChatMode",
            "Combat settings:\nAdvancedCombatUI, AutoRepeatAttack, AutoTarget, LeadMissileTargets, UseChargeAttack, UseFastMissiles, ViewCombatTarget, VividTargetingIndicator",
            "Character display settings:\nDisplayAge, DisplayAllegianceLogonNotifications, DisplayChessRank, DisplayDateOfBirth, DisplayFishingSkill, DisplayNumberCharacterTitles, DisplayNumberDeaths"
        };

        /// <summary>
        /// Mapping of GDLE -> ACE CharacterOptions
        /// </summary>
        private static Dictionary<string, string> translateOptions = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase)
        {
            // Common
            { "ConfirmVolatileRareUse", "ConfirmUseOfRareGems" },
            { "MainPackPreferred", "UseMainPackAsDefaultForPickingUpItems" },
            { "SalvageMultiple", "SalvageMultipleMaterialsAtOnce" },
            { "SideBySideVitals", "SideBySideVitals" },
            { "UseCraftSuccessDialog", "UseCraftingChanceOfSuccessDialog" },

            // Interaction
            { "AcceptLootPermits", "AcceptCorpseLootingPermissions" },
            { "AllowGive", "LetOtherPlayersGiveYouItems" },
            { "AppearOffline", "AppearOffline" },
            { "AutoAcceptFellowRequest", "AutomaticallyAcceptFellowshipRequests" },
            { "DragItemOnPlayerOpensSecureTrade", "DragItemToPlayerOpensTrade" },
            { "FellowshipShareLoot", "ShareFellowshipLoot" },
            { "FellowshipShareXP", "ShareFellowshipExpAndLuminance" },
            { "IgnoreAllegianceRequests", "IgnoreAllegianceRequests" },
            { "IgnoreFellowshipRequests", "IgnoreFellowshipRequests" },
            { "IgnoreTradeRequests", "IgnoreAllTradeRequests" },
            { "UseDeception", "AttemptToDeceiveOtherPlayers" },

            // UI
            { "CoordinatesOnRadar", "ShowCoordinatesByTheRadar" },
            { "DisableDistanceFog", "DisableDistanceFog" },
            { "DisableHouseRestrictionEffects", "DisableHouseRestrictionEffects" },
            { "DisableMostWeatherEffects", "DisableMostWeatherEffects" },
            { "FilterLanguage", "FilterLanguage" },
            { "LockUI", "LockUI" },
            { "PersistentAtDay", "AlwaysDaylightOutdoors" },
            { "ShowCloak", "ShowYourCloak" },
            { "ShowHelm", "ShowYourHelmOrHeadGear" },
            { "ShowTooltips", "Display3dTooltips" },
            { "SpellDuration", "DisplaySpellDurations" },
            { "TimeStamp", "DisplayTimestamps" },
            { "ToggleRun", "RunAsDefaultMovement" },
            { "UseMouseTurning", "UseMouseTurning" },

            // Chat
            { "HearAllegianceChat", "ListenToAllegianceChat" },
            { "HearGeneralChat", "ListenToGeneralChat" },
            { "HearLFGChat", "ListenToLFGChat" },
            { "HearRoleplayChat", "ListentoRoleplayChat" },
            { "HearSocietyChat", "ListenToSocietyChat" },
            { "HearTradeChat", "ListenToTradeChat" },
            { "HearPKDeaths", "ListenToPKDeathMessages" },
            { "StayInChatMode", "StayInChatModeAfterSendingMessage" },

            // Combat
            { "AdvancedCombatUI", "AdvancedCombatInterface" },
            { "AutoRepeatAttack", "AutoRepeatAttacks" },
            { "AutoTarget", "AutoTarget" },
            { "LeadMissileTargets", "LeadMissileTargets" },
            { "UseChargeAttack", "UseChargeAttack" },
            { "UseFastMissiles", "UseFastMissiles" },
            { "ViewCombatTarget", "KeepCombatTargetsInView" },
            { "VividTargetingIndicator", "VividTargetingIndicator" },

            // Character Display
            { "DisplayAge", "AllowOthersToSeeYourAge" },
            { "DisplayAllegianceLogonNotifications", "ShowAllegianceLogons" },
            { "DisplayChessRank", "AllowOthersToSeeYourChessRank" },
            { "DisplayDateOfBirth", "AllowOthersToSeeYourDateOfBirth" },
            { "DisplayFishingSkill", "AllowOthersToSeeYourFishingSkill" },
            { "DisplayNumberCharacterTitles", "AllowOthersToSeeYourNumberOfTitles" },
            { "DisplayNumberDeaths", "AllowOthersToSeeYourNumberOfDeaths" },
        };

        /// <summary>
        /// Manually sets a character option on the server. Use /config list to see a list of settings.
        /// </summary>
        [CommandHandler("config", AccessLevel.Player, CommandHandlerFlag.RequiresWorld, 1, "Manually sets a character option on the server.\nUse /config list to see a list of settings.", "<setting> <on/off>")]
        public static void HandleConfig(Session session, params string[] parameters)
        {
            if (!PropertyManager.GetBool("player_config_command").Item)
            {
                session.Network.EnqueueSend(new GameMessageSystemChat("The command \"config\" is not currently enabled on this server.", ChatMessageType.Broadcast));
                return;
            }

            // /config list - show character options
            if (parameters[0].Equals("list", StringComparison.OrdinalIgnoreCase))
            {
                foreach (var line in configList)
                    session.Network.EnqueueSend(new GameMessageSystemChat(line, ChatMessageType.Broadcast));

                return;
            }

            // translate GDLE CharacterOptions for existing plugins
            if (!translateOptions.TryGetValue(parameters[0], out var param) || !Enum.TryParse(param, out CharacterOption characterOption))
            {
                session.Network.EnqueueSend(new GameMessageSystemChat($"Unknown character option: {parameters[0]}", ChatMessageType.Broadcast));
                return;
            }

            var option = session.Player.GetCharacterOption(characterOption);

            // modes of operation:
            // on / off / toggle

            // - if none specified, default to toggle
            var mode = "toggle";

            if (parameters.Length > 1)
            {
                if (parameters[1].Equals("on", StringComparison.OrdinalIgnoreCase))
                    mode = "on";
                else if (parameters[1].Equals("off", StringComparison.OrdinalIgnoreCase))
                    mode = "off";
            }

            // set character option
            if (mode.Equals("on"))
                option = true;
            else if (mode.Equals("off"))
                option = false;
            else
                option = !option;

            session.Player.SetCharacterOption(characterOption, option);

            session.Network.EnqueueSend(new GameMessageSystemChat($"Character option {parameters[0]} is now {(option ? "on" : "off")}.", ChatMessageType.Broadcast));

            // update client
            session.Network.EnqueueSend(new GameEventPlayerDescription(session));
        }

        /// <summary>
        /// Force resend of all visible objects known to this player. Can fix rare cases of invisible object bugs.
        /// Can only be used once every 5 mins max.
        /// </summary>
        [CommandHandler("objsend", AccessLevel.Player, CommandHandlerFlag.RequiresWorld, "Force resend of all visible objects known to this player. Can fix rare cases of invisible object bugs. Can only be used once every 5 mins max.")]
        public static void HandleObjSend(Session session, params string[] parameters)
        {
            // a good repro spot for this is the first room after the door in facility hub
            // in the portal drop / staircase room, the VisibleCells do not have the room after the door
            // however, the room after the door *does* have the portal drop / staircase room in its VisibleCells (the inverse relationship is imbalanced)
            // not sure how to fix this atm, seems like it triggers a client bug..

            if (DateTime.UtcNow - session.Player.PrevObjSend < TimeSpan.FromMinutes(5))
            {
                session.Player.SendTransientError("You have used this command too recently!");
                return;
            }

            var creaturesOnly = parameters.Length > 0 && parameters[0].Contains("creature", StringComparison.OrdinalIgnoreCase);

            var knownObjs = session.Player.GetKnownObjects();

            foreach (var knownObj in knownObjs)
            {
                if (creaturesOnly && !(knownObj is Creature))
                    continue;

                session.Player.RemoveTrackedObject(knownObj, false);
                session.Player.TrackObject(knownObj);
            }
            session.Player.PrevObjSend = DateTime.UtcNow;
        }

        // show player ace server versions
        [CommandHandler("aceversion", AccessLevel.Player, CommandHandlerFlag.RequiresWorld, "Shows this server's version data")]
        public static void HandleACEversion(Session session, params string[] parameters)
        {
            if (!PropertyManager.GetBool("version_info_enabled").Item)
            {
                session.Network.EnqueueSend(new GameMessageSystemChat("The command \"aceversion\" is not currently enabled on this server.", ChatMessageType.Broadcast));
                return;
            }

            var msg = ServerBuildInfo.GetVersionInfo();

            session.Network.EnqueueSend(new GameMessageSystemChat(msg, ChatMessageType.WorldBroadcast));
        }

        // reportbug < code | content > < description >
        [CommandHandler("reportbug", AccessLevel.Player, CommandHandlerFlag.RequiresWorld, 2,
            "Generate a Bug Report",
            "<category> <description>\n" +
            "This command generates a URL for you to copy and paste into your web browser to submit for review by server operators and developers.\n" +
            "Category can be the following:\n" +
            "Creature\n" +
            "NPC\n" +
            "Item\n" +
            "Quest\n" +
            "Recipe\n" +
            "Landblock\n" +
            "Mechanic\n" +
            "Code\n" +
            "Other\n" +
            "For the first three options, the bug report will include identifiers for what you currently have selected/targeted.\n" +
            "After category, please include a brief description of the issue, which you can further detail in the report on the website.\n" +
            "Examples:\n" +
            "/reportbug creature Drudge Prowler is over powered\n" +
            "/reportbug npc Ulgrim doesn't know what to do with Sake\n" +
            "/reportbug quest I can't enter the portal to the Lost City of Frore\n" +
            "/reportbug recipe I cannot combine Bundle of Arrowheads with Bundle of Arrowshafts\n" +
            "/reportbug code I was killed by a Non-Player Killer\n"
            )]
        public static void HandleReportbug(Session session, params string[] parameters)
        {
            if (!PropertyManager.GetBool("reportbug_enabled").Item)
            {
                session.Network.EnqueueSend(new GameMessageSystemChat("The command \"reportbug\" is not currently enabled on this server.", ChatMessageType.Broadcast));
                return;
            }

            var category = parameters[0];
            var description = "";

            for (var i = 1; i < parameters.Length; i++)
                description += parameters[i] + " ";

            description.Trim();

            switch (category.ToLower())
            {
                case "creature":
                case "npc":
                case "quest":
                case "item":
                case "recipe":
                case "landblock":
                case "mechanic":
                case "code":
                case "other":
                    break;
                default:
                    category = "Other";
                    break;
            }

            var sn = ConfigManager.Config.Server.WorldName;
            var c = session.Player.Name;

            var st = "ACE";

            //var versions = ServerBuildInfo.GetVersionInfo();
            var databaseVersion = DatabaseManager.World.GetVersion();
            var sv = ServerBuildInfo.FullVersion;
            var pv = databaseVersion.PatchVersion;

            //var ct = PropertyManager.GetString("reportbug_content_type").Item;
            var cg = category.ToLower();

            var w = "";
            var g = "";

            if (cg == "creature" || cg == "npc"|| cg == "item" || cg == "item")
            {
                var objectId = new ObjectGuid();
                if (session.Player.HealthQueryTarget.HasValue || session.Player.ManaQueryTarget.HasValue || session.Player.CurrentAppraisalTarget.HasValue)
                {
                    if (session.Player.HealthQueryTarget.HasValue)
                        objectId = new ObjectGuid((uint)session.Player.HealthQueryTarget);
                    else if (session.Player.ManaQueryTarget.HasValue)
                        objectId = new ObjectGuid((uint)session.Player.ManaQueryTarget);
                    else
                        objectId = new ObjectGuid((uint)session.Player.CurrentAppraisalTarget);

                    //var wo = session.Player.CurrentLandblock?.GetObject(objectId);

                    var wo = session.Player.FindObject(objectId.Full, Player.SearchLocations.Everywhere);

                    if (wo != null)
                    {
                        w = $"{wo.WeenieClassId}";
                        g = $"0x{wo.Guid:X8}";
                    }
                }
            }

            var l = session.Player.Location.ToLOCString();

            var issue = description;

            var urlbase = $"https://www.accpp.net/bug?";

            var url = urlbase;
            if (sn.Length > 0)
                url += $"sn={Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(sn))}";
            if (c.Length > 0)
                url += $"&c={Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(c))}";
            if (st.Length > 0)
                url += $"&st={Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(st))}";
            if (sv.Length > 0)
                url += $"&sv={Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(sv))}";
            if (pv.Length > 0)
                url += $"&pv={Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(pv))}";
            //if (ct.Length > 0)
            //    url += $"&ct={Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(ct))}";
            if (cg.Length > 0)
            {
                if (cg == "npc")
                    cg = cg.ToUpper();
                else
                    cg = char.ToUpper(cg[0]) + cg.Substring(1);
                url += $"&cg={Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(cg))}";
            }
            if (w.Length > 0)
                url += $"&w={Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(w))}";
            if (g.Length > 0)
                url += $"&g={Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(g))}";
            if (l.Length > 0)
                url += $"&l={Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(l))}";
            if (issue.Length > 0)
                url += $"&i={Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(issue))}";

            var msg = "\n\n\n\n";
            msg += "Bug Report - Copy and Paste the following URL into your browser to submit a bug report\n";
            msg += "-=-\n";
            msg += $"{url}\n";
            msg += "-=-\n";
            msg += "\n\n\n\n";

            session.Network.EnqueueSend(new GameMessageSystemChat(msg, ChatMessageType.AdminTell));
        }
    }
}
