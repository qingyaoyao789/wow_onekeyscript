
CoordMode "Pixel"
global picpath := "D:\wowtools\attack\normal\PICS"  ;截图目录，截图文件按快捷键命名
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
if PixelSearch(&Px, &Py, 31,718,32,719,0xff2d35, 3)   ;是否选中目标，色块位置和色号，自行调节
{
if PixelSearch(&Px1, &Py1, 31,732,32,733, 0xfdf433,3) ;是否在施法，色块位置和色号，自行调节
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
if PixelSearch(&Px2, &Py2, 31,744,32,745,0xff2d35, 3)  ;角色 40码范围 是否有可攻击目标，色块位置和色号，自行调节
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

if ImageSearch(&FoundX, &FoundY, 30, 754, 58, 775, Apath) ;截图与屏幕上hekili 给出的技能快捷键对比，找到就按相应的快捷键
{
SplitPath A_LoopFileName ,,,, &name_no_ext
Akey:="{" name_no_ext "}"
ControlSend Akey ,,"魔兽世界"    ;如要用组合键，如，ctrl+1，可以用send 命令，截图文件名为^1,参考ahk 快捷键规定。
break
}
}
}

+z::ExitApp
+x::Reload


#MaxThreadsPerHotkey 10











