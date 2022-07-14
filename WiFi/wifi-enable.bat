:: ENABLE WIFI ON GGOS
:: https://github.com/getggos

@echo off
setlocal ENABLEDELAYEDEXPANSION

:: CHECK FOR ADMIN PRIVILEGES
dism >nul 2>&1 || ( echo This script must be Run as Administrator. && pause && exit /b 1 )

:: ENABLE WIFI DRIVERS
sc config vwififlt start=system >nul 2>&1
sc start vwififlt >nul 2>&1

:: ENABLE WIFI SERVICES
sc config WlanSvc start=auto >nul 2>&1
sc start WlanSvc >nul 2>&1

:: ENABLE ALL ADAPTERS
devcon enable =net >nul 2>&1

echo WiFi services have been enabled.
pause

exit /b 0
