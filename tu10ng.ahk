#Requires AutoHotkey v2.0
#SingleInstance

^8::{
    ; DetectHiddenWindows true

    if !WinExist("ahk_exe WindowsTerminal.exe")
        Run("wt.exe")
    else if WinActive("ahk_exe WindowsTerminal.exe")
        WinMinimize
    else
        WinActivate
}

$[::{
    Send "("
}

$]::{
    Send ")"
}

$(:: {
    Send "["
}

$)::{
    Send "]"
}
