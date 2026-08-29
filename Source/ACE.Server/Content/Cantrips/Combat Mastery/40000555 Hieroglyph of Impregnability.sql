DELETE FROM `weenie` WHERE `class_Id` = 40000555;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000555, 'gemrareeternalmissiledefense01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000555,   1,       2048) /* ItemType - Gem */
     , (40000555,   3,         39) /* PaletteTemplate - Black */
     , (40000555,   5,          5) /* EncumbranceVal */
     , (40000555,   8,          5) /* Mass */
     , (40000555,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000555,  17,        109) /* RareId */
     , (40000555,  18,          1) /* UiEffects - Magical */
     , (40000555,  19,          0) /* Value */
     , (40000555,  33,         -1) /* Bonded - Slippery */
     , (40000555,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000555,  94,         35215) /* TargetType - Vestements */
     , (40000555, 150,        103) /* HookPlacement - Hook */
     , (40000555, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000555,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000555,   1, 'Hieroglyph of Impregnability') /* Name */
     , (40000555,  16, 'Use this gem add Legendary Impregnability. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000555,   1, 0x020009A7) /* Setup */
     , (40000555,   3, 0x20000014) /* SoundTable */
     , (40000555,   6, 0x040001FA) /* PaletteBase */
     , (40000555,   7, 0x1000010B) /* ClothingBase */
     , (40000555,   8, 0x06005B22) /* Icon */
     , (40000555,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000555,  50, 0x06005B54) /* IconOverlay */
     , (40000555,  52, 0x06005B0C) /* IconUnderlay */;
