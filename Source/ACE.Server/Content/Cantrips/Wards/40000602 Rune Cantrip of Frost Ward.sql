DELETE FROM `weenie` WHERE `class_Id` = 40000602;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000602, 'gemcantripfrostward01', 38, '2026-01-01 00:00:00') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000602,   1,       2048) /* ItemType - Gem */
     , (40000602,   3,         39) /* PaletteTemplate - Black */
     , (40000602,   5,          5) /* EncumbranceVal */
     , (40000602,   8,          5) /* Mass */
     , (40000602,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000602,  17,        138) /* RareId */
     , (40000602,  18,          1) /* UiEffects - Magical */
     , (40000602,  19,         50) /* Value */
     , (40000602,  33,         -1) /* Bonded - Slippery */
     , (40000602,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000602, 150,        103) /* HookPlacement - Hook */
     , (40000602, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000602,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000602,   1, 'Rune Cantrip of Frost Ward') /* Name */
     , (40000602,  16, 'Use this gem to add Legendary Frost Ward. This gem will be destroyed upon use.') /* LongDesc */
;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000602,   1, 0x020009A7) /* Setup */
     , (40000602,   3, 0x20000014) /* SoundTable */
     , (40000602,   6, 0x040001FA) /* PaletteBase */
     , (40000602,   7, 0x1000010B) /* ClothingBase */
     , (40000602,   8, 0x06005B1E) /* Icon */
     , (40000602,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000602,  50, 0x06005B1F) /* IconOverlay */
     , (40000602,  52, 0x06005B0C) /* IconUnderlay */
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);
