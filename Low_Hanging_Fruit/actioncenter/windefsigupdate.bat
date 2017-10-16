cd %ProgramFiles%\Windows Defender
MpCmdRun.exe -RestoreDefaults | clip
MpCmdRun.exe -SignatureUpdate | clip
exit