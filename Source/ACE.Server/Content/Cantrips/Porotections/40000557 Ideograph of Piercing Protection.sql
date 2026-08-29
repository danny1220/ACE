DELETE FROM `weenie` WHERE `class_Id` = 40000557;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000557, 'gemrareeternalpiercingprotection01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000557,   1,       2048) /* ItemType - Gem */
     , (40000557,   3,         39) /* PaletteTemplate - Black */
     , (40000557,   5,          5) /* EncumbranceVal */
     , (40000557,   8,          5) /* Mass */
     , (40000557,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000557,  17,        122) /* RareId */
     , (40000557,  18,          1) /* UiEffects - Magical */
     , (40000557,  19,          0) /* Value */
     , (40000557,  33,         -1) /* Bonded - Slippery */
     , (40000557,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000557,  94,         35215) /* TargetType - Vestements */
     , (40000557, 150,        103) /* HookPlacement - Hook */
     , (40000557, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000557,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000557,   1, 'Ideograph of Piercing Protection') /* Name */
     , (40000557,  16, 'Use this gem add Legendary Piercing Ward. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000557,   1, 0x020009A7) /* Setup */
     , (40000557,   3, 0x20000014) /* SoundTable */
     , (40000557,   6, 0x040001FA) /* PaletteBase */
     , (40000557,   7, 0x1000010B) /* ClothingBase */
     , (40000557,   8, 0x06005B20) /* Icon */
     , (40000557,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000557,  50, 0x06005B56) /* IconOverlay */
     , (40000557,  52, 0x06005B0C) /* IconUnderlay */;
