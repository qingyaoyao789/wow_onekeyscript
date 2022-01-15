#NoEnv
#NoTrayIcon
#Persistent

global picpath := "D:\wowtools\ahkh1\x64w\PICS3"

loop {
PixelSearch,Px, Py, 31,718,32,719,0x352dff, 3, Fast
if ErrorLevel=1  
{
sleep,100
}
else 
{
PixelSearch,Px1,Py1, 31,732,32,733, 0x33f4fd,3, Fast
if ErrorLevel=1 
{
searchpic3()
}
else 
{
sleep,50
}
}
}

searchpic3()
{
global picpath
CoordMode,Pixel
Loop Files,%picpath%\*.PNG
{
ImageSearch,FoundX, FoundY, 30, 754, 58, 775, *70 %A_LoopFilePath%
if (ErrorLevel = 0)
{
SplitPath,A_LoopFileName ,,,, name_no_ext
;Akey:={%name_no_ext%}
ControlSend ,,{%name_no_ext%},Ä§ÊÞÊÀ½ç,,,
;send {%name_no_ext%}

break
}
}
}