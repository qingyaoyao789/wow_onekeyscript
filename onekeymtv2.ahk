
CoordMode "Pixel"
global swt :=1

#MaxThreadsPerHotkey 6
script1 := "
(
#NoTrayIcon 
Persistent
Loop
{
if PixelSearch(&Px, &Py, 31,718,32,719,0xff2d35, 3)  ;目标色块判断
{
if PixelSearch(&Px1, &Py1, 31,732,32,733, 0xfdf433,3)  ；施法色块判断
{
sleep 50
}
else if NOT PixelSearch(&Px1, &Py1, 31,732,32,733, 0xfdf433,3)
{

Loop Files,"D:\app\ahkdll\scripts\PICS1\*.PNG"  ;截图目录，自行修改
{
Apath:="*70 " A_LoopFilePath

if ImageSearch(&FoundX, &FoundY, 30, 754, 58, 775, Apath)  ；技能快捷键截图查找
{
SplitPath A_LoopFileName ,,,, &name_no_ext
Akey:="{" name_no_ext "}"
ControlSend Akey ,,"魔兽世界"
break
}
}
}
}
else 
{
if PixelSearch(&Px2, &Py2, 31,744,32,745,0xd8272d, 3)  ；周围是否有敌人色块判断
{
ControlSend "{Tab}" ,,"魔兽世界"
sleep 50
}
}
}
)"

script2 := "
(
#NoTrayIcon 
Persistent
Loop
{
if PixelSearch(&Px, &Py, 31,718,32,719,0xff2d35, 3)  
{
if PixelSearch(&Px1, &Py1, 31,732,32,733, 0xfdf433,3)
{
sleep 50
}
else if NOT PixelSearch(&Px1, &Py1, 31,732,32,733, 0xfdf433,3)
{

Loop Files,"D:\app\ahkdll\scripts\PICS2\*.PNG"
{
Apath:="*70 " A_LoopFilePath

if ImageSearch(&FoundX, &FoundY, 30, 754, 58, 775, Apath)
{
SplitPath A_LoopFileName ,,,, &name_no_ext
Akey:="{" name_no_ext "}"
ControlSend Akey ,,"魔兽世界"
break
}
}
}
}
else 
{
sleep 50
}
}
)"

script3 := "
(
#NoTrayIcon 
Persistent
Loop
{
if PixelSearch(&Px, &Py, 31,718,32,719,0xff2d35, 3)  
{
if PixelSearch(&Px1, &Py1, 31,732,32,733, 0xfdf433,3)
{
sleep 50
}
else if NOT PixelSearch(&Px1, &Py1, 31,732,32,733, 0xfdf433,3)
{

Loop Files,"D:\app\ahkdll\scripts\PICS3\*.PNG"  
{
Apath:="*70 " A_LoopFilePath

if ImageSearch(&FoundX, &FoundY, 30, 754, 58, 775, Apath)
{
SplitPath A_LoopFileName ,,,, &name_no_ext
Akey:="{" name_no_ext "}"
ControlSend Akey ,,"魔兽世界"
break
}
}
}
}
else 
{
sleep 50
}
}
)"

script4 := "
(
#NoTrayIcon 
Persistent
Loop
{
if PixelSearch(&Px, &Py, 31,718,32,719,0xff2d35, 3)  
{
if PixelSearch(&Px1, &Py1, 31,732,32,733, 0xfdf433,3)
{
sleep 50
}
else if NOT PixelSearch(&Px1, &Py1, 31,732,32,733, 0xfdf433,3)
{

Loop Files,"D:\app\ahkdll\scripts\PICS4\*.PNG"
{
Apath:="*70 " A_LoopFilePath

if ImageSearch(&FoundX, &FoundY, 30, 754, 58, 775, Apath)
{
SplitPath A_LoopFileName ,,,, &name_no_ext
Akey:="{" name_no_ext "}"
ControlSend Akey ,,"魔兽世界"
break
}
}
}
}
else 
{
sleep 50
}
}
)"

F1::
{
global ahk,script1,script2,script3,script4,swt
global threadid1,threadid2,threadid3,threadid4
ahk := ComObject("AutoHotkey2.Script")
if (swt=1)
{
threadid1:="",threadid2:="",threadid3:="",threadid4:=""
threadid1 := ahk.NewThread(script1) ;创建新线程，共4个线程
threadid2 := ahk.NewThread(script2)
threadid3 := ahk.NewThread(script3)
threadid4 := ahk.NewThread(script4)
swt:=0
}
else
{
if (IsSet(threadid1))
    ahk.ahkPostFunction(threadid1,'exitapp') ;终止线程
if (IsSet(threadid2))
    ahk.ahkPostFunction(threadid2,'exitapp') 
if (IsSet(threadid3))
    ahk.ahkPostFunction(threadid3,'exitapp') 
if (IsSet(threadid4))
    ahk.ahkPostFunction(threadid4,'exitapp') 
threadid1:="",threadid2:="",threadid3:="",threadid4:=""
swt:=1
}

}

+z::
{
    ExitApp 
}

#MaxThreadsPerHotkey 6