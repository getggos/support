:: REINSTALL VISUAL C++ REDISTRIBUTABLES ON GGOS
:: https://github.com/getggos

@echo off
setlocal ENABLEDELAYEDEXPANSION

:: CHECK FOR ADMIN PRIVILEGES
dism >nul 2>&1 || ( echo This script must be Run as Administrator. && pause && exit /b 1 )

:: REMOVE ALL OLD VISUAL C++ REDISTRIBUTABLES
echo Removing old Visual C++ Redistributables...
C:\Windows\Setup\Files\vcredist.exe /aiR /gm2

:: REINSTALL ALL VISUAL C++ REDISTRIBUTABLES
echo Reinstalling...
C:\Windows\Setup\Files\vcredist.exe /ai /gm2

echo All Visual C++ Redistributables have been removed and reinstalled.
pause

exit /b 0


