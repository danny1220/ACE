DELETE FROM `weenie` WHERE `class_Id` = 40000544;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000544, 'gemrareeternallifemagic01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000544,   1,       2048) /* ItemType - Gem */
     , (40000544,   3,         39) /* PaletteTemplate - Black */
     , (40000544,   5,          5) /* EncumbranceVal */
     , (40000544,   8,          5) /* Mass */
     , (40000544,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000544,  17,        101) /* RareId */
     , (40000544,  18,          1) /* UiEffects - Magical */
     , (40000544,  19,          0) /* Value */
     , (40000544,  33,         -1) /* Bonded - Slippery */
     , (40000544,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000544,  94,         35215) /* TargetType - Vestements */
     , (40000544, 150,        103) /* HookPlacement - Hook */
     , (40000544, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000544,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000544,   1, 'Hieroglyph Cantrip of Life Magic Mastery') /* Name */
     , (40000544,  16, 'Use this gem add Legendary Life Magic Aptitude. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000544,   1, 0x020009A7) /* Setup */
     , (40000544,   3, 0x20000014) /* SoundTable */
     , (40000544,   6, 0x040001FA) /* PaletteBase */
     , (40000544,   7, 0x1000010B) /* ClothingBase */
     , (40000544,   8, 0x06005B22) /* Icon */
     , (40000544,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000544,  50, 0x06005B48) /* IconOverlay */
     , (40000544,  52, 0x06005B0C) /* IconUnderlay */;
