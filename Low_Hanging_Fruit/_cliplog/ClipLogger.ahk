#Persistent
SetWorkingDir %A_ScriptDir%
StartTime = %A_TickCount%
LogName = %A_NOW%
clipboard = ;Make sure clip is empty
CoordMode, ToolTip, Screen
ToolTip, ClipLogger has started, 0, 0
while true
{
	SetWorkingDir %A_ScriptDir%
	IfExist, exit.txt
		Break
	IfWinExist, DISM Image Servicing Utility
	{
		WinKill, DISM Image Servicing Utility
	}
	if %clipboard%
	{
		prevclip = %clipboard%
		FileAppend, %A_NOW%`n, Logs/%LogName%.txt
		FileAppend, %clipboard%`n, Logs/%LogName%.txt
		ToolTip, %clipboard%, 0, 0
		clipboard =
	}
}
TotalTime := (A_TickCount-StartTime)/1000
FileAppend, Total Time: %TotalTime% seconds, Logs/%LogName%.txt
MsgBox,,Time Elapsed,Total Time: %TotalTime% seconds, 10
SoundPlay, *-1, wait
ExitApp