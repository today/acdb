#include <IE.au3>

#include "jintutil.au3"

; 打开网站
$oIE = _IECreate ("http://221.179.176.29:8180/acdb_ms/login.jsp",1,1,1,1)

; 找特定的Form 找的是 name 属性
$oForm = _IEFormGetObjByName ($oIE, "_login")

; 用name属性找页面控件
$oQuery1 = _IEFormElementGetObjByName ($oForm, "j_username")
; 给页面控件赋值
_IEFormElementSetValue ($oQuery1, "14133")

$oQuery2 = _IEFormElementGetObjByName ($oForm, "j_password")
_IEFormElementSetValue ($oQuery2, "123")

$oQuery3 = _IEFormElementGetObjByName ($oForm, "login")
sleep(1000)
; 向页面控件发送 click 事件
_IEAction($oQuery3, "click")


sleep(5000)
Local $oLinks = _IELinkGetCollection($oIE)
Local $iNumLinks = @extended

Local $sTxt = $iNumLinks & " links found" & @CRLF & @CRLF
prt( $sTxt & @CRLF )
For $oLink In $oLinks
    prt( $oLink.href & @CRLF )
Next



prt("start click MENU in left.")
;sleep(2000)

;_IELinkClickByText ( $oIE, "信息管理" , 0 , 1 )


prt("Finished.")
; -----------------------------------------  函数的分隔线  -----------------------------------------------
