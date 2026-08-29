/* Xtreme Soul Spear - Upgraded version of Soulbound Spear (45528) with 25% increased stats */

DELETE FROM `weenie` WHERE `class_Id` = 20000357;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (20000357, 'ace20000357-xtremesoulspear', 6, '2025-01-01 00:00:00') /* MeleeWeapon */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (20000357,   1,          1) /* ItemType - MeleeWeapon */
	 , (20000357,   3,         20) /* PaletteTemplate */
	 , (20000357,   5,        563) /* EncumbranceVal */
	 , (20000357,   8,        563) /* Mass */
	 , (20000357,   9,    1048576) /* ValidLocations - MeleeWeapon */
	 , (20000357,  16,          1) /* ItemUseable - No */
	 , (20000357,  19,      30000) /* Value */
	 , (20000357,  33,          1) /* Bonded - Bonded */
	 , (20000357,  36,       9999) /* ResistMagic */
	 , (20000357,  44,         75) /* Damage - 60 * 1.25 */
	 , (20000357,  45,          2) /* DamageType - Pierce */
	 , (20000357,  47,          2) /* AttackType - Thrust */
	 , (20000357,  48,         44) /* WeaponSkill - HeavyWeapons */
	 , (20000357,  49,         30) /* WeaponTime */
	 , (20000357,  51,          1) /* CombatUse - Melee */
	 , (20000357,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
	 , (20000357, 106,        375) /* ItemSpellcraft */
	 , (20000357, 107,       1875) /* ItemCurMana */
	 , (20000357, 108,       1875) /* ItemMaxMana */
	 , (20000357, 109,        250) /* ItemDifficulty */
	 , (20000357, 114,          1) /* Attuned - Attuned */
	 , (20000357, 151,          2) /* HookType - Wall */
	 , (20000357, 158,          2) /* WieldRequirements - RawSkill */
	 , (20000357, 159,         44) /* WieldSkillType - HeavyWeapons */
	 , (20000357, 160,        450) /* WieldDifficulty */
	 , (20000357, 353,          5) /* WeaponType - Spear */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (20000357,  22, True ) /* Inscribable */
	 , (20000357,  23, True ) /* DestroyOnSell */
	 , (20000357,  69, False) /* IsSellable */
	 , (20000357,  99, True ) /* Ivoryable */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (20000357,   5,  -0.033) /* ManaRate */
	 , (20000357,  12,   0.5) /* Shade */
	 , (20000357,  22,   0.5) /* DamageVariance */
	 , (20000357,  29,    1.25) /* WeaponDefense */
	 , (20000357,  39,    1.0) /* DefaultScale */
	 , (20000357,  62,    1.25) /* WeaponOffense */
	 , (20000357, 136,       1) /* CritMultiplier */
	 , (20000357, 147,       1) /* CriticalFrequency */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (20000357,   1, 'Xtreme Soul Spear') /* Name */
	 , (20000357,  16, 'A Soul Bound spear enhanced with Xtreme Oil, its power increased by 25%.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (20000357,   1, 0x0200041C) /* Setup */
	 , (20000357,   3, 0x20000014) /* SoundTable */
	 , (20000357,   6, 0x04000BEF) /* PaletteBase */
	 , (20000357,   7, 0x10000419) /* ClothingBase */
	 , (20000357,   8, 0x06001603) /* Icon */
	 , (20000357,  22, 0x3400002B) /* PhysicsEffectTable */
	 , (20000357,  36, 0x0E000014) /* MutateFilter */;
