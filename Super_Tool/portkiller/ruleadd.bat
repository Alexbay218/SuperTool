rem %1 is name
rem %2 is dir (in or out)
rem %3 action (allow, block, or bypass)
rem %4 is protocol=<protocol here> remoteport=<port here>
rem could be local port instead of remote port
netsh advfirewall firewall add rule name=%1 dir=%2 action=%3 %4