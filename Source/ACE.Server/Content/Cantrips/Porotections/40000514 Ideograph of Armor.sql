DELETE FROM `weenie` WHERE `class_Id` = 40000514;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000514, 'gemrareeternalarmor01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000514,   1,       2048) /* ItemType - Gem */
     , (40000514,   3,         39) /* PaletteTemplate - Black */
     , (40000514,   5,          5) /* EncumbranceVal */
     , (40000514,   8,          5) /* Mass */
     , (40000514,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000514,  17,        128) /* RareId */
     , (40000514,  18,          1) /* UiEffects - Magical */
     , (40000514,  19,         50) /* Value */
     , (40000514,  33,         -1) /* Bonded - Slippery */
     , (40000514,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000514,  94,         35215) /* TargetType - Vestements */
     , (40000514, 150,        103) /* HookPlacement - Hook */
     , (40000514, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000514,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000514,   1, 'Ideograph Cantrip of Armor') /* Name */
     , (40000514,  16, 'Use this gem to add Legendary Armor. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000514,   1, 0x020009A7) /* Setup */
     , (40000514,   3, 0x20000014) /* SoundTable */
     , (40000514,   6, 0x040001FA) /* PaletteBase */
     , (40000514,   7, 0x1000010B) /* ClothingBase */
     , (40000514,   8, 0x06005B20) /* Icon */
     , (40000514,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000514,  50, 0x06005B25) /* IconOverlay */
     , (40000514,  52, 0x06005B0C) /* IconUnderlay */;
