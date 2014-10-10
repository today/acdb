#include <IE.au3>

#include "jintutil.au3"

prt("Start")
; 找到打开的IE窗口
$oIE = _IECreate("http://221.179.176.29:8180/acdb_ms/menu!main.action",1,1,1,1)
prt("$oIE_2" & _IEPropertyGet($oIE, "locationurl") )



; 再找到输入查询条件的那个  iframe
$oIE_3 = _IEFrameGetObjByName($oIE, "frm-49")
prt("URL:" & _IEPropertyGet($oIE_3, "locationurl") )


$oInput = _IEGetObjById ( $oIE_3, "qtelno" )
prt("$oInput" & $oInput.tagname )
_IEFormElementSetValue ($oInput, "029-87397777")

prt("find button")
;$oButton = _IETagNameGetCollection( $oIE_3, "button", -1 )
$oButton = _IETagNameGetCollection( $oIE_3, "button", 1 )
;MsgBox($MB_OK, "debug", $oButton.innertext )
_IEAction($oButton, "click")

; 等待查询结果出现
sleep(5000)

; 再找到出错提示文本
$oText = _IEGetObjById ( $oIE_3, "ext-comp-1033" )
$iBrowserx = 0  ;用来做为判断是否找到内容的Flag
If @error<>0 Then
   prt( "Error Code:"&@error&"//")
Else
   $iBrowserx = _IEPropertyGet ( $oText, "browserx" )
   prt("$oText.visible:" & $iBrowserx )
endIf

If $iBrowserx>0 Then
   prt("Nothing finded.")
ElseIf $iBrowserx<0 Then
   prt("Find it.")
Else
   prt("Error. Please Debug.")
EndIf



;~ ; 遍历所有的 Button
;~ For $tag In $oButton
;~ 	prt("tag.id:" & $tag.id )
;~ 	prt("tag:" & $tag.innertext )
;~ 	MsgBox($MB_OK, "debug", $tag.innertext )
;~ Next





prt("Finished.")
; -----------------------------------------  函数的分隔线  -----------------------------------------------
