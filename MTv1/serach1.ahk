#NoEnv
#NoTrayIcon
#Persistent

global picpath := "D:\wowtools\ahkh1\x64w\PICS"

loop {
PixelSearch,Px, Py, 31,718,32,719,0x352dff, 3, Fast
if ErrorLevel=1  
{
   PixelSearch,Px2, Py2, 31,744,32,745,0x2d27d8, 3, Fast
   if ErrorLevel=0
   {
   ControlSend ,,{Tab} ,魔兽世界,,,
   sleep,100
   }
}
else 
{
PixelSearch,Px1,Py1, 31,732,32,733, 0x33f4fd,3, Fast
if ErrorLevel=1 
{
searchpic()
}
else 
{
sleep,50
}
}
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