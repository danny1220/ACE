DELETE FROM `weenie` WHERE `class_Id` = 40000527;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000527, 'gemrareeternaldeception01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000527,   1,       2048) /* ItemType - Gem */
     , (40000527,   3,         39) /* PaletteTemplate - Black */
     , (40000527,   5,          5) /* EncumbranceVal */
     , (40000527,   8,          5) /* Mass */
     , (40000527,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000527,  17,         94) /* RareId */
     , (40000527,  18,          1) /* UiEffects - Magical */
     , (40000527,  19,         50) /* Value */
     , (40000527,  33,         -1) /* Bonded - Slippery */
     , (40000527,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000527,  94,         35215) /* TargetType - Vestements */
     , (40000527, 150,        103) /* HookPlacement - Hook */
     , (40000527, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000527,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000527,   1, 'Hieroglyph Cantrip of Deception Mastery') /* Name */
     , (40000527,  16, 'Use this gem to add Legendary Deception Prowess. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000527,   1, 0x020009A7) /* Setup */
     , (40000527,   3, 0x20000014) /* SoundTable */
     , (40000527,   6, 0x040001FA) /* PaletteBase */
     , (40000527,   7, 0x1000010B) /* ClothingBase */
     , (40000527,   8, 0x06005B22) /* Icon */
     , (40000527,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000527,  50, 0x06005B35) /* IconOverlay */
     , (40000527,  52, 0x06005B0C) /* IconUnderlay */;
