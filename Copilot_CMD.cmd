@echo off
setlocal enabledelayedexpansion

:: ══════════════════════════════════════════════════════════════════════════════
:: COPILOT+ ELITE INTELLIGENCE SUITE v5.2 - CMD EDITION
:: ══════════════════════════════════════════════════════════════════════════════

cls
echo ^[[36mINITIALIZING COPILOT+ ELITE SUITE...^[[0m
timeout /t 1 /nobreak > nul

echo ^[[90m[ ] Cargando Nucleo Copilot+...^[[0m
timeout /t 1 /nobreak > nul
echo ^[[32m[OK] NEURAL CORE ONLINE^[[0m
timeout /t 1 /nobreak > nul
echo ^[[32m[OK] VISUAL INTERFACE ESTABLISHED^[[0m
timeout /t 1 /nobreak > nul
echo ^[[36m[OK] Conexion Neural Establecida.^[[0m
timeout /t 1 /nobreak > nul

cls
echo Microsoft Windows [Version 10.0.26200.7705]
echo (c) Microsoft Corporation. All rights reserved.
echo.

:: System Info
for /f "tokens=2 delims==" %%a in ('wmic os get caption /value') do set "osName=%%a"
for /f "tokens=2 delims==" %%a in ('wmic computersystem get manufacturer /value') do set "mfg=%%a"
for /f "tokens=2 delims==" %%a in ('wmic computersystem get model /value') do set "model=%%a"

echo   ^[[90m. SYSTEM   : ^[[0m!osName!
echo   ^[[90m. HARDWARE : ^[[0m!mfg! !model!
echo   ^[[90m. USER     : ^[[32m%USERNAME% @ %COMPUTERNAME%^[[0m
echo   ^[[36m. Copilot+ : ^[[0mSoy un asistente AI automatizado para ejecutar terminales de Windows.
echo   ^[[90m. Terminal : ^[[32mCommand Prompt Elite Edition^[[0m
echo.
echo   ^[[90m[SYSTEM] STATUS: ACTIVE ^| RAM: MONITORING ^| CORE: ONLINE^[[0m
echo.

:: Prompt definition
set "timeStr=%%TIME:~0,5%%"
prompt ^[[90m [^[[90m$T:~0,5^[[90m] ^[[36mCopilot+^[[0m ^[[37m$M$P $G^[[0m 
