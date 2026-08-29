/* Recipe: Xtreme Oil + Soulbound Bow = Xtreme Soul Bow */

DELETE FROM `cook_book` WHERE `recipe_Id` = 20000803;
DELETE FROM `recipe` WHERE `id` = 20000803;

INSERT INTO `recipe` (`id`, `unknown_1`, `skill`, `difficulty`, `salvage_Type`, `success_W_C_I_D`, `success_Amount`, `success_Message`, `fail_W_C_I_D`, `fail_Amount`, `fail_Message`, `success_Destroy_Source_Chance`, `success_Destroy_Source_Amount`, `success_Destroy_Source_Message`, `success_Destroy_Target_Chance`, `success_Destroy_Target_Amount`, `success_Destroy_Target_Message`, `fail_Destroy_Source_Chance`, `fail_Destroy_Source_Amount`, `fail_Destroy_Source_Message`, `fail_Destroy_Target_Chance`, `fail_Destroy_Target_Amount`, `fail_Destroy_Target_Message`, `data_Id`, `last_Modified`)
VALUES (20000803, 0, 0, 0, 0, 20000355, 1, 'The Xtreme Oil transforms your Soulbound Bow into an Xtreme Soul Bow!', 0, 0, '', 1, 1, '', 1, 1, '', 0, 0, '', 0, 0, '', 0, '2025-01-01 00:00:00');

INSERT INTO `cook_book` (`recipe_Id`, `source_W_C_I_D`, `target_W_C_I_D`, `last_Modified`)
VALUES (20000803, 20000351, 45523, '2025-01-01 00:00:00');  /* Xtreme Oil (20000351) + Soulbound Bow */
