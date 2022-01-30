:: ENABLE LANMAN WORKSTATION ON GGOS
:: https://github.com/getggos

@echo off
setlocal ENABLEDELAYEDEXPANSION

:: CHECK FOR ADMIN PRIVILEGES
dism >nul 2>&1 || ( echo This script must be Run as Administrator. && pause && exit /b 1 )

:: ENABLE LANMAN WORKSTATION AND DEPENDENCIES
sc config rdbss start=system >nul 2>&1
sc config KSecPkg start=boot >nul 2>&1
sc config LanmanWorkstation start=auto >nul 2>&1

echo Lanman Workstation has been enabled. Please restart your computer.
pause

exit /b 0
