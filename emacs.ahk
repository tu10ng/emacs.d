#Requires AutoHotkey v2.0
#SingleInstance

InstallKeybdHook
#UseHook

; The following line is a contribution of NTEmacs wiki http://www49.atwiki.jp/ntemacs/pages/20.html
SetKeyDelay 0

#Include ToolTipOptions.ahk
ToolTipOptions.Init()
ToolTipOptions.SetFont("BOLD s16", "Source Code Pro")
ToolTipOptions.SetColors("Black", "Green")

; ---------------------------------------------------------------
^8:: {
    ; DetectHiddenWindows true

    if !WinExist("ahk_exe WindowsTerminal.exe")
        Run("wt.exe")
    else if WinActive("ahk_exe WindowsTerminal.exe")
        WinMinimize
    else
        WinActivate
}

[:: {
    Send "("
}

]:: {
    Send ")"
}

(:: {
    Send "["
}

):: {
    Send "]"
}

CapsLock:: {
    Send "^#{Space}"
}

; `::{
;     Send "{/}"
; }

; --------------------------------------------------------------
; https://github.com/Eason0210/emacs.ahk

; turns to be 1 when ctrl-x is pressed
global IS_PRE_X := 0
; turns to be 1 when ctrl-space is pressed
global IS_PRE_SPC := 0
; turns to be 1 when Ctrl-c is pressed
global IS_PRE_C := 0

; Applications you want to disable emacs-like keybindings
; (Please comment out applications you don't use)
is_target()
{
    if WinActive("ahk_class ConsoleWindowClass") ; Cygwin
        return 1
    if WinActive("ahk_exe Code.exe") ;vscode
        return 1
    ; if WinActive("ahk_exe devenv.exe") ; Visual Studio 2022
    ;     return 1
    if WinActive("ahk_class VMwareUnityHostWndClass") ; Avoid VMwareUnity with AutoHotkey
        return 1
    if WinActive("ahk_class mintty")
        return 1
    if WinActive("ahk_class Window Class")
        return 1
    if WinActive("ahk_class CASCADIA_HOSTING_WINDOW_CLASS") ;Windows 10 terminal
        return 1
    if WinActive("ahk_class Vim") ; GVI
        return 1
    if WinActive("ahk_class Emacs") ; NTEmacs
        return 1
    if WinActive("ahk_class X410_XAppWin")
        return 1
    if WinActive("ahk_class RAIL_WINDOW")
        return 1
    return 0
}

is_smatraPDF()
{
    if WinActive("ahk_class SUMATRA_PDF_FRAME") ; smatraPDF
        return 1
    return 0
}

delete_char()
{
    Send "{Del}"
    global IS_PRE_SPC := 0
}

delete_word()
{
    Send "^{Del}"
    global IS_PRE_SPC := 0
}

delete_backward_char()
{
    Send "{BS}"
    global IS_PRE_SPC := 0
}
kill_line()
{
    Send "{ShiftDown}{END}{SHIFTUP}"
    Sleep 50 ;[ms] this value depends on your environment
    Send "^x"
    global IS_PRE_SPC := 0
}
open_line()
{
    Send "{END}{Enter}{Up}"
    global IS_PRE_SPC := 0
}

open_line_emacs()
{
    Send "{End}^{Enter}"
    global IS_PRE_SPC := 0
}
quit()
{
    Send "{ESC}"
    global IS_PRE_SPC := 0
}
newline()
{
    Send "{Enter}"
    global IS_PRE_SPC := 0
}

duplicate_line()
{
    ; TODO ?
    Send "^d"
    global IS_PRE_SPC := 0
}

newline_emacs()
{
    Send "{END}{Enter}"
    global IS_PRE_SPC := 0
}
indent_for_tab_command()
{
    Send "{Tab}"
    global IS_PRE_SPC := 0
}

indent_for_tab_command_invert()
{
    Send "+{Tab}"
    global IS_PRE_SPC := 0
}
newline_and_indent()
{
    Send "{Enter}{Tab}"
    global IS_PRE_SPC := 0
}
isearch_forward()
{
    Send "^f"
    global IS_PRE_SPC := 0
}
query_replace()
{
    Send "^h"
    global IS_PRE_SPC := 0
}
kill_region()
{
    Send "^x"
    global IS_PRE_SPC := 0
}
copy()
{
    Send "^c"
    global IS_PRE_SPC := 0
}
paste()
{
    Send "^v"
    global IS_PRE_SPC := 0
}
undo()
{
    Send "^z"
    global IS_PRE_SPC := 0
}

redo()
{
    Send "^y"
    global IS_PRE_SPC := 0
}
find_file()
{
    Send "^o"
    global IS_PRE_X := 0
}
save_buffer()
{
    Send "^s"
    global IS_PRE_X := 0
}
kill_emacs()
{
    Send "!{F4}"
    global IS_PRE_X := 0
}

move_beginning_of_line()
{
    global
    if IS_PRE_SPC
        Send "+{HOME}"
    else
        Send "{HOME}"
}
move_end_of_line()
{
    global
    if IS_PRE_SPC
        Send "+{END}"
    else
        Send "{END}"
}
previous_line()
{
    global
    if IS_PRE_SPC
        Send "+{Up}"
    else
        Send "{Up}"
}
next_line()
{
    global
    if IS_PRE_SPC
        Send "+{Down}"
    else
        Send "{Down}"
}
forward_char()
{
    global
    if IS_PRE_SPC
        Send "+{Right}"
    else
        Send "{Right}"
}
backward_char()
{
    global
    if IS_PRE_SPC
        Send "+{Left}"
    else
        Send "{Left}"
}

forward_word()
{
    global
    if IS_PRE_SPC
        Send "^+{Right}"
    else
        Send "^{Right}"
}

backward_word()
{
    global
    if IS_PRE_SPC
        Send "^+{Left}"
    else
        Send "^{Left}"
}

scroll_up()
{
    global
    if IS_PRE_SPC
        Send "+{PgUp}"
    else
        Send "{PgUp}"
}
scroll_down()
{
    global
    if IS_PRE_SPC
        Send "+{PgDn}"
    else
        Send "{PgDn}"
}

mark_whole_buffer()
{
    Send "^{End}^+{Home}"
    global IS_PRE_SPC := 0
}

^f::
{
    if is_target()
        Send(A_ThisHotkey)
    else
    {
        forward_char()
    }
}
!f::
{
    if is_target()
        Send(A_ThisHotkey)
    else
        forward_word()
}
!b::
{
    if is_target()
        Send(A_ThisHotkey)
    else
        backward_word()
}

^d::
{
    if is_target()
        Send(A_ThisHotkey)
    else
    {
        delete_char()
    }
}
!d::
{
    if is_target()
        Send(A_ThisHotkey)
    else
        delete_word()
}

; TODO bug: will kill backward and then insert 'S'
; !BS::{
;     if (is_target()) {
;         Send(A_ThisHotkey)
;     } else {
;         Send("^{BS}")
;     }
; }

^k::
{
    if is_target()
        Send(A_ThisHotkey)
    else
        kill_line()
}
^o::
{
    if is_target()
        Send(A_ThisHotkey)
    else
        open_line_emacs()
    ; TODO: send C-enter in wechat
}
^g::
{
    if is_target()
        Send(A_ThisHotkey)
    else
        quit()
}

^s::
{
    if is_target()
        Send(A_ThisHotkey)
    else
    {
        ; save_buffer()
        isearch_forward()
    }
}

^p::
{
    if is_target()
        Send(A_ThisHotkey)
    else
        previous_line()
}

^n::
{
    if is_target()
        Send(A_ThisHotkey)
    else
        next_line()
}

^b::
{
    if is_target()
        Send(A_ThisHotkey)
    else
        backward_char()
}

;; Toggle Chinese and English input method
^\::
{
    Send "^#{Space}"
}

;; For Visual Studio Code
;; Goto Ducument M-.
!.::
{
    if is_target()
        Send(A_ThisHotkey)
    else
        Send "^{Right}"
}

;; Back to last location M-,
!,::
{
    if is_target()
        Send(A_ThisHotkey)
    else
        Send "^{Left}"
}

;; Toggle line comment C-x,C-;
!;::
{
    if is_target()
        Send(A_ThisHotkey)
    else
    {
        Send "^{/}"
    }
}

; --------------------------------------------------
; https://github.com/bceenaeiklmr/Taskbar-Color-Shifter/blob/main/TaskBar_ColorShift.ahk

taskbar_change_color(c1 := 0x000000, p := 0x80) {
    r := (0xff0000 & c1) >> 16
    g := (0x00ff00 & c1) >> 8
    b := 0x0000ff & c1

    Color := Format("{:#02x}{:02x}{:02x}{:02x}", p, b, g, r)

    TaskBar_SetAttr(2, Color)
}

taskbar_blur() {
    TaskBar_SetAttr(3)
}

taskbar_transparent() {
    TaskBar_SetAttr(2, "0x01000000")
}

/**
 * The following function is a fork (update to v2) of jNizM's Make the Windows 10 taskbar translucent (blur) repository.
 * https://github.com/jNizM/AHK_TaskBar_SetAttr/tree/master
 * https://autohotkey.com/boards/viewtopic.php?f=6&t=26752
 * 
 * TaskBar_SetAttr(option, color)
 * 
 * option -> 0 = off,
 *           1 = gradient    (+color),
 *           2 = transparent (+color),
 *           3 = blur
 * 
 * color  -> ABGR (alpha | blue | green | red) 0xffd7a78f
 */
TaskBar_SetAttr(accent_state := 0, gradient_color := "0x01000000")
{
    static init, hTrayWnd, ver := DllCall("GetVersion") & 0xff < 10
    static pad := A_PtrSize = 8 ? 4 : 0, WCA_ACCENT_POLICY := 19

    if !IsSet(init) {
        if (ver)
            throw ValueError("Minimum support client: Windows 10", -1)
        if !(hTrayWnd := DllCall("user32\FindWindow", "str", "Shell_TrayWnd", "ptr", 0, "ptr"))
            throw ValueError("Failed to get the handle", -1)
        init := 1
    }

    ACCENT_POLICY := Buffer(16, 0)
    NumPut("int", (accent_state > 0 && accent_state < 4) ? accent_state : 0, ACCENT_POLICY, 0)

    if (accent_state >= 1) && (accent_state <= 2) && (RegExMatch(gradient_color, "0x[[:xdigit:]]{8}"))
        NumPut("int", gradient_color, ACCENT_POLICY, 8)

    WINCOMPATTRDATA := Buffer(4 + pad + A_PtrSize + 4 + pad, 0)
    NumPut("int", WCA_ACCENT_POLICY, WINCOMPATTRDATA, 0)
    NumPut("ptr", ACCENT_POLICY.ptr, WINCOMPATTRDATA, 4 + pad)
    NumPut("uint", ACCENT_POLICY.Size, WINCOMPATTRDATA, 4 + pad + A_PtrSize)
    if !(DllCall("user32\SetWindowCompositionAttribute", "ptr", hTrayWnd, "ptr", WINCOMPATTRDATA.ptr))
        throw ValueError("Failed to set transparency / blur", -1)

    ; https://www.autohotkey.com/boards/viewtopic.php?f=6&t=26752&sid=0fef180ce2f81a9265b75a6d6384d66f&start=20
    ohMultipleMonitor := WinGetList("ahk_class Shell_SecondaryTrayWnd")
    ahMultipleMonitor := Array()
    For v in ohMultipleMonitor {
        ahMultipleMonitor.Push(v)
    }
    if (ahMultipleMonitor.Length) {
        Loop ahMultipleMonitor.Length {
            if !(DllCall("user32\SetWindowCompositionAttribute", "ptr", ahMultipleMonitor[A_Index], "ptr", WINCOMPATTRDATA))
                throw ValueError("Failed to set transparency / blur 2", -1)
        }
    }
    return true
}

; --------------------------------------------------
SetTimer(WatchCursor, 16) ; 1000ms/60fps =~ 16.7ms

ReadImeState()
{
    DetectHiddenWindows(true)

    hWnd := WinGetId("A")
    id := DllCall("imm32\ImmGetDefaultIMEWnd", "Uint", hWnd, "Uint")

    ret := SendMessage(0x283, 0x005, 0, , id)
    Return ret
}

WatchCursor() {
    try {
        imeState := ReadImeState()
        ; ToolTip(imeState)
    } catch as e {
        taskbar_transparent()
        return
    }

    if (imeState == 0) { ; english
        taskbar_transparent()
    } else if (imeState == 1) { ; chinese
        if WinActive("ahk_exe WeChat.exe") { ; TODO: when mouse is hover over wechat, even wechat isn't the active window, will return imeState == 1
            taskbar_transparent()
            return
        }
        if WinActive("ahk_exe Telegram.exe") { ; telegram the same
            taskbar_transparent()
            return
        }
        taskbar_change_color(0xff0000)

        if (A_TimeIdle > 5000) {
            Send "^#{Space}"
        }
    } else {
        taskbar_transparent()
    }

}