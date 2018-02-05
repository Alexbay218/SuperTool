cd %ProgramFiles%\Windows Defender
MpCmdRun.exe -Scan -2 | clip
MpCmdRun.exe -GetFiles | clip
xcopy /y "%ProgramData%\Microsoft\Windows Defender\Support\MPSupportFiles.cab" "%~dp0\SupportFiles" | clip
exit