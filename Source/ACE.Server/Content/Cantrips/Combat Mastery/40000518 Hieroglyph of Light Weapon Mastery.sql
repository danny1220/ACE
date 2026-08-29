DELETE FROM `weenie` WHERE `class_Id` = 40000518;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000518, 'gemrareeternalaxe01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000518,   1,       2048) /* ItemType - Gem */
     , (40000518,   3,         39) /* PaletteTemplate - Black */
     , (40000518,   5,          5) /* EncumbranceVal */
     , (40000518,   8,          5) /* Mass */
     , (40000518,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000518,  17,         88) /* RareId */
     , (40000518,  18,          1) /* UiEffects - Magical */
     , (40000518,  19,         50) /* Value */
     , (40000518,  33,         -1) /* Bonded - Slippery */
     , (40000518,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000518,  94,         35215) /* TargetType - Vestements */
     , (40000518, 150,        103) /* HookPlacement - Hook */
     , (40000518, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000518,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000518,   1, 'Hieroglyph Cantrip of Light Weapon Mastery') /* Name */
     , (40000518,  16, 'Use this gem to add Legendary Light Weapon Aptitude. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000518,   1, 0x020009A7) /* Setup */
     , (40000518,   3, 0x20000014) /* SoundTable */
     , (40000518,   6, 0x040001FA) /* PaletteBase */
     , (40000518,   7, 0x1000010B) /* ClothingBase */
     , (40000518,   8, 0x06005B22) /* Icon */
     , (40000518,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000518,  50, 0x06007112) /* IconOverlay */
     , (40000518,  52, 0x06005B0C) /* IconUnderlay */;
