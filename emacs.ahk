#Requires AutoHotkey v2.0
#SingleInstance

InstallKeybdHook
#UseHook

; The following line is a contribution of NTEmacs wiki http://www49.atwiki.jp/ntemacs/pages/20.html
SetKeyDelay 0

; ---------------------------------------------------------------
^8::{
    ; DetectHiddenWindows true

    if !WinExist("ahk_exe WindowsTerminal.exe")
        Run("wt.exe")
    else if WinActive("ahk_exe WindowsTerminal.exe")
        WinMinimize
    else
        WinActivate
}

[::{
    Send "("
}

]::{
    Send ")"
}

(:: {
    Send "["
}

)::{
    Send "]"
}

CapsLock::{
    ; TODO: 根据按下的时间, 选择瞬间切换还是切换其他窗口
    Send "!{TAB}"
}

`::{
    Send "{/}"
}

/::{
    Send "``"
}

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
        save_buffer()
        isearch_forward()
    }
}
^r::
{
    if is_target()
        Send(A_ThisHotkey)
    else
        query_replace()
}

!w::
{
    if is_target()
        Send(A_ThisHotkey)
    else
        copy()
}
^y::
{
    if is_target()
        Send(A_ThisHotkey)
    else
        paste()
}
^/::
{
    if is_target()
        Send(A_ThisHotkey)
    else
        undo()
}
^+/::
{
    if is_target()
        Send(A_ThisHotkey)
    else
        redo()
}

;; Set the mark with C-SPC in Emacs
^Space::
{
    if WinActive("ahk_class Emacs") or WinActive("ahk_class  X410_XAppWin")
        Send "^{@}"
    else
    {
        if is_target()
            Send "{CtrlDown}{Space}{CtrlUp}"
        else
        {
            if IS_PRE_SPC
                global IS_PRE_SPC := 0
            else
                global IS_PRE_SPC := 1
        }
    }
}

^a::
{
    if is_target()
        Send(A_ThisHotkey)
    else
        move_beginning_of_line()
}
^e::
{
    if is_target()
        Send(A_ThisHotkey)
    else
        move_end_of_line()
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
#Include ToolTipOptions.ahk
ToolTipOptions.Init()
ToolTipOptions.SetFont("BOLD s10", "Source Code Pro")
ToolTipOptions.SetColors("Black", "Green")

SetTimer WatchCursor, 16 ; 1000ms/60fps =~ 16.7ms

ReadImeState(hWnd)
{
    ; WinGet,hWnd,ID,%WinTitle%
    Return Send_ImeControl(ImmGetDefaultIMEWnd(hWnd), 0x005, "")
}

Send_ImeControl(DefaultIMEWnd, wParam, lParam)
{
    DetectHiddenWindows(true)
    try {
        ErrorLevel := SendMessage(0x283, wParam, lParam, , "ahk_id " DefaultIMEWnd)
    } catch as e {
        ; some window will will return error
        return -1
    } else {
        return ErrorLevel
    }
}

ImmGetDefaultIMEWnd(hWnd)
{
    return DllCall("imm32\ImmGetDefaultIMEWnd", "Uint", hWnd, "Uint")
}

WatchCursor(){
    ; TODO: only show toop tip after user clicks
    MouseGetPos(&x, &y, &id, &control)

    imeState := ReadImeState(id)

    ; should show ENG label?
    if(imeState == -1){
        ToolTip()
        return
    } else if (imeState == 0) {
        ToolTip("E")
        return
    } else {
        ToolTip("Z")
        return
    }
}

