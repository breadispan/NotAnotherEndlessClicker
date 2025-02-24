#Persistent
Menu, Tray, Tip, Press "F2" to start Clicking
Menu, Tray, Icon, %A_ScriptDir%\icons\lmousewait.ico

global isClicking := false
global iconFiles := []
global iconIndex := 1
global animationFolder := A_ScriptDir . "\animation"

LoadIcons() {
    global iconFiles, animationFolder
    iconFiles := []
    Loop, Files, %animationFolder%\*.ico
    {
        iconFiles.Push(A_LoopFileFullPath)
    }
    if (iconFiles.Length() == 0) {
        MsgBox, No icons found in 'animation' folder. Please add `.ico` files.
    }
}

AnimateTrayIcon() {
    global isClicking, iconFiles, iconIndex
    if (!isClicking) {
        SetTimer, AnimateTrayIcon, Off
        return
    }

    if (iconFiles.Length() > 0) {
        Menu, Tray, Icon, % iconFiles[iconIndex]
        iconIndex++
        if (iconIndex > iconFiles.Length()) {
            iconIndex := 1
        }
    }
}

F2::
    Gui, Destroy
    Gui, Add, Text,, 🖱️
    Gui, Add, Edit, vinterval ym w150, Set seconds interval
    Gui, Add, Edit, vclickAmount w150, Set clicks amount
    Gui, Add, Text,, ⚠️ Move your mouse to the click position
    Gui, Add, Button, Default gStartClicking, OK
    Gui, Add, Text,, Press Esc to exit
    Gui, Show,, Auto Clicker Config
return

StartClicking:
    Gui, Submit, NoHide
    if (interval = "" or clickAmount = "" or interval = "set seconds interval" or clickAmount = "set clicks amount") {
        MsgBox, Please enter valid values for interval and click amount.
        return
    }

    interval := interval * 1000
    clickAmount := clickAmount + 0

    if (interval <= 0 or clickAmount <= 0) {
        MsgBox, Invalid input. Please enter positive numbers.
        return
    }

    Gui, Destroy
    MsgBox, Move your mouse to the click position and press F3 to start.
return

F3::
    LoadIcons()
    if (iconFiles.Length() == 0)
        return

    MouseGetPos, x, y
    startTime := A_TickCount
    isClicking := true

    SetTimer, AnimateTrayIcon, 100

    Loop, %clickAmount%
    {
        Click, %x%, %y%

        if (iconFiles.Length() > 0) {
            Menu, Tray, Icon, % iconFiles[iconIndex]
            iconIndex++
            if (iconIndex > iconFiles.Length()) {
                iconIndex := 1
            }
        }

        Sleep, %interval%
    }

    isClicking := false
    SetTimer, AnimateTrayIcon, Off
    Menu, Tray, Icon, %A_ScriptDir%\icons\leftclick.ico

    totalTime := Round((A_TickCount - startTime) / 1000)
    MsgBox, Done!`nTime elapsed: %totalTime% seconds`nTotal clicks: %clickAmount%
return

Esc::
    isClicking := false
    SetTimer, AnimateTrayIcon, Off
    Menu, Tray, Icon, %A_ScriptDir%\icons\leftclick.ico
    ExitApp
return
