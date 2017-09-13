@echo off
del "%cd%\bin\log.txt"
echo Finding files
dir C:\* /s /b /a-d > "%cd%\bin\list.txt"
echo Done finding
echo Starting hash calculations
"%cd%\bin\main.exe" "%cd%\bin\list.txt"
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