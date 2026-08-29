/* Xtreme Soul Bow - Upgraded version of Soulbound Bow (45523) with 25% increased stats */

DELETE FROM `weenie` WHERE `class_Id` = 20000355;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (20000355, 'ace20000355-xtremesoulbow', 3, '2025-01-01 00:00:00') /* MissileLauncher */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (20000355,   1,        256) /* ItemType - MissileWeapon */
	 , (20000355,   3,         20) /* PaletteTemplate */
	 , (20000355,   5,        563) /* EncumbranceVal */
	 , (20000355,   8,        180) /* Mass */
	 , (20000355,   9,    4194304) /* ValidLocations - MissileWeapon */
	 , (20000355,  16,          1) /* ItemUseable - No */
	 , (20000355,  19,      30000) /* Value */
	 , (20000355,  33,          1) /* Bonded - Bonded */
	 , (20000355,  36,       9999) /* ResistMagic */
	 , (20000355,  44,          0) /* Damage */
	 , (20000355,  45,          0) /* DamageType - Undef */
	 , (20000355,  48,         47) /* WeaponSkill - MissileWeapons */
	 , (20000355,  49,         25) /* WeaponTime */
	 , (20000355,  50,          1) /* AmmoType - Arrow */
	 , (20000355,  51,          2) /* CombatUse - Missile */
	 , (20000355,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
	 , (20000355, 106,        375) /* ItemSpellcraft */
	 , (20000355, 107,       1875) /* ItemCurMana */
	 , (20000355, 108,       1875) /* ItemMaxMana */
	 , (20000355, 109,        250) /* ItemDifficulty */
	 , (20000355, 114,          1) /* Attuned - Attuned */
	 , (20000355, 151,          2) /* HookType - Wall */
	 , (20000355, 158,          2) /* WieldRequirements - RawSkill */
	 , (20000355, 159,         47) /* WieldSkillType - MissileWeapons */
	 , (20000355, 160,        450) /* WieldDifficulty */
	 , (20000355, 353,          3) /* WeaponType - Bow */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (20000355,  22, True ) /* Inscribable */
	 , (20000355,  23, True ) /* DestroyOnSell */
	 , (20000355,  69, False) /* IsSellable */
	 , (20000355,  99, True ) /* Ivoryable */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (20000355,   5,  -0.033) /* ManaRate */
	 , (20000355,  12,   0.5) /* Shade */
	 , (20000355,  26,    27.5) /* MaximumVelocity */
	 , (20000355,  29,    1.25) /* WeaponDefense */
	 , (20000355,  39,    1.1) /* DefaultScale */
	 , (20000355,  62,    1.25) /* WeaponOffense */
	 , (20000355,  63,    3.125) /* DamageMod - 2.5 * 1.25 */
	 , (20000355, 136,       2) /* CritMultiplier */
	 , (20000355, 147,       1) /* CriticalFrequency */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (20000355,   1, 'Xtreme Soul Bow') /* Name */
	 , (20000355,  16, 'A Soul Bound bow enhanced with Xtreme Oil, its power increased by 25%.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (20000355,   1, 0x02000543) /* Setup */
	 , (20000355,   3, 0x20000014) /* SoundTable */
	 , (20000355,   6, 0x04000BEF) /* PaletteBase */
	 , (20000355,   7, 0x10000419) /* ClothingBase */
	 , (20000355,   8, 0x060015FC) /* Icon */
	 , (20000355,  22, 0x3400002B) /* PhysicsEffectTable */
	 , (20000355,  36, 0x0E000014) /* MutateFilter */;
