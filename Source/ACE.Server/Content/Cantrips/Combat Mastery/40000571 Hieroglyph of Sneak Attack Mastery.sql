DELETE FROM `weenie` WHERE `class_Id` = 40000571;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000571, 'ace40000571-hieroglyphofsneakattackmastery', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000571,   1,       2048) /* ItemType - Gem */
     , (40000571,   3,         39) /* PaletteTemplate - Black */
     , (40000571,   5,          5) /* EncumbranceVal */
     , (40000571,   8,          5) /* Mass */
     , (40000571,  16,          524296) /* ItemUseable - SourceContainedTargetContained */
     , (40000571,  17,         83) /* RareId */
     , (40000571,  18,          1) /* UiEffects - Magical */
     , (40000571,  19,          0) /* Value */
     , (40000571,  33,         -1) /* Bonded - Slippery */
     , (40000571,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000571,  94,         35215) /* TargetType - Vestements */
     , (40000571, 150,        103) /* HookPlacement - Hook */
     , (40000571, 151,         11) /* HookType - Floor, Wall, Yard */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000571,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000571,   1, 'Hieroglyph of Sneak Attack Mastery') /* Name */
     , (40000571,  16, 'Use this gem to add Legendary Sneak Attack Prowess. This gem will be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000571,   1, 0x020009A7) /* Setup */
     , (40000571,   3, 0x20000014) /* SoundTable */
     , (40000571,   6, 0x040001FA) /* PaletteBase */
     , (40000571,   7, 0x1000010B) /* ClothingBase */
     , (40000571,   8, 0x06005B22) /* Icon */
     , (40000571,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000571,  50, 0x06007117) /* IconOverlay */
     , (40000571,  52, 0x06005B0C) /* IconUnderlay */;
