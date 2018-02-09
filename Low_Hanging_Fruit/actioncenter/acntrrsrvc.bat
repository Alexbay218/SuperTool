reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 4 /f | clip

sc config wscsvc start= auto
sc config MpsSvc start= auto
sc config wuauserv start= auto
sc config WinDefend start= auto

net start wscsvc
net start MpsSvc
net start wuauserv
net start WinDefend

netsh advfirewall set allprofiles state on

exit