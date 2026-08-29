DELETE FROM `weenie` WHERE `class_Id` = 40000560;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000560, 'gemrareeternalslashingprotection01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000560,   1,       2048) /* ItemType - Gem */
     , (40000560,   3,         39) /* PaletteTemplate - Black */
     , (40000560,   5,          5) /* EncumbranceVal */
     , (40000560,   8,          5) /* Mass */
     , (40000560,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000560,  17,        121) /* RareId */
     , (40000560,  18,          1) /* UiEffects - Magical */
     , (40000560,  19,          0) /* Value */
     , (40000560,  33,         -1) /* Bonded - Slippery */
     , (40000560,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000560,  94,         35215) /* TargetType - Vestements */
     , (40000560, 150,        103) /* HookPlacement - Hook */
     , (40000560, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000560,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000560,   1, 'Ideograph of Blade Protection') /* Name */
     , (40000560,  16, 'Use this gem to add Legendary Slashing Ward. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000560,   1, 0x020009A7) /* Setup */
     , (40000560,   3, 0x20000014) /* SoundTable */
     , (40000560,   6, 0x040001FA) /* PaletteBase */
     , (40000560,   7, 0x1000010B) /* ClothingBase */
     , (40000560,   8, 0x06005B20) /* Icon */
     , (40000560,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000560,  50, 0x06005B5B) /* IconOverlay */
     , (40000560,  52, 0x06005B0C) /* IconUnderlay */;
