DELETE FROM `weenie` WHERE `class_Id` = 40000563;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000563, 'gemrareeternalswiftkiller01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000563,   1,       2048) /* ItemType - Gem */
     , (40000563,   3,         39) /* PaletteTemplate - Black */
     , (40000563,   5,          5) /* EncumbranceVal */
     , (40000563,   8,          5) /* Mass */
     , (40000563,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000563,  17,        132) /* RareId */
     , (40000563,  18,          1) /* UiEffects - Magical */
     , (40000563,  19,          0) /* Value */
     , (40000563,  33,         -1) /* Bonded - Slippery */
     , (40000563,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000563,  94,         257) /* TargetType - Weapon */
     , (40000563, 150,        103) /* HookPlacement - Hook */
     , (40000563, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000563,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000563,   1, 'Rune of Swift Killer') /* Name */
     , (40000563,  16, 'Use this gem to add Legendary Swift Hunter. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000563,   1, 0x020009A7) /* Setup */
     , (40000563,   3, 0x20000014) /* SoundTable */
     , (40000563,   6, 0x040001FA) /* PaletteBase */
     , (40000563,   7, 0x1000010B) /* ClothingBase */
     , (40000563,   8, 0x06005B1E) /* Icon */
     , (40000563,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000563,  50, 0x06005B61) /* IconOverlay */
     , (40000563,  52, 0x06005B0C) /* IconUnderlay */;
