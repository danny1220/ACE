DELETE FROM `weenie` WHERE `class_Id` = 40000535;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000535, 'gemrareeternalhealing01', 38, '2023-09-08 17:32:38') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000535,   1,       2048) /* ItemType - Gem */
     , (40000535,   3,         39) /* PaletteTemplate - Black */
     , (40000535,   5,          5) /* EncumbranceVal */
     , (40000535,   8,          5) /* Mass */
     , (40000535,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000535,  17,         96) /* RareId */
     , (40000535,  18,          1) /* UiEffects - Magical */
     , (40000535,  19,         50) /* Value */
     , (40000535,  33,         -1) /* Bonded - Slippery */
     , (40000535,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000535,  94,         35215) /* TargetType - Vestements */
     , (40000535, 150,        103) /* HookPlacement - Hook */
     , (40000535, 151,         11) /* HookType - Floor, Wall, Yard */
     , (40000535, 280,         10) /* SharedCooldown */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000535,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000535,   1, 'Hieroglyph Cantrip of Healing Mastery') /* Name */
     , (40000535,  16, 'Use this gem to add Legendary Healing Prowess. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000535,   1, 0x020009A7) /* Setup */
     , (40000535,   3, 0x20000014) /* SoundTable */
     , (40000535,   6, 0x040001FA) /* PaletteBase */
     , (40000535,   7, 0x1000010B) /* ClothingBase */
     , (40000535,   8, 0x06005B22) /* Icon */
     , (40000535,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000535,  50, 0x06005B3F) /* IconOverlay */
     , (40000535,  52, 0x06005B0C) /* IconUnderlay */;
