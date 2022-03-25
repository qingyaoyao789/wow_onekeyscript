使用ahk v2 beta3 版，制作的hekili自动脚本生成器，其中截图功能使用thqby大神的开源dll， https://github.com/thqby/wincapture 和https://github.com/thqby/ahk2_lib/tree/master/wincapture 

先从 https://www.autohotkey.com/download/ahk-v2.zip 下载 ahk v2

将脚本 wow_onekeyscript-gui 和ahkv2 解压在一起，或者单独目录，

把 脚本下的 PIC目录 复制到 魔兽世界 interface 目录下

打开游戏，导入 wa 字符串，注意：导入后，施法检测触发器1 先临时选择反向。见图片设置 hekili 快捷键字符位置，最好调整到技能下方

运行 脚本Onekey_Creat.ahk (运行方式：右键-打开方式 选择AutoHotkey64，或者在同一目录，直接拖曳脚本放到 AutoHotkey64图标上

然后放开左键）

按脚本界面提示，取色，设定截图坐标，先把hekili提示技能放 0 快捷键上，按F12截图，然后放1，按f12截图，文件会自动按0-9，F1-F2-FXX命名。校核脚本参数，生成脚本，退出。

施法检测触发器1 取消反向

到截图目录修改文件名，与截图一致，比如截图是 e 文件名命名为e

再运行新生成的Attack_companion.ahk

默认F1 开启关闭脚本

