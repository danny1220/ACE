DELETE FROM `weenie` WHERE `class_Id` = 40000522;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000522, 'gemrareeternalbludgeoningprotection01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000522,   1,       2048) /* ItemType - Gem */
     , (40000522,   3,         39) /* PaletteTemplate - Black */
     , (40000522,   5,          5) /* EncumbranceVal */
     , (40000522,   8,          5) /* Mass */
     , (40000522,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000522,  17,        123) /* RareId */
     , (40000522,  18,          1) /* UiEffects - Magical */
     , (40000522,  19,         50) /* Value */
     , (40000522,  33,         -1) /* Bonded - Slippery */
     , (40000522,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000522,  94,         35215) /* TargetType - Vestements */
     , (40000522, 150,        103) /* HookPlacement - Hook */
     , (40000522, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000522,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000522,   1, 'Ideograph Cantrip of Bludgeoning Protection') /* Name */
     , (40000522,  16, 'Use this gem to cast Legendary Bludgeoning Ward. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000522,   1, 0x020009A7) /* Setup */
     , (40000522,   3, 0x20000014) /* SoundTable */
     , (40000522,   6, 0x040001FA) /* PaletteBase */
     , (40000522,   7, 0x1000010B) /* ClothingBase */
     , (40000522,   8, 0x06005B20) /* Icon */
     , (40000522,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000522,  50, 0x06005B2D) /* IconOverlay */
     , (40000522,  52, 0x06005B0C) /* IconUnderlay */;
