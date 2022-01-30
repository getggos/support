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
sc start Spooler >nul 2>&1

echo Printing has been enabled.
echo Install your printer driver to complete the setup.
pause

exit /b 0
