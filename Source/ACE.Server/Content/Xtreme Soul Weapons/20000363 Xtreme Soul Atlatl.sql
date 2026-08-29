/* Xtreme Soul Atlatl - Upgraded version of Soulbound Atlatl (41927) with 25% increased stats */

DELETE FROM `weenie` WHERE `class_Id` = 20000363;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (20000363, 'ace20000363-xtremesoulatlatl', 3, '2025-01-01 00:00:00') /* MissileLauncher */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (20000363,   1,        256) /* ItemType - MissileWeapon */
	 , (20000363,   3,         20) /* PaletteTemplate */
	 , (20000363,   5,        563) /* EncumbranceVal */
	 , (20000363,   8,        180) /* Mass */
	 , (20000363,   9,    4194304) /* ValidLocations - MissileWeapon */
	 , (20000363,  16,          1) /* ItemUseable - No */
	 , (20000363,  19,      30000) /* Value */
	 , (20000363,  33,          1) /* Bonded - Bonded */
	 , (20000363,  36,       9999) /* ResistMagic */
	 , (20000363,  44,          0) /* Damage */
	 , (20000363,  45,          0) /* DamageType - Undef */
	 , (20000363,  48,         47) /* WeaponSkill - MissileWeapons */
	 , (20000363,  49,         30) /* WeaponTime */
	 , (20000363,  50,          4) /* AmmoType - Atlatl */
	 , (20000363,  51,          2) /* CombatUse - Missile */
	 , (20000363,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
	 , (20000363, 106,        375) /* ItemSpellcraft */
	 , (20000363, 107,       1875) /* ItemCurMana */
	 , (20000363, 108,       1875) /* ItemMaxMana */
	 , (20000363, 109,        250) /* ItemDifficulty */
	 , (20000363, 114,          1) /* Attuned - Attuned */
	 , (20000363, 151,          2) /* HookType - Wall */
	 , (20000363, 158,          2) /* WieldRequirements - RawSkill */
	 , (20000363, 159,         47) /* WieldSkillType - MissileWeapons */
	 , (20000363, 160,        450) /* WieldDifficulty */
	 , (20000363, 353,         11) /* WeaponType - Atlatl */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (20000363,  22, True ) /* Inscribable */
	 , (20000363,  23, True ) /* DestroyOnSell */
	 , (20000363,  69, False) /* IsSellable */
	 , (20000363,  99, True ) /* Ivoryable */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (20000363,   5,  -0.033) /* ManaRate */
	 , (20000363,  12,   0.5) /* Shade */
	 , (20000363,  26,    27.5) /* MaximumVelocity */
	 , (20000363,  29,    1.25) /* WeaponDefense */
	 , (20000363,  39,    1.0) /* DefaultScale */
	 , (20000363,  62,    1.25) /* WeaponOffense */
	 , (20000363,  63,    3.125) /* DamageMod - 2.5 * 1.25 */
	 , (20000363, 136,       2) /* CritMultiplier */
	 , (20000363, 147,       1) /* CriticalFrequency */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (20000363,   1, 'Xtreme Soul Atlatl') /* Name */
	 , (20000363,  16, 'A Soul Bound atlatl enhanced with Xtreme Oil, its power increased by 25%.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (20000363,   1, 0x020005E5) /* Setup */
	 , (20000363,   3, 0x20000014) /* SoundTable */
	 , (20000363,   6, 0x04000BEF) /* PaletteBase */
	 , (20000363,   7, 0x10000419) /* ClothingBase */
	 , (20000363,   8, 0x060015FA) /* Icon */
	 , (20000363,  22, 0x3400002B) /* PhysicsEffectTable */
	 , (20000363,  36, 0x0E000014) /* MutateFilter */;
