DELETE FROM `weenie` WHERE `class_Id` = 20000352;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (20000352, 'ace20000352-xtremeoil', 44, '2025-01-01 00:00:00') /* CraftTool */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (20000352,   1,        128) /* ItemType - Misc */
	 , (20000352,   5,         50) /* EncumbranceVal */
	 , (20000352,  11,          1) /* MaxStackSize */
	 , (20000352,  12,          1) /* StackSize */
	  , (20000352,  16,     524296) /* ItemUseable - SourceContainedTargetContained */
	 , (20000352,  19,      50000) /* Value */
	 , (20000352,  33,          1) /* Bonded - Bonded */
	 , (20000352,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
	  , (20000352,  94,     560015) /* TargetType - ItemEnchantableTarget (wider - matches weapons/enchantable items) */
	 , (20000352, 114,          1) /* Attuned - Attuned */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (20000352,  22, True ) /* Inscribable */
	 , (20000352,  23, True ) /* DestroyOnSell */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (20000352,   1, 'Xtreme Oil') /* Name */
	 , (20000352,  14, 'Apply this mystical oil to any Soul Bound weapon to enhance it into an Xtreme Soul weapon with 25% increased power!') /* Use */
	 , (20000352,  16, 'A shimmering vial of otherworldly oil that pulses with raw energy. When applied to Soul Bound weapons, it unlocks their true potential.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (20000352,   1, 0x02000181) /* Setup */
	, (20000352,   3, 0x20000014) /* SoundTable */
	, (20000352,   8, 0x060015F9) /* Icon - oil_icon (changed to existing icon DID for visibility) */
	, (20000352,  22, 0x3400002B) /* PhysicsEffectTable */;
