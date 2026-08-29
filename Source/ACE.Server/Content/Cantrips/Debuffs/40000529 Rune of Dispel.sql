DELETE FROM `weenie` WHERE `class_Id` = 40000529;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (40000529, 'gemrareeternaldispel01', 38, '2021-11-17 16:56:08') /* Gem */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (40000529,   1,       2048) /* ItemType - Gem */
     , (40000529,   3,         39) /* PaletteTemplate - Black */
     , (40000529,   5,          5) /* EncumbranceVal */
     , (40000529,   8,          5) /* Mass */
     , (40000529,  11,          1) /* MaxStackSize */
     , (40000529,  12,          1) /* StackSize */
     , (40000529,  13,          5) /* StackUnitEncumbrance */
     , (40000529,  14,          5) /* StackUnitMass */
     , (40000529,  15,          0) /* StackUnitValue */
     , (40000529,  16,          8) /* ItemUseable - Contained */
     , (40000529,  17,        143) /* RareId */
     , (40000529,  18,          1) /* UiEffects - Magical */
     , (40000529,  19,         50) /* Value */
     , (40000529,  33,         1) /* Bonded - Slippery */
     , (40000529,  92,         -1) /* Structure */
     , (40000529,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (40000529,  94,         16) /* TargetType - Creature */
     , (40000529, 106,        325) /* ItemSpellcraft */
     , (40000529, 107,      10000) /* ItemCurMana */
     , (40000529, 108,      10000) /* ItemMaxMana */
     , (40000529, 150,        103) /* HookPlacement - Hook */
     , (40000529, 151,         11) /* HookType - Floor, Wall, Yard */
     , (40000529, 280,         10) /* SharedCooldown */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (40000529,  22, True ) /* Inscribable */
     , (40000529,  63, True ) /* UnlimitedUse */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (40000529, 167,       5) /* CooldownDuration */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (40000529,   1, 'Rune Cantrip of Dispel') /* Name */
     , (40000529,  16, 'Use this gem to cast Incantation of Dispel. This gem does not run out of charges. It will not be destroyed upon use.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (40000529,   1, 0x020009A7) /* Setup */
     , (40000529,   3, 0x20000014) /* SoundTable */
     , (40000529,   6, 0x040001FA) /* PaletteBase */
     , (40000529,   7, 0x1000010B) /* ClothingBase */
     , (40000529,   8, 0x06005B0C) /* Icon */
     , (40000529,  22, 0x3400002B) /* PhysicsEffectTable */
     , (40000529,  28,       4330) /* Spell - Incantation of Nullify All Magic Other */
     , (40000529,  50, 0x06005B37) /* IconOverlay */
     , (40000529,  52, 0x06005B0C) /* IconUnderlay */;
