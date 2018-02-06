for /f "tokens=*" %%a in ('ver') do set version=%%a
mkdir "%~dp0%version%"
mkdir "%~dp0%version%\autorun"
"%~dp0..\Sysinternals_Source\autorunsc.exe" -c > "%~dp0%version%\autorun\all.csv"
"%~dp0listdll.bat"