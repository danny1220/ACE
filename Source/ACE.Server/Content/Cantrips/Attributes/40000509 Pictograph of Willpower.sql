DELETE FROM `weenie` WHERE `class_Id` = 40000509;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000509, 'sliverself', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000509,   1,       2048) /* ItemType - Gem */
     , (40000509,   3,         39) /* PaletteTemplate - Black */
     , (40000509,   5,          5) /* EncumbranceVal */
     , (40000509,   8,          5) /* Mass */
     , (40000509,  16,     524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000509,  17,         82) /* RareId */
     , (40000509,  18,          1) /* UiEffects - Magical */
     , (40000509,  19,         50) /* Value */
     , (40000509,  33,         -1) /* Bonded - Slippery */
     , (40000509,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000509,  94,      35215) /* TargetType - Jewelry, Misc, Gem, RedirectableItemEnchantmentTarget */
     , (40000509, 150,        103) /* HookPlacement - Hook */
     , (40000509, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000509,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000509,   1, 'Pictograph Cantrip of Willpower') /* Name */
     , (40000509,  16, 'Use this gem to add Legendary Willpower. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000509,   1, 0x020009A7) /* Setup */
     , (40000509,   3, 0x20000014) /* SoundTable */
     , (40000509,   6, 0x040001FA) /* PaletteBase */
     , (40000509,   7, 0x1000010B) /* ClothingBase */
     , (40000509,   8, 0x06005B30) /* Icon */
     , (40000509,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000509,  50, 0x06005B5A) /* IconOverlay */
     , (40000509,  52, 0x06005B0C) /* IconUnderlay */;
