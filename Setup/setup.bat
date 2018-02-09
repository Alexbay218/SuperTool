start "Start" "%~dp0..\AutoHotKey_Source\AutoHotkey.exe" "%~dp0start.ahk"

start "Start Collect" /W "%~dp0..\Archive\start_collect.bat"

"%~dp0wget\bin\wget.exe" --no-check-certificate "http://ninite.com/.net4.7-7zip-chrome-essentials-firefox-java8-malwarebytes-notepadplusplus-spybot2/ninite.exe"

timeout 2

"%~dp0wget\bin\wget.exe" --no-check-certificate "http://ninite.com/.net4.7-7zip-chrome-essentials-firefox-java8-malwarebytes-notepadplusplus-spybot2/ninite.exe"

timeout 2

start "Ninite" /W "%~dp0ninite.exe"

echo exit > "%~dp0exit.txt"

timeout 3

del "%~dp0exit.txt"

"%~dp0..\Super_Tool\super_tool.bat"
