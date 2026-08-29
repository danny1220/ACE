DELETE FROM `weenie` WHERE `class_Id` = 40000523;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000523, 'gemrareeternalbow01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000523,   1,       2048) /* ItemType - Gem */
     , (40000523,   3,         39) /* PaletteTemplate - Black */
     , (40000523,   5,          5) /* EncumbranceVal */
     , (40000523,   8,          5) /* Mass */
     , (40000523,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000523,  17,         89) /* RareId */
     , (40000523,  18,          1) /* UiEffects - Magical */
     , (40000523,  19,         50) /* Value */
     , (40000523,  33,         -1) /* Bonded - Slippery */
     , (40000523,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000523,  94,         35215) /* TargetType - Vestements */
     , (40000523, 150,        103) /* HookPlacement - Hook */
     , (40000523, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000523,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000523,   1, 'Hieroglyph Cantrip of Missile Weapon Mastery') /* Name */
     , (40000523,  16, 'Use this gem to add Legendary Missile Weapon Aptitude. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000523,   1, 0x020009A7) /* Setup */
     , (40000523,   3, 0x20000014) /* SoundTable */
     , (40000523,   6, 0x040001FA) /* PaletteBase */
     , (40000523,   7, 0x1000010B) /* ClothingBase */
     , (40000523,   8, 0x06005B22) /* Icon */
     , (40000523,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000523,  50, 0x06005B2E) /* IconOverlay */
     , (40000523,  52, 0x06005B0C) /* IconUnderlay */;
