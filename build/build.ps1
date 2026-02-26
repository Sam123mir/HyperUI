$ErrorActionPreference = "Stop"

$pkg_json = Get-Content package.json -Raw | ConvertFrom-Json
$pkg_raw = Get-Content package.json -Raw

# Step 1: Create package.lua
$package_lua = "-- Generated from package.json | build/build.ps1`n`nreturn [[`n$pkg_raw`n]]"
Set-Content -Path build/package.lua -Value $package_lua -Encoding utf8

# Step 2: Run Darklua
$darklua_path = "C:\Users\samir\.aftman\bin\darklua.exe"
& $darklua_path process src/Init.lua dist/temp.lua --config build/darklua.dev.config.json

# Step 3: Combine Header and Code
$header = Get-Content build/header.lua -Raw
$header = $header -replace '{{VERSION}}', $pkg_json.version
$header = $header -replace '{{BUILD_DATE}}', (Get-Date -Format "yyyy-MM-dd")
$header = $header -replace '{{DESCRIPTION}}', $pkg_json.description
$header = $header -replace '{{REPOSITORY}}', $pkg_json.repository
$header = $header -replace '{{DISCORD}}', $pkg_json.discord
$header = $header -replace '{{LICENSE}}', $pkg_json.license

$temp_lua = Get-Content dist/temp.lua -Raw
$final_lua = $header + "`n`n" + $temp_lua

Set-Content -Path dist/main.lua -Value $final_lua -Encoding utf8
Remove-Item dist/temp.lua

Write-Host "Build completed successfully!"
