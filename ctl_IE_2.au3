#include <IE.au3>

#include "jintutil.au3"

prt("Start")
; 找到打开的IE窗口
$oIE = _IECreate("http://221.179.176.29:8180/acdb_ms/menu!main.action",1,1,1,1)
prt("$oIE_2" & _IEPropertyGet($oIE, "locationurl") )



$oIE_2 = _IEAttach("模糊查询", "text")
If @error<>0 Then
   prt( "Error Code:"&@error&"//")
Else
   prt("$oIE_2" & _IEPropertyGet($oIE_2, "locationurl") )
endIf


$oIE_3 = _IEFrameGetObjByName($oIE, "frm-49")
prt("$oIE_3" & _IEPropertyGet($oIE_3, "locationurl") )


$oInput = _IEGetObjById ( $oIE_3, "qtelno" )
prt("$oInput" & $oInput.tagname )
_IEFormElementSetValue ($oInput, "029-87397777")

prt("find button")
;$oButton = _IETagNameGetCollection( $oIE_3, "button", -1 )
$oButton = _IETagNameGetCollection( $oIE_3, "button", 1 )
;MsgBox($MB_OK, "debug", $oButton.innertext )
_IEAction($oButton, "click")

;~ For $tag In $oButton
;~ 	prt("tag.id:" & $tag.id )
;~ 	prt("tag:" & $tag.innertext )
;~ 	MsgBox($MB_OK, "debug", $tag.innertext )
;~ Next




;~ $oTags = _IETagNameAllGetCollection  ($oIE_3 )
;~ If @error<>0 Then
;~    prt( "Error Code:"&@error&"//")
;~ Else
;~    For $tag In $oTags
;~ 	   prt("tag.id:" & $tag.id )
;~    Next

;~ endIf
;prt( _IEPropertyGet($oText, "tagname ") )


prt("Finished.")
; -----------------------------------------  函数的分隔线  -----------------------------------------------
