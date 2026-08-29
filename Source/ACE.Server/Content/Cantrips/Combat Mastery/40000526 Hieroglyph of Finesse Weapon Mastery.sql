DELETE FROM `weenie` WHERE `class_Id` = 40000526;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000526, 'gemrareeternaldagger01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000526,   1,       2048) /* ItemType - Gem */
     , (40000526,   3,         39) /* PaletteTemplate - Black */
     , (40000526,   5,          5) /* EncumbranceVal */
     , (40000526,   8,          5) /* Mass */
     , (40000526,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000526,  17,         93) /* RareId */
     , (40000526,  18,          1) /* UiEffects - Magical */
     , (40000526,  19,         50) /* Value */
     , (40000526,  33,         -1) /* Bonded - Slippery */
     , (40000526,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000526,  94,        35215) /* TargetType - Vestements */
     , (40000526, 109,          0) /* ItemDifficulty */
     , (40000526, 150,        103) /* HookPlacement - Hook */
     , (40000526, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000526,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000526,   1, 'Hieroglyph Cantrip of Finesse Weapon Mastery') /* Name */
     , (40000526,  16, 'Use this gem to add Legendary Finesse Weapons. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000526,   1, 0x020009A7) /* Setup */
     , (40000526,   3, 0x20000014) /* SoundTable */
     , (40000526,   6, 0x040001FA) /* PaletteBase */
     , (40000526,   7, 0x1000010B) /* ClothingBase */
     , (40000526,   8, 0x06005B22) /* Icon */
     , (40000526,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000526,  50, 0x06005B34) /* IconOverlay */
     , (40000526,  52, 0x06005B0C) /* IconUnderlay */;
