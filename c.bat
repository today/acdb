@echo [Clear]
@del top200_ping.exe

@echo [Compile Script to .exe]
"C:\Program Files\AutoIt3\Aut2Exe\Aut2exe.exe" /in findCo.au3 /out bin\findCo.exe /icon .\favicon.ico /console /comp 1
