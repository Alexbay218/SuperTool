@echo off
color 0a
echo on

Start "Start" "%~dp0..\AutoHotKey_Source\AutoHotkey.exe" "%~dp0start.ahk"

Start "ClipLogger" "%~dp0..\AutoHotKey_Source\AutoHotkey.exe" "%~dp0_cliplog\ClipLogger.ahk"

Start "Advanced Firewall" /wait "%~dp0\advfirewall\VCaftApplier"

secedit /configure /db "%~dp0secedit/secedit.sdb" /cfg "%~dp0secedit/VClsp.inf"

Start "End" "%~dp0..\AutoHotKey_Source\AutoHotkey.exe" "%~dp0\end.ahk"

echo exit > "%~dp0\_cliplog\exit.txt"

echo off
color fc
timeout 1
color 0a
timeout 1
color fc
timeout 1
color 0a
timeout 1
color fc
timeout 1
color 0a
timeout 1
color fc
timeout 1
color 0a
timeout 1

del "%~dp0\_cliplog\exit.txt"
