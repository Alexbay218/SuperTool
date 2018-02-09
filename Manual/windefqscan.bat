cd %ProgramFiles%\Windows Defender
MpCmdRun.exe -Scan -1
MpCmdRun.exe -GetFiles
xcopy /y "%ProgramData%\Microsoft\Windows Defender\Support\MPSupportFiles.cab" "%~dp0\SupportFiles" | clip
pause