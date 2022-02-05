
#NoEnv
#Persistent
#MaxThreadsPerHotkey 20
CoordMode,Pixel
global t1 :="",t2 :="",findit:="",Akey:="",AAkey:=""
enblatt:=0


$F1::
{
	enblatt:=!enblatt
	t1 :="",t2 :=""
	if (enblatt=1)
	{
	t1 := AhkThread("op1.ahk","",true)
	t2 := AhkThread("op2.ahk","",true)	
	while (t1.ahkReady() & t2.ahkReady())
  {
    if (t1.ahkgetvar.findit=1)
    {
      AAkey:=t2.ahkgetvar.Akey
      ControlSend ,,{%AAkey%},Ä§ÊÞÊÀ½ç,,,
      sleep,100
    }
  }
	}
	else
	{
		ahkthread_free(t1),t1:=""
		ahkthread_free(t2),t2:=""
	}
return
}

+z::
{
	ExitApp
}

+x::Reload

#MaxThreadsPerHotkey 20