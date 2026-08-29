DELETE FROM `weenie` WHERE `class_Id` = 40000510;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000510, 'gemrareeternalacidbane01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000510,   1,       2048) /* ItemType - Gem */
     , (40000510,   3,         39) /* PaletteTemplate - Black */
     , (40000510,   5,          5) /* EncumbranceVal */
     , (40000510,   8,          5) /* Mass */
     , (40000510,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000510,  17,        138) /* RareId */
     , (40000510,  18,          1) /* UiEffects - Magical */
     , (40000510,  19,         50) /* Value */
     , (40000510,  33,         -1) /* Bonded - Slippery */
     , (40000510,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000510,  94,         35215) /* TargetType - Vestements */
     , (40000510, 150,        103) /* HookPlacement - Hook */
     , (40000510, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000510,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000510,   1, 'Rune Cantrip of Acid Bane') /* Name */
     , (40000510,  16, 'Use this gem to apply the spell Legendary Acid Bane. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000510,   1, 0x020009A7) /* Setup */
     , (40000510,   3, 0x20000014) /* SoundTable */
     , (40000510,   6, 0x040001FA) /* PaletteBase */
     , (40000510,   7, 0x1000010B) /* ClothingBase */
     , (40000510,   8, 0x06005B1E) /* Icon */
     , (40000510,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000510,  50, 0x06005B1F) /* IconOverlay */
     , (40000510,  52, 0x06005B0C) /* IconUnderlay */;
