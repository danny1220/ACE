ImportWorldSchema.ps1
======================

Purpose
-------
This script applies the project's world database schema SQL files (Database/Base, Database/Updates, Database/Optional) to a MySQL server.

Usage
-----
1. Edit the top of ImportWorldSchema.ps1 or set environment variables:
   - MYSQL_EXE (path to mysql client, optional)
   - MYSQL_HOST (default 127.0.0.1)
   - MYSQL_PORT (default 3306)
   - MYSQL_USER (default root)
   - MYSQL_PASSWORD (optional; prompts if not set)
   - MYSQL_DB (default ace_world)

2. Run the script from PowerShell with appropriate privileges:
   PS> powershell -ExecutionPolicy Bypass -File .\Database\Setup\ImportWorldSchema.ps1

Notes
-----
- This script expects the SQL files to be present in the repository under Database\Base (core schema), Database\Updates (migrations/content patches), and Database\Optional.
- It will apply files in alphabetical order; ensure files are named to reflect the desired order.
- The server also creates some small helper tables at startup (player_permanent_modifiers, player_pk_history), but core shard tables (biota, biota_properties_int, etc.) must be applied using these scripts.

If you prefer the server to auto-run these on first startup, consider invoking this script from your deployment automation or calling the mysql client directly on the server machine.
