#NoEnv
#Persistent
#NoTrayIcon
ABkey:="",self_press:=0

loop
{
if ABkey is Space
{
ABkey:=check_input(ByRef key_input)
self_press:=0
}
else if ABkey is not Space
self_press:=1
sleep,100
}


check_input(ByRef key_input)
{
    key_input:=""
    ih := InputHook("T1=1 V")
    ih.KeyOpt("{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{q}{e}{r}{g}{f}{x}{t}{2}{3}{4}{5}{1}", "ES") 
    ih.Start()
    ih.Wait()
    return key_input:= ih.EndKey   ; ??????
}




