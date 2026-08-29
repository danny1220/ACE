DELETE FROM `weenie` WHERE `class_Id` = 40000537;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000537, 'gemrareeternalheartseeker01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000537,   1,       2048) /* ItemType - Gem */
     , (40000537,   3,         39) /* PaletteTemplate - Black */
     , (40000537,   5,          5) /* EncumbranceVal */
     , (40000537,   8,          5) /* Mass */
     , (40000537,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000537,  17,        130) /* RareId */
     , (40000537,  18,          1) /* UiEffects - Magical */
     , (40000537,  19,         50) /* Value */
     , (40000537,  33,         -1) /* Bonded - Slippery */
     , (40000537,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000537,  94,         257) /* TargetType - Weapon */
     , (40000537, 150,        103) /* HookPlacement - Hook */
     , (40000537, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000537,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000537,   1, 'Rune Cantrip of Heart Seeker') /* Name */
     , (40000537,  16, 'Use this gem add Legendary Heart Thirst. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000537,   1, 0x020009A7) /* Setup */
     , (40000537,   3, 0x20000014) /* SoundTable */
     , (40000537,   6, 0x040001FA) /* PaletteBase */
     , (40000537,   7, 0x1000010B) /* ClothingBase */
     , (40000537,   8, 0x06005B1E) /* Icon */
     , (40000537,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000537,  50, 0x06005B41) /* IconOverlay */
     , (40000537,  52, 0x06005B0C) /* IconUnderlay */;
