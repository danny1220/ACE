DELETE FROM `weenie` WHERE `class_Id` = 40000570;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000570, 'ace40000570-hieroglyphofshieldmastery', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000570,   1,       2048) /* ItemType - Gem */
     , (40000570,   3,         39) /* PaletteTemplate - Black */
     , (40000570,   5,          5) /* EncumbranceVal */
     , (40000570,   8,          5) /* Mass */
     , (40000570,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000570,  17,         83) /* RareId */
     , (40000570,  18,          1) /* UiEffects - Magical */
     , (40000570,  19,          0) /* Value */
     , (40000570,  33,         -1) /* Bonded - Slippery */
     , (40000570,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000570,  94,         35215) /* TargetType - Vestements */
     , (40000570, 150,        103) /* HookPlacement - Hook */
     , (40000570, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000570,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000570,   1, 'Hieroglyph of Shield Mastery') /* Name */
     , (40000570,  16, 'Use this gem to add Legendary Shield Aptitude. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000570,   1, 0x020009A7) /* Setup */
     , (40000570,   3, 0x20000014) /* SoundTable */
     , (40000570,   6, 0x040001FA) /* PaletteBase */
     , (40000570,   7, 0x1000010B) /* ClothingBase */
     , (40000570,   8, 0x06005B22) /* Icon */
     , (40000570,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000570,  50, 0x06007116) /* IconOverlay */
     , (40000570,  52, 0x06005B0C) /* IconUnderlay */;
