# Rename Heiroglyph WCIDs script
# Scans SQL files in Source/ACE.Server/Content/Heiroglyph and replaces existing weenie class IDs
# with sequential IDs starting at 40000510. Saves a mapping file and backups.

$root = Join-Path (Get-Location) "Source\ACE.Server\Content\Heiroglyph"
if (-not (Test-Path $root)) { Write-Error "Path not found: $root"; exit 1 }

$files = Get-ChildItem -Path $root -Filter "*.sql" | Sort-Object Name
$startId = 40000510
$map = @{}
$backupDir = Join-Path $root "_bak_$(Get-Date -Format yyyyMMdd_HHmmss)"
New-Item -ItemType Directory -Path $backupDir | Out-Null

foreach ($f in $files) {
    $text = Get-Content -Raw -Path $f.FullName

    # Find first occurrence of class id in DELETE or VALUES (we assume numeric pattern like (12345, ...)
    # Try to find DELETE FROM `weenie` WHERE `class_Id` = X;
    $m = [regex]::Match($text, "DELETE\s+FROM\s+`weenie`\s+WHERE\s+`class_Id`\s*=\s*(\d+)", 'IgnoreCase')
    if (-not $m.Success) {
        # fallback: look for VALUES (X, 'name' ...)
        $m = [regex]::Match($text, "VALUES\s*\(\s*(\d+)\s*,", 'IgnoreCase')
    }
    if ($m.Success) {
        $oldId = [int]$m.Groups[1].Value
        $newId = $startId

        # backup
        Copy-Item -Path $f.FullName -Destination (Join-Path $backupDir $f.Name)

        # replace occurrences: DELETE FROM ... = oldId and VALUES (oldId,
        $text2 = $text -replace "DELETE\s+FROM\s+`weenie`\s+WHERE\s+`class_Id`\s*=\s*$oldId", "DELETE FROM `weenie` WHERE `class_Id` = $newId"
        $text2 = $text2 -replace "VALUES\s*\(\s*$oldId\s*,", "VALUES ($newId,"
        # also replace any other exact occurrences of the oldId as standalone (be conservative)
        $text2 = $text2 -replace "\(\s*$oldId\s*\)", "($newId)"

        Set-Content -Path $f.FullName -Value $text2 -Encoding UTF8

        $map[$f.Name] = @{ old = $oldId; new = $newId }

        $startId++
    }
    else {
        Write-Host "No class_Id found in $($f.Name), skipping"
    }
}

# Write mapping
$mapFile = Join-Path $root "heiroglyph_wcid_map_$(Get-Date -Format yyyyMMdd_HHmmss).csv"
"File,Old,New" | Out-File -FilePath $mapFile -Encoding UTF8
foreach ($k in $map.Keys) { "$k,$($map[$k].old),$($map[$k].new)" | Out-File -FilePath $mapFile -Append -Encoding UTF8 }

Write-Host "Done. Backups saved to $backupDir. Mapping saved to $mapFile."
