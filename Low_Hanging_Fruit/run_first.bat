@echo off
color 0a
echo on

Start "Start" "%~dp0..\AutoHotKey_Source\AutoHotkey.exe" "%~dp0start.ahk"

Timeout 2

Start "Action Center Services" /wait "%~dp0actioncenter\acntrrsrvc.bat"
echo Action Center Scripts finished | clip

"%~dp0actioncenter\windefsigupdate.bat"

"%~dp0actioncenter\winfwreset.bat"

"%~dp0services\run_services.bat"

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
