@echo off
color 0a
echo on

Start "Start" "%~dp0..\AutoHotKey_Source\AutoHotkey.exe" "%~dp0start.ahk"

Rem Start "Advanced Firewall" /wait "%~dp0\advfirewall\aftApplier"

secedit /configure /db "%~dp0secedit/secedit.sdb" /cfg "%~dp0secedit/lsp.inf"

net user %USERNAME% /active:yes

echo exit > "%~dp0exit.txt"

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

del "%~dp0exit.txt"
