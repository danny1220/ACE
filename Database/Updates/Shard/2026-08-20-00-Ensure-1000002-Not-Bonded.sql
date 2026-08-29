-- Ensure PK Trophy (weenie class id 1000002) is not bonded
-- Remove any bonded flag from shard biota entries referencing this weenie
DELETE bint FROM biota_properties_int bint
JOIN biota ON bint.object_Id = biota.id
WHERE biota.weenie_Class_Id = 1000002 AND bint.`type` = 33;

-- Also remove any bonded flag from the world weenie definition (world DB)
DELETE FROM ace_world.weenie_properties_int
WHERE object_Id = 1000002 AND `type` = 33;

-- End of patch
