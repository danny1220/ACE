DELETE FROM `weenie` WHERE `class_Id` = 40000605;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000605, 'gemcantripslashingward01', 38, '2026-01-01 00:00:00') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000605,   1,       2048) /* ItemType - Gem */
     , (40000605,   3,         39) /* PaletteTemplate - Black */
     , (40000605,   5,          5) /* EncumbranceVal */
     , (40000605,   8,          5) /* Mass */
     , (40000605,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000605,  17,        138) /* RareId */
     , (40000605,  18,          1) /* UiEffects - Magical */
     , (40000605,  19,         50) /* Value */
     , (40000605,  33,         -1) /* Bonded - Slippery */
     , (40000605,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000605, 150,        103) /* HookPlacement - Hook */
     , (40000605, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000605,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000605,   1, 'Rune Cantrip of Slashing Ward') /* Name */
     , (40000605,  16, 'Use this gem to add Legendary Slashing Ward. This gem will be destroyed upon use.') /* LongDesc */
;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000605,   1, 0x020009A7) /* Setup */
     , (40000605,   3, 0x20000014) /* SoundTable */
     , (40000605,   6, 0x040001FA) /* PaletteBase */
     , (40000605,   7, 0x1000010B) /* ClothingBase */
     , (40000605,   8, 0x06005B1E) /* Icon */
     , (40000605,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000605,  50, 0x06005B1F) /* IconOverlay */
     , (40000605,  52, 0x06005B0C) /* IconUnderlay */
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);
