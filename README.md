利用ahk imagesearch 和pixsearch，结合 WA对目标，自身施法状态判断，自动按下hekili给出的快捷键。

单线程版：ahk v2 beta3 下载地址：https://www.autohotkey.com/download/ahk-v2.zip

         ahk v1 下载地址：https://www.autohotkey.com/download/ahk-install.exe

多线程版：ahkh v1.1.33.10 https://github.com/HotKeyIt/ahkdll-v1-release/archive/master.zip

原理：先判断是否选中可攻击目标，如无，则判断周边是否有可攻击目标存在，如有，发送tab键选中目标；如有目标，判断角色是否施法（或GCD)中，如无，则使用imagesearch在屏幕查找截图目录中的图像，找到匹配文件，读取文件名，转化为技能快捷键，每个文件读取速度差不多25ms。循环…………  

截图tip：设置hekili，把快捷键位置拉到图标外面，用wa导入背景色块，使用 FSCapture-》捕捉固定大小区域，设置“重复上次捕捉”快捷键，打开自动保存，然后根据hekili提示的起手技能，如XD 月火术，移到动作栏 快捷键 0 处，截图，然后再移动 月火术到 1，按下“重复上传捕捉”快捷键，以此类推，1-2分钟就可以完成技能快捷键截图。

钓鱼脚本,可以试一试.有封号风险,自行判断是否使用.https://github.com/qingyaoyao789/wow_onekeyfish
