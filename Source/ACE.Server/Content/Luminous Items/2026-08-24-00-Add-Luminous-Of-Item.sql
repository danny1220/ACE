-- Adds weenie class for luminous of item (WCID 40000500)
-- This item is a Gem weenie that when used from inventory grants a permanent +2% to item enchantment spells.

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000500, 'ace40000500_luminous_of_item', 38, NOW())
ON DUPLICATE KEY UPDATE `class_Name` = VALUES(`class_Name`), `type` = VALUES(`type`);

-- Set display name and internal name
INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES
  (40000500, 1, 'luminous of item'), -- PropertyString.Name
  (40000500, 42, 'luminous of item') -- PropertyString.DisplayName
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);

-- Set icon texture (new_Id uses hex 0x06001FBA -> decimal 100671418)
INSERT INTO `weenie_properties_texture_map` (`object_Id`, `index`, `old_Id`, `new_Id`)
VALUES (40000500, 0, 0, 100671418)
ON DUPLICATE KEY UPDATE `old_Id` = VALUES(`old_Id`), `new_Id` = VALUES(`new_Id`);

-- Basic item int properties
INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES
  (40000500, 1, 2048), -- ItemType = Gem (0x00000800)
  (40000500, 11, 1),  -- MaxStackSize = 1
  (40000500, 12, 1),  -- StackSize = 1
  (40000500, 16, 8),  -- ItemUseable = Usable.Contained (0x08)
  (40000500, 19, 50)  -- Value = 50 (coin value)
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);

-- Use animation/sound (makes gem use show drink animation and eat sound)
-- UseSound (PropertyDataId.UseSound = 23) -> Sound.Eat1 (0x40 = 64)
-- UseUserAnimation (PropertyDataId.UseUserAnimation = 27) -> MotionCommand.Drink (0x4000001b = 1073741851)
INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES
  (40000500, 23, 64),
  (40000500, 27, 1073741851)
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);

-- Set Icon DID so client shows an icon (PropertyDataId.Icon = 8)
-- Using hex DID 0x06001FBA as requested
INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES
  (40000500, 8, 0x06001FBA)
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);

-- Short description (PropertyString.ShortDesc = 15)
INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES
  (40000500, 15, 'A small gem that enhances your item enchantment power permanently.' )
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);

-- Comment: This gem is handled in server code: when a player uses the gem (from inventory)
-- the server will increment the player's ItemEnchantmentEffectivenessPercent by +2 and persist it.
-- Comment: This gem is handled in server code: when a player uses the gem (from inventory)
-- the server will increment the player's ItemEnchantmentEffectivenessPercent by +2 and persist it.
