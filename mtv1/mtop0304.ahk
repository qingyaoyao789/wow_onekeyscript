#NoEnv
#Persistent
#MaxThreadsPerHotkey 20
CoordMode,Pixel
global t1 :="",t2 :="",findit:="",Akey:="",AAkey:="",t3:=""
Gui, +AlwaysOnTop +Disabled -SysMenu +Owner  ; +Owner 避免显示任务栏按钮.
;Gui, Add, Edit, R1 vMyEdit
Gui, Add, Text,vMyText, START.
enblatt:=0


$F1::
{
	enblatt:=!enblatt
	t1 :="",t2 :="",t3:=""
	if (enblatt=1)
	{
    
    Gui, Show,W80 H20 X900 Y82 NoActivate, AutoHotkey
	t1 := AhkThread("op1.ahk","",true)
	t2 := AhkThread("op2.ahk","",true)	
	t3 := AhkThread("op3.ahk","",true)
	while (t1.ahkReady() & t2.ahkReady() & t3.ahkReady())
  {
    if (t1.ahkgetvar.findit=1)
    {
	  if (t3.ahkgetvar.self_press=1)
      AAkey:=t3.ahkgetvar.ABkey
	  else
	  {
	  AAkey:=t2.ahkgetvar.Akey
	  }
      ControlSend ,,{%AAkey%},魔兽世界,,,
      GuiControl,, MyText, %AAkey%
	  t3.ahkassign("ABkey","")
      sleep,50
    }
  }
	}
	else
	{
        Gui, Hide
		ahkthread_free(t1),t1:=""
		ahkthread_free(t2),t2:=""
		ahkthread_free(t3),t3:=""
	}
return
}

+z::
{
	ExitApp
}

+x::Reload

#MaxThreadsPerHotkey 20