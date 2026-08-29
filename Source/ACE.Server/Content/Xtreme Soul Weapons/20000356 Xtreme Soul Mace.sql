/* Xtreme Soul Mace - Upgraded version of Soulbound Mace (45527) with 25% increased stats */

DELETE FROM `weenie` WHERE `class_Id` = 20000356;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (20000356, 'ace20000356-xtremesoulmace', 6, '2025-01-01 00:00:00') /* MeleeWeapon */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (20000356,   1,          1) /* ItemType - MeleeWeapon */
	 , (20000356,   3,         20) /* PaletteTemplate */
	 , (20000356,   5,        563) /* EncumbranceVal */
	 , (20000356,   8,        563) /* Mass */
	 , (20000356,   9,    1048576) /* ValidLocations - MeleeWeapon */
	 , (20000356,  16,          1) /* ItemUseable - No */
	 , (20000356,  19,      30000) /* Value */
	 , (20000356,  33,          1) /* Bonded - Bonded */
	 , (20000356,  36,       9999) /* ResistMagic */
	 , (20000356,  44,         75) /* Damage - 60 * 1.25 */
	 , (20000356,  45,          4) /* DamageType - Bludgeon */
	 , (20000356,  47,          4) /* AttackType - Slash */
	 , (20000356,  48,         44) /* WeaponSkill - HeavyWeapons */
	 , (20000356,  49,         30) /* WeaponTime */
	 , (20000356,  51,          1) /* CombatUse - Melee */
	 , (20000356,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
	 , (20000356, 106,        375) /* ItemSpellcraft */
	 , (20000356, 107,       1875) /* ItemCurMana */
	 , (20000356, 108,       1875) /* ItemMaxMana */
	 , (20000356, 109,        250) /* ItemDifficulty */
	 , (20000356, 114,          1) /* Attuned - Attuned */
	 , (20000356, 151,          2) /* HookType - Wall */
	 , (20000356, 158,          2) /* WieldRequirements - RawSkill */
	 , (20000356, 159,         44) /* WieldSkillType - HeavyWeapons */
	 , (20000356, 160,        450) /* WieldDifficulty */
	 , (20000356, 353,          4) /* WeaponType - Mace */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (20000356,  22, True ) /* Inscribable */
	 , (20000356,  23, True ) /* DestroyOnSell */
	 , (20000356,  69, False) /* IsSellable */
	 , (20000356,  99, True ) /* Ivoryable */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (20000356,   5,  -0.033) /* ManaRate */
	 , (20000356,  12,   0.5) /* Shade */
	 , (20000356,  22,   0.5) /* DamageVariance */
	 , (20000356,  29,    1.25) /* WeaponDefense */
	 , (20000356,  39,    1.0) /* DefaultScale */
	 , (20000356,  62,    1.25) /* WeaponOffense */
	 , (20000356, 136,       1) /* CritMultiplier */
	 , (20000356, 147,       1) /* CriticalFrequency */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (20000356,   1, 'Xtreme Soul Mace') /* Name */
	 , (20000356,  16, 'A Soul Bound mace enhanced with Xtreme Oil, its power increased by 25%.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (20000356,   1, 0x02000407) /* Setup */
	 , (20000356,   3, 0x20000014) /* SoundTable */
	 , (20000356,   6, 0x04000BEF) /* PaletteBase */
	 , (20000356,   7, 0x10000419) /* ClothingBase */
	 , (20000356,   8, 0x06001602) /* Icon */
	 , (20000356,  22, 0x3400002B) /* PhysicsEffectTable */
	 , (20000356,  36, 0x0E000014) /* MutateFilter */;
