DELETE FROM `weenie` WHERE `class_Id` = 40000516;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000516, 'gemrareeternalassesscreature01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000516,   1,       2048) /* ItemType - Gem */
     , (40000516,   3,         39) /* PaletteTemplate - Black */
     , (40000516,   5,          5) /* EncumbranceVal */
     , (40000516,   8,          5) /* Mass */
     , (40000516,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000516,  17,         86) /* RareId */
     , (40000516,  18,          1) /* UiEffects - Magical */
     , (40000516,  19,         50) /* Value */
     , (40000516,  33,         -1) /* Bonded - Slippery */
     , (40000516,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000516,  94,         35215) /* TargetType - Vestements */
     , (40000516, 150,        103) /* HookPlacement - Hook */
     , (40000516, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000516,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000516,   1, 'Hieroglyph Cantrip of Monster Attunement') /* Name */
     , (40000516,  16, 'Use this gem to add Legendary Assess Creature. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000516,   1, 0x020009A7) /* Setup */
     , (40000516,   3, 0x20000014) /* SoundTable */
     , (40000516,   6, 0x040001FA) /* PaletteBase */
     , (40000516,   7, 0x1000010B) /* ClothingBase */
     , (40000516,   8, 0x06005B30) /* Icon */
     , (40000516,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000516,  50, 0x06005B27) /* IconOverlay */
     , (40000516,  52, 0x06005B0C) /* IconUnderlay */;
