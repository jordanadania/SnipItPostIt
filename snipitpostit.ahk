~F6::Reload

!^.::WinSet, Style, ^0xC00000, A
!^a::WinSet, AlwaysOnTop, toggle, A

i := 1
!^p::
i++

if DllCall("OpenClipboard", "ptr", 0){
	if DllCall("IsClipboardFormatAvailable", "uint", 2)
		hBitmap := DllCall("GetClipboardData", "uint", 2, "ptr")
	else
		return
	DllCall("CloseClipboard")
}
Gui %i%: Add, Picture, hwndmypic, % "HBITMAP:*" hBitmap
ControlGetpos,,,wh,ht,,ahk_id %mypic%
wh *= .8
ht *= .8
Gui %i%: Destroy
Gui %i%: Add, Picture, x0 y0 w%wh% h%ht%, % "HBITMAP:*" hBitmap
Gui %i%: Show, w%wh% h%ht%
Gui %i%: +Resize
return