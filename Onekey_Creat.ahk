CoordMode "Pixel"
CoordMode "Mouse"
#MaxThreadsPerHotkey 3
#Include "wincapture.ahk"

global Target_X:=0,Target_Y:=0,Target_Color:=""
global Cast_X:=0,Cast_Y:=0,Cast_Color:=""
global Enemy_X:=0,Enemy_Y:=0,Enemy_Color:=""
global Capture_TLX:=0,Capture_TLY:=0,Capture_BRX:=0,Capture_BRY:=0
global Capture_num:=0,Capture_Folder





MyGui := Gui(, "Hekili辅助助手")
MyGui.Opt("+AlwaysOnTop   +Owner") 
MyGui.Add("Button","x5 vTarget_Button" , "目标坐标，颜色").OnEvent("Click", Target_Posandcolor)
MyGui.Add("Text","x+10 vTarget_Text" ,"Target_X:    Target_Y:   Target_Color:                       ")
MyGui.Add("Button","x5 vCast_Button" , "施法坐标，颜色").OnEvent("Click", Cast_Posandcolor)
MyGui.Add("Text","x+10 vCast_Text" ,"Cast_X:   Cast_Y:  Cast_Color:                       ")
MyGui.Add("Button","x5 vEnemy_Button" , "敌人坐标，颜色").OnEvent("Click", Enemy_Posandcolor)
MyGui.Add("Text","x+10 vEnemy_Text","Enemy_X:    Enemy_Y:  Enemy_Color:                       ")
MyGui.Add("Text","x5", "-----------------------------------分割线-----------------------------------")
MyGui.Add("Button","x5 vCapture_Button" , "截图坐标").OnEvent("Click", CapturePic)
MyGui.Add("Text","x+10 vCapture_Text","截图坐标：左上角X=  左上角Y=  右下角X=  右下角Y=                           ")
MyGui.Add("Button","x5 vCapture_Folder" , "截图目录").OnEvent("Click", OpenFolder)
MyGui.Add("Text","x+10 vCapture_Folder_Text","截图保存目录：                                 ")
MyGui.Add("Text","x5", "脚本热键：")
MyGui.Add("Hotkey", "x+10 vChosenHotkey","F1")
MyGui.Add("Button","x+10 vjiemian","界面预览").OnEvent("Click", Preview_gui)
MyGui.Add("Button","x5 vCheck_Script_Button" , "检测脚本参数").OnEvent("Click", Check_Script)
MyGui.Add("Button","x+10 vCreat_Script_Button" , "一键生成脚本")
MyGui["Creat_Script_Button"].Opt("+Disabled")
global Sbar1:=MyGui.Add("StatusBar","x5 vsBar", "")
MyGui.OnEvent("Close", ExitApp)
MyGui.Show("x900 y60 NoActivate")
dxcp := wincapture.DXGI()

Target_Posandcolor(ctl,*)
{
Check_Game()
global Target_X:=0,Target_Y:=0,Target_Color:=""
ui := ctl.Gui
ui['Target_Button'].Text := "重置"
ui['SBar'].SetText("鼠标左键点击目标色块")
Loop
{
if GetKeyState("LButton")
{
MouseGetPos &MouseX, &MouseY
Target_X:=MouseX 
Target_Y:=MouseY
Target_Color:=PixelGetColor(Target_X,Target_Y)
ui['Target_Text'].Text:="Target_X=" Target_X "  Target_Y=" Target_Y "  Target_Color=" Target_Color
break
}
sleep 50
}
ui['SBar'].SetText("目标色块坐标和颜色获取成功")
}

Cast_Posandcolor(ctl,*)
{
Check_Game()
global Cast_X:=0,Cast_Y:=0,Cast_Color:=""
ui := ctl.Gui
ui['Cast_Button'].Text := "重置"
ui['SBar'].SetText("读个施法（炉石），鼠标左键点击施法色块")
Loop
{
if GetKeyState("LButton")
{
MouseGetPos &MouseX, &MouseY
Cast_X:=MouseX 
Cast_Y:=MouseY
Cast_Color:=PixelGetColor(Cast_X,Cast_Y)
ui['Cast_Text'].Text:="Cast_X=" Cast_X "  Cast_Y=" Cast_Y "  Cast_Color=" Cast_Color
break
}
sleep 50
}
ui['SBar'].SetText("施法色块坐标和颜色获取成功")
}

Enemy_Posandcolor(ctl,*)
{
Check_Game()
global Enemy_X:=0,Enemy_Y:=0,Enemy_Color:=""
ui := ctl.Gui
ui['Enemy_Button'].Text := "重置"
ui['SBar'].SetText("鼠标左键点击周边敌人色块")
Loop
{
if GetKeyState("LButton")
{
MouseGetPos &MouseX, &MouseY
Enemy_X:=MouseX 
Enemy_Y:=MouseY
Enemy_Color:=PixelGetColor(Enemy_X,Enemy_Y)
ui['Enemy_Text'].Text:="Enemy_X=" Enemy_X "  Enemy_Y=" Enemy_Y "  Enemy_Color=" Enemy_Color
break
}
sleep 50
}
ui['SBar'].SetText("周边敌人色块坐标和颜色获取成功")
}

OpenFolder(ctl,*)
{
global Capture_Folder
ui := ctl.Gui
MyGui.Opt("+OwnDialogs") 
if (Capture_Folder := DirSelect())
	ui['Capture_Folder_Text'].Text := Capture_Folder
        ;, ui['Start'].Enabled := true
}

CapturePic(ctl,*)
{
Check_Game()
global Capture_TLX:=0,Capture_TLY:=0,Capture_BRX:=0,Capture_BRY:=0
ui := ctl.Gui
ui['SBar'].SetText("鼠标左键点击要截图区域的左上角")
Loop
{
 if GetKeyState("LButton")  
 {
MouseGetPos &MouseX, &MouseY
Capture_TLX:=MouseX 
Capture_TLY:=MouseY
break
 }
sleep 50
}
ui['Capture_Text'].Text:="左上角X=" Capture_TLX "   左上角Y=" Capture_TLY
sleep 500
ui['SBar'].SetText("鼠标左键点击要截图区域的右下角") 
Loop
{
 if GetKeyState("LButton")  
 {
MouseGetPos &MouseX1, &MouseY1
Capture_BRX:=MouseX1
Capture_BRY:=MouseY1
break
 }
sleep 50
}
ui['Capture_Text'].Text:="左上角X=" Capture_TLX "   左上角Y=" Capture_TLY "    右下角X=" Capture_BRX "    右下角Y=" Capture_BRY
}

Check_Script(ctl,*)
{
Check_Game()
global Target_X,Target_Y,Target_Color,Cast_X,Cast_Y,Cast_Color,Enemy_X,Enemy_Y,Enemy_Color
global Capture_TLX,Capture_TLY,Capture_BRX,Capture_BRY,Capture_Folder
check_error:=""
ui := ctl.Gui
ui['SBar'].SetText("目标色块检测")
sleep 100
if PixelSearch(&Px, &Py, Target_X,Target_Y,Target_X,Target_Y,Target_Color, 3)
ui['SBar'].SetText("找到目标色块")
Else
{
msgbox "未找到目标色块，请检查设置"
ui['SBar'].SetText("未找到目标色块")
check_error:=check_error "未找到目标色块"
}
sleep 500
if PixelSearch(&Px, &Py, Cast_X,Cast_Y,Cast_X,Cast_Y,Cast_Color, 3)
ui['SBar'].SetText("找到施法色块")
Else
{
msgbox "未找到施法色块，请检查设置"
ui['SBar'].SetText("未找到施法色块")
check_error:=check_error "未找到施法色块"
}
sleep 500
if PixelSearch(&Px, &Py, Enemy_X,Enemy_Y,Enemy_X,Enemy_Y,Enemy_Color, 3)
ui['SBar'].SetText("找到周边敌人色块")
Else
{
msgbox "未找到周边敌人色块，请检查设置"
ui['SBar'].SetText("未找到周边敌人色块")
check_error:=check_error "未找到周边敌人色块"
}
sleep 500
if Check_Pic()=false
check_error:=check_error "未找到快捷键截图"
if NOT (check_error="")
{
ui['SBar'].SetText(check_error)
msgbox "测试未通过，错误原因" check_error
}
else
{
MyGui["Creat_Script_Button"].Opt("-Disabled")
MyGui["Creat_Script_Button"].OnEvent("Click", Creat_Script)
}
}
F12::
{
Check_Game()
global Capture_num
global Capture_TLX,Capture_TLY,Capture_BRX,Capture_BRY
if NOT IsSpace(Capture_Folder)
{
;msgbox Capture_BRX
box := Buffer(16,0)
; capture range
NumPut("uint", Capture_TLX, "uint", Capture_TLY, "uint", Capture_BRX, "uint", Capture_BRY, box)
;NumPut("uint", 600, "uint", 600, "uint", 670, "uint", 680, box)
savepic:=Capture_Folder "\" Capture_num ".png"
; save to bmp
try dxcp.captureAndSave(box).save(savepic)
dxcp.freeBuffer()	; It's not necessary
Capture_num:=Capture_num+1
Sbar1.SetText("截图已保存到" savepic)
}
else
{
msgbox "截图目录未选择"
return
}
}

Check_Game()
{
if WinExist("魔兽世界")
    WinActivate ; 使用由 WinExist 找到的窗口
else
{
    msgbox "游戏未启动"
    return
}
}

Check_Pic()
{
global Capture_Folder
global Capture_TLX,Capture_TLY,Capture_BRX,Capture_BRY
Find_Pic:=0
Loop Files,Capture_Folder "\*.PNG"
{
Sbar1.SetText("查找快捷键截图.....")
Apath:="*70 " A_LoopFilePath
if ImageSearch(&FoundX, &FoundY, Capture_TLX-10, Capture_TLY-10, Capture_BRX+40, Capture_BRY+40, Apath)
{
Sbar1.SetText("找到快捷键截图")
Find_Pic:=1
break
}
sleep 100
}
if Find_Pic=0
{
msgbox "未找到快捷键截图，请查看截图设置"
return false
}
}

Preview_gui(*)
{
    _Preview := Gui("+owner" MyGui.Hwnd)  ; 让主窗口成为 "about box" 的父窗口.
    MyGui.Opt("+Disabled")  ; 禁用主窗口.
    MyGui.Hide()
    _Preview.Opt("+AlwaysOnTop -SysMenu") 
    _Preview.Add("Text",, "Attact")
    _Preview.Add("Button", "Default", "返回主窗口").OnEvent("Click", _Preview_Close)
    _Preview.Show("w80 x900 y82 NoActivate")

    _Preview_Close(*)
    {
        MyGui.Opt("-Disabled")  ; 重新启用主窗口(必须在下一步之前进行).
        MyGui.show()
        _Preview.Destroy()  ; 销毁关于对话框.
    }
}

Creat_Script(ctl,*)
{
ui := ctl.Gui
if FileExist("Attack_companion.ahk")
    FileDelete "Attack_companion.ahk"
ui['SBar'].SetText("旧脚本删除")
sleep 100
ui['SBar'].SetText("新脚本生成中......")
FileAppend  "
(
CoordMode "Pixel"
global MyGui := Gui(, "Attack")
MyGui.Opt("+AlwaysOnTop +Disabled -SysMenu +Owner") 
global MyText:=MyGui.Add("Text",, "     ")
#MaxThreadsPerHotkey 13

)" ,"Attack_companion.ahk","UTF-8"
sleep 100
ui['SBar'].SetText("新脚本第二部分生成中......")
FileAppend 
(
"global Target_X:=" Target_X ", Target_Y:=" Target_Y ", Target_Color:=" Target_Color "`r"
"global Cast_X:=" Cast_X ", Cast_Y:=" Cast_Y ", Cast_Color:=" Cast_Color "`r"
"global Enemy_X:=" Enemy_X ", Enemy_Y:=" Enemy_Y ", Enemy_Color:=" Enemy_Color "`r"
"global Capture_TLX:=" Capture_TLX ",Capture_TLY:=" Capture_TLY ",Capture_BRX:=" Capture_BRX ",Capture_BRY:=" Capture_BRY "`r"
"global picpath := " '"' Capture_Folder '"' "`r"
ui['ChosenHotkey'].Value '::' "`r"
), "Attack_companion.ahk","UTF-8" 

FileAppend  "
(
{
global Target_X,Target_Y,Target_Color
global Cast_X,Cast_Y,Cast_Color
global Enemy_X,Enemy_Y,Enemy_Color
static startatt:=false
AAkey:=""
if startatt
{
startatt:=false
return
}

startatt:=true
MyText.Value :="Start"
MyGui.Show("w80 x900 y82 NoActivate")  
Loop
{
if PixelSearch(&Px, &Py, Target_X,Target_Y,Target_X,Target_Y,Target_Color, 3)  
{
if PixelSearch(&Px1, &Py1, Cast_X,Cast_Y,Cast_X,Cast_Y, Cast_Color,3)
{
loop
{
if NOT IsSpace(AAkey)
break
check_input(&AAkey)
if IsSpace(AAkey)
pickact(&AAkey)
sleep 100
}
}
else if NOT PixelSearch(&Px1, &Py1, Cast_X,Cast_Y,Cast_X,Cast_Y, Cast_Color,3)
{
if IsSpace(AAkey)
{
pickact(&AAkey)
MyText.Value :=AAkey
send AAkey
sleep 50 
AAkey:=""
sleep 50  
}
else  if NOT IsSpace(AAkey)
{
if InStr(AAkey,"^",0,1) or InStr(AAkey,"!",0,1) or InStr(AAkey,"+",0,1) or InStr(AAkey,"{",0,1)
{
MyText.Value :=AAkey
send AAkey
sleep 50
}
else
{
MyText.Value :=AAkey
send "{" AAkey "}"
}
AAkey:=""
sleep 50   
}
}
}
else 
{
if PixelSearch(&Px2, &Py2, Enemy_X,Enemy_Y,Enemy_X,Enemy_Y,Enemy_Color, 3) 
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
global Capture_TLX,Capture_TLY,Capture_BRX,Capture_BRY
Loop Files,picpath "\*.PNG"
{
Apath:="*70 " A_LoopFilePath

if ImageSearch(&FoundX, &FoundY, Capture_TLX-10, Capture_TLY-10, Capture_BRX+40, Capture_BRY+40, Apath)
{
SplitPath A_LoopFileName ,,,, &name_no_ext
if InStr(name_no_ext,"^",0,1) or InStr(name_no_ext,"!",0,1) or InStr(name_no_ext,"+",0,1)
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
    
    ih := InputHook("T0.5 V")
    ih.KeyOpt("{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{q}{e}{r}{g}{f}{t}{2}{3}{4}{5}{1}{6}", "ES") 
    ih.Start()
    ih.Wait( )
    return key_input:= ih.EndKey   ; 返回按键名称
}

+z::ExitApp
+x::Reload


#MaxThreadsPerHotkey 10

)" ,"Attack_companion.ahk","UTF-8"

ui['SBar'].SetText("新脚本完成，请使用退出本脚本，运行Attack_companion.ahk，使用热键" ui['ChosenHotkey'].Value "启动")

}



+z::ExitApp
+x::Reload
#MaxThreadsPerHotkey 1