#include-once

#include <Array.au3>


; -----------------------------------------  函数的分隔线  -----------------------------------------------

; 下载文件
Func downloadFile( $url, $savePath )
	$i = 0
	$ret = InetGet( $url , $savePath, 1, 1 )
	Do
		Sleep(2000)
		$i = $i +1
		If mod($i,10) == 0 Then
			prt("time=" & ($i*2))
		EndIf
	Until InetGetInfo($ret, 2)    ; Check if the download is complete.
	Local $nBytes = InetGetInfo($ret, 0)
	InetClose($ret)   ; Close the handle to release resourcs.
	;MsgBox(0, "", "Bytes read: " & $nBytes)
EndFunc

; 获得MAC地址
Func _GetMAC ($sIP)
  Local $MAC,$MACSize
  Local $i,$s,$r,$iIP

  $MAC = DllStructCreate("byte[6]")
  $MACSize = DllStructCreate("int")

  DllStructSetData($MACSize,1,6)
  $r = DllCall ("Ws2_32.dll", "int", "inet_addr", "str", $sIP)
  $iIP = $r[0]
  $r = DllCall ("iphlpapi.dll", "int", "SendARP","int", $iIP,"int", 0,"ptr", DllStructGetPtr($MAC),"ptr", DllStructGetPtr($MACSize))
  $s    = ""
  For $i = 0 To 5
      If $i Then $s = $s & ":"
      $s = $s & Hex(DllStructGetData($MAC,1,$i+1),2)
  Next
  Return $s
EndFunc

;弹出消息框
Func msg( $str )
	prt($str)
	MsgBox(0, "Debug", $str, 10 )
EndFunc

;在console中打印出日志
Func prt($str)
	if @compiled == 1 Then
		;FileWriteLine(@ScriptDir & "\log.log", getCurrTime() & " " & $str)
		ConsoleWrite( getCurrTime() & " " & $str & @CRLF )
	else
		ConsoleWrite( getCurrTime() & " " & $str & @CRLF )
	EndIf
EndFunc

; 在屏幕右下角显示提示框
Func pop($str)
	TrayTip("Debug", $str, 3, 1)
EndFunc



; 把文件名的后三个字母换成 hwl ， 一般来讲，这样就改变了扩展名。
Func csvToHwl($path)
	$l = StringLen($path)
	If $l > 3  Then
		$tmp = StringLeft( $path, $l-3 )
		return $tmp & "hwl"
	Else
		Return ""
	EndIf

EndFunc



; 检查网络是否可用
Func NetAlive()
	If Ping ("www.qq.com",3000) > 0 Then     ; ping这一个应该就够了。
		Sleep(100)
		return True
	Else
		prt("NetAlive: False")
		Return False
	EndIf

EndFunc


;
Func getCurrTime()
	$time = @YEAR & @MON & @MDAY & " " & @HOUR & ":" & @MIN & ":" & @SEC
	return $time
EndFunc

;
Func getHour()
	$hour = @YEAR & @MON & @MDAY & @HOUR
	Return $hour
EndFunc

;
Func sendReq($req)
	$response = InetRead ( $req, 1)
	$ret = BinaryToString($response)
	Return $ret
EndFunc

;
Func runDos($cmd)
	$fullcmd = @ComSpec & " /c " & $cmd
	return RunWait( $fullcmd, @ScriptDir) ;, @SW_HIDE )
EndFunc

Func map_init($str)
	$strArray = StringSplit( $str, "," )
	Dim $mapArray[$strArray[0]][2]
	$i=1
	while $i < $strArray[0]+1

		$index = StringInStr($strArray[$i], "=")
		If $index > 0 Then
			$key = StringLeft($strArray[$i],$index-1)
			$key = StringStripWS($key, 3)
			$value = StringRight($strArray[$i], StringLen( $strArray[$i]) - $index)
			$value = StringStripWS($value, 3)

			$mapArray[$i-1][0] = $key
			$mapArray[$i-1][1] = $value
		EndIf
		$i = $i + 1
	WEnd
	;prt( "MAP:" & map_toString($mapArray))
	Return $mapArray
EndFunc

Func map_toString( $map )
	$i = 0
	$str = ""
	While $i < UBound($map)
		$str = $str & $map[$i][0] & "=" & $map[$i][1] & ","
		$i=$i+1
	WEnd
	return $str
EndFunc

Func map_get( $map , $key )
	$i = 0
	$str = ""
	While $i < UBound($map)
		if $map[$i][0] == $key Then
			$str = $map[$i][1]
		EndIf
		$i=$i+1
	WEnd

	return $str
EndFunc