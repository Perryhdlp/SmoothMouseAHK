#Persistent
; DISCLAIMER: 
; Script says running until it is manually closed. 
; To close the script, right click on the green "H" icon in the taskbar and click "Exit".

; This script is for Windows only. It will not work on Mac or Linux.

; This script requires AutoHotkey v1.1.33 or later.
; Download AutoHotkey at https://www.autohotkey.com/download/

; This script requires the D11Call function from the Windows API.

; To use this script, copy and paste the entire script into a text editor like Notepad, Notepad++, or Sublime Text.
; Save the file with a .ahk extension. For example: MouseMovement.ahk
; Double click on the file to run the script.

; To stop the script, right click on the green "H" icon in the taskbar and click "Exit".



; How to use: Press the arrow keys to move the mouse cursor by 5/10 pixels, 20 pixels, or 40 pixels
; Press the same arrow key again to stop the movement
; Press the Modifier + Escape key to stop all movement entirely

; How to add modifier keys to the arrow keys: "^" for Ctrl, "+" for Shift, "#" for Win, and "&" for Alt
; For example, "^Left" means Ctrl+Left, "+Right" means Shift+Right, and so on

; How to change the movement speeds: Change the values of the variables speed_slow, speed_normal, and speed_fast
; For example, speed_slow = 5 means the mouse cursor will move by 5 pixels each time the arrow key is pressed

; How to change the beep sound: Change the values of the variables beep_frequency and beep_duration
; For example, beep_frequency = 900 and beep_duration = 50 means the beep sound will be played at 900 Hz for 50 milliseconds

; Simple Explanation of the Code:
; The arrow keys are set to toggle the movement of the mouse cursor
; The movement speed is determined by the arrow key and the modifier key
; For example, Left means move left, Ctrl+Left means move left by 40 pixels, and Shift+Left means move left by 20 pixels
; The movement is stopped when the same arrow key is pressed again
; The movement is stopped entirely when the Modifier + Escape key is pressed
; The way the mouse is moved is by using the D11Call function to call the mouse_event function in the user32.dll library provided by Windows.

; ===================================================================================================================
;
;
; Initialization
;
;   - Set the beep sound
;   - Set the movement speeds
;   - Set the hotkey to stop all movement entirely when Escape key is pressed
;   - Initialize the toggle states for each movement speed
;
; ===================================================================================================================

; Set the beep sound
beep_frequency = 900
beep_duration = 50

; Set the movement speeds
speed_slow = 5
speed_normal = 20 
speed_fast = 40

; Hotkey to stop all movement entirely when Escape key is pressed
^Esc::
    toggleState10 := false
    toggleState20 := false
    toggleState40 := false
    StopAllMovementTimers()
    PlayBeep() ; Play the beep sound
return

; Initialize the toggle states for each movement speed
toggleState10 := false
toggleState20 := false
toggleState40 := false

; ===================================================================================================================
;
;
; Functions
;
;   - Function to stop a specific movement timer
;   - Function to stop all movement timers
;   - Function to play a simple beep sound
;
; ===================================================================================================================

; Function to stop a specific movement timer
StopMovementTimer(speed) {
    SetTimer, % "MoveMouse" . (speed < 0 ? "Left" : "Right") . Abs(speed), Off
}

; Function to stop all movement timers
StopAllMovementTimers() {
    StopMovementTimer(-10)
    StopMovementTimer(-20)
    StopMovementTimer(-40)
    StopMovementTimer(10)
    StopMovementTimer(20)
    StopMovementTimer(40)
}

; Function to play a simple beep sound
PlayBeep() {
    SoundBeep, beep_frequency,beep_duration
}


; ===================================================================================================================
;
;
; Arrow Key Hotkeys
;
;   - Set the arrow key with Ctrl to toggle 40-pixel movement
;   - Set the arrow key with Shift to toggle 20-pixel movement
;   - Set the arrow key without any modifier to toggle 10-pixel movement
;
; ===================================================================================================================

; Set the arrow key with Ctrl to toggle 40-pixel movement
^Left::
    toggleState40 := !toggleState40
    if (toggleState40) {
        SetTimer, MoveMouseLeft40, 1
        PlayBeep() ; Play the beep sound
    }
    else
        StopMovementTimer(-40)
return

^Right::
    toggleState40 := !toggleState40
    if (toggleState40) {
        SetTimer, MoveMouseRight40, 1
        PlayBeep() ; Play the beep sound
    }
    else
        StopMovementTimer(40)
return

; Set the arrow key with Shift to toggle 20-pixel movement
+Left::
    toggleState20 := !toggleState20
    if (toggleState20) {
        SetTimer, MoveMouseLeft20, 1
        PlayBeep() ; Play the beep sound
    }
    else
        StopMovementTimer(-20)
return

+Right::
    toggleState20 := !toggleState20
    if (toggleState20) {
        SetTimer, MoveMouseRight20, 1
        PlayBeep() ; Play the beep sound
    }
    else
        StopMovementTimer(20)
return

; Set the arrow key without any modifier to toggle 10-pixel movement
Left::
    toggleState10 := !toggleState10
    if (toggleState10) {
        SetTimer, MoveMouseLeft10, 1
        PlayBeep() ; Play the beep sound
    }
    else
        StopMovementTimer(-10)
return

Right::
    toggleState10 := !toggleState10
    if (toggleState10) {
        SetTimer, MoveMouseRight10, 1
        PlayBeep() ; Play the beep sound
    }
    else
        StopMovementTimer(10)
return


; ===================================================================================================================
;
;
; Movement Functions
;
;   - Function to move the mouse cursor left by 40 pixels
;   - Function to move the mouse cursor right by 40 pixels
;   - Function to move the mouse cursor left by 20 pixels
;   - Function to move the mouse cursor right by 20 pixels
;   - Function to move the mouse cursor left by 10 pixels
;   - Function to move the mouse cursor right by 10 pixels
;
; ===================================================================================================================

MoveMouseLeft10:
    if (!toggleState10)
        return
    DllCall("mouse_event", UInt, 0x0001, Int, -speed_slow, Int, 0, UInt, 0, UInt, 0)
return

MoveMouseRight10:
    if (!toggleState10)
        return
    DllCall("mouse_event", UInt, 0x0001, Int, speed_slow, Int, 0, UInt, 0, UInt, 0)
return

MoveMouseLeft20:
    if (!toggleState20)
        return
    DllCall("mouse_event", UInt, 0x0001, Int, -speed_normal, Int, 0, UInt, 0, UInt, 0)
return

MoveMouseRight20:
    if (!toggleState20)
        return
    DllCall("mouse_event", UInt, 0x0001, Int, speed_normal, Int, 0, UInt, 0, UInt, 0)
return

MoveMouseLeft40:
    if (!toggleState40)
        return
    DllCall("mouse_event", UInt, 0x0001, Int, -speed_fast, Int, 0, UInt, 0, UInt, 0)
return

MoveMouseRight40:
    if (!toggleState40)
        return
    DllCall("mouse_event", UInt, 0x0001, Int, speed_fast, Int, 0, UInt, 0, UInt, 0)
return
