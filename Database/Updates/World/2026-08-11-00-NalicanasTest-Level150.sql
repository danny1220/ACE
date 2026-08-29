-- 2026-08-11 - Nalicana's Test - set MinLevel to 150 for weenie class 45682
-- Idempotent: updates existing property or inserts it if missing.
-- PropertyInt.MinLevel (type = 86) -> set value = 150

START TRANSACTION;

-- update if exists
UPDATE `weenie_properties_int`
SET `value` = 150
WHERE `object_Id` = 45682 AND `type` = 86;

-- insert if not exists
INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
SELECT 45682, 86, 150
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM `weenie_properties_int` WHERE `object_Id` = 45682 AND `type` = 86
);

COMMIT;
