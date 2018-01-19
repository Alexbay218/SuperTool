cd %~dp0
rmdir /s /q "%~dp0..\Archive\Data\Local"
mkdir "%~dp0..\Archive\Data\Local"
dism /online /get-features > feature_list.txt
dism /online /get-package > package_list.txt
move "%~dp0feature_list.txt" "%~dp0..\Archive\Data\Local"
move "%~dp0package_list.txt" "%~dp0..\Archive\Data\Local"
del "%~dp0..\Archive\Data\Local\list.txt"
dir C:\* /s /b /a-d > "%~dp0..\Archive\Data\Local\list.txt"
cd %~dp0
"%~dp0wget\bin\wget.exe" --no-check-certificate "http://ninite.com/.net4.7-7zip-chrome-essentials-firefox-java8-malwarebytes-notepadplusplus-spybot2/ninite.exe"
"%~dp0ninite.exe"
cd %~dp0
"%~dp0..\Super_Tool\super_tool.bat"
