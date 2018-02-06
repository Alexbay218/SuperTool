for /f "tokens=*" %%a in ('ver') do set version=%%a
mkdir "%~dp0%version%"
mkdir "%~dp0%version%\listdll"
"%~dp0..\Sysinternals_Source\listdll.exe" -u > "%~dp0%version%\listdll\dlls.txt"
"%~dp0dump.bat"