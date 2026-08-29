DELETE FROM `weenie` WHERE `class_Id` = 40000533;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000533, 'gemrareeternalfrostbane01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000533,   1,       2048) /* ItemType - Gem */
     , (40000533,   3,         39) /* PaletteTemplate - Black */
     , (40000533,   5,          5) /* EncumbranceVal */
     , (40000533,   8,          5) /* Mass */
     , (40000533,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000533,  17,        140) /* RareId */
     , (40000533,  18,          1) /* UiEffects - Magical */
     , (40000533,  19,         50) /* Value */
     , (40000533,  33,         -1) /* Bonded - Slippery */
     , (40000533,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000533,  94,         35215) /* TargetType - Vestements */
     , (40000533, 150,        103) /* HookPlacement - Hook */
     , (40000533, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000533,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000533,   1, 'Rune Cantrip of Frost Bane') /* Name */
     , (40000533,  16, 'Use this gem to add Legendary Frost Bane. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000533,   1, 0x020009A7) /* Setup */
     , (40000533,   3, 0x20000014) /* SoundTable */
     , (40000533,   6, 0x040001FA) /* PaletteBase */
     , (40000533,   7, 0x1000010B) /* ClothingBase */
     , (40000533,   8, 0x06005B1E) /* Icon */
     , (40000533,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000533,  50, 0x06005B3D) /* IconOverlay */
     , (40000533,  52, 0x06005B0C) /* IconUnderlay */;
