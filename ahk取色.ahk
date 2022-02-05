
CoordMode "Pixel"

 
F1::
{
MouseGetPos &MouseX, &MouseY
MsgBox "当前坐标和颜色 "  MouseX "-" MouseY "-" PixelGetColor(MouseX, MouseY)
}
F2::ExitApp









