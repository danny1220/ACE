DELETE FROM `weenie` WHERE `class_Id` = 40000543;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000543, 'gemrareeternalleadership01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000543,   1,       2048) /* ItemType - Gem */
     , (40000543,   3,         39) /* PaletteTemplate - Black */
     , (40000543,   5,          5) /* EncumbranceVal */
     , (40000543,   8,          5) /* Mass */
     , (40000543,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000543,  17,        100) /* RareId */
     , (40000543,  18,          1) /* UiEffects - Magical */
     , (40000543,  19,         50) /* Value */
     , (40000543,  33,         -1) /* Bonded - Slippery */
     , (40000543,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000543,  94,         35215) /* TargetType - Vestements */
     , (40000543, 150,        103) /* HookPlacement - Hook */
     , (40000543, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000543,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000543,   1, 'Hieroglyph Cantrip of Leadership Mastery') /* Name */
     , (40000543,  16, 'Use this gem add Legendary Leadership. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000543,   1, 0x020009A7) /* Setup */
     , (40000543,   3, 0x20000014) /* SoundTable */
     , (40000543,   6, 0x040001FA) /* PaletteBase */
     , (40000543,   7, 0x1000010B) /* ClothingBase */
     , (40000543,   8, 0x06005B22) /* Icon */
     , (40000543,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000543,  50, 0x06005B47) /* IconOverlay */
     , (40000543,  52, 0x06005B0C) /* IconUnderlay */;
