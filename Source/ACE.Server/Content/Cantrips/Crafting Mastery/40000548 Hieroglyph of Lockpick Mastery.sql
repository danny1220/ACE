DELETE FROM `weenie` WHERE `class_Id` = 40000548;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000548, 'gemrareeternallockpick01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000548,   1,       2048) /* ItemType - Gem */
     , (40000548,   3,         39) /* PaletteTemplate - Black */
     , (40000548,   5,          5) /* EncumbranceVal */
     , (40000548,   8,          5) /* Mass */
     , (40000548,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000548,  17,        102) /* RareId */
     , (40000548,  18,          1) /* UiEffects - Magical */
     , (40000548,  19,          0) /* Value */
     , (40000548,  33,         -1) /* Bonded - Slippery */
     , (40000548,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000548,  94,         35215) /* TargetType - Vestements */
     , (40000548, 150,        103) /* HookPlacement - Hook */
     , (40000548, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000548,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000548,   1, 'Hieroglyph Cantrip of Lockpick Mastery') /* Name */
     , (40000548,  16, 'Use this gem add Legendary Lockpick Prowess. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000548,   1, 0x020009A7) /* Setup */
     , (40000548,   3, 0x20000014) /* SoundTable */
     , (40000548,   6, 0x040001FA) /* PaletteBase */
     , (40000548,   7, 0x1000010B) /* ClothingBase */
     , (40000548,   8, 0x06005B22) /* Icon */
     , (40000548,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000548,  50, 0x06005B4C) /* IconOverlay */
     , (40000548,  52, 0x06005B0C) /* IconUnderlay */;
