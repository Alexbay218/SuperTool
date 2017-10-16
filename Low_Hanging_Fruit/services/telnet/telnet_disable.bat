@echo off
net stop Telnet | clip

taskkill /im telnet.exe /f | clip
taskkill /im telnet.exe /f | clip
taskkill /im telnet.exe /f | clip

sc config TlntSvr start= disabled | clip

dism /online /Disable-Feature /FeatureName:TelnetServer /FeatureName:TelnetClient /NoRestart

exit