DELETE FROM `weenie` WHERE `class_Id` = 40000566;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000566, 'gemrareeternalweapontinkering01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000566,   1,       2048) /* ItemType - Gem */
     , (40000566,   3,         39) /* PaletteTemplate - Black */
     , (40000566,   5,          5) /* EncumbranceVal */
     , (40000566,   8,          5) /* Mass */
     , (40000566,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000566,  17,        117) /* RareId */
     , (40000566,  18,          1) /* UiEffects - Magical */
     , (40000566,  19,          0) /* Value */
     , (40000566,  33,         -1) /* Bonded - Slippery */
     , (40000566,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000566,  94,         35215) /* TargetType - Vestements */
     , (40000566, 150,        103) /* HookPlacement - Hook */
     , (40000566, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000566,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000566,   1, 'Hieroglyph of Weapon Tinkering Expertise') /* Name */
     , (40000566,  16, 'Use this gem to add Legendary Weapon Tinkering Expertise. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000566,   1, 0x020009A7) /* Setup */
     , (40000566,   3, 0x20000014) /* SoundTable */
     , (40000566,   6, 0x040001FA) /* PaletteBase */
     , (40000566,   7, 0x1000010B) /* ClothingBase */
     , (40000566,   8, 0x06005B22) /* Icon */
     , (40000566,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000566,  50, 0x06005B66) /* IconOverlay */
     , (40000566,  52, 0x06005B0C) /* IconUnderlay */;
