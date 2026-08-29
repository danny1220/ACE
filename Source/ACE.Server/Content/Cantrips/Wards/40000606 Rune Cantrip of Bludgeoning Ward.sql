DELETE FROM `weenie` WHERE `class_Id` = 40000606;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000606, 'gemcantripbludgeonward01', 38, '2026-01-01 00:00:00') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000606,   1,       2048) /* ItemType - Gem */
     , (40000606,   3,         39) /* PaletteTemplate - Black */
     , (40000606,   5,          5) /* EncumbranceVal */
     , (40000606,   8,          5) /* Mass */
     , (40000606,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000606,  17,        138) /* RareId */
     , (40000606,  18,          1) /* UiEffects - Magical */
     , (40000606,  19,         50) /* Value */
     , (40000606,  33,         -1) /* Bonded - Slippery */
     , (40000606,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000606, 150,        103) /* HookPlacement - Hook */
     , (40000606, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000606,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000606,   1, 'Rune Cantrip of Bludgeoning Ward') /* Name */
     , (40000606,  16, 'Use this gem to add Legendary Bludgeoning Ward. This gem will be destroyed upon use.') /* LongDesc */
;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000606,   1, 0x020009A7) /* Setup */
     , (40000606,   3, 0x20000014) /* SoundTable */
     , (40000606,   6, 0x040001FA) /* PaletteBase */
     , (40000606,   7, 0x1000010B) /* ClothingBase */
     , (40000606,   8, 0x06005B1E) /* Icon */
     , (40000606,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000606,  50, 0x06005B1F) /* IconOverlay */
     , (40000606,  52, 0x06005B0C) /* IconUnderlay */
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);
