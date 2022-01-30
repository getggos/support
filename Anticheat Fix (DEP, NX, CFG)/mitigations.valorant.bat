:: MITIGATIONS (DEP AND CFG ONLY)
:: https://github.com/getggos

@echo off
setlocal ENABLEDELAYEDEXPANSION

:: CHECK FOR ADMIN PRIVILEGES
dism >nul 2>&1 || ( echo This script must be Run as Administrator. && pause && exit /b 1 )

:: MITIGATIONS (DEP AND CFG ONLY)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationAuditOptions" /t REG_BINARY /d "222222222222222222222222222222222222222222222222" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationOptions" /t REG_BINARY /d "232222222223222222222222222222222222222222222222" /f >nul 2>&1

echo DEP and CFG mitigations have been enabled. Please restart your computer.
pause

exit /b 0
