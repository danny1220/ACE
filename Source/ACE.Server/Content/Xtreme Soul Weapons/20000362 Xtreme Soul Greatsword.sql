/* Xtreme Soul Greatsword - Upgraded version of Soulbound Greatsword (37585) with 25% increased stats */

DELETE FROM `weenie` WHERE `class_Id` = 20000362;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (20000362, 'ace20000362-xtremesoulgreatsword', 6, '2025-01-01 00:00:00') /* MeleeWeapon */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (20000362,   1,          1) /* ItemType - MeleeWeapon */
	 , (20000362,   3,         20) /* PaletteTemplate */
	 , (20000362,   5,        750) /* EncumbranceVal - 600 * 1.25 */
	 , (20000362,   8,        750) /* Mass */
	 , (20000362,   9,    1048576) /* ValidLocations - MeleeWeapon */
	 , (20000362,  16,          1) /* ItemUseable - No */
	 , (20000362,  19,      30000) /* Value */
	 , (20000362,  33,          1) /* Bonded - Bonded */
	 , (20000362,  36,       9999) /* ResistMagic */
	 , (20000362,  44,         94) /* Damage - 75 * 1.25 */
	 , (20000362,  45,          3) /* DamageType - Slash, Pierce */
	 , (20000362,  47,          6) /* AttackType - Thrust, Slash */
	 , (20000362,  48,         44) /* WeaponSkill - HeavyWeapons */
	 , (20000362,  49,         40) /* WeaponTime */
	 , (20000362,  51,          1) /* CombatUse - Melee */
	 , (20000362,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
	 , (20000362, 106,        375) /* ItemSpellcraft */
	 , (20000362, 107,       1875) /* ItemCurMana */
	 , (20000362, 108,       1875) /* ItemMaxMana */
	 , (20000362, 109,        250) /* ItemDifficulty */
	 , (20000362, 114,          1) /* Attuned - Attuned */
	 , (20000362, 151,          2) /* HookType - Wall */
	 , (20000362, 158,          2) /* WieldRequirements - RawSkill */
	 , (20000362, 159,         44) /* WieldSkillType - HeavyWeapons */
	 , (20000362, 160,        450) /* WieldDifficulty */
	 , (20000362, 353,          2) /* WeaponType - Sword */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (20000362,  22, True ) /* Inscribable */
	 , (20000362,  23, True ) /* DestroyOnSell */
	 , (20000362,  69, False) /* IsSellable */
	 , (20000362,  99, True ) /* Ivoryable */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (20000362,   5,  -0.033) /* ManaRate */
	 , (20000362,  12,   0.5) /* Shade */
	 , (20000362,  22,   0.5) /* DamageVariance */
	 , (20000362,  29,    1.25) /* WeaponDefense */
	 , (20000362,  39,    1.1) /* DefaultScale */
	 , (20000362,  62,    1.25) /* WeaponOffense */
	 , (20000362, 136,       1) /* CritMultiplier */
	 , (20000362, 147,       1) /* CriticalFrequency */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (20000362,   1, 'Xtreme Soul Greatsword') /* Name */
	 , (20000362,  16, 'A Soul Bound greatsword enhanced with Xtreme Oil, its power increased by 25%.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (20000362,   1, 0x02000408) /* Setup */
	 , (20000362,   3, 0x20000014) /* SoundTable */
	 , (20000362,   6, 0x04000BEF) /* PaletteBase */
	 , (20000362,   7, 0x10000419) /* ClothingBase */
	 , (20000362,   8, 0x060015FF) /* Icon */
	 , (20000362,  22, 0x3400002B) /* PhysicsEffectTable */
	 , (20000362,  36, 0x0E000014) /* MutateFilter */;
