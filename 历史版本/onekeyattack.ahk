
CoordMode "Pixel"
global picpath := "D:\wowtools\attack\normal\PICS"
#MaxThreadsPerHotkey 13
 
F1::
{
 static startatt:=false

if startatt
{
startatt:=false
return
}
startatt:=true
Loop
{
if PixelSearch(&Px, &Py, 31,718,32,719,0xff2d35, 3)  
{
if PixelSearch(&Px1, &Py1, 31,732,32,733, 0xfdf433,3)
{
sleep 100
}
else if NOT PixelSearch(&Px1, &Py1, 31,732,32,733, 0xfdf433,3)
{
pickact()
}
}
else 
{
if PixelSearch(&Px2, &Py2, 31,744,32,745,0xff2d35, 3) 
{
ControlSend "{Tab}" ,,"魔兽世界"
sleep 100
}
}
if not startatt
break
}
startatt:=false

}

pickact()
{
global picpath
Loop Files,picpath "\*.PNG"
{
Apath:="*70 " A_LoopFilePath

if ImageSearch(&FoundX, &FoundY, 30, 754, 58, 775, Apath)
{
SplitPath A_LoopFileName ,,,, &name_no_ext
if InStr(name_no_ext,"^",0,1) or InStr(name_no_ext,"!",0,1) or InStr(name_no_ext,"+",0,1)
{
Akey := name_no_ext
}
else
Akey:="{" name_no_ext "}"
send Akey
break
}
}
}

+z::ExitApp
+x::Reload


#MaxThreadsPerHotkey 10











