
#NoEnv
#Persistent
#NoTrayIcon
global findit:="0"
CoordMode,Pixel


loop
    {
    global findit:=0
     PixelSearch,Px, Py, 31,718,32,719,0x352dff, 3, Fast
     if ErrorLevel=1  
     {
       PixelSearch,Px2, Py2, 31,744,32,745,0x352dff, 3, Fast
       if ErrorLevel=0
          {
           ControlSend ,,{Tab} ,Ä§ÊÞÊÀ½ç,,,
           sleep,100
          }         
      }
     else 
     {
        PixelSearch,Px1,Py1, 31,732,32,733, 0x33f4fd,3, Fast
        if ErrorLevel=1 
        {
        findit:=1
        sleep,100
        Continue
        }
	 }

    }
