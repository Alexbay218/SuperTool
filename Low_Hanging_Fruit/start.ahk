SetWorkingDir, %A_ScriptDir%
SplashImage, start.png, by45
while true
{
	SetWorkingDir, %A_ScriptDir%
	IfExist, _cliplog\exit.txt
		Break
}
ExitApp