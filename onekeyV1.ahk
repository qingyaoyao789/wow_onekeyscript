
#NoEnv
#MaxThreadsPerHotkey 16
#Persistent 
CoordMode,Pixel

global picpath := "D:\wowtools\attack\normal\PICS"

F1::
{
#MaxThreadsPerHotkey 10

if KeepWinZRunning  ;  ��˵��һ��Ǳ�ڵ��߳����������ѭ��������.
{
    KeepWinZRunning := false  ; ���Ǹ��̵߳�ѭ������ֹͣ���ź�.
    return  ; �������߳�, �����ſ�����������ָ̻߳�����֪��һ�������ĸ���.
}
; ����:
KeepWinZRunning := true
Loop
{
PixelSearch,Px, Py, 31,718,32,719,0x352dff, 3, Fast
if ErrorLevel=1  
{
   PixelSearch,Px2, Py2, 31,744,32,745,0x352dff, 3, Fast
   if ErrorLevel=0
   {
   ControlSend ,,{Tab} ,ħ������,,,
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
    if not KeepWinZRunning  ; �û��ٴΰ��� Win-Z ����ѭ������ֹͣ���ź�.
        break  ; ������ѭ��.
}
KeepWinZRunning := false  ; ��λ, Ϊ��һ��ʹ���ȼ���׼��.
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
ControlSend ,,{%name_no_ext%},ħ������,,,
break
}
}
}

+z::
{
	ExitApp
}

#MaxThreadsPerHotkey 16











