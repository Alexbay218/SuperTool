@echo off
color 0a
echo on

Start "Start" "%~dp0..\AutoHotKey_Source\AutoHotkey.exe" "%~dp0start.ahk"

Start "ClipLogger" "%~dp0..\AutoHotKey_Source\AutoHotkey.exe" "%~dp0_cliplog\ClipLogger.ahk"

Timeout 2

Start "View Hidden" /wait "%~dp0..\AutoHotKey_Source\AutoHotkey.exe" "%~dp0viewhidden\viewhidden.ahk"

Start "Action Center Services" /wait "%~dp0actioncenter\acntrrsrvc.bat"
echo Action Center Scripts finished | clip

Start "Windows Defender Signature Update" "%~dp0actioncenter\windefsigupdate.bat"

Start "Windows FireWall Reset" "%~dp0actioncenter\winfwreset.bat"

Start "Services" /wait "%~dp0services\run_services.bat"

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
