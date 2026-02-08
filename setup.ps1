$RepoPath = $PSScriptRoot
$DocumentsPath = [System.IO.Path]::Combine($env:USERPROFILE, 'Documents')
$TerminalPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
$ESC = [char]27

Clear-Host
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "         COPILOT+ ELITE TERMINAL SUITE v6.0 (PORTABLE)         " -ForegroundColor Cyan
Write-Host "         Distributed via GitHub Core Engine                    " -ForegroundColor Gray
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

# --- SEGURIDAD DE INSTALACIÓN ---
Write-Host "  [!] SISTEMA: Detectado Agente AI Inteligente y Potente." -ForegroundColor White
$Confirm = Read-Host "  [?] ¿Deseas instalar esta suite en tu PC actual? (Escribe 'SI')"

if ($Confirm -ne "SI") {
    Write-Host "`n  [!] Instalación cancelada por el usuario." -ForegroundColor Yellow
    exit
}

Write-Host "`n  [#] CONFIGURANDO NUCLEOS PORTÁTILES..." -ForegroundColor Green

# 1. Configurar CMD (Dinámico y Portable)
$CmdFile = Join-Path $DocumentsPath "copilot_cmd.cmd"
$c1 = $ESC + "[36m"; $c2 = $ESC + "[0m"; $c3 = $ESC + "[32m"; $c4 = $ESC + "[90m"

$lines = @(
    "@echo off",
    "setlocal enabledelayedexpansion",
    "cls",
    "echo $c1" + "INITIALIZING COPILOT+ ELITE AGENT..." + "$c2",
    "timeout /t 1 /nobreak > nul",
    "cls",
    "echo Microsoft Windows [Version 10.0.26200.7705]",
    "echo (c) Microsoft Corporation. All rights reserved.",
    "echo.",
    'for /f "tokens=2 delims==" %%a in (''wmic os get caption /value'') do set "osName=%%a"',
    'for /f "tokens=2 delims==" %%a in (''wmic computersystem get manufacturer /value'') do set "mfg=%%a"',
    'for /f "tokens=2 delims==" %%a in (''wmic computersystem get model /value'') do set "model=%%a"',
    "echo   $c4. SYSTEM   : $c2!osName!",
    "echo   $c4. HARDWARE : $c2!mfg! !model!",
    "echo   $c4. USER     : $c3%USERNAME% @ %COMPUTERNAME%$c2",
    "echo   $c1. Copilot+ : $c2Soy un Agente AI automatizado para ejecutar terminales",
    "echo                de Windows e inteligente potente.",
    "echo.",
    "echo                Gestiono flujos de trabajo avanzados,",
    "echo                busco soluciones de forma autonoma y",
    "echo                optimizo la velocidad de tu sistema.",
    "echo.",
    "echo   $c4. Terminal : $c3Command Prompt Elite Edition$c2",
    "echo.",
    "echo   $c4" + "[SYSTEM] STATUS: ACTIVE | RAM: MONITORING | CORE: ONLINE" + "$c2",
    "echo.",
    'set "timeStr=%%TIME:~0,5%%"',
    "prompt $c4 [$c4" + '$T' + "$c4] $c1" + "Copilot+" + "$c2 $ESC" + "[37m" + '$P $G' + "$c2 "
)
[System.IO.File]::WriteAllLines($CmdFile, $lines, [System.Text.Encoding]::ASCII)

# 2. Configurar PowerShell (GitHub Path Friendly)
$ProfileDirs = @(
    (Join-Path $DocumentsPath "WindowsPowerShell"),
    (Join-Path $DocumentsPath "PowerShell")
)
foreach ($dir in $ProfileDirs) {
    if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
    $sourceProfile = Join-Path $RepoPath "PowerShell_Profile.ps1"
    if (Test-Path $sourceProfile) {
        Copy-Item $sourceProfile -Destination (Join-Path $dir "Microsoft.PowerShell_profile.ps1") -Force
    }
}

# 3. Terminal Settings (Universal)
if (Test-Path $TerminalPath) {
    try {
        $jsonStr = (Get-Content $TerminalPath -Raw) -replace '//.*', ''
        $current = $jsonStr | ConvertFrom-Json
        $newSet = Get-Content (Join-Path $RepoPath "Terminal_Settings.json") -Raw | ConvertFrom-Json
        
        # Inyectar perfiles y esquemas
        if (-not $current.schemes) { $current.schemes = @() }
        foreach ($s in $newSet.schemes) { if (-not ($current.schemes | Where-Object { $_.name -eq $s.name })) { $current.schemes += $s } }
        foreach ($p in $newSet.profiles.list) {
            $exist = $current.profiles.list | Where-Object { $_.name -eq $p.name }
            if ($null -eq $exist) { $current.profiles.list += $p }
            else { foreach ($prop in $p.psobject.Properties) { $exist."$($prop.Name)" = $prop.Value } }
        }
        $current | ConvertTo-Json -Depth 100 | Set-Content $TerminalPath -Encoding UTF8
    }
    catch { 
        Copy-Item (Join-Path $RepoPath "Terminal_Settings.json") -Destination $TerminalPath -Force 
    }
}

# 4. Desbloqueo de archivos descargados (Crucial para GitHub)
Get-ChildItem -Path $RepoPath -Recurse | Unblock-File
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser -Force

Write-Host "`n  [!] ÉXITO: La suite ha sido sincronizada con este PC." -ForegroundColor Cyan
Write-Host "  [#] El Agente AI ya está operativo." -ForegroundColor Green

if (Get-Command wt.exe -ErrorAction SilentlyContinue) { Start-Process wt.exe }
else { Write-Host "`n  [i] Windows Terminal no detectado. Abre una nueva terminal para ver los cambios." -ForegroundColor Gray }