for /f "tokens=*" %%a in ('ver') do set version=%%a
mkdir "%~dp0%version%"
mkdir "%~dp0%version%\accesschk"
"%~dp0..\Sysinternals_Source\accesschk.exe" -ks hklm > "%~dp0%version%\accesschk\hklm.txt"
"%~dp0..\Sysinternals_Source\accesschk.exe" -wuo everyone \basednamedobjects > "%~dp0%version%\accesschk\allobj.txt"
"%~dp0..\Sysinternals_Source\accesschk.exe" users -s c:\ > "%~dp0%version%\accesschk\users.txt"
"%~dp0..\Sysinternals_Source\accesschk.exe" Administrators -s c:\ > "%~dp0%version%\accesschk\administrators.txt"
"%~dp0..\Sysinternals_Source\accesschk.exe" users -cws * > "%~dp0%version%\accesschk\services.txt"
"%~dp0..\Sysinternals_Source\accesschk.exe" users -cws * > "%~dp0%version%\accesschk\services.txt"
mkdir "%~dp0%version%\accesschk\users"
setlocal EnableExtensions
for /f "tokens=2* delims==" %%G IN ('
        wmic useraccount where "status='OK'" get name /value  2^>NUL
    ') DO for %%g in (%%~G) do (
	net user %%~g > "%~dp0%version%\accesschk\users\%%~g.txt"
	"%~dp0..\Sysinternals_Source\accesschk.exe" -s %%~g C:\ >> "%~dp0%version%\accesschk\users\%%~g.txt"
    )
"%~dp0autorun.bat"