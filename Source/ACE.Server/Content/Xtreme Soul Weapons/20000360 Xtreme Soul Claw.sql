/* Xtreme Soul Claw - Upgraded version of Soulbound Claw (37577) with 25% increased stats */

DELETE FROM `weenie` WHERE `class_Id` = 20000360;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (20000360, 'ace20000360-xtremesoulclaw', 6, '2025-01-01 00:00:00') /* MeleeWeapon */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (20000360,   1,          1) /* ItemType - MeleeWeapon */
	 , (20000360,   3,         20) /* PaletteTemplate */
	 , (20000360,   5,        188) /* EncumbranceVal - 150 * 1.25 */
	 , (20000360,   8,        188) /* Mass */
	 , (20000360,   9,    1048576) /* ValidLocations - MeleeWeapon */
	 , (20000360,  16,          1) /* ItemUseable - No */
	 , (20000360,  19,      30000) /* Value */
	 , (20000360,  33,          1) /* Bonded - Bonded */
	 , (20000360,  36,       9999) /* ResistMagic */
	 , (20000360,  44,         75) /* Damage - 60 * 1.25 */
	 , (20000360,  45,          1) /* DamageType - Slash */
	 , (20000360,  47,          4) /* AttackType - Slash */
	 , (20000360,  48,         45) /* WeaponSkill - LightWeapons */
	 , (20000360,  49,         20) /* WeaponTime */
	 , (20000360,  51,          1) /* CombatUse - Melee */
	 , (20000360,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
	 , (20000360, 106,        375) /* ItemSpellcraft */
	 , (20000360, 107,       1875) /* ItemCurMana */
	 , (20000360, 108,       1875) /* ItemMaxMana */
	 , (20000360, 109,        250) /* ItemDifficulty */
	 , (20000360, 114,          1) /* Attuned - Attuned */
	 , (20000360, 151,          2) /* HookType - Wall */
	 , (20000360, 158,          2) /* WieldRequirements - RawSkill */
	 , (20000360, 159,         45) /* WieldSkillType - LightWeapons */
	 , (20000360, 160,        450) /* WieldDifficulty */
	 , (20000360, 353,          1) /* WeaponType - Unarmed */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (20000360,  22, True ) /* Inscribable */
	 , (20000360,  23, True ) /* DestroyOnSell */
	 , (20000360,  69, False) /* IsSellable */
	 , (20000360,  99, True ) /* Ivoryable */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (20000360,   5,  -0.033) /* ManaRate */
	 , (20000360,  12,   0.5) /* Shade */
	 , (20000360,  22,   0.5) /* DamageVariance */
	 , (20000360,  29,    1.25) /* WeaponDefense */
	 , (20000360,  39,    0.75) /* DefaultScale */
	 , (20000360,  62,    1.25) /* WeaponOffense */
	 , (20000360, 136,       1) /* CritMultiplier */
	 , (20000360, 147,       1) /* CriticalFrequency */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (20000360,   1, 'Xtreme Soul Claw') /* Name */
	 , (20000360,  16, 'A Soul Bound claw enhanced with Xtreme Oil, its power increased by 25%.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (20000360,   1, 0x02000402) /* Setup */
	 , (20000360,   3, 0x20000014) /* SoundTable */
	 , (20000360,   6, 0x04000BEF) /* PaletteBase */
	 , (20000360,   7, 0x10000419) /* ClothingBase */
	 , (20000360,   8, 0x060015FD) /* Icon */
	 , (20000360,  22, 0x3400002B) /* PhysicsEffectTable */
	 , (20000360,  36, 0x0E000014) /* MutateFilter */;
