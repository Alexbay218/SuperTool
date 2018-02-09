"%~dp0wget\bin\wget.exe" --no-check-certificate "http://ninite.com/.net4.7-7zip-chrome-essentials-firefox-java8-malwarebytes-notepadplusplus-spybot2/ninite.exe"

timeout 2

start "Ninite" /W "%~dp0ninite.exe"