#include-once
#include "jintutil.au3"

$VERSION = 1

Global $UID_DISKID = "abcdefg"





; -----------------------------------------  函数的分隔线  -----------------------------------------------

Func ClearCache()
	Sleep(500)

	If Not WinActive($TITLE, "") Then WinActivate($TITLE, "")
	Sleep(500)
	Send("^+{DEL}")
	Sleep(500)

	$title2 = "Delete Browsing History"
	WinActivate($title2, "")
	Send("{d 1}")
	Sleep(1000)
	WinWaitClose("正在删除")
	Sleep(500)
	MouseClick("left")
	Sleep(500)

EndFunc   ;==>ClearCache

Func OpenIE()
	If ProcessExists("iexplore.exe") Then
		ProcessClose("iexplore.exe")
		Sleep(1000)
	EndIf

	If Not ProcessExists("iexplore.exe") Then
		Run("C:\Program Files\Internet Explorer\iexplore.exe")
		$ieHandle = WinWaitActive("Windows Internet Explorer")

		Sleep(1000)
		Send("{TAB}")
		sleep(300)
		Send("{ENTER}")
		Sleep(200)
	EndIf

   $TITLE = "Windows Internet Explorer"
	;WinMove($TITLE, "", 45, 0)
	WinSetState( $TITLE , "",@SW_MAXIMIZE )
EndFunc

Func CloseIE()
	If ProcessExists("iexplore.exe") Then
		ProcessClose("iexplore.exe")
		Sleep(1000)
	EndIf
EndFunc