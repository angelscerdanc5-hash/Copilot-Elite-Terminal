<#
.SYNOPSIS
    Instalador Automático para Copilot+ Elite Terminal
.DESCRIPTION
    Este script automatiza la copia de perfiles, configuración de scripts de inicio
    y actualización de Windows Terminal.
#>

$RepoPath = $PSScriptRoot
$DocumentsPath = [System.IO.Path]::Combine($env:USERPROFILE, "Documents")
$TerminalPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

Write-Host "`n[#] Iniciando instalación de Copilot+ Elite Terminal Suite..." -ForegroundColor Cyan

# 1. Configurar PowerShell Profile
Write-Host "[1] Configurando perfil de PowerShell..." -ForegroundColor DarkGray
$PSProfileDir = Split-Path $PROFILE
if (-not (Test-Path $PSProfileDir)) { New-Item -ItemType Directory -Path $PSProfileDir -Force }
Copy-Item "$RepoPath\PowerShell_Profile.ps1" -Destination $PROFILE -Force
Write-Host "    - Hecho." -ForegroundColor Green

# 2. Configurar CMD Script
Write-Host "[2] Configurando script de inicio para CMD..." -ForegroundColor DarkGray
Copy-Item "$RepoPath\Copilot_CMD.cmd" -Destination "$DocumentsPath\copilot_cmd.cmd" -Force
Write-Host "    - Hecho." -ForegroundColor Green

# 3. Configurar Windows Terminal
if (Test-Path $TerminalPath) {
    Write-Host "[3] Actualizando configuración de Windows Terminal..." -ForegroundColor DarkGray
    Copy-Item "$RepoPath\Terminal_Settings.json" -Destination $TerminalPath -Force
    Write-Host "    - Hecho." -ForegroundColor Green
}

Write-Host "`n[!] INSTALACIÓN COMPLETADA CON ÉXITO." -ForegroundColor Cyan
Write-Host "Por favor, reinicia Windows Terminal para ver los cambios.`n" -ForegroundColor White
