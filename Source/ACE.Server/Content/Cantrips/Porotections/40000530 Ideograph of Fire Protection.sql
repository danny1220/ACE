DELETE FROM `weenie` WHERE `class_Id` = 40000530;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000530, 'gemrareeternalfireprotection01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000530,   1,       2048) /* ItemType - Gem */
     , (40000530,   3,         39) /* PaletteTemplate - Black */
     , (40000530,   5,          5) /* EncumbranceVal */
     , (40000530,   8,          5) /* Mass */
     , (40000530,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000530,  17,        125) /* RareId */
     , (40000530,  18,          1) /* UiEffects - Magical */
     , (40000530,  19,         50) /* Value */
     , (40000530,  33,         -1) /* Bonded - Slippery */
     , (40000530,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000530,  94,         35215) /* TargetType - Vestements */
     , (40000530, 150,        103) /* HookPlacement - Hook */
     , (40000530, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000530,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000530,   1, 'Ideograph Cantrip of Fire Protection') /* Name */
     , (40000530,  16, 'Use this gem to add Legendary Flame Ward. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000530,   1, 0x020009A7) /* Setup */
     , (40000530,   3, 0x20000014) /* SoundTable */
     , (40000530,   6, 0x040001FA) /* PaletteBase */
     , (40000530,   7, 0x1000010B) /* ClothingBase */
     , (40000530,   8, 0x06005B20) /* Icon */
     , (40000530,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000530,  50, 0x06005B39) /* IconOverlay */
     , (40000530,  52, 0x06005B0C) /* IconUnderlay */;
