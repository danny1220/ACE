DELETE FROM `weenie` WHERE `class_Id` = 40000568;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000568, 'ace40000568-hieroglyphofdualwieldmastery', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000568,   1,       2048) /* ItemType - Gem */
     , (40000568,   3,         39) /* PaletteTemplate - Black */
     , (40000568,   5,          5) /* EncumbranceVal */
     , (40000568,   8,          5) /* Mass */
     , (40000568,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000568,  17,         83) /* RareId */
     , (40000568,  18,          1) /* UiEffects - Magical */
     , (40000568,  19,          0) /* Value */
     , (40000568,  33,         -1) /* Bonded - Slippery */
     , (40000568,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000568,  94,         35215) /* TargetType - Vestements */
     , (40000568, 150,        103) /* HookPlacement - Hook */
     , (40000568, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000568,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000568,   1, 'Hieroglyph of Dual Wield Mastery') /* Name */
     , (40000568,  16, 'Use this gem to add Legendary Dual Wield Aptitude. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000568,   1, 0x020009A7) /* Setup */
     , (40000568,   3, 0x20000014) /* SoundTable */
     , (40000568,   6, 0x040001FA) /* PaletteBase */
     , (40000568,   7, 0x1000010B) /* ClothingBase */
     , (40000568,   8, 0x06005B22) /* Icon */
     , (40000568,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000568,  50, 0x06007115) /* IconOverlay */
     , (40000568,  52, 0x06005B0C) /* IconUnderlay */;
