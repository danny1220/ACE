DELETE FROM `weenie` WHERE `class_Id` = 40000541;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000541, 'gemrareeternalitemtinkering01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000541,   1,       2048) /* ItemType - Gem */
     , (40000541,   3,         39) /* PaletteTemplate - Black */
     , (40000541,   5,          5) /* EncumbranceVal */
     , (40000541,   8,          5) /* Mass */
     , (40000541,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000541,  17,         98) /* RareId */
     , (40000541,  18,          1) /* UiEffects - Magical */
     , (40000541,  19,         50) /* Value */
     , (40000541,  33,         -1) /* Bonded - Slippery */
     , (40000541,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000541,  94,         35215) /* TargetType - Vestements */
     , (40000541, 150,        103) /* HookPlacement - Hook */
     , (40000541, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000541,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000541,   1, 'Hieroglyph Cantrip of Item Tinkering Expertise') /* Name */
     , (40000541,  16, 'Use this gem add Legendary Item Tinkering Expertise. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000541,   1, 0x020009A7) /* Setup */
     , (40000541,   3, 0x20000014) /* SoundTable */
     , (40000541,   6, 0x040001FA) /* PaletteBase */
     , (40000541,   7, 0x1000010B) /* ClothingBase */
     , (40000541,   8, 0x06005B22) /* Icon */
     , (40000541,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000541,  50, 0x06005B45) /* IconOverlay */
     , (40000541,  52, 0x06005B0C) /* IconUnderlay */;
