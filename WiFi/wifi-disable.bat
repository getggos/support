:: DISABLE WIFI ON GGOS
:: https://github.com/getggos

@echo off
setlocal ENABLEDELAYEDEXPANSION

:: CHECK FOR ADMIN PRIVILEGES
dism >nul 2>&1 || ( echo This script must be Run as Administrator. && pause && exit /b 1 )

:: DISABLE WIFI DRIVERS
sc config vwififlt start=demand >nul 2>&1

:: DISABLE WIFI SERVICES
sc config WlanSvc start=disabled >nul 2>&1

echo WiFi services have been disabled. Please restart your computer.
pause

exit /b 0
