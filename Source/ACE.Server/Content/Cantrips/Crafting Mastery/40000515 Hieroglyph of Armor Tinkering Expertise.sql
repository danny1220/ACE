DELETE FROM `weenie` WHERE `class_Id` = 40000515;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000515, 'gemrareeternalarmortinkering01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000515,   1,       2048) /* ItemType - Gem */
     , (40000515,   3,         39) /* PaletteTemplate - Black */
     , (40000515,   5,          5) /* EncumbranceVal */
     , (40000515,   8,          5) /* Mass */
     , (40000515,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000515,  17,         85) /* RareId */
     , (40000515,  18,          1) /* UiEffects - Magical */
     , (40000515,  19,         50) /* Value */
     , (40000515,  33,         -1) /* Bonded - Slippery */
     , (40000515,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000515,  94,         35215) /* TargetType - Vestements */
     , (40000515, 150,        103) /* HookPlacement - Hook */
     , (40000515, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000515,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000515,   1, 'Hieroglyph Cantrip of Armor Tinkering Expertise') /* Name */
     , (40000515,  16, 'Use this gem to add Legendary Armor Tinkering Expertise. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000515,   1, 0x020009A7) /* Setup */
     , (40000515,   3, 0x20000014) /* SoundTable */
     , (40000515,   6, 0x040001FA) /* PaletteBase */
     , (40000515,   7, 0x1000010B) /* ClothingBase */
     , (40000515,   8, 0x06005B30) /* Icon */
     , (40000515,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000515,  50, 0x06005B26) /* IconOverlay */
     , (40000515,  52, 0x06005B0C) /* IconUnderlay */;
