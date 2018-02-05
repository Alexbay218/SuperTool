SetWorkingDir, %A_ScriptDir%
RunWait, lsuser.bat,,Hide
FileRead, formattedlist, list.txt
FileRead, currentuser, currentuser.txt
StringTrimRight, currentuser, currentuser, 3
StringTrimLeft, formattedlist, formattedlist, 114
StringTrimRight, formattedlist, formattedlist, 40

lines := StrSplit(formattedlist, "`n")

formattedlist :=

Loop % lines.length()
{
	e :=
	e := SubStr(lines[A_Index], 1, 49) . "|" . SubStr(lines[A_Index], 51)
	e := SubStr(e, 1, 25) . "|" . SubStr(e, 26)
	e := "|" . e
	formattedlist := formattedlist . e
}

StringReplace, formattedlist, formattedlist, %A_Space%,,All
StringReplace, formattedlist, formattedlist, `n,,All
StringReplace, formattedlist, formattedlist, `r,,All
StringReplace, formattedlist, formattedlist, |,
formattedlist := formattedlist . "|"

searchkey := "|"
currentusers := Object()
while InStr(formattedlist,searchkey)
{
	currentusers.Insert(SubStr(formattedlist,1,InStr(formattedlist,searchkey)-1))
	formattedlist := SubStr(formattedlist,InStr(formattedlist,searchkey)+1)
}
FileDelete, formattedlist.txt
FileAppend, %currentuser% `n, formattedlist.txt
for index, element in currentusers
{
	if (currentuser != element)
		FileAppend, %element% `n, formattedlist.txt
}
