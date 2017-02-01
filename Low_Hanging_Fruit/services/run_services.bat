@echo off
If Exist "%~dp0rdp\rename_to_stop.txt" Start "Disable Remote Desktop" "%~dp0rdp\rdp_disable.bat" | clip

If Exist "%~dp0rdp\rename_to_stop.txt" Start "Disable Remote Assistance" "%~dp0rdp\ra_disable.bat" | clip

If Exist "%~dp0telnet\rename_to_stop.txt" Start "Disable Telnet" /wait "%~dp0telnet\telnet_disable.bat" | clip

If Exist "%~dp0games\rename_to_stop.txt" Start "Disable Features" "%~dp0features\features_disable.bat" | clip

exit