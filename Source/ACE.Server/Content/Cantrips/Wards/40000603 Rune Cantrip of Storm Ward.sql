DELETE FROM `weenie` WHERE `class_Id` = 40000603;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000603, 'gemcantripstormward01', 38, '2026-01-01 00:00:00') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000603,   1,       2048) /* ItemType - Gem */
     , (40000603,   3,         39) /* PaletteTemplate - Black */
     , (40000603,   5,          5) /* EncumbranceVal */
     , (40000603,   8,          5) /* Mass */
     , (40000603,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000603,  17,        138) /* RareId */
     , (40000603,  18,          1) /* UiEffects - Magical */
     , (40000603,  19,         50) /* Value */
     , (40000603,  33,         -1) /* Bonded - Slippery */
     , (40000603,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000603, 150,        103) /* HookPlacement - Hook */
     , (40000603, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000603,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000603,   1, 'Rune Cantrip of Storm Ward') /* Name */
     , (40000603,  16, 'Use this gem to add Legendary Storm Ward. This gem will be destroyed upon use.') /* LongDesc */
;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000603,   1, 0x020009A7) /* Setup */
     , (40000603,   3, 0x20000014) /* SoundTable */
     , (40000603,   6, 0x040001FA) /* PaletteBase */
     , (40000603,   7, 0x1000010B) /* ClothingBase */
     , (40000603,   8, 0x06005B1E) /* Icon */
     , (40000603,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000603,  50, 0x06005B1F) /* IconOverlay */
     , (40000603,  52, 0x06005B0C) /* IconUnderlay */
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);
