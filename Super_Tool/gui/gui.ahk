#SingleInstance
if !A_IsAdmin {
  MsgBox, Please Start with Admin Privileges
  ExitApp
}

SetWorkingDir, %A_ScriptDir%

Gui, New, -Theme, Super Tool v0.25
Gui, Add, Tab, +h600 +w400,Script Starter|Users|File Search

Gui, Tab, 1
Gui, Add, Button, c40 r3 center gLHF, Low Hanging Fruit
Gui, Add, Button, c40 r3 center gHHF, High Hanging Fruit
Gui, Add, Button, c40 r3 center gPointGain, Point Gain

Gui, Tab, 2
Gui, Add, Button, gRefreshUser, Refresh Users
Gui, Add, Button, xp+200 yp gChangeUserPass,Change all User Password
Gui, Add, ListBox, xp-200 yp+30 gGetUser h90 w150 vUserList
Gui, Add, Text, x+50 yp,Default password:`n1qaz2wsx3edc$RFV + 1st user char
Gui, Add, Button, xp yp+30 gPromoteUser,Promote
Gui, Add, Button, xp+70 yp gDemoteUser,Demote
Gui, Add, Button, xp-90 yp+30 gAddUser,Add Account
Gui, Add, Button, xp+90 yp gRemoveUser,Delete Account
Gui, Add, Text, xm+10 yp+30 w380 r24 vUserInfo,

Gui, Tab, 3
FileRead, searchlist, ..\search\searchlist\exlist.txt
StringReplace, searchlist, searchlist, `n, |, All
Gui, Add, Text, xm+5 ym+30,Path:
Gui, Add, Edit, xp+30 yp-3 w150 vPath,
Gui, Add, Button, xp+160 yp+0 gStartSearch , Search
Gui, Add, ListBox, Multi xp-190 yp+30 w50 h440 vListCheck, %searchlist%
Gui, Add, ListBox, Multi yp xp+55 h440 w330 HScroll vResults,
Gui, Add, Button, xp-55 yp+445 gLook, View
Gui, Add, Button, xp+50 yp gDelete, Delete
Gui, Add, Button, xp+150 yp gUnhide, Force Unhide
Gui, Show

Goto, RefreshUser

Return

;Script Starter Tab
HHF:
{
	SetWorkingDir, %A_ScriptDir%
	Run, *Runas ..\..\High_Hanging_Fruit\run_last.bat
	Return
}
LHF:
{
	SetWorkingDir, %A_ScriptDir%
	Run, *Runas ..\..\Low_Hanging_Fruit\run_first.bat
	Return
}
PointGain:
{
	SetWorkingDir, %A_ScriptDir%
	SoundPlay, ..\point\Point_Gain.mp3
	Return
}

;User tab
GetUser:
{
	SetWorkingDir, %A_ScriptDir%	
	Gui, Submit, NoHide
	RunWait, ..\users\getuser\getuser.bat %UserList%,,Hide
	FileRead, userinfo, ..\users\getuser\userinfo.txt
	GuiControl,,UserInfo,%userinfo%
	Return
}

RefreshUser:
{
	GuiControl,,UserList,|
	Gui, Submit, NoHide
	SetWorkingDir, %A_ScriptDir%	
	RunWait, ..\users\userlist\userlist.bat,,Hide
	FileRead, userlist,  ..\users\userlist\formattedlist.txt
	StringReplace, userlist, userlist, `n, |, All
	currentuser := SubStr(userlist,1,InStr(userlist,"|")-1)
	GuiControl,,UserList,%userlist%
	Return
}

ChangeUserPass:
{
	Gui, Submit, NoHide
	SetWorkingDir, %A_ScriptDir%	
	RunWait, ..\users\userlist\userlist.bat,,Hide
	FileRead, userlist,  ..\users\userlist\formattedlist.txt
	currentuser := SubStr(userlist,1,InStr(userlist,"`n")-1)
	userarray := Object()
	userarray := StrSplit(userlist,"`n")
	StringReplace, userlist, userlist, `n, |, All
	for index, element in userarray
	{
		if (element != currentuser)
			{
			pass := SubStr(element, 1, 1)
			;RunWait, *Runas ..\users\changeuserpass.bat %element% 1qaz2wsx3edc$RFV%pass%,,Hide
			}
	}
	Return
}

RemoveUser:
{
	SetWorkingDir, %A_ScriptDir%	
	Gui, Submit, NoHide
	StringReplace, UserList, UserList, `n,, All
	if (UserList != currentuser)
	{
		RunWait, *Runas ..\users\rmuser.bat %UserList%,,Hide
	}
	else
	{
		MsgBox, You cannot delete %UserList%
	}
	Return
}

PromoteUser:
{
	SetWorkingDir, %A_ScriptDir%	
	Gui, Submit, NoHide
	StringReplace, UserList, UserList, `n,, All
	RunWait, *Runas ..\users\pmuser.bat %UserList%,,Hide
	Return
}

DemoteUser:
{
	SetWorkingDir, %A_ScriptDir%	
	Gui, Submit, NoHide
	StringReplace, UserList, UserList, `n,, All
	RunWait, *Runas ..\users\dmuser.bat %UserList%,,Hide
	Return
}

AddUser:
{
	SetWorkingDir, %A_ScriptDir%	
	Gui, Submit, NoHide
	InputBox, input, Username to add account
	RunWait, *Runas ..\users\adduser.bat %input%,,Hide
	Return
}
;Search tab
StartSearch:
{
	SetWorkingDir, %A_ScriptDir%
	Gui, Submit, NoHide
	StringReplace, ListCheck, ListCheck, |,`n,All
	FileDelete, ..\search\searchlist\listcheck.txt
	FileAppend, %ListCheck%, ..\search\searchlist\listcheck.txt
	result :=
	Loop, Read, ..\search\searchlist\listcheck.txt
	{
		currentex := A_LoopReadLine
		Loop, Files, %Path%\*.%currentex%,FR
		{
			result := result . "`n" . A_LoopFileFullPath
		}
	}
	StringReplace, result, result, `n, |,All
	GuiControl,,Results,%result%
	Loop 20
	{
		Gui, Flash
		Sleep, 500
	}
	return
}

Look:
{
	Gui, Submit, NoHide
	StringReplace, Results, Results, |,`n,All
	MsgBox, %Results%
	Return
}
Delete:
{
	SetWorkingDir, %A_ScriptDir%
	Gui, Submit, NoHide
	StringReplace, Results, Results, |,`n,All
	FileDelete, ..\search\searchlist\dellist.txt
	FileAppend, %Results%, ..\search\searchlist\dellist.txt
	i := 0
	Loop, Read, ..\search\searchlist\dellist.txt
	{
		FileDelete, %A_LoopReadLine%
		i := i+1
	}
	MsgBox, %i% File(s) Deleted
	Return
}
Unhide:
{
	SetWorkingDir, %A_ScriptDir%
	RunWait,  ..\search\unhide.bat
	Return
}
Return
;end of tab functions
GuiClose:
ExitApp