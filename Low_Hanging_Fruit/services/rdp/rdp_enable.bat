sc config TermService start= auto

sc config SessionEnv start= auto

sc config UmRdpService start= auto

net start TermService

net start SessionEnv

net start UmRdpService

pausenet stop TermService

net stop SessionEnv

net stop UmRdpService

Pause