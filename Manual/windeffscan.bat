cd %ProgramFiles%\Windows Defender
MpCmdRun.exe -Scan -2
MpCmdRun.exe -GetFiles
xcopy /y "%ProgramData%\Microsoft\Windows Defender\Support\MPSupportFiles.cab" "%~dp0\SupportFiles"
pause