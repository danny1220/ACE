DELETE FROM `weenie` WHERE `class_Id` = 40000561;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000561, 'gemrareeternalspiritdrinker01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000561,   1,       2048) /* ItemType - Gem */
     , (40000561,   3,         39) /* PaletteTemplate - Black */
     , (40000561,   5,          5) /* EncumbranceVal */
     , (40000561,   8,          5) /* Mass */
     , (40000561,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000561,  17,        133) /* RareId */
     , (40000561,  18,          1) /* UiEffects - Magical */
     , (40000561,  19,          0) /* Value */
     , (40000561,  33,         -1) /* Bonded - Slippery */
     , (40000561,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000561,  94,         32768) /* TargetType - Caster */
     , (40000561, 150,        103) /* HookPlacement - Hook */
     , (40000561, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000561,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000561,   1, 'Rune of Spirit Drinker') /* Name */
     , (40000561,  16, 'Use this gem to add Legendary Spirit Thirst. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000561,   1, 0x020009A7) /* Setup */
     , (40000561,   3, 0x20000014) /* SoundTable */
     , (40000561,   6, 0x040001FA) /* PaletteBase */
     , (40000561,   7, 0x1000010B) /* ClothingBase */
     , (40000561,   8, 0x06005B1E) /* Icon */
     , (40000561,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000561,  50, 0x06005B5D) /* IconOverlay */
     , (40000561,  52, 0x06005B0C) /* IconUnderlay */;
