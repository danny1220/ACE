DELETE FROM `weenie` WHERE `class_Id` = 40000556;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000556, 'gemrareeternalpiercingbane01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000556,   1,       2048) /* ItemType - Gem */
     , (40000556,   3,         39) /* PaletteTemplate - Black */
     , (40000556,   5,          5) /* EncumbranceVal */
     , (40000556,   8,          5) /* Mass */
     , (40000556,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000556,  17,        136) /* RareId */
     , (40000556,  18,          1) /* UiEffects - Magical */
     , (40000556,  19,          0) /* Value */
     , (40000556,  33,         -1) /* Bonded - Slippery */
     , (40000556,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000556,  94,         35215) /* TargetType - Vestements */
     , (40000556, 150,        103) /* HookPlacement - Hook */
     , (40000556, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000556,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000556,   1, 'Rune of Pierce Bane') /* Name */
     , (40000556,  16, 'Use this gem add Legendary Piercing Bane. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000556,   1, 0x020009A7) /* Setup */
     , (40000556,   3, 0x20000014) /* SoundTable */
     , (40000556,   6, 0x040001FA) /* PaletteBase */
     , (40000556,   7, 0x1000010B) /* ClothingBase */
     , (40000556,   8, 0x06005B1E) /* Icon */
     , (40000556,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000556,  50, 0x06005B55) /* IconOverlay */
     , (40000556,  52, 0x06005B0C) /* IconUnderlay */;
