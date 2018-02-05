dism /online /Enable-Feature /FeatureName:TelnetServer
dism /online /Enable-Feature /FeatureName:TelnetClient

sc config TlntSvr start= auto

net start Telnet

pause