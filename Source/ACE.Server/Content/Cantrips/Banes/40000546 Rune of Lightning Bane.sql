DELETE FROM `weenie` WHERE `class_Id` = 40000546;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000546, 'gemrareeternallightningbane01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000546,   1,       2048) /* ItemType - Gem */
     , (40000546,   3,         39) /* PaletteTemplate - Black */
     , (40000546,   5,          5) /* EncumbranceVal */
     , (40000546,   8,          5) /* Mass */
     , (40000546,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000546,  17,        141) /* RareId */
     , (40000546,  18,          1) /* UiEffects - Magical */
     , (40000546,  19,          0) /* Value */
     , (40000546,  33,         -1) /* Bonded - Slippery */
     , (40000546,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000546,  94,         16) /* TargetType - Creature */
     , (40000546, 150,        103) /* HookPlacement - Hook */
     , (40000546, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000546,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000546,   1, 'Rune Cantrip of Lightning Bane') /* Name */
     , (40000546,  16, 'Use this gem add Legendary Storm Bane. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000546,   1, 0x020009A7) /* Setup */
     , (40000546,   3, 0x20000014) /* SoundTable */
     , (40000546,   6, 0x040001FA) /* PaletteBase */
     , (40000546,   7, 0x1000010B) /* ClothingBase */
     , (40000546,   8, 0x06005B1E) /* Icon */
     , (40000546,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000546,  50, 0x06005B4A) /* IconOverlay */
     , (40000546,  52, 0x06005B0C) /* IconUnderlay */;
