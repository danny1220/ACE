DELETE FROM `weenie` WHERE `class_Id` = 40000547;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000547, 'gemrareeternallightningprotection01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000547,   1,       2048) /* ItemType - Gem */
     , (40000547,   3,         39) /* PaletteTemplate - Black */
     , (40000547,   5,          5) /* EncumbranceVal */
     , (40000547,   8,          5) /* Mass */
     , (40000547,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000547,  17,        127) /* RareId */
     , (40000547,  18,          1) /* UiEffects - Magical */
     , (40000547,  19,          0) /* Value */
     , (40000547,  33,         -1) /* Bonded - Slippery */
     , (40000547,  92,         -1) /* Structure */
     , (40000547,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000547,  94,         35215) /* TargetType - Vestements */
     , (40000547, 150,        103) /* HookPlacement - Hook */
     , (40000547, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000547,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000547,   1, 'Ideograph Cantrip of Lightning Protection') /* Name */
     , (40000547,  16, 'Use this gem add Legendary Storm Ward. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000547,   1, 0x020009A7) /* Setup */
     , (40000547,   3, 0x20000014) /* SoundTable */
     , (40000547,   6, 0x040001FA) /* PaletteBase */
     , (40000547,   7, 0x1000010B) /* ClothingBase */
     , (40000547,   8, 0x06005B20) /* Icon */
     , (40000547,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000547,  50, 0x06005B4B) /* IconOverlay */
     , (40000547,  52, 0x06005B0C) /* IconUnderlay */;
