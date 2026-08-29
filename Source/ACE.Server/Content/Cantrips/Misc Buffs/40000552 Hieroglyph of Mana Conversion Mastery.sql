DELETE FROM `weenie` WHERE `class_Id` = 40000552;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000552, 'gemrareeternalmanaconversion01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000552,   1,       2048) /* ItemType - Gem */
     , (40000552,   3,         39) /* PaletteTemplate - Black */
     , (40000552,   5,          5) /* EncumbranceVal */
     , (40000552,   8,          5) /* Mass */
     , (40000552,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000552,  17,        107) /* RareId */
     , (40000552,  18,          1) /* UiEffects - Magical */
     , (40000552,  19,          0) /* Value */
     , (40000552,  33,         -1) /* Bonded - Slippery */
     , (40000552,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000552,  94,         35215) /* TargetType - Vestements */
     , (40000552, 150,        103) /* HookPlacement - Hook */
     , (40000552, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000552,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000552,   1, 'Hieroglyph of Mana Conversion Mastery') /* Name */
     , (40000552,  16, 'Use this gem to add Legendary Mana Conversion Prowess. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000552,   1, 0x020009A7) /* Setup */
     , (40000552,   3, 0x20000014) /* SoundTable */
     , (40000552,   6, 0x040001FA) /* PaletteBase */
     , (40000552,   7, 0x1000010B) /* ClothingBase */
     , (40000552,   8, 0x06005B22) /* Icon */
     , (40000552,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000552,  50, 0x06005B51) /* IconOverlay */
     , (40000552,  52, 0x06005B0C) /* IconUnderlay */;
