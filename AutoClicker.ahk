; AutoClicker.ahk

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Variables
clicking := false
interval := 1000  ; Default interval in milliseconds

; GUI
Gui, Add, Text,, Step (s):
Gui, Add, Edit, vIntervalInput ym w40, 30
Gui, Add, Button, gStartStop w40, Start
Gui, Show,, _

return

; Start/Stop Button Handler
StartStop:
    if (!clicking)
    {
        Gui, Submit, NoHide
        interval := IntervalInput * 1000
        clicking := true
        GuiControl,, Button1, Stop
        SetTimer, AutoClick, %interval%
    }
    else
    {
        clicking := false
        GuiControl,, Button1, Start
        SetTimer, AutoClick, Off
    }
return

; AutoClick Function
AutoClick:
    Click
return

; Close GUI Handler
GuiClose:
    ExitApp
