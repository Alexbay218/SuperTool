netsh advfirewall firewall set rule group="remote assistance" new enable=Yes
reg add "HKLM\System\CurrentControlSet\Control\Remote Assistance" /v fAllowToGetHelp /t REG_DWORD /d 1 /f
Pause