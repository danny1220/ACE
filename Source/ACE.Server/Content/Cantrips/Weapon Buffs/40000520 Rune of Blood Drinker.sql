DELETE FROM `weenie` WHERE `class_Id` = 40000520;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000520, 'gemrareeternalblooddrinker01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000520,   1,       2048) /* ItemType - Gem */
     , (40000520,   3,         39) /* PaletteTemplate - Black */
     , (40000520,   5,          5) /* EncumbranceVal */
     , (40000520,   8,          5) /* Mass */
     , (40000520,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000520,  17,        129) /* RareId */
     , (40000520,  18,          1) /* UiEffects - Magical */
     , (40000520,  19,         50) /* Value */
     , (40000520,  33,         -1) /* Bonded - Slippery */
     , (40000520,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000520,  94,         257) /* TargetType - Weapon */
     , (40000520, 150,        103) /* HookPlacement - Hook */
     , (40000520, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000520,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000520,   1, 'Rune Cantrip of Blood Drinker') /* Name */
     , (40000520,  16, 'Use this gem to add Legendary Blood Thirst. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000520,   1, 0x020009A7) /* Setup */
     , (40000520,   3, 0x20000014) /* SoundTable */
     , (40000520,   6, 0x040001FA) /* PaletteBase */
     , (40000520,   7, 0x1000010B) /* ClothingBase */
     , (40000520,   8, 0x06005B1E) /* Icon */
     , (40000520,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000520,  50, 0x06005B2B) /* IconOverlay */
     , (40000520,  52, 0x06005B0C) /* IconUnderlay */;
