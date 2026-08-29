DELETE FROM `weenie` WHERE `class_Id` = 40000539;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000539, 'gemrareeternalimpenetrability01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000539,   1,       2048) /* ItemType - Gem */
     , (40000539,   3,         39) /* PaletteTemplate - Black */
     , (40000539,   5,          5) /* EncumbranceVal */
     , (40000539,   8,          5) /* Mass */
     , (40000539,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000539,  17,        142) /* RareId */
     , (40000539,  18,          1) /* UiEffects - Magical */
     , (40000539,  19,         50) /* Value */
     , (40000539,  33,         -1) /* Bonded - Slippery */
     , (40000539,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000539,  94,         35215) /* TargetType - Vestements */
     , (40000539, 150,        103) /* HookPlacement - Hook */
     , (40000539, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000539,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000539,   1, 'Rune Cantrip of Impenetrability') /* Name */
     , (40000539,  16, 'Use this gem add Legendary Impenetrability. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000539,   1, 0x020009A7) /* Setup */
     , (40000539,   3, 0x20000014) /* SoundTable */
     , (40000539,   6, 0x040001FA) /* PaletteBase */
     , (40000539,   7, 0x1000010B) /* ClothingBase */
     , (40000539,   8, 0x06005B1E) /* Icon */
     , (40000539,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000539,  50, 0x06005B43) /* IconOverlay */
     , (40000539,  52, 0x06005B0C) /* IconUnderlay */;
