<h1>SuperTool</h1>
<hr>
SuperTool is a tool design for basic security configuration of Microsoft Windows

It uses both AutoHotkey and Batch to accomplish a variety of tasks

```
GUI:
Script launcher (Low/High Hanging Fruit)
User management
File searching

Low Hanging Fruit:
0) View hidden files
1) Enables automatic update
2) Start the following services:
    > Security Center
    > Windows Defender
    > Windows Firewall
    > Windows Update
3) Windows Defender Signature update
4) Windows Firewall Setting reset
5) Stops (and disables) the following services:
    > Remote Desktop:
        - TermService
        - SessionEnv
        - UmRdpService
    > Remote Assistance:
 - Firewall rule added
    > Telnet:
        - TlntSvr
6) Turns off the following Windows Features:
    > TelnetServer
    > TelnetClient
    > Games
High Hanging Fruit:
0) Applies LSP
```
