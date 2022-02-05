
#NoEnv
#Persistent
#NoTrayIcon
global Akey:=""
CoordMode,Pixel

loop
{
global Akey
Loop Files, D:\wowtools\attack\normal\PICS\*.PNG
 {
   ImageSearch,FoundX, FoundY, 30, 754, 58, 775, *70 %A_LoopFilePath%
    if (ErrorLevel = 0)
            {
              SplitPath,A_LoopFileName ,,,, name_no_ext
              if Akey=name_no_ext
              {
              break
              }
              else
              {
              ;ControlSend ,,{%name_no_ext%},Ä§ÊÞÊÀ½ç,,,
              Akey:=name_no_ext
              break
              }
            }
    }
}




