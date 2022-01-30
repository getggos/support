:: DISABLE DEP ON GGOS
:: https://github.com/getggos

@echo off
setlocal ENABLEDELAYEDEXPANSION

:: CHECK FOR ADMIN PRIVILEGES
dism >nul 2>&1 || ( echo This script must be Run as Administrator. && pause && exit /b 1 )

:: DISABLE DEP
bcdedit /set nx AlwaysOff

echo DEP has been disabled. Please restart your computer.
pause

exit /b 0
