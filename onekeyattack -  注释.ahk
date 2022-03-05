CoordMode "Pixel"
global picpath := "D:\wowtools\attack\normal\PICS"  ;截图目录，截图文件按快捷键命名
global MyGui := Gui(, "Attack")   ;增加 gui,提示脚本是否运行
MyGui.Opt("+AlwaysOnTop +Disabled -SysMenu +Owner") 
global MyText:=MyGui.Add("Text",, "     ")
#MaxThreadsPerHotkey 13
 
F1::  ;F1启动/暂停脚本
{
static startatt:=false
AAkey:=""
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
loop                                                  ;按键检测,截图识别逻辑修改,在读条(或GCD)时,识别技能
{
if NOT IsSpace(AAkey)
break
check_input(&AAkey)
if IsSpace(AAkey)
pickact(&AAkey)
sleep 100
}
}
else if NOT PixelSearch(&Px1, &Py1, 31,732,32,733, 0xfdf433,3)  ;是否在施法，色块位置和色号，自行调节
{
if IsSpace(AAkey)                                              ;释放技能
{
pickact(&AAkey)
send AAkey
MyText.Value :=AAkey
AAkey:=""
sleep 50  
}
else  
{
if InStr(AAkey,"^",0,1) or InStr(AAkey,"!",0,1) or InStr(AAkey,"+",0,1) or InStr(AAkey,"{",0,1)
{
send AAkey
MyText.Value :=AAkey
}
else
{
send "{" AAkey "}"
MyText.Value :=AAkey
}
AAkey:=""
sleep 50   
}
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
{
MyGui.Hide()
break
}
}
startatt:=false

}

pickact(&Akey)
{
global picpath
Loop Files,picpath "\*.PNG"
{
Apath:="*70 " A_LoopFilePath

if ImageSearch(&FoundX, &FoundY, 30, 754, 58, 775, Apath)  ;截图识别,坐标自行调整
{
SplitPath A_LoopFileName ,,,, &name_no_ext
if InStr(name_no_ext,"^",0,1) or InStr(name_no_ext,"!",0,1) or InStr(name_no_ext,"+",0,1) ;组合键判断
{
Akey := name_no_ext
}
else
Akey:="{" name_no_ext "}"
break
}
}
}

check_input(&key_input)  
{
    
    ih := InputHook("T1=0.4 V")   ;等待按键时间
    ih.KeyOpt("{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{q}{e}{r}{g}{f}{x}{t}{2}{3}{4}{5}{1}", "ES")  ;按键检测,自行按需增减
    ih.Start()
    ih.Wait()
    return key_input:= ih.EndKey   ; 返回按键名称
}

+z::ExitApp  ;shift +z  退出脚本
+x::Reload   ;shift +x  重置脚本 


#MaxThreadsPerHotkey 10

