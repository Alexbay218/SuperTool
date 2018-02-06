for /f "tokens=*" %%a in ('ver') do set version=%%a
mkdir "%~dp0%version%"
mkdir "%~dp0%version%\logons"
"%~dp0..\Sysinternals_Source\logonsessions.exe" -c -p > "%~dp0%version%\logons\logons.csv"
"%~dp0rootrevealer.bat"