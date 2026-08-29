DELETE FROM `weenie` WHERE `class_Id` = 40000534;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000534, 'gemrareeternalfrostprotection01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000534,   1,       2048) /* ItemType - Gem */
     , (40000534,   3,         39) /* PaletteTemplate - Black */
     , (40000534,   5,          5) /* EncumbranceVal */
     , (40000534,   8,          5) /* Mass */
     , (40000534,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000534,  17,        126) /* RareId */
     , (40000534,  18,          1) /* UiEffects - Magical */
     , (40000534,  19,         50) /* Value */
     , (40000534,  33,         -1) /* Bonded - Slippery */
     , (40000534,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000534,  94,         35215) /* TargetType - Vestements */
     , (40000534, 150,        103) /* HookPlacement - Hook */
     , (40000534, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000534,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000534,   1, 'Ideograph Cantrip of Frost Protection') /* Name */
     , (40000534,  16, 'Use this gem to add Legendary Frost Ward. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000534,   1, 0x020009A7) /* Setup */
     , (40000534,   3, 0x20000014) /* SoundTable */
     , (40000534,   6, 0x040001FA) /* PaletteBase */
     , (40000534,   7, 0x1000010B) /* ClothingBase */
     , (40000534,   8, 0x06005B20) /* Icon */
     , (40000534,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000534,  50, 0x06005B3E) /* IconOverlay */
     , (40000534,  52, 0x06005B0C) /* IconUnderlay */;
