/* Xtreme Soul Dagger - Upgraded version of Soulbound Dagger (45525) with 25% increased stats */

DELETE FROM `weenie` WHERE `class_Id` = 20000353;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (20000353, 'ace20000353-xtremesouldagger', 6, '2025-01-01 00:00:00') /* MeleeWeapon */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (20000353,   1,          1) /* ItemType - MeleeWeapon */
	 , (20000353,   3,         20) /* PaletteTemplate */
	 , (20000353,   5,        125) /* EncumbranceVal */
	 , (20000353,   8,        225) /* Mass */
	 , (20000353,   9,    1048576) /* ValidLocations - MeleeWeapon */
	 , (20000353,  16,          1) /* ItemUseable - No */
	 , (20000353,  19,      30000) /* Value */
	 , (20000353,  33,          1) /* Bonded - Bonded */
	 , (20000353,  36,       9999) /* ResistMagic */
	 , (20000353,  44,         63) /* Damage - 50 * 1.25 = 62.5 */
	 , (20000353,  45,          3) /* DamageType - Slash, Pierce */
	 , (20000353,  47,          1) /* AttackType - Punch */
	 , (20000353,  48,         46) /* WeaponSkill - FinesseWeapons */
	 , (20000353,  49,         25) /* WeaponTime */
	 , (20000353,  51,          1) /* CombatUse - Melee */
	 , (20000353,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
	 , (20000353, 106,        375) /* ItemSpellcraft - 300 * 1.25 */
	 , (20000353, 107,       1875) /* ItemCurMana - 1500 * 1.25 */
	 , (20000353, 108,       1875) /* ItemMaxMana - 1500 * 1.25 */
	 , (20000353, 109,        250) /* ItemDifficulty - 200 * 1.25 */
	 , (20000353, 114,          1) /* Attuned - Attuned */
	 , (20000353, 151,          2) /* HookType - Wall */
	 , (20000353, 158,          2) /* WieldRequirements - RawSkill */
	 , (20000353, 159,         46) /* WieldSkillType - FinesseWeapons */
	 , (20000353, 160,        450) /* WieldDifficulty - 360 * 1.25 */
	 , (20000353, 353,          1) /* WeaponType - Unarmed */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (20000353,  22, True ) /* Inscribable */
	 , (20000353,  23, True ) /* DestroyOnSell */
	 , (20000353,  69, False) /* IsSellable */
	 , (20000353,  99, True ) /* Ivoryable */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (20000353,   5,  -0.033) /* ManaRate */
	 , (20000353,  12,   0.5) /* Shade */
	 , (20000353,  22,   0.5) /* DamageVariance */
	 , (20000353,  26,       0) /* MaximumVelocity */
	 , (20000353,  29,    1.25) /* WeaponDefense - 1.0 * 1.25 */
	 , (20000353,  39,    1.25) /* DefaultScale */
	 , (20000353,  62,    1.25) /* WeaponOffense - 1.0 * 1.25 */
	 , (20000353, 136,       1) /* CritMultiplier */
	 , (20000353, 147,       1) /* CriticalFrequency */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (20000353,   1, 'Xtreme Soul Dagger') /* Name */
	 , (20000353,  16, 'A Soul Bound dagger enhanced with Xtreme Oil, its power increased by 25%.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (20000353,   1, 0x02000404) /* Setup - same as original soulbound dagger */
	 , (20000353,   3, 0x20000014) /* SoundTable */
	 , (20000353,   6, 0x04000BEF) /* PaletteBase */
	 , (20000353,   7, 0x10000419) /* ClothingBase */
	 , (20000353,   8, 0x060015F9) /* Icon */
	 , (20000353,  22, 0x3400002B) /* PhysicsEffectTable */
	 , (20000353,  36, 0x0E000014) /* MutateFilter */;

/* NOTE: Adjust damage, defense, and stat values to be exactly 25% higher than the original Soulbound Dagger (45525) */
/* Add spell list from original if needed using weenie_properties_spell table */
