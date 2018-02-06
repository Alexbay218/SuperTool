for /f "tokens=*" %%a in ('ver') do set version=%%a
mkdir "%~dp0%version%"
mkdir "%~dp0%version%\dump"
setlocal EnableExtensions
for /f "tokens=2* delims==" %%G IN ('
        wmic process get name /value  2^>NUL
    ') DO for %%g in (%%~G) do (
	"%~dp0..\Sysinternals_Source\procdump.exe" -ma %%~g C:\ >> "%~dp0%version%\dump\%%~g.dmp"
    )
"%~dp0logons.bat"