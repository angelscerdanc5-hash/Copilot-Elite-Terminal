
# ══════════════════════════════════════════════════════════════════════════════
# COPILOT+ ELITE INTELLIGENCE SUITE v5.2 - ULTIMATE ANIMATION
# ══════════════════════════════════════════════════════════════════════════════

function Write-Animated {
    param([string]$Text, [string]$Color = "White", [int]$Delay = 15, [switch]$Decode)
    $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$&%"
    $Text.ToCharArray() | ForEach-Object {
        if ($Decode) {
            for ($i = 0; $i -lt 2; $i++) {
                Write-Host ($chars[(Get-Random -Maximum $chars.Length)]) -NoNewline -ForegroundColor DarkGray
                Start-Sleep -Milliseconds 5
                Write-Host "`b" -NoNewline
            }
        }
        Write-Host $_ -NoNewline -ForegroundColor $Color
        Start-Sleep -Milliseconds $Delay
    }
    Write-Host ""
}

function Invoke-Telemetry {
    $os = Get-CimInstance Win32_OperatingSystem -ErrorAction SilentlyContinue
    $mem = if ($os) { [math]::Round(($os.TotalVisibleMemorySize - $os.FreePhysicalMemory) / $os.TotalVisibleMemorySize * 100, 1) } else { "N/A" }
    Write-Host "`n  [SYSTEM] STATUS: ACTIVE | RAM: $mem% | CORE: ONLINE" -ForegroundColor DarkGray
}

function Show-Welcome {
    # 1. Parpadeo rápido e inicio de carga
    Clear-Host
    Write-Host "INITIALIZING COPILOT+ ELITE SUITE..." -ForegroundColor Cyan
    Start-Sleep -Milliseconds 300
    
    # 2. Carga de Módulos (IA despertando)
    Write-Host "[ ] Cargando Núcleo Copilot+..." -ForegroundColor DarkGray
    Start-Sleep -Milliseconds 250
    Write-Host "[OK] NEURAL CORE ONLINE" -ForegroundColor Green
    Start-Sleep -Milliseconds 200
    Write-Host "[OK] VISUAL INTERFACE ESTABLISHED" -ForegroundColor Green
    Start-Sleep -Milliseconds 150
    Write-Host "[OK] Conexión Neural Establecida." -ForegroundColor Cyan
    Start-Sleep -Milliseconds 400
    
    # 3. Limpieza y Pantalla Oficial + Escritura IA
    Clear-Host
    Write-Host "Microsoft Windows [Versión 10.0.26200.7705]"
    Write-Host "(c) Microsoft Corporation. All rights reserved.`n"
    
    $osName = (Get-CimInstance Win32_OperatingSystem).Caption
    $sysInfo = Get-CimInstance Win32_ComputerSystem
    $productInfo = Get-CimInstance Win32_ComputerSystemProduct
    
    # Intentar obtener el nombre comercial más amigable
    $modelName = $productInfo.Name
    if ($productInfo.Version -and $productInfo.Version -notmatch "None|Default") {
        $modelName = $productInfo.Version
    }
    elseif ($sysInfo.SystemFamily -and $sysInfo.SystemFamily -notmatch "To be filled") {
        $modelName = $sysInfo.SystemFamily
    }
    
    $hardware = "$($sysInfo.Manufacturer) $modelName".Trim()

    Write-Host "  · SYSTEM   : " -NoNewline -ForegroundColor DarkGray
    Write-Host "$osName" -ForegroundColor White

    Write-Host "  · HARDWARE : " -NoNewline -ForegroundColor DarkGray
    Write-Host "$hardware" -ForegroundColor White

    Write-Host "  · USER     : " -NoNewline -ForegroundColor DarkGray
    Write-Host "$env:USERNAME @ $env:COMPUTERNAME" -ForegroundColor Green

    Write-Host "  · Copilot+ : " -NoNewline -ForegroundColor Cyan
    Write-Animated "Soy un asistente AI automatizado para ejecutar terminales de Windows." -Color "White" -Decode
    
    Write-Host "  · Terminal : " -NoNewline -ForegroundColor DarkGray
    Write-Animated "PowerShell 7 Elite Edition" -Color "Green" -Delay 10
    
    Invoke-Telemetry
    Write-Host ""
}

function prompt {
    $loc = $executionContext.SessionState.Path.CurrentLocation
    $time = Get-Date -Format "HH:mm"
    Write-Host ""
    Write-Host " [$time] " -NoNewline -ForegroundColor DarkGray
    Write-Host "Copilot+" -NoNewline -ForegroundColor Cyan
    Write-Host " » $loc » " -NoNewline -ForegroundColor White
    return " "
}

# Inicialización Inteligente
try {
    Set-PSReadLineOption -PredictionSource History -ErrorAction SilentlyContinue
    Set-PSReadLineOption -PredictionViewStyle ListView -ErrorAction SilentlyContinue
}
catch {}

Show-Welcome
