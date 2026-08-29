DELETE FROM `weenie` WHERE `class_Id` = 40000531;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000531, 'gemrareeternalflamebane01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000531,   1,       2048) /* ItemType - Gem */
     , (40000531,   3,         39) /* PaletteTemplate - Black */
     , (40000531,   5,          5) /* EncumbranceVal */
     , (40000531,   8,          5) /* Mass */
     , (40000531,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000531,  17,        139) /* RareId */
     , (40000531,  18,          1) /* UiEffects - Magical */
     , (40000531,  19,         50) /* Value */
     , (40000531,  33,         -1) /* Bonded - Slippery */
     , (40000531,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000531,  94,         35215) /* TargetType - Vestements */
     , (40000531, 150,        103) /* HookPlacement - Hook */
     , (40000531, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000531,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000531,   1, 'Rune Cantrip of Flame Bane') /* Name */
     , (40000531,  16, 'Use this gem to add Legendary Flame Bane. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000531,   1, 0x020009A7) /* Setup */
     , (40000531,   3, 0x20000014) /* SoundTable */
     , (40000531,   6, 0x040001FA) /* PaletteBase */
     , (40000531,   7, 0x1000010B) /* ClothingBase */
     , (40000531,   8, 0x06005B1E) /* Icon */
     , (40000531,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000531,  50, 0x06005B3A) /* IconOverlay */
     , (40000531,  52, 0x06005B0C) /* IconUnderlay */;
