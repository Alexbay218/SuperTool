Start "Start" "%~dp0..\AutoHotKey_Source\AutoHotkey.exe" "%~dp0start.ahk"

Timeout 2

Rem Start "Advanced Firewall" /wait "%~dp0\advfirewall\aftApplier.bat"

echo exit > "%~dp0exit.txt"

timeout 3

del "%~dp0exit.txt"
