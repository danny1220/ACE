DELETE FROM `weenie` WHERE `class_Id` = 40000540;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000540, 'gemrareeternalitemenchantment01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000540,   1,       2048) /* ItemType - Gem */
     , (40000540,   3,         39) /* PaletteTemplate - Black */
     , (40000540,   5,          5) /* EncumbranceVal */
     , (40000540,   8,          5) /* Mass */
     , (40000540,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000540,  17,         97) /* RareId */
     , (40000540,  18,          1) /* UiEffects - Magical */
     , (40000540,  19,         50) /* Value */
     , (40000540,  33,         -1) /* Bonded - Slippery */
     , (40000540,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000540,  94,         35215) /* TargetType - Vestements */
     , (40000540, 150,        103) /* HookPlacement - Hook */
     , (40000540, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000540,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000540,   1, 'Hieroglyph Cantrip of Item Enchantment Mastery') /* Name */
     , (40000540,  16, 'Use this gem add Legendary Item Enchantment Aptitude. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000540,   1, 0x020009A7) /* Setup */
     , (40000540,   3, 0x20000014) /* SoundTable */
     , (40000540,   6, 0x040001FA) /* PaletteBase */
     , (40000540,   7, 0x1000010B) /* ClothingBase */
     , (40000540,   8, 0x06005B22) /* Icon */
     , (40000540,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000540,  50, 0x06005B44) /* IconOverlay */
     , (40000540,  52, 0x06005B0C) /* IconUnderlay */;
