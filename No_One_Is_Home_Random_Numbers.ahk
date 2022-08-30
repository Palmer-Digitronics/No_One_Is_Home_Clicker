#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

List(listName,integer)
{
 Loop, parse, listName, |
 {
  If (integer = A_Index) {
   returnValue := A_LoopField
  }
 }
 return returnValue
}

phonex = 1580
phoney = 880

cancelx = 1090
cancely = 370

onex = 870
oney = 470
twox = 980
twoy = 470
threex = 1090
threey = 470

fourx = 870
foury = 590
fivex = 980
fivey = 590
sixx = 1090
sixy = 590

sevenx = 870
seveny = 700
eightx = 870
eighty = 700
ninex = 1090
niney = 700

zerox = 980
zeroy = 823

numx = %zerox%|%onex%|%twox%|%threex%|%fourx%|%fivex%|%sixx%|%sevenx%|%eightx%|%ninex%
numy = %zeroy%|%oney%|%twoy%|%threey%|%foury%|%fivey%|%sixy%|%seveny%|%eighty%|%niney%

IfWinExist, Thimbleweed Park
    WinActivate
Else
    MsgBox,, No One Is Home Clicker, Thimbleweed Park doesn't seem to be running

Sleep, 600

Loop
{   
    Click, %phonex% %phoney%

    Sleep, 500
    
    Random x1, 1, 9
    thisx := List(numx,x1)
    thisy := List(numy,x1)

    Click, %thisx%, %thisy%

    Sleep 500

    Random x2, 0, 9
    thisx := List(numx,x2)
    thisy := List(numy,x2)
    
    Click, %thisx%, %thisy%

    Sleep 500

    Random x3, 0, 9
    thisx := List(numx,x3)
    thisy := List(numy,x3)

    Click, %thisx%, %thisy%

    Sleep 500
    
    Random x4, 0, 9
    thisx := List(numx,x4)
    thisy := List(numy,x4)

    Click, %thisx%, %thisy%

    Sleep 4500

    Click, %cancelx% %cancely%

    Sleep, 700
}

Esc::ExitApp