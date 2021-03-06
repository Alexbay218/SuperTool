for /f "tokens=*" %%a in ('ver') do set version=%%a

mkdir "%~dp0%version%"

cd "%version%"

mkdir "%~dp0%version%\lists"

dir C:\* /s /b /a-d > "%~dp0%version%\lists\file_list.txt"

"%~dp0..\MD5Deep_Source\hashdeep.exe" -r C:\ > "%~dp0%version%\lists\filehash_list.txt"

dism /online /get-features > "%~dp0%version%\lists\feature_list.txt"

dism /online /get-package > "%~dp0%version%\lists\package_list.txt"

netstat -abo > "%~dp0%version%\lists\port_list.txt"

netstat -r > "%~dp0%version%\lists\iproute_list.txt"

tasklist > "%~dp0%version%\lists\task_list.txt"

net start > "%~dp0%version%\lists\service_list.txt"

secedit /export /cfg "%~dp0%version%\lists\lspsettings_list.inf"

netsh advfirewall export "%~dp0%version%\lists\fwsettings_list.wfw"

"%~dp0accesschk.bat"