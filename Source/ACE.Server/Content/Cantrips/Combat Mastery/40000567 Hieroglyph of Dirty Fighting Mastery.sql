DELETE FROM `weenie` WHERE `class_Id` = 40000567;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000567, 'ace40000567-hieroglyphofdirtyfightingmastery', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000567,   1,       2048) /* ItemType - Gem */
     , (40000567,   3,         39) /* PaletteTemplate - Black */
     , (40000567,   5,          5) /* EncumbranceVal */
     , (40000567,   8,          5) /* Mass */
     , (40000567,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000567,  17,         83) /* RareId */
     , (40000567,  18,          1) /* UiEffects - Magical */
     , (40000567,  19,          0) /* Value */
     , (40000567,  33,         -1) /* Bonded - Slippery */
     , (40000567,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000567,  94,         35215) /* TargetType - Vestements */
     , (40000567, 150,        103) /* HookPlacement - Hook */
     , (40000567, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000567,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000567,   1, 'Hieroglyph of Dirty Fighting Mastery') /* Name */
     , (40000567,  16, 'Use this gem add Legendary Dirty Fighting Prowess. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000567,   1, 0x020009A7) /* Setup */
     , (40000567,   3, 0x20000014) /* SoundTable */
     , (40000567,   6, 0x040001FA) /* PaletteBase */
     , (40000567,   7, 0x1000010B) /* ClothingBase */
     , (40000567,   8, 0x06005B22) /* Icon */
     , (40000567,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000567,  50, 0x06007114) /* IconOverlay */
     , (40000567,  52, 0x06005B0C) /* IconUnderlay */;
