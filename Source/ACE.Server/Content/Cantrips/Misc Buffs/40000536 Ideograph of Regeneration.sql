DELETE FROM `weenie` WHERE `class_Id` = 40000536;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000536, 'gemrareeternalhealthregeneration01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000536,   1,       2048) /* ItemType - Gem */
     , (40000536,   3,         39) /* PaletteTemplate - Black */
     , (40000536,   5,          5) /* EncumbranceVal */
     , (40000536,   8,          5) /* Mass */
     , (40000536,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000536,  17,        118) /* RareId */
     , (40000536,  18,          1) /* UiEffects - Magical */
     , (40000536,  19,         50) /* Value */
     , (40000536,  33,         -1) /* Bonded - Slippery */
     , (40000536,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000536,  94,         35215) /* TargetType - Vestements */
     , (40000536, 150,        103) /* HookPlacement - Hook */
     , (40000536, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000536,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000536,   1, 'Ideograph Cantrip of Regeneration') /* Name */
     , (40000536,  16, 'Use this gem to add Legendary Health Gain. This gem does will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000536,   1, 0x020009A7) /* Setup */
     , (40000536,   3, 0x20000014) /* SoundTable */
     , (40000536,   6, 0x040001FA) /* PaletteBase */
     , (40000536,   7, 0x1000010B) /* ClothingBase */
     , (40000536,   8, 0x06005B20) /* Icon */
     , (40000536,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000536,  50, 0x06005B40) /* IconOverlay */
     , (40000536,  52, 0x06005B0C) /* IconUnderlay */;
