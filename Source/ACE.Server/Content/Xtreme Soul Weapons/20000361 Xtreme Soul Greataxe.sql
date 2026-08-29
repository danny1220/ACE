/* Xtreme Soul Greataxe - Upgraded version of Soulbound Dolabra (37579) with 25% increased stats */

DELETE FROM `weenie` WHERE `class_Id` = 20000361;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (20000361, 'ace20000361-xtremesoulgreataxe', 6, '2025-01-01 00:00:00') /* MeleeWeapon */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (20000361,   1,          1) /* ItemType - MeleeWeapon */
	 , (20000361,   3,         20) /* PaletteTemplate */
	 , (20000361,   5,        750) /* EncumbranceVal - 600 * 1.25 */
	 , (20000361,   8,        750) /* Mass */
	 , (20000361,   9,    1048576) /* ValidLocations - MeleeWeapon */
	 , (20000361,  16,          1) /* ItemUseable - No */
	 , (20000361,  19,      30000) /* Value */
	 , (20000361,  33,          1) /* Bonded - Bonded */
	 , (20000361,  36,       9999) /* ResistMagic */
	 , (20000361,  44,         94) /* Damage - 75 * 1.25 */
	 , (20000361,  45,          1) /* DamageType - Slash */
	 , (20000361,  47,          4) /* AttackType - Slash */
	 , (20000361,  48,         46) /* WeaponSkill - FinesseWeapons */
	 , (20000361,  49,         40) /* WeaponTime */
	 , (20000361,  51,          1) /* CombatUse - Melee */
	 , (20000361,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
	 , (20000361, 106,        375) /* ItemSpellcraft */
	 , (20000361, 107,       1875) /* ItemCurMana */
	 , (20000361, 108,       1875) /* ItemMaxMana */
	 , (20000361, 109,        250) /* ItemDifficulty */
	 , (20000361, 114,          1) /* Attuned - Attuned */
	 , (20000361, 151,          2) /* HookType - Wall */
	 , (20000361, 158,          2) /* WieldRequirements - RawSkill */
	 , (20000361, 159,         46) /* WieldSkillType - FinesseWeapons */
	 , (20000361, 160,        450) /* WieldDifficulty */
	 , (20000361, 353,          1) /* WeaponType - Axe */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (20000361,  22, True ) /* Inscribable */
	 , (20000361,  23, True ) /* DestroyOnSell */
	 , (20000361,  69, False) /* IsSellable */
	 , (20000361,  99, True ) /* Ivoryable */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (20000361,   5,  -0.033) /* ManaRate */
	 , (20000361,  12,   0.5) /* Shade */
	 , (20000361,  22,   0.5) /* DamageVariance */
	 , (20000361,  29,    1.25) /* WeaponDefense */
	 , (20000361,  39,    1.2) /* DefaultScale */
	 , (20000361,  62,    1.25) /* WeaponOffense */
	 , (20000361, 136,       1) /* CritMultiplier */
	 , (20000361, 147,       1) /* CriticalFrequency */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (20000361,   1, 'Xtreme Soul Greataxe') /* Name */
	 , (20000361,  16, 'A Soul Bound greataxe enhanced with Xtreme Oil, its power increased by 25%.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (20000361,   1, 0x02000403) /* Setup */
	 , (20000361,   3, 0x20000014) /* SoundTable */
	 , (20000361,   6, 0x04000BEF) /* PaletteBase */
	 , (20000361,   7, 0x10000419) /* ClothingBase */
	 , (20000361,   8, 0x060015FE) /* Icon */
	 , (20000361,  22, 0x3400002B) /* PhysicsEffectTable */
	 , (20000361,  36, 0x0E000014) /* MutateFilter */;
