DELETE FROM `weenie` WHERE `class_Id` = 40000573;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000573, 'ace40000573-hieroglyphoftwohandedweaponsmastery', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000573,   1,       2048) /* ItemType - Gem */
     , (40000573,   3,         39) /* PaletteTemplate - Black */
     , (40000573,   5,          5) /* EncumbranceVal */
     , (40000573,   8,          5) /* Mass */
     , (40000573,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000573,  17,         83) /* RareId */
     , (40000573,  18,          1) /* UiEffects - Magical */
     , (40000573,  19,          0) /* Value */
     , (40000573,  33,         -1) /* Bonded - Slippery */
     , (40000573,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000573,  94,         35215) /* TargetType - Vestements */
     , (40000573, 150,        103) /* HookPlacement - Hook */
     , (40000573, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000573,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000573,   1, 'Hieroglyph of Two Handed Weapons Mastery') /* Name */
     , (40000573,  16, 'Use this gem to add Legendary Two Handed Combat Aptitude. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000573,   1, 0x020009A7) /* Setup */
     , (40000573,   3, 0x20000014) /* SoundTable */
     , (40000573,   6, 0x040001FA) /* PaletteBase */
     , (40000573,   7, 0x1000010B) /* ClothingBase */
     , (40000573,   8, 0x06005B22) /* Icon */
     , (40000573,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000573,  50, 0x06006B03) /* IconOverlay */
     , (40000573,  52, 0x06005B0C) /* IconUnderlay */;
