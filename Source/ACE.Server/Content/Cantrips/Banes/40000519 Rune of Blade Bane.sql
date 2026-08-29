DELETE FROM `weenie` WHERE `class_Id` = 40000519;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000519, 'gemrareeternalbladebane01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000519,   1,       2048) /* ItemType - Gem */
     , (40000519,   3,         39) /* PaletteTemplate - Black */
     , (40000519,   5,          5) /* EncumbranceVal */
     , (40000519,   8,          5) /* Mass */
     , (40000519,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000519,  17,        135) /* RareId */
     , (40000519,  18,          1) /* UiEffects - Magical */
     , (40000519,  19,         50) /* Value */
     , (40000519,  33,         -1) /* Bonded - Slippery */
     , (40000519,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000519,  94,         35215) /* TargetType - Vestements */
     , (40000519, 150,        103) /* HookPlacement - Hook */
     , (40000519, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000519,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000519,   1, 'Rune Cantrip of Blade Bane') /* Name */
     , (40000519,  16, 'Use this gem to add Legendary Slashing Bane. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000519,   1, 0x020009A7) /* Setup */
     , (40000519,   3, 0x20000014) /* SoundTable */
     , (40000519,   6, 0x040001FA) /* PaletteBase */
     , (40000519,   7, 0x1000010B) /* ClothingBase */
     , (40000519,   8, 0x06005B1E) /* Icon */
     , (40000519,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000519,  50, 0x06005B2A) /* IconOverlay */
     , (40000519,  52, 0x06005B0C) /* IconUnderlay */;
