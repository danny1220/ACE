DELETE FROM `weenie` WHERE `class_Id` = 40000505;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000505, 'sliverendurance', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000505,   1,       2048) /* ItemType - Gem */
     , (40000505,   3,         39) /* PaletteTemplate - Black */
     , (40000505,   5,          5) /* EncumbranceVal */
     , (40000505,   8,          5) /* Mass */
     , (40000505,  16,     524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000505,  17,         78) /* RareId */
     , (40000505,  18,          1) /* UiEffects - Magical */
     , (40000505,  19,         50) /* Value */
     , (40000505,  33,         -1) /* Bonded - Slippery */
     , (40000505,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000505,  94,      35215) /* TargetType - Jewelry, Misc, Gem, RedirectableItemEnchantmentTarget */
     , (40000505, 150,        103) /* HookPlacement - Hook */
     , (40000505, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000505,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000505,   1, 'Pictograph Cantrip of Endurance') /* Name */
     , (40000505,  16, 'Use this gem to add Legendary Endurance. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000505,   1, 0x020009A7) /* Setup */
     , (40000505,   3, 0x20000014) /* SoundTable */
     , (40000505,   6, 0x040001FA) /* PaletteBase */
     , (40000505,   7, 0x1000010B) /* ClothingBase */
     , (40000505,   8, 0x06005B30) /* Icon */
     , (40000505,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000505,  50, 0x06005B38) /* IconOverlay */
     , (40000505,  52, 0x06005B0C) /* IconUnderlay */;
