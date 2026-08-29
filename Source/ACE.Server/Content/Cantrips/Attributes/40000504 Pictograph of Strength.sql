DELETE FROM `weenie` WHERE `class_Id` = 40000504;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000504, 'sliverstrength', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000504,   1,       2048) /* ItemType - Gem */
     , (40000504,   3,         39) /* PaletteTemplate - Black */
     , (40000504,   5,          5) /* EncumbranceVal */
     , (40000504,   8,          5) /* Mass */
     , (40000504,  16,     524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000504,  17,         77) /* RareId */
     , (40000504,  18,          1) /* UiEffects - Magical */
     , (40000504,  19,         50) /* Value */
     , (40000504,  33,         -1) /* Bonded - Slippery */
     , (40000504,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000504,  94,      35215) /* TargetType - Jewelry, Misc, Gem, RedirectableItemEnchantmentTarget */
     , (40000504, 150,        103) /* HookPlacement - Hook */
     , (40000504, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000504,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000504,   1, 'Pictograph Cantrip of Strength') /* Name */
     , (40000504,  16, 'Use this gem to add Legendary Strength. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000504,   1, 0x020009A7) /* Setup */
     , (40000504,   3, 0x20000014) /* SoundTable */
     , (40000504,   6, 0x040001FA) /* PaletteBase */
     , (40000504,   7, 0x1000010B) /* ClothingBase */
     , (40000504,   8, 0x06005B30) /* Icon */
     , (40000504,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000504,  50, 0x06005B60) /* IconOverlay */
     , (40000504,  51, 0x06005B60) /* IconOverlaySecondary */
     , (40000504,  52, 0x06005B0C) /* IconUnderlay */;
