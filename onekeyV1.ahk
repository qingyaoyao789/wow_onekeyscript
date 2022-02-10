
#NoEnv
#MaxThreadsPerHotkey 16
#Persistent 
CoordMode,Pixel

global picpath := "D:\wowtools\attack\normal\PICS"

F1::
{
#MaxThreadsPerHotkey 10

if KeepWinZRunning  ;  这说明一个潜在的线程正在下面的循环中运行.
{
    KeepWinZRunning := false  ; 向那个线程的循环发出停止的信号.
    return  ; 结束此线程, 这样才可以让下面的线程恢复并得知上一行所做的更改.
}
; 否则:
KeepWinZRunning := true
Loop
{
PixelSearch,Px, Py, 31,718,32,719,0x352dff, 3, Fast
if ErrorLevel=1  
{
   PixelSearch,Px2, Py2, 31,744,32,745,0x352dff, 3, Fast
   if ErrorLevel=0
   {
   ControlSend ,,{Tab} ,魔兽世界,,,
   sleep,100
   }
 }
else if ErrorLevel=0
{
PixelSearch,Px1,Py1, 31,732,32,733, 0x33f4fd,3, Fast
if ErrorLevel=1 
{
searchpic()
}
}
    if not KeepWinZRunning  ; 用户再次按下 Win-Z 来向循环发出停止的信号.
        break  ; 跳出此循环.
}
KeepWinZRunning := false  ; 复位, 为下一次使用热键做准备.
return
}

searchpic()
{
CoordMode,Pixel
global picpath
Loop Files,%picpath%\*.PNG
{
ImageSearch,FoundX, FoundY, 30, 754, 58, 775, *70 %A_LoopFilePath%
if (ErrorLevel = 0)
{
SplitPath,A_LoopFileName ,,,, name_no_ext
ControlSend ,,{%name_no_ext%},魔兽世界,,,
break
}
}
}

+z::
{
	ExitApp
}

#MaxThreadsPerHotkey 16











