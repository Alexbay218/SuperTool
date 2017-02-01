SetWorkingDir, %A_ScriptDir%
SplashImage, start.png, by45
while true
{
	SetWorkingDir, %A_ScriptDir%
	IniRead, check, _cliplog\com.ini, com, e
	IfExist, _cliplog\exit.txt
		Break
}
ExitApp