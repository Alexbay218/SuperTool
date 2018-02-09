Start "Start" "%~dp0..\AutoHotKey_Source\AutoHotkey.exe" "%~dp0start.ahk"

Timeout 2

Start "Action Center Services" /wait "%~dp0actioncenter\acntrrsrvc.bat"

"%~dp0actioncenter\windefsigupdate.bat"

netsh advfirewall reset

"%~dp0services\run_services.bat"

echo exit > "%~dp0exit.txt"

timeout 3

del "%~dp0exit.txt"
