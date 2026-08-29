/* Xtreme Soul Staff - Upgraded version of Soulbound Staff (45526) with 25% increased stats */

DELETE FROM `weenie` WHERE `class_Id` = 20000358;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (20000358, 'ace20000358-xtremesoulstaff', 35, '2025-01-01 00:00:00') /* Caster */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (20000358,   1,      32768) /* ItemType - Caster */
	 , (20000358,   3,         20) /* PaletteTemplate */
	 , (20000358,   5,        250) /* EncumbranceVal */
	 , (20000358,   8,        250) /* Mass */
	 , (20000358,   9,   16777216) /* ValidLocations - Held */
	 , (20000358,  16,    6291461) /* ItemUseable - No, SourceWieldedTargetRemoteNeverWalk */
	 , (20000358,  19,      30000) /* Value */
	 , (20000358,  33,          1) /* Bonded - Bonded */
	 , (20000358,  36,       9999) /* ResistMagic */
	 , (20000358,  45,         64) /* DamageType - Electric */
	 , (20000358,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
	 , (20000358,  94,         16) /* TargetType - Creature */
	 , (20000358, 106,        375) /* ItemSpellcraft */
	 , (20000358, 107,       7500) /* ItemCurMana */
	 , (20000358, 108,       7500) /* ItemMaxMana */
	 , (20000358, 109,        250) /* ItemDifficulty */
	 , (20000358, 114,          1) /* Attuned - Attuned */
	 , (20000358, 151,          2) /* HookType - Wall */
	 , (20000358, 158,          2) /* WieldRequirements - RawSkill */
	 , (20000358, 159,         34) /* WieldSkillType - WarMagic */
	 , (20000358, 160,        450) /* WieldDifficulty */
	 , (20000358, 166,         60) /* SlayerCreatureType - AcidElemental */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (20000358,  22, True ) /* Inscribable */
	 , (20000358,  23, True ) /* DestroyOnSell */
	 , (20000358,  69, False) /* IsSellable */
	 , (20000358,  99, True ) /* Ivoryable */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (20000358,   5,  -0.033) /* ManaRate */
	 , (20000358,  12,   0.5) /* Shade */
	 , (20000358,  29,    1.31) /* WeaponDefense - 1.05 * 1.25 */
	 , (20000358,  39,    0.6) /* DefaultScale */
	 , (20000358, 144,   0.125) /* ManaConversionMod */
	 , (20000358, 147,       1) /* CriticalFrequency */
	 , (20000358, 152,    1.31) /* ElementalDamageMod - 1.05 * 1.25 */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (20000358,   1, 'Xtreme Soul Staff') /* Name */
	 , (20000358,  16, 'A Soul Bound staff enhanced with Xtreme Oil, its power increased by 25%.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (20000358,   1, 0x020005FB) /* Setup */
	 , (20000358,   3, 0x20000014) /* SoundTable */
	 , (20000358,   6, 0x04000BEF) /* PaletteBase */
	 , (20000358,   7, 0x10000419) /* ClothingBase */
	 , (20000358,   8, 0x06001604) /* Icon */
	 , (20000358,  22, 0x3400002B) /* PhysicsEffectTable */
	 , (20000358,  36, 0x0E000014) /* MutateFilter */;
