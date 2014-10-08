#include <GUIConstants.au3>
#include <Misc.au3>

#include "common.au3"

; 避免重复运行
_Singleton("SingleAutoTest")

prt(@ScriptName & " start.")

OpenIE()

$server_URL = "http://221.179.176.29:8180/acdb_ms/login.jsp"

Sleep( 3000 )
Send("{F4}")
Sleep(300)
Send("{BACKSPACE}")
Sleep(300)
Send($server_URL)
Sleep(900)
Send("{ENTER}")


Sleep( 3000 )


$oForm = _IEFormGetObjByName ($oIE, "f")
$oQuery1 = _IEFormElementGetObjByName ($oForm, "wd")
_IEFormElementSetValue ($oQuery1, "与 autoit3 亲密接触")




;CloseIE()


; -----------------------------------------  函数的分隔线  -----------------------------------------------
