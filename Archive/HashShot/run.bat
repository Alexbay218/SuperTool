@echo off
del "%~dp0bin\log.txt"
echo Finding files
dir C:\* /s /b /a-d > "%~dp0bin\list.txt"
echo Done finding
echo Starting hash calculations
"%~dp0bin\main.exe" "%~dp0bin\list.txt"
echo.
echo Done calculating hashes

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
pause