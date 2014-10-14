#include <GUIConstants.au3>
#include <Misc.au3>

#include "common.au3"

; 避免重复运行
_Singleton("SingleAutoTest")

prt(@ScriptName & " start.")






If FileExists( @ScriptDir & "\test_acdb.csv" ) Then
   ; 读入文件内容

   ; 循环查找

   ; 记录结果

   sleep(5000)
Else
   msg("Not found test_acdb.csv 请检查相关目录。")
EndIf


; -----------------------------------------  函数的分隔线  -----------------------------------------------
