for /f "tokens=*" %%a in ('ver') do set version=%%a
mkdir "%~dp0%version%"
mkdir "%~dp0%version%\rootrevealer"
"%~dp0..\Sysinternals_Source\rootkitrevealer.exe" -a -m -c "%~dp0%version%\rootrevealer\rkr.csv"