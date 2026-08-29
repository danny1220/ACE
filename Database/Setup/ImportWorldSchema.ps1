# ImportWorldSchema.ps1
# Usage: edit the connection settings below or pass via environment variables

# Configuration - edit these to match your MySQL server or set environment variables
$mysqlExe = $env:MYSQL_EXE  # e.g. 'C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe'
if ([string]::IsNullOrWhiteSpace($mysqlExe)) { $mysqlExe = "mysql" }
$host = $env:MYSQL_HOST; if ([string]::IsNullOrWhiteSpace($host)) { $host = "127.0.0.1" }
$port = $env:MYSQL_PORT; if ([string]::IsNullOrWhiteSpace($port)) { $port = "3306" }
$user = $env:MYSQL_USER; if ([string]::IsNullOrWhiteSpace($user)) { $user = "root" }
$password = $env:MYSQL_PASSWORD; if ($null -eq $password) { $password = Read-Host -AsSecureString "MySQL password (leave blank for none)"; $password = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($password)) }
$db = $env:MYSQL_DB; if ([string]::IsNullOrWhiteSpace($db)) { $db = "ace_world" }

Write-Host "Importing world DB schema into $db on $host:$port using user $user"

# Helper to run a single .sql file
function Run-SqlFile($filePath) {
    Write-Host "Applying $filePath..."
    $args = "-h`"$host`" -P$port -u`"$user`""
    if ($password -ne "") { $args += " -p`"$password`"" }
    $args += " $db < `"$filePath`""

    $command = "$mysqlExe $args"
    Write-Host $command
    $proc = Start-Process -FilePath $mysqlExe -ArgumentList @("-h$host","-P$port","-u$user","-p$password","$db") -NoNewWindow -Wait -PassThru -RedirectStandardInput $true
    # Use simple invocation if Start-Process with redirection fails; fallback
    try {
        & $mysqlExe -h $host -P $port -u $user -p$password $db < $filePath
        if ($LASTEXITCODE -ne 0) { throw "mysql returned exit code $LASTEXITCODE" }
    } catch {
        Write-Error "Failed to apply $filePath: $_"
        return $false
    }
    return $true
}

$baseDir = Join-Path -Path (Resolve-Path "$(Split-Path -Path $PSScriptRoot -Parent)") -ChildPath "Database\Base"
$updatesDir = Join-Path -Path (Resolve-Path "$(Split-Path -Path $PSScriptRoot -Parent)") -ChildPath "Database\Updates"
$optionalDir = Join-Path -Path (Resolve-Path "$(Split-Path -Path $PSScriptRoot -Parent)") -ChildPath "Database\Optional"

$didAny = $false

if (Test-Path $baseDir) {
    Write-Host "Applying base schema files from $baseDir"
    Get-ChildItem -Path $baseDir -Filter "*.sql" -Recurse | Sort-Object FullName | ForEach-Object {
        $didAny = $true
        if (-not (Run-SqlFile $_.FullName)) { Write-Error "Aborting."; exit 1 }
    }
}

if (Test-Path $updatesDir) {
    Write-Host "Applying update files from $updatesDir"
    Get-ChildItem -Path $updatesDir -Filter "*.sql" -Recurse | Sort-Object FullName | ForEach-Object {
        $didAny = $true
        if (-not (Run-SqlFile $_.FullName)) { Write-Error "Aborting."; exit 1 }
    }
}

if (Test-Path $optionalDir) {
    Write-Host "Applying optional files from $optionalDir"
    Get-ChildItem -Path $optionalDir -Filter "*.sql" -Recurse | Sort-Object FullName | ForEach-Object {
        $didAny = $true
        if (-not (Run-SqlFile $_.FullName)) { Write-Warning "Continuing but file failed: $($_.FullName)" }
    }
}

if (-not $didAny) {
    Write-Warning "No SQL files found in Database/Base, Database/Updates, or Database/Optional. Ensure repository contains DB scripts."
} else {
    Write-Host "All SQL files applied successfully."
}
