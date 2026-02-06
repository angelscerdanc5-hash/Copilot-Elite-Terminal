@echo off
:: Obtener el carácter de escape (ESC)
for /F "delims=#" %%a in ('"prompt #$E# & for %%b in (1) do rem"') do set "ESC=%%a"

chcp 65001 > nul
cls

:: Definir códigos ANSI para colores
set "Cyan=%ESC%[36m"
set "Green=%ESC%[32m"
set "Gray=%ESC%[90m"
set "White=%ESC%[37m"
set "Reset=%ESC%[0m"

:: Obtener Hardware con lógica mejorada para nombre comercial
for /f "usebackq tokens=*" %%i in (`powershell -NoProfile -Command "$s=Get-CimInstance Win32_ComputerSystem; $p=Get-CimInstance Win32_ComputerSystemProduct; $m=$p.Name; if($p.Version -and $p.Version -notmatch 'None|Default'){$m=$p.Version} elseif($s.SystemFamily -and $s.SystemFamily -notmatch 'To be filled'){$m=$s.SystemFamily}; $s.Manufacturer + ' ' + $m"`) do set "Hardware=%%i"

:: 1. Parpadeo e Inicio de Carga
echo %Cyan%INITIALIZING COPILOT+ ELITE SUITE...%Reset%
powershell -NoProfile -Command "Start-Sleep -m 300"

:: 2. Carga de Módulos
echo %Gray%[%Reset% %Gray%] Cargando Núcleo Copilot+...%Reset%
powershell -NoProfile -Command "Start-Sleep -m 250"
echo %Gray%[%Reset%%Green%OK%Gray%]%Reset% %Green%NEURAL CORE ONLINE%Reset%
powershell -NoProfile -Command "Start-Sleep -m 200"
echo %Gray%[%Reset%%Green%OK%Gray%]%Reset% %Green%VISUAL INTERFACE ESTABLISHED%Reset%
powershell -NoProfile -Command "Start-Sleep -m 150"
echo %Gray%[%Reset%%Green%OK%Gray%]%Reset% %Cyan%Conexión Neural Establecida.%Reset%
powershell -NoProfile -Command "Start-Sleep -m 400"

:: 3. Limpieza y Pantalla Final
cls
echo %Gray%Microsoft Windows [Versión 10.0.26200.7705]%Reset%
echo %Gray%(c) Microsoft Corporation. All rights reserved.%Reset%
echo.

echo    %Gray%USER     :%Reset% %Green%%USERNAME% @ %COMPUTERNAME%%Reset%
echo    %Gray%SYSTEM   :%Reset% %White%Windows 11 Elite Edition%Reset%
echo    %Gray%HARDWARE :%Reset% %White%%Hardware%%Reset%
echo    %Gray%IDENTITY :%Reset% %Cyan%Copilot+ AI Elite%Reset%
echo    %Gray%STATUS   :%Reset% %White%Conexión establecida. Sistema optimizado. 🚀%Reset%
echo    %Gray%EDITION  :%Reset% %Green%CMD Elite / v5.2%Reset%
echo.
echo   %Gray%[SYSTEM] STATUS:%Reset% %Green%ACTIVE%Reset% %Gray%^| CORE:%Reset% %White%ONLINE%Reset%
echo.

prompt %Gray%[%Reset%%White%%TIME:~0,5%%Gray%]%Reset% %Cyan%Copilot+%Reset% %Gray% » %Reset%%White% %P %Reset%%Cyan%»%Reset% 
