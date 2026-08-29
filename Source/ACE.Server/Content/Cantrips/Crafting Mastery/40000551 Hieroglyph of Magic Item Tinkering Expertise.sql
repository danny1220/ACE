DELETE FROM `weenie` WHERE `class_Id` = 40000551;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000551, 'gemrareeternalmagicitemtinkering01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000551,   1,       2048) /* ItemType - Gem */
     , (40000551,   3,         39) /* PaletteTemplate - Black */
     , (40000551,   5,          5) /* EncumbranceVal */
     , (40000551,   8,          5) /* Mass */
     , (40000551,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000551,  17,        105) /* RareId */
     , (40000551,  18,          1) /* UiEffects - Magical */
     , (40000551,  19,          0) /* Value */
     , (40000551,  33,         -1) /* Bonded - Slippery */
     , (40000551,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000551,  94,         35215) /* TargetType - Vestements */
     , (40000551, 150,        103) /* HookPlacement - Hook */
     , (40000551, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000551,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000551,   1, 'Hieroglyph of Magic Item Tinkering Expertise') /* Name */
     , (40000551,  16, 'Use this gem to add Legendary Magic Item Tinkering Expertise. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000551,   1, 0x020009A7) /* Setup */
     , (40000551,   3, 0x20000014) /* SoundTable */
     , (40000551,   6, 0x040001FA) /* PaletteBase */
     , (40000551,   7, 0x1000010B) /* ClothingBase */
     , (40000551,   8, 0x06005B22) /* Icon */
     , (40000551,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000551,  50, 0x06005B50) /* IconOverlay */
     , (40000551,  52, 0x06005B0C) /* IconUnderlay */;
