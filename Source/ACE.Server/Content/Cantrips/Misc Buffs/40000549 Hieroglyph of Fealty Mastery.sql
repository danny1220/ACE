DELETE FROM `weenie` WHERE `class_Id` = 40000549;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000549, 'gemrareeternalloyalty01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000549,   1,       2048) /* ItemType - Gem */
     , (40000549,   3,         39) /* PaletteTemplate - Black */
     , (40000549,   5,          5) /* EncumbranceVal */
     , (40000549,   8,          5) /* Mass */
     , (40000549,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000549,  17,        103) /* RareId */
     , (40000549,  18,          1) /* UiEffects - Magical */
     , (40000549,  19,          0) /* Value */
     , (40000549,  33,         -1) /* Bonded - Slippery */
     , (40000549,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000549,  94,         35215) /* TargetType - Vestements */
     , (40000549, 150,        103) /* HookPlacement - Hook */
     , (40000549, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000549,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000549,   1, 'Hieroglyph of Fealty Mastery') /* Name */
     , (40000549,  16, 'Use this gem add Legendary Fealty. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000549,   1, 0x020009A7) /* Setup */
     , (40000549,   3, 0x20000014) /* SoundTable */
     , (40000549,   6, 0x040001FA) /* PaletteBase */
     , (40000549,   7, 0x1000010B) /* ClothingBase */
     , (40000549,   8, 0x06005B22) /* Icon */
     , (40000549,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000549,  50, 0x06005B4D) /* IconOverlay */
     , (40000549,  52, 0x06005B0C) /* IconUnderlay */;
