/* Xtreme Soul Sword - Upgraded version of Soulbound Sword (45529) with 25% increased stats */

DELETE FROM `weenie` WHERE `class_Id` = 20000354;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (20000354, 'ace20000354-xtremesoulsword', 6, '2025-01-01 00:00:00') /* MeleeWeapon */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (20000354,   1,          1) /* ItemType - MeleeWeapon */
	 , (20000354,   3,         20) /* PaletteTemplate */
	 , (20000354,   5,        563) /* EncumbranceVal - 450 * 1.25 */
	 , (20000354,   8,        563) /* Mass */
	 , (20000354,   9,    1048576) /* ValidLocations - MeleeWeapon */
	 , (20000354,  16,          1) /* ItemUseable - No */
	 , (20000354,  19,      30000) /* Value */
	 , (20000354,  33,          1) /* Bonded - Bonded */
	 , (20000354,  36,       9999) /* ResistMagic */
	 , (20000354,  44,         75) /* Damage - 60 * 1.25 */
	 , (20000354,  45,          3) /* DamageType - Slash, Pierce */
	 , (20000354,  47,          6) /* AttackType - Thrust, Slash */
	 , (20000354,  48,         44) /* WeaponSkill - HeavyWeapons */
	 , (20000354,  49,         30) /* WeaponTime */
	 , (20000354,  51,          1) /* CombatUse - Melee */
	 , (20000354,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
	 , (20000354, 106,        375) /* ItemSpellcraft */
	 , (20000354, 107,       1875) /* ItemCurMana */
	 , (20000354, 108,       1875) /* ItemMaxMana */
	 , (20000354, 109,        250) /* ItemDifficulty */
	 , (20000354, 114,          1) /* Attuned - Attuned */
	 , (20000354, 151,          2) /* HookType - Wall */
	 , (20000354, 158,          2) /* WieldRequirements - RawSkill */
	 , (20000354, 159,         44) /* WieldSkillType - HeavyWeapons */
	 , (20000354, 160,        450) /* WieldDifficulty */
	 , (20000354, 353,          2) /* WeaponType - Sword */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (20000354,  22, True ) /* Inscribable */
	 , (20000354,  23, True ) /* DestroyOnSell */
	 , (20000354,  69, False) /* IsSellable */
	 , (20000354,  99, True ) /* Ivoryable */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (20000354,   5,  -0.033) /* ManaRate */
	 , (20000354,  12,   0.5) /* Shade */
	 , (20000354,  22,   0.5) /* DamageVariance */
	 , (20000354,  29,    1.25) /* WeaponDefense */
	 , (20000354,  39,    1.0) /* DefaultScale */
	 , (20000354,  62,    1.25) /* WeaponOffense */
	 , (20000354, 136,       1) /* CritMultiplier */
	 , (20000354, 147,       1) /* CriticalFrequency */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (20000354,   1, 'Xtreme Soul Sword') /* Name */
	 , (20000354,  16, 'A Soul Bound sword enhanced with Xtreme Oil, its power increased by 25%.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (20000354,   1, 0x02000420) /* Setup */
	 , (20000354,   3, 0x20000014) /* SoundTable */
	 , (20000354,   6, 0x04000BEF) /* PaletteBase */
	 , (20000354,   7, 0x10000419) /* ClothingBase */
	 , (20000354,   8, 0x06001600) /* Icon */
	 , (20000354,  22, 0x3400002B) /* PhysicsEffectTable */
	 , (20000354,  36, 0x0E000014) /* MutateFilter */;
