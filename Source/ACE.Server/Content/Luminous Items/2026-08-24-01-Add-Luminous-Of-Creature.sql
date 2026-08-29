-- Adds weenie class for luminous of creature (WCID 40000501)
-- This item is a Gem weenie that when used from inventory grants a permanent +2% to creature enchantment spells.

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000501, 'ace40000501_luminous_of_creature', 38, NOW())
ON DUPLICATE KEY UPDATE `class_Name` = VALUES(`class_Name`), `type` = VALUES(`type`);

-- Name / DisplayName
INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES
  (40000501, 1, 'luminous of creature'), -- PropertyString.Name
  (40000501, 42, 'luminous of creature') -- PropertyString.DisplayName
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);

-- Icon texture map (client icon mapping may use PropertyDataId.Icon instead)
INSERT INTO `weenie_properties_texture_map` (`object_Id`, `index`, `old_Id`, `new_Id`)
VALUES (40000501, 0, 0, 100671418)
ON DUPLICATE KEY UPDATE `old_Id` = VALUES(`old_Id`), `new_Id` = VALUES(`new_Id`);

-- Basic int properties
INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES
  (40000501, 1, 2048), -- ItemType = Gem (0x00000800)
  (40000501, 11, 1),  -- MaxStackSize = 1
  (40000501, 12, 1),  -- StackSize = 1
  (40000501, 16, 8),  -- ItemUseable = Usable.Contained (0x08)
  (40000501, 19, 50)   -- Value = 50
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);

-- Use animation/sound and icon DID
INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES
  (40000501, 23, 64),          -- UseSound = Eat1
  (40000501, 27, 1073741851),  -- UseUserAnimation = Drink
  (40000501, 8, 0x06001FBA)    -- Icon DID
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);

-- Short description
INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES
  (40000501, 15, 'A small gem that enhances your creature enchantment power permanently.' )
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);
