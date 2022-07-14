:: ENABLE SHELL HARDWARE DETECTION ON GGOS
:: https://github.com/getggos

@echo off
setlocal ENABLEDELAYEDEXPANSION

:: CHECK FOR ADMIN PRIVILEGES
dism >nul 2>&1 || ( echo This script must be Run as Administrator. && pause && exit /b 1 )

:: ENABLE SHELL HARDWARE DETECTION
sc config ShellHWDetection start=auto >nul 2>&1
sc start ShellHWDetection >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" /v "DisableAutoplay" /t REG_DWORD /d "0" /f

echo Shell Hardware Detection and Autoplay has been enabled.
pause

exit /b 0
