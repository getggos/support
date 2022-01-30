:: DISABLE TROUBLESHOOTING ON GGOS (DEFAULT)
:: https://github.com/getggos

@echo off
setlocal ENABLEDELAYEDEXPANSION

:: CHECK FOR ADMIN PRIVILEGES
dism >nul 2>&1 || ( echo This script must be Run as Administrator. && pause && exit /b 1 )

:: DISABLE DIAGNOSTICS & TROUBLESHOOTING SERVICES
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Windows" /v "NoInteractiveServices" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DiagLog" /v "Start" /t REG_DWORD /d "0" /f >nul 2>&1
sc config DPS start=disabled >nul 2>&1

echo Diagnostics & Troubleshooting services have been disabled. Please restart your computer.
pause

/exit /b 0
