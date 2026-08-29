DELETE FROM `weenie` WHERE `class_Id` = 40000513;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000513, 'gemrareeternalarcanelore01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000513,   1,       2048) /* ItemType - Gem */
     , (40000513,   3,         39) /* PaletteTemplate - Black */
     , (40000513,   5,          5) /* EncumbranceVal */
     , (40000513,   8,          5) /* Mass */
     , (40000513,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000513,  17,         84) /* RareId */
     , (40000513,  18,          1) /* UiEffects - Magical */
     , (40000513,  19,         50) /* Value */
     , (40000513,  33,         -1) /* Bonded - Slippery */
     , (40000513,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000513,  94,         35215) /* TargetType - Vestements */
     , (40000513, 150,        103) /* HookPlacement - Hook */
     , (40000513, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000513,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000513,   1, 'Hieroglyph Cantrip of Arcane Enlightenment') /* Name */
     , (40000513,  16, 'Use this gem to add Legendary Arcane Prowess. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000513,   1, 0x020009A7) /* Setup */
     , (40000513,   3, 0x20000014) /* SoundTable */
     , (40000513,   6, 0x040001FA) /* PaletteBase */
     , (40000513,   7, 0x1000010B) /* ClothingBase */
     , (40000513,   8, 0x06005B30) /* Icon */
     , (40000513,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000513,  50, 0x06005B24) /* IconOverlay */
     , (40000513,  52, 0x06005B0C) /* IconUnderlay */;
