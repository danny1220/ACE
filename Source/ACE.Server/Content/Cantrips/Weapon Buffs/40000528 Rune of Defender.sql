DELETE FROM `weenie` WHERE `class_Id` = 40000528;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000528, 'gemrareeternaldefender01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000528,   1,       2048) /* ItemType - Gem */
     , (40000528,   3,         39) /* PaletteTemplate - Black */
     , (40000528,   5,          5) /* EncumbranceVal */
     , (40000528,   8,          5) /* Mass */
     , (40000528,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000528,  17,        131) /* RareId */
     , (40000528,  18,          1) /* UiEffects - Magical */
     , (40000528,  19,         50) /* Value */
     , (40000528,  33,         -1) /* Bonded - Slippery */
     , (40000528,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000528,  94,         35215) /* TargetType - Vestements */
     , (40000528, 150,        103) /* HookPlacement - Hook */
     , (40000528, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000528,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000528,   1, 'Rune Cantrip of Defender') /* Name */
     , (40000528,  16, 'Use this gem to add Legendary Defender. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000528,   1, 0x020009A7) /* Setup */
     , (40000528,   3, 0x20000014) /* SoundTable */
     , (40000528,   6, 0x040001FA) /* PaletteBase */
     , (40000528,   7, 0x1000010B) /* ClothingBase */
     , (40000528,   8, 0x06005B1E) /* Icon */
     , (40000528,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000528,  50, 0x06005B36) /* IconOverlay */
     , (40000528,  52, 0x06005B0C) /* IconUnderlay */;
