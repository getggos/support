:: ENABLE BLUETOOTH ON GGOS
:: https://github.com/getggos

@echo off
setlocal ENABLEDELAYEDEXPANSION

:: CHECK FOR ADMIN PRIVILEGES
dism >nul 2>&1 || ( echo This script must be Run as Administrator. && pause && exit /b 1 )
devcon /? >nul 2>&1 || ( echo This script requires devcon in the system path. && pause && exit /b 1 )

:: ENABLE BLUETOOTH DEVICES
devcon enable =Bluetooth >nul 2>&1

:: ENABLE BLUETOOTH DRIVERS
sc config BthA2dp start=demand >nul 2>&1
sc config BthEnum start=demand >nul 2>&1
sc config BthHFEnum start=demand >nul 2>&1
sc config BthLEEnum start=demand >nul 2>&1
sc config BthMini start=demand >nul 2>&1
sc config BthPan start=demand >nul 2>&1
sc config BTHPORT start=demand >nul 2>&1
sc config BTHUSB start=demand >nul 2>&1
sc config HidBth start=demand >nul 2>&1
sc config Microsoft_Bluetooth_AvrcpTransport start=demand >nul 2>&1
sc config RFCOMM start=demand >nul 2>&1

:: ENABLE BLUETOOTH SERVICES
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BluetoothUserService" /v "Start" /t REG_DWORD /d "3" /f >nul 2>&1
sc config BluetoothUserService start=demand >nul 2>&1
sc config BTAGService start=demand >nul 2>&1
sc config BthAvctpSvc start=demand >nul 2>&1
sc config bthserv start=demand >nul 2>&1

:: ENABLE BLUETOOTH DEVICES
devcon enable BTH* >nul 2>&1

echo Bluetooth services have been enabled. Please restart your computer.
pause

exit /b 0
