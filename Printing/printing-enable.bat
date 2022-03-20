:: ENABLE PRINTING ON GGOS
:: https://github.com/getggos

@echo off
setlocal ENABLEDELAYEDEXPANSION

:: CHECK FOR ADMIN PRIVILEGES
dism >nul 2>&1 || ( echo This script must be Run as Administrator. && pause && exit /b 1 )
devcon /? >nul 2>&1 || ( echo This script requires devcon in the system path. && pause && exit /b 1 )

:: ENABLE PRINTING DEVICES
devcon enable "=Printer" >nul 2>&1
devcon enable "=PrintQueue" >nul 2>&1

:: ENABLE PRINTING SERVICES
sc config Spooler start=auto >nul 2>&1
sc config PrintNotify start=demand >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PrintWorkflowUserSvc" /v "Start" /t REG_DWORD /d "3" /f >nul 2>&1

echo Printing has been enabled.
echo Install your printer driver, then restart your computer.
pause

exit /b 0
