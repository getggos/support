:: DISABLE PRINTING ON GGOS (DEFAULT)
:: https://github.com/getggos

@echo off
setlocal ENABLEDELAYEDEXPANSION

:: CHECK FOR ADMIN PRIVILEGES
dism >nul 2>&1 || ( echo This script must be Run as Administrator. && pause && exit /b 1 )

:: DISABLE PRINTING DEVICES
devcon disable "=Printer" >nul 2>&1
devcon disable "=PrintQueue" >nul 2>&1

:: DISABLE PRINTING SERVICES
sc config Spooler start=disabled >nul 2>&1
sc config PrintNotify start=disabled >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PrintWorkflowUserSvc" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1

echo Printing has been disabled.
pause

exit /b 0
