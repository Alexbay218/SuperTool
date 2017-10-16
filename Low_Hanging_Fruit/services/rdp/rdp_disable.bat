@echo off
net stop TermService | clip

net stop SessionEnv | clip

net stop UmRdpService | clip

sc config TermService start= disabled | clip

sc config SessionEnv start= disabled | clip

sc config UmRdpService start= disabled | clip

exit