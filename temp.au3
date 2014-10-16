#include <GUIConstants.au3>
#include <Misc.au3>

#include "common.au3"

; 避免重复运行
_Singleton("SingleAutoTest")

prt(@ScriptName & " start.")

; 遍历所有的 Button
For $tag In $oButton
	prt("tag.id:" & $tag.id )
	prt("tag:" & $tag.innertext )
	MsgBox($MB_OK, "debug", $tag.innertext )
Next


; -----------------------------------------  函数的分隔线  -----------------------------------------------
