cd %~dp0
rmdir /s /q "%~dp0..\Archive\Data\Before"
mkdir "%~dp0..\Archive\Data\Before"
"%~dp0..\Archive\DISMLister\list.bat"
dism /online /get-features > feature_list.txt
dism /online /get-package > package_list.txt
move "%~dp0feature_list.txt" "%~dp0..\Archive\Data\Before"
move "%~dp0package_list.txt" "%~dp0..\Archive\Data\Before"
"%~dp0..\Archive\HashShot\run.bat"
move "%~dp0..\Archive\HashShot\bin\log.txt" "%~dp0..\Archive\Data\Before"
cd %~dp0
"%~dp0wget\bin\wget.exe" --no-check-certificate "http://ninite.com/.net4.7-7zip-chrome-essentials-firefox-java8-malwarebytes-notepadplusplus-spybot2/ninite.exe"
"%~dp0ninite.exe"
cd %~dp0
rmdir /s /q "%~dp0..\Archive\Data\Before"
mkdir "%~dp0..\Archive\Data\After"
dism /online /get-features > feature_list.txt
dism /online /get-package > package_list.txt
move "%~dp0feature_list.txt" "%~dp0..\Archive\Data\After"
move "%~dp0package_list.txt" "%~dp0..\Archive\Data\After"
"%~dp0..\Archive\HashShot\run.bat"
move "%~dp0..\Archive\HashShot\bin\log.txt" "%~dp0..\Archive\Data\After"
cd %~dp0
"%~dp0..\Super_Tool\super_tool.bat"
