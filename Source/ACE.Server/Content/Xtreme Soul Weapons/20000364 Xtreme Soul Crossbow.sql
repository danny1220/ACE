/* Xtreme Soul Crossbow - Upgraded version of Soulbound Crossbow (45524) with 25% increased stats */

DELETE FROM `weenie` WHERE `class_Id` = 20000364;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (20000364, 'ace20000364-xtremesoulcrossbow', 3, '2025-01-01 00:00:00') /* MissileLauncher */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (20000364,   1,        256) /* ItemType - MissileWeapon */
	 , (20000364,   3,         20) /* PaletteTemplate */
	 , (20000364,   5,        563) /* EncumbranceVal */
	 , (20000364,   8,        180) /* Mass */
	 , (20000364,   9,    4194304) /* ValidLocations - MissileWeapon */
	 , (20000364,  16,          1) /* ItemUseable - No */
	 , (20000364,  19,      30000) /* Value */
	 , (20000364,  33,          1) /* Bonded - Bonded */
	 , (20000364,  36,       9999) /* ResistMagic */
	 , (20000364,  44,          0) /* Damage */
	 , (20000364,  45,          0) /* DamageType - Undef */
	 , (20000364,  48,         47) /* WeaponSkill - MissileWeapons */
	 , (20000364,  49,         30) /* WeaponTime */
	 , (20000364,  50,          2) /* AmmoType - Bolt */
	 , (20000364,  51,          2) /* CombatUse - Missile */
	 , (20000364,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
	 , (20000364, 106,        375) /* ItemSpellcraft */
	 , (20000364, 107,       1875) /* ItemCurMana */
	 , (20000364, 108,       1875) /* ItemMaxMana */
	 , (20000364, 109,        250) /* ItemDifficulty */
	 , (20000364, 114,          1) /* Attuned - Attuned */
	 , (20000364, 151,          2) /* HookType - Wall */
	 , (20000364, 158,          2) /* WieldRequirements - RawSkill */
	 , (20000364, 159,         47) /* WieldSkillType - MissileWeapons */
	 , (20000364, 160,        450) /* WieldDifficulty */
	 , (20000364, 353,          9) /* WeaponType - Crossbow */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (20000364,  22, True ) /* Inscribable */
	 , (20000364,  23, True ) /* DestroyOnSell */
	 , (20000364,  69, False) /* IsSellable */
	 , (20000364,  99, True ) /* Ivoryable */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (20000364,   5,  -0.033) /* ManaRate */
	 , (20000364,  12,   0.5) /* Shade */
	 , (20000364,  26,    27.5) /* MaximumVelocity */
	 , (20000364,  29,    1.25) /* WeaponDefense */
	 , (20000364,  39,    1.0) /* DefaultScale */
	 , (20000364,  62,    1.25) /* WeaponOffense */
	 , (20000364,  63,    3.125) /* DamageMod - 2.5 * 1.25 */
	 , (20000364, 136,       2) /* CritMultiplier */
	 , (20000364, 147,       1) /* CriticalFrequency */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (20000364,   1, 'Xtreme Soul Crossbow') /* Name */
	 , (20000364,  16, 'A Soul Bound crossbow enhanced with Xtreme Oil, its power increased by 25%.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (20000364,   1, 0x02000541) /* Setup */
	 , (20000364,   3, 0x20000014) /* SoundTable */
	 , (20000364,   6, 0x04000BEF) /* PaletteBase */
	 , (20000364,   7, 0x10000419) /* ClothingBase */
	 , (20000364,   8, 0x060015FD) /* Icon */
	 , (20000364,  22, 0x3400002B) /* PhysicsEffectTable */
	 , (20000364,  36, 0x0E000014) /* MutateFilter */;
