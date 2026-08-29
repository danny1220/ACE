DELETE FROM `weenie` WHERE `class_Id` = 40000562;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000562, 'gemrareeternalstaminaregeneration01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000562,   1,       2048) /* ItemType - Gem */
     , (40000562,   3,         39) /* PaletteTemplate - Black */
     , (40000562,   5,          5) /* EncumbranceVal */
     , (40000562,   8,          5) /* Mass */
     , (40000562,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000562,  17,        119) /* RareId */
     , (40000562,  18,          1) /* UiEffects - Magical */
     , (40000562,  19,          0) /* Value */
     , (40000562,  33,         -1) /* Bonded - Slippery */
     , (40000562,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000562,  94,         35215) /* TargetType - Vestements */
     , (40000562, 150,        103) /* HookPlacement - Hook */
     , (40000562, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000562,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000562,   1, 'Ideograph of Revitalization') /* Name */
     , (40000562,  16, 'Use this gem to add Legendary Stamina Gain. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000562,   1, 0x020009A7) /* Setup */
     , (40000562,   3, 0x20000014) /* SoundTable */
     , (40000562,   6, 0x040001FA) /* PaletteBase */
     , (40000562,   7, 0x1000010B) /* ClothingBase */
     , (40000562,   8, 0x06005B20) /* Icon */
     , (40000562,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000562,  50, 0x06005B5F) /* IconOverlay */
     , (40000562,  52, 0x06005B0C) /* IconUnderlay */;
