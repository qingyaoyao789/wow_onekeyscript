
#NoEnv
#MaxThreadsPerHotkey 6
#Persistent 
CoordMode,Pixel
enblatt:=0

$F1::
{
	enblatt:=!enblatt
	t1 :="",t2 :="",t3 :="",t4 :=""
	if (enblatt=1)
	{
	t1 := AhkThread("serach1.ahk","",true)
	t2 := AhkThread("serach2.ahk","",true)	
	t3 := AhkThread("serach3.ahk","",true)	
	t4 := AhkThread("serach4.ahk","",true)	
	}
	else
	{
		ahkthread_free(t1),t1:=""
		ahkthread_free(t2),t2:=""
		ahkthread_free(t3),t3:=""
		ahkthread_free(t4),t4:=""
	}
return
}

+z::
{
	ExitApp
}

#MaxThreadsPerHotkey 6











