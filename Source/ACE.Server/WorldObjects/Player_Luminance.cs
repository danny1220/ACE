using System;

using ACE.Entity.Enum;
using ACE.Entity.Enum.Properties;
using ACE.Server.Managers;
using ACE.Server.Network.GameMessages.Messages;

namespace ACE.Server.WorldObjects
{
    partial class Player
    {
        /// <summary>
        /// Applies luminance modifiers before adding luminance
        /// </summary>
        public void EarnLuminance(long amount, XpType xpType, ShareType shareType = ShareType.All)
        {
            if (IsOlthoiPlayer)
                return;

            // following the same model as Player_Xp
            var questModifier = PropertyManager.GetDouble("quest_lum_modifier").Item;
            var modifier = PropertyManager.GetDouble("luminance_modifier").Item;
            if (xpType == XpType.Quest)
                modifier *= questModifier;

            // should this be passed upstream to fellowship?
            var enchantment = GetXPAndLuminanceModifier(xpType);

            var m_amount = (long)Math.Round(amount * enchantment * modifier);

            GrantLuminance(m_amount, xpType, shareType);
        }

        /// <summary>
        /// Directly grants luminance to the player, without any additional luminance modifiers
        /// </summary>
        public void GrantLuminance(long amount, XpType xpType, ShareType shareType = ShareType.All)
        {
            if (IsOlthoiPlayer)
                return;

            if (Fellowship != null && Fellowship.ShareXP && shareType.HasFlag(ShareType.Fellowship))
            {
                // this will divy up the luminance, and re-call this function
                // with ShareType.Fellowship removed
                Fellowship.SplitLuminance((ulong)amount, xpType, shareType, this);
            }
            else
                AddLuminance(amount, xpType);
        }

        private void AddLuminance(long amount, XpType xpType)
        {
            var available = AvailableLuminance ?? 0;
            var maximum = MaximumLuminance ?? 0;

            if (available == maximum)
                return;

            // this is similar to Player_Xp.UpdateXpAndLevel()

            var remaining = maximum - available;

            var addAmount = Math.Min(amount, remaining);

            AvailableLuminance = available + addAmount;

            if (addAmount > 0)
                Session.Network.EnqueueSend(new GameMessageSystemChat($"You've gained {addAmount:N0} luminance.", ChatMessageType.Broadcast));

            // Update player's available luminance on the client
            UpdateLuminance();

            // Track accumulated luminance (lifetime earned) and persist occasionally
            try
            {
                var acc = GetProperty(ACE.Entity.Enum.Properties.PropertyInt64.AccumulatedLuminance) ?? 0L;
                var newAcc = acc + addAmount;
                SetProperty(ACE.Entity.Enum.Properties.PropertyInt64.AccumulatedLuminance, newAcc);
                // send private update for accumulated luminance so player can see progress if UI supports it
                Session.Network.EnqueueSend(new GameMessagePrivateUpdatePropertyInt64(this, ACE.Entity.Enum.Properties.PropertyInt64.AccumulatedLuminance, newAcc));

                // Persist periodically to avoid excessive DB writes: every 100k earned or when crossing 5,000,000
                if (newAcc >= 5000000 || (newAcc / 100000) != (acc / 100000))
                {
                    SaveBiotaToDatabase();
                }
            }
            catch { }
        }

        /// <summary>
        /// Spends the amount of luminance specified, deducting it from available luminance
        /// </summary>
        public bool SpendLuminance(long amount)
        {
            var available = AvailableLuminance ?? 0;

            if (amount > available)
                return false;

            AvailableLuminance = available - amount;

            UpdateLuminance();

            return true;
        }

        /// <summary>
        /// Sends network message to update luminance
        /// </summary>
        private void UpdateLuminance()
        {
            Session.Network.EnqueueSend(new GameMessagePrivateUpdatePropertyInt64(this, PropertyInt64.AvailableLuminance, AvailableLuminance ?? 0));
        }
    }
}
