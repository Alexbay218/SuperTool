@echo off
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 4 /f | clip

sc config wscsvc start= auto | clip
sc config MpsSvc start= auto | clip
sc config wuauserv start= auto | clip
sc config WinDefend start= auto | clip

net start wscsvc | clip
net start MpsSvc | clip
net start wuauserv | clip
net start WinDefend | clip

netsh advfirewall set allprofiles state on

exit