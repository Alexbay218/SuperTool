SetWorkingDir, %A_ScriptDir%
Gui, New,,HashViewer v1.0
Gui, Add, Text,, Select current hashshot
Gui, Add, Button, gCurrentFileSelect, Open
Gui, Add, Text,, Select compare hashshot
Gui, Add, Button, gCompareFileSelect, Open
Gui, Add, Button, gCompare, Compare
Gui, Show
currentFile := "NULL"
compareFile := "NULL"
Return

CurrentFileSelect:
FileSelectFile, currentFile, 3, %A_ScriptDir%\..`\
Return

CompareFileSelect:
FileSelectFile, compareFile, 3, %A_ScriptDir%\..`\
Return

Compare:
if(currentFile != "NULL" && compareFile != "NULL") {
  Run, %A_ScriptDir%\bin\main.exe %currentFile% %compareFile%
}
else {
  MsgBox, Select hashshots to compare
}
Return

GuiClose:
ExitApp