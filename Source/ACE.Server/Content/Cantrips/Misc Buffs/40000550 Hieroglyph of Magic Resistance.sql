DELETE FROM `weenie` WHERE `class_Id` = 40000550;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000550, 'gemrareeternalmagicdefense01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000550,   1,       2048) /* ItemType - Gem */
     , (40000550,   3,         39) /* PaletteTemplate - Black */
     , (40000550,   5,          5) /* EncumbranceVal */
     , (40000550,   8,          5) /* Mass */
     , (40000550,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000550,  17,        106) /* RareId */
     , (40000550,  18,          1) /* UiEffects - Magical */
     , (40000550,  19,          0) /* Value */
     , (40000550,  33,         -1) /* Bonded - Slippery */
     , (40000550,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000550,  94,         35215) /* TargetType - Vestements */
     , (40000550, 150,        103) /* HookPlacement - Hook */
     , (40000550, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000550,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000550,   1, 'Hieroglyph of Magic Resistance') /* Name */
     , (40000550,  16, 'Use this gem add Legendary Magic Resistance. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000550,   1, 0x020009A7) /* Setup */
     , (40000550,   3, 0x20000014) /* SoundTable */
     , (40000550,   6, 0x040001FA) /* PaletteBase */
     , (40000550,   7, 0x1000010B) /* ClothingBase */
     , (40000550,   8, 0x06005B22) /* Icon */
     , (40000550,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000550,  50, 0x06005B4F) /* IconOverlay */
     , (40000550,  52, 0x06005B0C) /* IconUnderlay */;
