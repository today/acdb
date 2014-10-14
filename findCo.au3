#include <GUIConstants.au3>
#include <Misc.au3>

#include "common.au3"
#include "ctl_IE_2.au3"

; 避免重复运行
_Singleton("SingleAutoTest")

prt(@ScriptName & " start.")






If FileExists( @ScriptDir & "\test_acdb.csv" ) Then
   ; 读入文件内容
   $csvfile = FileOpen( @ScriptDir & "\test_acdb.csv", 0)
   $outFile = FileOpen(  @ScriptDir & "\result.csv" , 1)   ; 参数1 代表 append 模式

   ; 循环查找
   While 1
	  $line = FileReadLine($csvfile)
	  If @error = -1 Then
		 ExitLoop
	  EndIf
	  ;prt( $line & @CRLF )

	  If StringIsSpace($line) Then
		 ContinueLoop
	  EndIf

	  $strArray = StringSplit( $line, "," )

	  $retStr = "No"
	  $retStr = checkTeleExist($strArray[5])

	  ; 记录结果
	  FileWriteLine($outFile, $strArray[3] & "," & $strArray[5] &  "," & $retStr)

	  ;prt( "Process:" &  $line )

   WEnd
   FileClose($csvfile)
   FileClose($outFile)


   sleep(1000)
Else
   msg("Not found test_acdb.csv 请检查相关目录。")
EndIf


prt(@ScriptName & " Finished.")
; -----------------------------------------  函数的分隔线  -----------------------------------------------
