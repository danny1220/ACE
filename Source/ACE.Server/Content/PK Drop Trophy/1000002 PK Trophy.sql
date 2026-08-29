-- Defensive PK Trophy SQL patch (ensure not bonded)
-- This script only attempts deletes if the target tables exist in the current database.
-- It avoids errors when running against a database that hasn't had the full shard schema applied yet.

DELIMITER $$
CREATE PROCEDURE `_ace_pk_trophy_unbond`()
BEGIN
  -- Remove bonded entries from biota properties (if table exists)
  IF EXISTS(SELECT 1 FROM information_schema.tables WHERE table_schema = DATABASE() AND table_name = 'biota_properties_int') THEN
    DELETE bint FROM biota_properties_int bint
    JOIN biota ON bint.object_Id = biota.id
    WHERE biota.weenie_Class_Id = 1000002 AND bint.`type` = 33;
  END IF;

  -- Remove bonded entries from weenie properties (if table exists)
  IF EXISTS(SELECT 1 FROM information_schema.tables WHERE table_schema = DATABASE() AND table_name = 'weenie_properties_int') THEN
    DELETE FROM weenie_properties_int
    WHERE object_Id = 1000002 AND `type` = 33;
  END IF;
END$$

DELIMITER ;

CALL `_ace_pk_trophy_unbond`();
DROP PROCEDURE IF EXISTS `_ace_pk_trophy_unbond`;

-- End
