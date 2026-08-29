/* Xtreme Soul Axe - Upgraded version of Soulbound Axe (37574) with 25% increased stats */

DELETE FROM `weenie` WHERE `class_Id` = 20000359;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (20000359, 'ace20000359-xtremesoulaxe', 6, '2025-01-01 00:00:00') /* MeleeWeapon */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (20000359,   1,          1) /* ItemType - MeleeWeapon */
	 , (20000359,   3,         20) /* PaletteTemplate */
	 , (20000359,   5,        563) /* EncumbranceVal */
	 , (20000359,   8,        563) /* Mass */
	 , (20000359,   9,    1048576) /* ValidLocations - MeleeWeapon */
	 , (20000359,  16,          1) /* ItemUseable - No */
	 , (20000359,  19,      30000) /* Value */
	 , (20000359,  33,          1) /* Bonded - Bonded */
	 , (20000359,  36,       9999) /* ResistMagic */
	 , (20000359,  44,         75) /* Damage - 60 * 1.25 */
	 , (20000359,  45,          1) /* DamageType - Slash */
	 , (20000359,  47,          4) /* AttackType - Slash */
	 , (20000359,  48,         44) /* WeaponSkill - HeavyWeapons */
	 , (20000359,  49,         30) /* WeaponTime */
	 , (20000359,  51,          1) /* CombatUse - Melee */
	 , (20000359,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
	 , (20000359, 106,        375) /* ItemSpellcraft */
	 , (20000359, 107,       1875) /* ItemCurMana */
	 , (20000359, 108,       1875) /* ItemMaxMana */
	 , (20000359, 109,        250) /* ItemDifficulty */
	 , (20000359, 114,          1) /* Attuned - Attuned */
	 , (20000359, 151,          2) /* HookType - Wall */
	 , (20000359, 158,          2) /* WieldRequirements - RawSkill */
	 , (20000359, 159,         44) /* WieldSkillType - HeavyWeapons */
	 , (20000359, 160,        450) /* WieldDifficulty */
	 , (20000359, 353,          1) /* WeaponType - Axe */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (20000359,  22, True ) /* Inscribable */
	 , (20000359,  23, True ) /* DestroyOnSell */
	 , (20000359,  69, False) /* IsSellable */
	 , (20000359,  99, True ) /* Ivoryable */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (20000359,   5,  -0.033) /* ManaRate */
	 , (20000359,  12,   0.5) /* Shade */
	 , (20000359,  22,   0.5) /* DamageVariance */
	 , (20000359,  29,    1.25) /* WeaponDefense */
	 , (20000359,  39,    1.0) /* DefaultScale */
	 , (20000359,  62,    1.25) /* WeaponOffense */
	 , (20000359, 136,       1) /* CritMultiplier */
	 , (20000359, 147,       1) /* CriticalFrequency */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (20000359,   1, 'Xtreme Soul Axe') /* Name */
	 , (20000359,  16, 'A Soul Bound axe enhanced with Xtreme Oil, its power increased by 25%.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (20000359,   1, 0x020003FF) /* Setup */
	 , (20000359,   3, 0x20000014) /* SoundTable */
	 , (20000359,   6, 0x04000BEF) /* PaletteBase */
	 , (20000359,   7, 0x10000419) /* ClothingBase */
	 , (20000359,   8, 0x060015FB) /* Icon */
	 , (20000359,  22, 0x3400002B) /* PhysicsEffectTable */
	 , (20000359,  36, 0x0E000014) /* MutateFilter */;
