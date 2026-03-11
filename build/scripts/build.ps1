# HyperUI v2 Build Script

$Version = "2.0.0"
$Date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$OutputFile = "dist/HyperUI.lua"

Write-Host "### Building HyperUI v2 ($Version) ###" -ForegroundColor Cyan

# 1. Run Python bundler
Write-Host "[1/3] Bundling modules with Python..." -ForegroundColor Yellow
python build/scripts/bundle.py

# 2. Run Darklua minification
Write-Host "[2/3] Minifying bundle with Darklua..." -ForegroundColor Yellow
& darklua process $OutputFile $OutputFile

# 3. Add Header
Write-Host "[3/3] Finalizing distribution header..." -ForegroundColor Yellow
$Header = @"
-- HyperUI Framework
-- Version: $Version
-- Build Date: $Date
-- Distribution: Single File

"@

$Content = Get-Content $OutputFile -Raw
$FinalContent = $Header + $Content
Set-Content -Path $OutputFile -Value $FinalContent

Write-Host "Success! Build output: $OutputFile" -ForegroundColor Green
