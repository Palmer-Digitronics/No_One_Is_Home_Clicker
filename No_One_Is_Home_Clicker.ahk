#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

/*
This is a clicker script for Thimbleweed Park, to get the No One is Home achievement.

For this to work properly, you need to be using the default safe area and the full Screen
1920x1080 resolution. 

Thimbleweed Park must be running before running this script - You will need to be playing
as Agent Ray at a point where she has the cell phone in her third inventory slot. If you 
collected the county map with Ray, you can use AutoHotkey's WindowSpy to find the 
appropriatenew coordinates, but it will probably be quicker to start a new save until 
you can make calls with Ray.

These numbers are all straight from the phone book, but not all numbers answer on the
first ring. It seems to be a little better than 50% for me, so there are 190 numbers
here to get you the required 100. If you do not have the No One is Home achievement
after this finishes, you will either be very close with just a few calls left to
make by hand, or your resolution/window size doesn't match the standard.

Thanks to steam user offfffffff who wrote the original python script for the linux
version of this game that inspired me (and supplied coordinates to me) to write
this AHK version for windows. 

offfffffff's Original python script at:
https://steamcommunity.com/sharedfiles/filedetails/?id=1798902895
*/


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

numbers =
(
    six|two|seven|nine, 
    six|three|two|eight, 
    three|one|seven|two, 
    three|one|eight|zero, 
    two|six|eight|four, 
    eight|six|one|five, 
    two|eight|three|four, 
    four|five|zero|six, 
    five|five|five|six, 
    seven|one|four|five, 
    five|eight|one|zero, 
    four|two|seven|zero, 
    four|three|one|five, 
    five|eight|eight|two, 
    one|four|zero|three, 
    two|two|two|eight, 
    two|nine|five|eight, 
    one|seven|one|five, 
    five|one|five|five, 
    four|zero|two|four, 
    four|eight|seven|zero, 
    one|two|four|one, 
    eight|eight|nine|one, 
    two|nine|four|six, 
    eight|six|seven|seven, 
    seven|zero|six|five, 
    six|six|eight|zero, 
    six|six|three|zero, 
    five|four|zero|four, 
    five|seven|five|two, 
    seven|two|one|nine, 
    three|two|seven|eight, 
    two|two|zero|three, 
    one|six|five|seven, 
    eight|three|four|four, 
    three|eight|three|five, 
    two|four|zero|nine, 
    one|seven|nine|eight, 
    one|seven|zero|seven, 
    six|four|seven|five, 
    seven|four|nine|three, 
    two|six|eight|one, 
    two|nine|two|nine, 
    four|four|five|nine, 
    two|two|six|one, 
    two|one|five|six, 
    five|two|eight|four, 
    six|four|four|five, 
    seven|five|seven|one, 
    four|seven|zero|one, 
    one|five|seven|six, 
    one|three|four|eight, 
    five|one|nine|six, 
    three|three|one|five, 
    four|seven|seven|four, 
    two|five|four|zero, 
    three|five|seven|four, 
    one|five|seven|four, 
    one|zero|nine|nine, 
    two|seven|eight|nine, 
    seven|seven|nine|nine, 
    seven|five|zero|six, 
    three|six|zero|six, 
    seven|seven|eight|nine, 
    six|one|one|four, 
    two|zero|two|two, 
    four|nine|eight|six, 
    eight|one|one|seven, 
    three|seven|nine|zero, 
    eight|two|four|three, 
    four|one|four|zero, 
    three|three|seven|two, 
    eight|six|three|eight, 
    five|nine|four|three, 
    seven|four|seven|nine, 
    five|three|three|eight, 
    four|seven|one|six, 
    seven|eight|three|eight, 
    eight|nine|four|eight, 
    three|five|two|nine, 
    one|eight|three|one, 
    five|zero|two|zero, 
    two|five|one|five, 
    five|three|four|five, 
    five|five|five|five, 
    seven|nine|zero|two, 
    one|two|one|eight, 
    seven|two|zero|seven, 
    three|seven|five|two, 
    five|nine|four|two, 
    three|two|eight|four, 
    seven|two|eight|five, 
    three|nine|six|nine, 
    five|seven|zero|seven, 
    eight|eight|four|seven, 
    five|five|two|five, 
    three|two|nine|three, 
    seven|six|nine|nine, 
    two|seven|zero|two, 
    five|six|four|nine, 
    six|zero|one|eight, 
    six|seven|one|zero, 
    five|three|nine|three, 
    one|one|five|seven, 
    one|zero|eight|zero, 
    three|nine|four|two, 
    seven|three|nine|seven, 
    one|zero|five|seven, 
    five|four|eight|one, 
    four|six|four|six, 
    four|nine|two|five, 
    five|eight|nine|five, 
    seven|zero|three|four, 
    two|nine|three|zero, 
    eight|five|six|nine, 
    six|seven|two|nine, 
    five|two|one|six, 
    one|nine|three|nine, 
    two|three|seven|three, 
    three|eight|eight|three, 
    four|one|three|five, 
    two|zero|two|eight, 
    eight|zero|four|two, 
    one|three|eight|nine, 
    one|six|zero|eight, 
    five|four|nine|four, 
    one|five|nine|one, 
    four|nine|nine|zero, 
    five|three|eight|four, 
    three|nine|seven|two, 
    six|seven|one|seven, 
    two|nine|three|three, 
    four|four|eight|seven, 
    five|zero|nine|two, 
    two|one|two|four, 
    five|seven|nine|zero, 
    two|nine|four|one, 
    three|six|zero|five, 
    six|one|nine|four, 
    four|two|four|one, 
    three|one|nine|one, 
    seven|five|eight|three, 
    two|four|two|zero, 
    five|nine|five|three
    six|nine|three|eight, 
    two|zero|nine|seven, 
    eight|three|seven|seven, 
    one|seven|two|seven, 
    five|six|nine|nine, 
    six|five|eight|two, 
    two|two|zero|zero, 
    three|nine|three|five, 
    one|one|one|zero, 
    one|five|nine|eight, 
    four|four|six|one, 
    two|five|four|six, 
    one|one|eight|five, 
    five|zero|four|zero, 
    three|four|two|zero, 
    eight|zero|five|one, 
    four|four|seven|eight, 
    six|seven|three|four, 
    five|six|nine|three, 
    two|five|five|one, 
    three|zero|four|four, 
    three|four|five|seven, 
    three|four|nine|three, 
    five|nine|three|one, 
    six|nine|four|seven, 
    two|six|seven|three, 
    one|six|one|one, 
    six|zero|three|four, 
    seven|two|six|five, 
    four|five|seven|nine, 
    seven|seven|nine|five, 
    three|six|two|two, 
    four|five|eight|four, 
    six|nine|two|one, 
    one|nine|four|five, 
    one|seven|one|zero, 
    one|six|four|one, 
    eight|six|eight|six, 
    four|nine|one|eight, 
    three|four|one|two, 
    four|zero|seven|two, 
    seven|four|three|one, 
    eight|seven|seven|one, 
    six|zero|eight|three, 
)

Array := StrSplit(numbers, ",", "[],` ```n")

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
    ExitApp 1

Sleep, 600

Loop 190
{   
    Click, %phonex% %phoney%

    Sleep, 500
    
    thiscall := Array[A_Index]
    
    thisnum := List(thiscall,1)
    thisx = %thisnum%x
    thisy = %thisnum%y
    xcoords := %thisx%
    ycoords := %thisy%

    Click, %xcoords% %ycoords%

    Sleep 500

    thisnum := List(thiscall,2)
    thisx = %thisnum%x
    thisy = %thisnum%y
    xcoords := %thisx%
    ycoords := %thisy%

    Click, %xcoords% %ycoords%

    Sleep 500
    
    thisnum := List(thiscall,3)
    thisx = %thisnum%x
    thisy = %thisnum%y
    xcoords := %thisx%
    ycoords := %thisy%

    Click, %xcoords% %ycoords%

    Sleep 500
    
    thisnum := List(thiscall,4)
    thisx = %thisnum%x
    thisy = %thisnum%y
    xcoords := %thisx%
    ycoords := %thisy%

    Click, %xcoords% %ycoords%

    Sleep 5000

    Click, %cancelx% %cancely%

    Sleep, 700
}

MsgBox,, No One is Home Clicker, No One is Home Clicker Finished! Did you get the achievement?

Esc::ExitApp

ExitApp