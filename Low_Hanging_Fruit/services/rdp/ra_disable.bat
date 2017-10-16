@echo off
netsh advfirewall firewall set rule group="remote assistance" new enable=No | clip
reg add "HKLM\System\CurrentControlSet\Control\Remote Assistance" /v fAllowToGetHelp /t REG_DWORD /d 0 /f | clip
exit