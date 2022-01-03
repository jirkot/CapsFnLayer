;Functionality:
; - Deactivates Capslock for normal use. You can turn Capslock back on & suspend the script by pressing Win + Capslock.
; - Access the following functions when pressing Capslock: 
;     Cursor keys               - J, K, L, I
;     Enter                     - Space
;     Home, End, PgDn, PgUp     - H, E, D, U
;     Backspace, Insert, Del    - B, N, M
;     Tab                       - T
;     Undo, redo                - , and .
;     Num row                   - Esc and F keys
;     Win Key                   - W
;     Ctrl, Shift, Alt          - Q, S, A

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Persistent
SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff

; Capslock + Q, S, A => Ctrl, Shift, Alt
Capslock & q::Send {Blind}{Ctrl Down}
Capslock & q up::Send {Blind}{Ctrl Up}
;Capslock & s::Send {Blind}{Shift Down}
;Capslock & s up::Send {Blind}{Shift Up}
;Capslock & a::Send {Blind}{Alt Down}
;Capslock & a up::Send {Blind}{Alt Up}

; Capslock + , => Undo
Capslock & ,::Send {Blind}{Ctrl Down}{z}{Ctrl Up}
;Capslock & , up::Send {Ctrl Up}{z Up}

; Capslock + . => Redo
Capslock & .::Send {Blind}{Ctrl Down}{y}{Ctrl Up}
;Capslock & . up::Send {Ctrl Up}{y Up}

; Capslock + J, K, L, I => Left, Down, Right, Up
Capslock & j::Send {Blind}{Left Down}
;Capslock & j up::Send {Blind}{Left Up}
Capslock & k::Send {Blind}{Down Down}
;Capslock & k up::Send {Blind}{Down Up}
Capslock & l::Send {Blind}{Right Down}
;Capslock & l up::Send {Blind}{Right Up}
Capslock & i::Send {Blind}{Up Down}
;Capslock & i up::Send {Blind}{Up Up}

; Capslock + O, U, H, E => Pg Down, Pg Up, Home, End
Capslock & h::Send {Blind}{Home}
;Capslock & h up::Send {Blind}{Home Up}
Capslock & e::Send {Blind}{End}
;Capslock & e up::Send {Blind}{End Up}
Capslock & u::Send {Blind}{PgUp}
;Capslock & u up::Send {Blind}{PgUp Up}
Capslock & o::Send {Blind}{PgDn}
;Capslock & d up::Send {Blind}{PgDn Up}

; Capslock + B, N, M => Backspace, Insert, Delete
Capslock & b::Send {Blind}{BS}
Capslock & n::Send {Blind}{Insert}
Capslock & m::Send {Blind}{Del}

; Fn + P -> PrintScreen
Capslock & p::Send {PrintScreen}

; Capslock + T => Tab
Capslock & t::Send {Blind}{Tab}
;Capslock & t up::Send {Blind}{Tab Up}

; Capslock + W => Win key
Capslock & w::Send {Blind}{LWin Down}
Capslock & w up::Send {Blind}{LWin Up}

; Capslock + Tab => Previous tab
;Capslock & Tab::Send {Ctrl Down}{Shift Down}{Tab Down}
;Capslock & Tab up::Send {Ctrl Up}{Shift Up}{Tab Up}

; Capslock + Space => Enter
Capslock & Space::Send {Enter}

; Capsloc + ~` => Esc
Capslock & SC029::Send {Blind}{Esc}    ; SC029 = ~`
Capslock & SC029 up::Send {Blind}{Esc Up}

; Win key + Capslock => Suspend hotkeys and rertun the normal Capslock on/off functionality
IsSuspended := False
#Capslock::
   Suspend
   IsSuspended := !IsSuspended
   If IsSuspended {
      SetCapsLockState, On
   }
   Else {
      SetCapsLockState, AlwaysOff
   }
   Return

; Turn on/off layer with CZ letter with diacritis. If it's off then the num row can be used as Esc & F keys.
IsCzLayerOn := False
Capslock & c::
   IsCzLayerOn := !IsCzLayerOn
Return

; Capslock + 1 => Latin letter 'o' with acute or F1 (if IsCzLayerOn is false)
Capslock & 1::
If IsCzLayerOn {
   If GetKeyState("Shift", "P")
      Send {Blind}{U+00D3}
   Else
      Send {Blind}{U+00F3}
   Return
}
Else {
   Send {Blind}{F1}
}
Return

; Capslock + 2 => Latin letter 'e' with caron or F2 (if IsCzLayerOn is false)
Capslock & 2::
If IsCzLayerOn {
   If GetKeyState("Shift", "P")
      Send {Blind}{U+011A}
   Else
      Send {Blind}{U+011B}
   Return
}
Else {
   Send {Blind}{F2}
}
Return

; Capslock + 3 => Latin letter 's' with caron or F3 (if IsCzLayerOn is false)
Capslock & 3::
If IsCzLayerOn {
   If GetKeyState("Shift", "P")
      Send {Blind}{U+0160}
   Else
      Send {Blind}{U+0161}
   Return
}
Else {
   Send {Blind}{F3}
}
Return

; Capslock + 4 =>  Latin letter 'c' with caron or F4 (if IsCzLayerOn is false)
Capslock & 4::
If IsCzLayerOn {
   If GetKeyState("Shift", "P")
      Send {Blind}{U+010C}
   Else
      Send {Blind}{U+010D}
   Return
}
Else {
   Send {Blind}{F4}
}
Return

; Capslock + 5 => Latin letter 'r' with caron or F5 (if IsCzLayerOn is false)
Capslock & 5::
If IsCzLayerOn {
   If GetKeyState("Shift", "P")
      Send {Blind}{U+0158}
   Else
      Send {Blind}{U+0159}
   Return
}
Else {
   Send {Blind}{F5}
}
Return

; Capslock + 6 => Latin letter 'z' with caron or F6 (if IsCzLayerOn is false)
Capslock & 6::
If IsCzLayerOn {
   If GetKeyState("Shift", "P")
      Send {Blind}{U+017D}
   Else
      Send {Blind}{U+017E}
   Return
}
Else {
   Send {Blind}{F6}
}
Return

; Capslock + 7 => Latin letter 'y' with acute or F7 (if IsCzLayerOn is false)
Capslock & 7::
If IsCzLayerOn {
   If GetKeyState("Shift", "P")
      Send {Blind}{U+00DD}
   Else
      Send {Blind}{U+00FD}
   Return
}
Else {
   Send {Blind}{F7}
}
Return

; Capslock + 8 => Latin letter 'a' with acute or F8 (if IsCzLayerOn is false)
Capslock & 8::
If IsCzLayerOn {
   If GetKeyState("Shift", "P")
      Send {Blind}{U+00C1}
   Else
      Send {Blind}{U+00E1}
   Return
}
Else {
   Send {Blind}{F8}
}
Return

; Capslock + 9 => Latin letter 'i' acute or F9 (if IsCzLayerOn is false)
Capslock & 9::
If IsCzLayerOn {
   If GetKeyState("Shift", "P")
      Send {Blind}{U+00CD}
   Else
      Send {Blind}{U+00ED}
   Return
}
Else {
   Send {Blind}{F9}
}
Return

; Capslock + 0 => Latin letter 'e' with acute or F10 (if IsCzLayerOn is false)
Capslock & 0::
If IsCzLayerOn {
   If GetKeyState("Shift", "P")
      Send {Blind}{U+00C9}
   Else
      Send {Blind}{U+00E9}
   Return
}
Else {
   Send {Blind}{F10}
}
Return

; Capslock + -_ => Latin letter 'd' with caron or F11 (if IsCzLayerOn is false)
Capslock & SC00C::
If IsCzLayerOn {
   If GetKeyState("Shift", "P")
      Send {Blind}{U+010E}
   Else
      Send {Blind}{U+010F}
   Return
}
Else {
   Send {Blind}{F11}
}
Return

; Capslock + =+ => Latin letter 't' with caron or F12 (if IsCzLayerOn is false)
Capslock & SC00D::
If IsCzLayerOn {
   If GetKeyState("Shift", "P")
      Send {Blind}{U+0164}
   Else
      Send {Blind}{U+0165}
   Return
}
Else {
   Send {Blind}{F12}
}
Return

; Capslock + =+ => Latin letter 'n' with carton or do nothing (if IsCzLayerOn is false)
Capslock & SC01B::
If IsCzLayerOn {
   If GetKeyState("Shift", "P")
      Send {Blind}{U+0147}
   Else
      Send {Blind}{U+0148}
   Return
}
Else {
}
Return

; Capslock + [{ => Latin letter 'u' with acute or do nothing (if IsCzLayerOn is false)
Capslock & SC01A::
If IsCzLayerOn {
   If GetKeyState("Shift", "P")
      Send {Blind}{U+00DA}
   Else
      Send {Blind}{U+00FA}
   Return
}
Else {
}
Return

; Capslock + ;: => Latin letter 'u' with ring or do nothing (if IsCzLayerOn is false)
Capslock & SC027::
If IsCzLayerOn {
   If GetKeyState("Shift", "P")
      Send {Blind}{U+016E}
   Else
      Send {Blind}{U+016F}
   Return
}
Else {
}
Return