:: RESTORE WINDOWS POWER MANAGEMENT
:: https://github.com/getggos

@echo off
setlocal ENABLEDELAYEDEXPANSION

:: CHECK FOR ADMIN PRIVILEGES
dism >nul 2>&1 || (echo This script must be Run as Administrator. && pause && exit /b 1)
devcon /? >nul 2>&1 || ( echo This script requires devcon in the system path. && pause && exit /b 1 )

:: RESTORE WINDOWS POWER MANAGEMENT
powershell -NoProfile "Get-PnpDevice -FriendlyName 'ACPI Processor Aggregator' | Enable-PnpDevice -confirm:$false" >nul 2>&1
powershell -NoProfile "Get-PnpDevice -FriendlyName 'Microsoft Windows Management Interface for ACPI' | Enable-PnpDevice -confirm:$false" >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /f >nul 2>&1

echo Windows power management features have been restored. 
echo Please restart your computer.
pause

exit /b 0
