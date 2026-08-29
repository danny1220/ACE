-- Adds weenie class for luminous of life (WCID 40000502)
-- This item is a Gem weenie that when used from inventory grants a permanent +2% to life magic spells.

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000502, 'ace40000502_luminous_of_life', 38, NOW())
ON DUPLICATE KEY UPDATE `class_Name` = VALUES(`class_Name`), `type` = VALUES(`type`);

-- Name / DisplayName
INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES
  (40000502, 1, 'luminous of life'), -- PropertyString.Name
  (40000502, 42, 'luminous of life') -- PropertyString.DisplayName
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);

-- Icon texture map
INSERT INTO `weenie_properties_texture_map` (`object_Id`, `index`, `old_Id`, `new_Id`)
VALUES (40000502, 0, 0, 100671418)
ON DUPLICATE KEY UPDATE `old_Id` = VALUES(`old_Id`), `new_Id` = VALUES(`new_Id`);

-- Basic int properties
INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES
  (40000502, 1, 2048), -- ItemType = Gem (0x00000800)
  (40000502, 11, 1),  -- MaxStackSize = 1
  (40000502, 12, 1),  -- StackSize = 1
  (40000502, 16, 8),  -- ItemUseable = Usable.Contained (0x08)
  (40000502, 19, 50)   -- Value = 50
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);

-- Use animation/sound and icon DID
INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES
  (40000502, 23, 64),          -- UseSound = Eat1
  (40000502, 27, 1073741851),  -- UseUserAnimation = Drink
  (40000502, 8, 0x06001FBA)    -- Icon DID
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);

-- Short description
INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES
  (40000502, 15, 'A small gem that enhances your life magic power permanently.' )
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);
