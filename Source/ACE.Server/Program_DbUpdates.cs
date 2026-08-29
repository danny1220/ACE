using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Text.Json;
using System.Threading;

using ACE.Common;

namespace ACE.Server
{
    partial class Program
    {
        private static void CheckForWorldDatabaseUpdate()
        {
            log.Info($"Automatic World Database Update started...");
            try
            {
                var worldDb = new Database.WorldDatabase();
                var currentVersion = worldDb.GetVersion();
                log.Info($"Current World Database version: Base - {currentVersion.BaseVersion} | Patch - {currentVersion.PatchVersion}");

                var url = "https://api.github.com/repos/ACEmulator/ACE-World-16PY-Patches/releases/latest";

                using var client = new WebClient();
                var html = client.GetStringFromURL(url).Result;
                var json = JsonSerializer.Deserialize<JsonElement>(html);
                string tag = json.GetProperty("tag_name").GetString();
                string dbURL = json.GetProperty("assets")[0].GetProperty("browser_download_url").GetString();
                string dbFileName = json.GetProperty("assets")[0].GetProperty("name").GetString();

                if (currentVersion.PatchVersion != tag)
                {
                    var patchVersionSplit = currentVersion.PatchVersion.Split(".");
                    var tagSplit = tag.Split(".");

                    int.TryParse(patchVersionSplit[0], out var patchMajor);
                    int.TryParse(patchVersionSplit[1], out var patchMinor);
                    int.TryParse(patchVersionSplit[2], out var patchBuild);

                    int.TryParse(tagSplit[0], out var tagMajor);
                    int.TryParse(tagSplit[1], out var tagMinor);
                    int.TryParse(tagSplit[2], out var tagBuild);

                    if (tagMajor > patchMajor || tagMinor > patchMinor || (tagBuild > patchBuild && patchBuild != 0))
                    {
                        log.Info($"Latest patch version is {tag} -- Update Required!");
                        UpdateToLatestWorldDatabase(dbURL, dbFileName);
                        var newVersion = worldDb.GetVersion();
                        log.Info($"Updated World Database version: Base - {newVersion.BaseVersion} | Patch - {newVersion.PatchVersion}");
                    }




                    else
                    {
                        log.Info($"Latest patch version is {tag} -- No Update Required!");
                    }
                }
                else
                {
                    log.Info($"Latest patch version is {tag} -- No Update Required!");
                }
            }
            catch (Exception ex)
            {
                log.Info($"Unable to continue with Automatic World Database Update due to the following error: {ex}");
            }
            log.Info($"Automatic World Database Update complete.");
        }

        private static void EnsureCoreWorldSchema()
        {
            // check for a core table: biota_properties_int
            var connStr = $"server={ConfigManager.Config.MySql.World.Host};port={ConfigManager.Config.MySql.World.Port};user={ConfigManager.Config.MySql.World.Username};password={ConfigManager.Config.MySql.World.Password};database={ConfigManager.Config.MySql.World.Database};{ConfigManager.Config.MySql.World.ConnectionOptions}";
            using var conn = new MySqlConnector.MySqlConnection(connStr);
            conn.Open();
            using (var cmd = conn.CreateCommand())
            {
                cmd.CommandText = "SHOW TABLES LIKE 'biota_properties_int'";
                var reader = cmd.ExecuteReader();
                var has = reader.Read();
                reader.Close();
                if (has)
                {
                    conn.Close();
                    return; // schema present
                }
            }

            // Schema missing - attempt to import Database/Base then Database/Updates from repo
            var exeLocation = Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location);
            var repoRoot = Path.GetFullPath(Path.Combine(exeLocation, "..", "..", "..", ".."));
            var baseDir = Path.Combine(repoRoot, "Database", "Base");
            var updatesDir = Path.Combine(repoRoot, "Database", "Updates");

            Console.WriteLine("Core world schema missing; attempting automatic import of Database/Base and Database/Updates...");

            // apply base files
            if (Directory.Exists(baseDir))
            {
                var files = Directory.GetFiles(baseDir, "*.sql", SearchOption.AllDirectories).OrderBy(f => f).ToList();
                foreach (var file in files)
                {
                    Console.WriteLine($"Applying base file: {file}");
                    var text = File.ReadAllText(file).Replace("ace_world", ConfigManager.Config.MySql.World.Database);
                    var script = new MySqlConnector.MySqlCommand(text, conn);
                    try
                    {
                        ExecuteScript(script);
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine($"Failed to apply base SQL file {file}: {ex.Message}");
                        throw;
                    }
                }
            }

            // apply updates
            if (Directory.Exists(updatesDir))
            {
                var files = Directory.GetFiles(updatesDir, "*.sql", SearchOption.AllDirectories).OrderBy(f => f).ToList();
                foreach (var file in files)
                {
                    Console.WriteLine($"Applying update file: {file}");
                    var text = File.ReadAllText(file).Replace("ace_world", ConfigManager.Config.MySql.World.Database);
                    var script = new MySqlConnector.MySqlCommand(text, conn);
                    try
                    {
                        ExecuteScript(script);
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine($"Failed to apply update SQL file {file}: {ex.Message}");
                        throw;
                    }
                }
            }

            conn.Close();
            Console.WriteLine("Automatic core world schema import complete.");
        }

        private static void UpdateToLatestWorldDatabase(string dbURL, string dbFileName)
        {
            Console.WriteLine();

            if (IsRunningInContainer)
            {
                Console.WriteLine(" ");
                Console.WriteLine("This process will take a while, depending on many factors, and may look stuck while reading and importing the world database, please be patient! ");
                Console.WriteLine(" ");
            }

            Console.Write($"Downloading {dbFileName} .... ");
            using var client = new WebClient();
            try
            {
                var dlTask = client.DownloadFile(dbURL, dbFileName);
                dlTask.Wait();
            }
            catch
            {
                Console.Write($"Download for {dbFileName} failed!");
                return;
            }
            Console.WriteLine("download complete!");

            Console.Write($"Extracting {dbFileName} .... ");
            ZipFile.ExtractToDirectory(dbFileName, ".", true);
            Console.WriteLine("extraction complete!");
            Console.Write($"Deleting {dbFileName} .... ");
            File.Delete(dbFileName);
            Console.WriteLine("Deleted!");

            var sqlFile = dbFileName.Substring(0, dbFileName.Length - 4);
            Console.Write($"Importing {sqlFile} into SQL server at {ConfigManager.Config.MySql.World.Host}:{ConfigManager.Config.MySql.World.Port} (This will take a while, please be patient) .... ");
            using (var sr = File.OpenText(sqlFile))
            {
                var sqlConnect = new MySqlConnector.MySqlConnection($"server={ConfigManager.Config.MySql.World.Host};port={ConfigManager.Config.MySql.World.Port};user={ConfigManager.Config.MySql.World.Username};password={ConfigManager.Config.MySql.World.Password};{ConfigManager.Config.MySql.World.ConnectionOptions}");

                var line = string.Empty;
                var completeSQLline = string.Empty;

                var dbname = ConfigManager.Config.MySql.World.Database;

                var currentDelimiter = ";";

                while ((line = sr.ReadLine()) != null)
                {
                    var trimmed = line.Trim();
                    if (trimmed.StartsWith("DELIMITER ", StringComparison.OrdinalIgnoreCase))
                    {
                        currentDelimiter = trimmed.Substring("DELIMITER ".Length);
                        continue;
                    }

                    line = line.Replace("ace_world", dbname);

                    completeSQLline += line + Environment.NewLine;

                    if (trimmed.EndsWith(currentDelimiter))
                    {
                        var sqlToExec = completeSQLline;
                        if (currentDelimiter != ";")
                        {
                            var idx = sqlToExec.LastIndexOf(currentDelimiter, StringComparison.Ordinal);
                            if (idx >= 0)
                                sqlToExec = sqlToExec.Substring(0, idx);
                        }

                        var script = new MySqlConnector.MySqlCommand(sqlToExec, sqlConnect);
                        try
                        {
                            ExecuteScript(script);
                        }
                        catch (MySqlConnector.MySqlException)
                        {

                        }
                        completeSQLline = string.Empty;
                    }
                }
                CleanupConnection(sqlConnect);
            }
            Console.WriteLine(" complete!");

            Console.Write($"Deleting {sqlFile} .... ");
            File.Delete(sqlFile);
            Console.WriteLine("Deleted!");
        }

        private static string GetContentFolder()
        {
            var sqlConnect = new MySqlConnector.MySqlConnection($"server={ConfigManager.Config.MySql.Shard.Host};port={ConfigManager.Config.MySql.Shard.Port};user={ConfigManager.Config.MySql.Shard.Username};password={ConfigManager.Config.MySql.Shard.Password};database={ConfigManager.Config.MySql.Shard.Database};{ConfigManager.Config.MySql.Shard.ConnectionOptions}");
            var sqlQuery = "SELECT `value` FROM config_properties_string WHERE `key` = 'content_folder';";
            var sqlCommand = new MySqlConnector.MySqlCommand(sqlQuery, sqlConnect);

            sqlConnect.Open();
            var sqlReader = sqlCommand.ExecuteReader();

            var content_folder = "";

            if (sqlReader.HasRows)
            {
                while (sqlReader.Read())
                {
                    content_folder = sqlReader.GetString(0);
                    break;
                }
            }
            else
                content_folder = @".\Content";

            sqlReader.Close();
            sqlCommand.Connection.Close();

            // handle relative path
            if (content_folder.StartsWith("."))
            {
                var cwd = Directory.GetCurrentDirectory() + Path.DirectorySeparatorChar;
                content_folder = cwd + content_folder;
            }

            return content_folder;
        }

        private static void AutoApplyWorldCustomizations()
        {
            // Ensure core world schema exists; if not, attempt to import Database/Base and Database/Updates automatically.
            try
            {
                EnsureCoreWorldSchema();
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Warning: EnsureCoreWorldSchema failed: {ex.Message}");
            }
            var content_folders_search_option = ConfigManager.Config.Offline.RecurseWorldCustomizationPaths ? SearchOption.AllDirectories : SearchOption.TopDirectoryOnly;
            var content_folders = new List<string> { GetContentFolder() };
            content_folders.AddRange(ConfigManager.Config.Offline.WorldCustomizationAddedPaths);
            content_folders.Sort();

            Console.WriteLine($"Searching for World Customization SQL scripts .... ");

            content_folders.ForEach(path =>
            {
                var contentDI = new DirectoryInfo(path);
                if (contentDI.Exists)
                {
                    Console.WriteLine($"Searching for SQL files within {path} .... ");

                    var sqlConnect = new MySqlConnector.MySqlConnection($"server={ConfigManager.Config.MySql.World.Host};port={ConfigManager.Config.MySql.World.Port};user={ConfigManager.Config.MySql.World.Username};password={ConfigManager.Config.MySql.World.Password};database={ConfigManager.Config.MySql.World.Database};{ConfigManager.Config.MySql.World.ConnectionOptions}");
                    foreach (var file in contentDI.GetFiles("*.sql", content_folders_search_option).OrderBy(f => f.FullName))
                    {
                        Console.Write($"Found {file.FullName} .... ");
                        var sqlDBFile = File.ReadAllText(file.FullName);
                        sqlDBFile = sqlDBFile.Replace("ace_world", ConfigManager.Config.MySql.World.Database);
                        var script = new MySqlConnector.MySqlCommand(sqlDBFile, sqlConnect);

                        Console.Write($"Importing into World database on SQL server at {ConfigManager.Config.MySql.World.Host}:{ConfigManager.Config.MySql.World.Port} .... ");
                        try
                        {
                            ExecuteScript(script);
                            //Console.Write($" {count} database records affected ....");
                            Console.WriteLine(" complete!");
                        }
                        catch (MySqlConnector.MySqlException ex)
                        {
                            Console.WriteLine($" error!");
                            Console.WriteLine($" Unable to apply patch due to following exception: {ex}");
                        }
                    }
                    CleanupConnection(sqlConnect);
                }
            });

            Console.WriteLine($"World Customization SQL scripts import complete!");
        }

        private static void AutoApplyDatabaseUpdates()
        {
            log.Info($"Automatic Database Patching started...");
            Thread.Sleep(1000);

            PatchDatabase("Authentication", ConfigManager.Config.MySql.Authentication.Host, ConfigManager.Config.MySql.Authentication.Port, ConfigManager.Config.MySql.Authentication.Username, ConfigManager.Config.MySql.Authentication.Password, ConfigManager.Config.MySql.Authentication.Database, ConfigManager.Config.MySql.Shard.Database, ConfigManager.Config.MySql.World.Database);
            PatchDatabase("Shard", ConfigManager.Config.MySql.Shard.Host, ConfigManager.Config.MySql.Shard.Port, ConfigManager.Config.MySql.Shard.Username, ConfigManager.Config.MySql.Shard.Password, ConfigManager.Config.MySql.Authentication.Database, ConfigManager.Config.MySql.Shard.Database, ConfigManager.Config.MySql.World.Database);
            PatchDatabase("World", ConfigManager.Config.MySql.World.Host, ConfigManager.Config.MySql.World.Port, ConfigManager.Config.MySql.World.Username, ConfigManager.Config.MySql.World.Password, ConfigManager.Config.MySql.Authentication.Database, ConfigManager.Config.MySql.Shard.Database, ConfigManager.Config.MySql.World.Database);

            Thread.Sleep(1000);
            log.Info($"Automatic Database Patching complete.");
        }

        private static void PatchDatabase(string dbType, string host, uint port, string username, string password, string authDB, string shardDB, string worldDB)
        {
            var updatesPath = $"DatabaseSetupScripts{Path.DirectorySeparatorChar}Updates{Path.DirectorySeparatorChar}{dbType}";
            var updatesFile = $"{updatesPath}{Path.DirectorySeparatorChar}applied_updates.txt";

            if (!Directory.Exists(updatesPath))
            {
                // File not found in Environment.CurrentDirectory
                // Lets try the ExecutingAssembly Location
                var executingAssemblyLocation = System.Reflection.Assembly.GetExecutingAssembly().Location;

                var directoryName = Path.GetFullPath(Path.GetDirectoryName(executingAssemblyLocation));

                updatesPath = Path.Combine(directoryName, $"DatabaseSetupScripts{Path.DirectorySeparatorChar}Updates{Path.DirectorySeparatorChar}{dbType}");

                if (!Directory.Exists(updatesPath))
                {
                    Console.WriteLine($" error!");
                    Console.WriteLine($" Unable to locate updates directory");
                }
                else
                {
                    updatesFile = $"{updatesPath}{Path.DirectorySeparatorChar}applied_updates.txt";
                }

            }

            var appliedUpdates = Array.Empty<string>();

            var containerUpdatesFile = $"/ace/Config/{dbType}_applied_updates.txt";
            if (IsRunningInContainer && File.Exists(containerUpdatesFile))
                File.Copy(containerUpdatesFile, updatesFile, true);

            if (File.Exists(updatesFile))
                appliedUpdates = File.ReadAllLines(updatesFile);

            Console.WriteLine($"Searching for {dbType} update SQL scripts .... ");
            foreach (var file in new DirectoryInfo(updatesPath).GetFiles("*.sql").OrderBy(f => f.Name))
            {
                if (appliedUpdates.Contains(file.Name))
                    continue;

                Console.Write($"Found {file.Name} .... ");
                var sqlDBFile = File.ReadAllText(file.FullName);
                var database = "";
                switch (dbType)
                {
                    case "Authentication":
                        database = authDB;
                        break;
                    case "Shard":
                        database = shardDB;
                        break;
                    case "World":
                        database = worldDB;
                        break;
                }
                var sqlConnect = new MySqlConnector.MySqlConnection($"server={host};port={port};user={username};password={password};database={database};DefaultCommandTimeout=120;SslMode=None;AllowPublicKeyRetrieval=true");
                sqlDBFile = sqlDBFile.Replace("ace_auth", authDB);
                sqlDBFile = sqlDBFile.Replace("ace_shard", shardDB);
                sqlDBFile = sqlDBFile.Replace("ace_world", worldDB);
                var script = new MySqlConnector.MySqlCommand(sqlDBFile, sqlConnect);

                Console.Write($"Importing into {database} database on SQL server at {host}:{port} .... ");
                try
                {
                    ExecuteScript(script);
                    //Console.Write($" {count} database records affected ....");
                    Console.WriteLine(" complete!");
                }
                catch (MySqlConnector.MySqlException ex)
                {
                    Console.WriteLine($" error!");
                    Console.WriteLine($" Unable to apply patch due to following exception: {ex}");
                }
                File.AppendAllText(updatesFile, file.Name + Environment.NewLine);
                CleanupConnection(sqlConnect);
            }

            if (IsRunningInContainer && File.Exists(updatesFile))
                File.Copy(updatesFile, containerUpdatesFile, true);

            Console.WriteLine($"{dbType} update SQL scripts import complete!");
        }
    }
}
