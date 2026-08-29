DELETE FROM `weenie` WHERE `class_Id` = 40000559;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000559, 'gemrareeternalrun01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000559,   1,       2048) /* ItemType - Gem */
     , (40000559,   3,         39) /* PaletteTemplate - Black */
     , (40000559,   5,          5) /* EncumbranceVal */
     , (40000559,   8,          5) /* Mass */
     , (40000559,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000559,  17,        110) /* RareId */
     , (40000559,  18,          1) /* UiEffects - Magical */
     , (40000559,  19,          0) /* Value */
     , (40000559,  33,         -1) /* Bonded - Slippery */
     , (40000559,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000559,  94,         35215) /* TargetType - Vestements */
     , (40000559, 150,        103) /* HookPlacement - Hook */
     , (40000559, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000559,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000559,   1, 'Hieroglyph of Sprint') /* Name */
     , (40000559,  16, 'Use this gem to add Legendary Sprint. This gem does not run out of charges. It will not be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000559,   1, 0x020009A7) /* Setup */
     , (40000559,   3, 0x20000014) /* SoundTable */
     , (40000559,   6, 0x040001FA) /* PaletteBase */
     , (40000559,   7, 0x1000010B) /* ClothingBase */
     , (40000559,   8, 0x06005B22) /* Icon */
     , (40000559,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000559,  50, 0x06005B59) /* IconOverlay */
     , (40000559,  52, 0x06005B0C) /* IconUnderlay */;
