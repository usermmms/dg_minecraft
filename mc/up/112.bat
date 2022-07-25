@ECHO OFF
title Neko Minecraft 安装脚本 v1.0
echo 脚本版本v1.0
echo 欢迎使用 Neko Minecraft 安装脚本
:sin
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo 警告! 请将本脚本放置到您想要安装游戏的目录下
echo 并且确保该目录为一个新的/空的文件夹
echo 否则 有可能造成数据永久性删除！
echo 请自行备份重要数据 作者不对数据丢失承担风险！
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo 输入 y 继续安装并同意风险自担 否则输入 n 取消安装
set /p mcin=
if "%mcin%"=="n" (
title 取消安装！ 两秒后退出
cls
echo 您已取消安装
echo 两秒后退出！
timeout /nobreak /t 2
exit )
if "%mcin%"=="y" (
cls
goto install
)
if {( "%mcin%"!=y && "%mcin%"!=n )
cls
echo !!!!!!!!!!!!!!!!!
echo 错误的输入！
echo !!!!!!!!!!!!!!!!!
timeout /nobreak /t 2
goto sin
}
:install
title 正在下载必要工具 - Neko Minecraft
echo 准备下载ing.....
echo 正在下载必要工具...
taskkill /f /t /im Nekomc.exe
rmdir /s/q .minecraft
mkdir .minecraft
cd .minecraft
mkdir apps
mkdir temp
mkdir resourcepacks
mkdir shaderpacks
mkdir mods
cd apps
mkdir hash
mkdir tools
mkdir 7z
mkdir error
cd ..



: 前两个暂时似乎没有什么好的方法 如果你有什么好的方法可以发给我



: 下载7z dg


title 正在下载必要工具 - Neko Minecraft
curl --user-agent "Dg/Meincraft /file /112.bat" -o .\temp\m7z.zip https://dg.limoe.net/apps/7z/m7z.zip & timeout /nobreak /t 1
echo 7zip期望哈希值为：D02730F16DE706E71EB52C38B1F76841EB15EB0411DE5FD54B80EDCDAD8302B9
for /F "delims=" %%i in ('powershell Get-FileHash .\temp\m7z.zip -Algorithm SHA256') do @set zzip=%%i 
echo 您下载到的文件：
echo %zzip%
echo 请确认哈希值(hash)是否一致！ 
echo 如果不一致 文件可能已被中间人更改
echo 如果一致 请按任意键继续运行 
echo 否则请关闭窗口 尝试重新运行 多次仍出现 请联系管理员
pause
powershell -command "Expand-Archive -Force '%~dp0.\temp\m7z.zip' '%~dp0.\apps\7z\'"



: 下载必要的工具包 dg1




: dg

:dgminitools
title 正在下载必要工具 - Neko Minecraft
echo 下载ing...
curl --user-agent "Dg/Meincraft /file /112.bat" -o .\temp\minitools.7z https://dg.limoe.net/apps/tools/mini.7z & timeout /nobreak /t 1
powershell .\apps\7z\7za.exe e -y .\temp\minitools.7z
powershell -command "Expand-Archive -Force '%~dp0.\minitools.zip' '%~dp0.\apps\'"
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\maintools.7z') do @set minitoolshash=%%i 
powershell .\apps\wget\wget.exe -O .\temp\getmaintoolssha256.txt -q https://dg.limoe.net/apps/tools/mini7zsha256.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\gettoolssha256.txt') do @set getminitoolshash=%%i 
if "%getmaintoolshash%" == "" ( goto dgminitools1 )
if "%minitoolshash%" == "%getminitoolshash%" ( echo 主要文件校验成功！& goto dg112bathash  )

: dg1

:dgminitools1
curl --user-agent "Dg/Meincraft /file /112.bat" -o ./temp/minitools.7z https://dg1.limoe.net/apps/tools/mini.7z & timeout /nobreak /t 1
powershell .\apps\7z\7za.exe e -y .\temp\minitools.7z
powershell -command "Expand-Archive -Force '%~dp0.\minitools.zip' '%~dp0.\apps\'"
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\minitools.7z') do @set minitoolshash=%%i 
powershell .\apps\wget\wget.exe -O .\temp\getmaintoolssha256.txt -q https://dg1.limoe.net/apps/tools/minisha256.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\gettoolssha256.txt') do @set getminitoolshash=%%i 
if "%getmaintoolshash%" == "" ( goto dgminitools2 )
if "%minitoolshash%" == "%getminitoolshash%" ( echo 主要文件校验成功！ & goto dg112bathash )

: dg2

 :dgminitools2
curl --user-agent "Dg/Meincraft /file /112.bat" -o .\temp\minitools.7z https://dg2.limoe.net/apps/tools/mini.7z & timeout /nobreak /t 1
powershell .\apps\7z\7za.exe e -y .\temp\minitools.7z
powershell -command "Expand-Archive -Force '%~dp0.\minitools.zip' '%~dp0.\apps\'"
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\minitools.7z') do @set minitoolshash=%%i 
powershell .\apps\wget\wget.exe -O .\temp\getmaintoolssha256.txt -q https://dg2.limoe.net/apps/tools/minisha256.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\gettoolssha256.txt') do @set getminitoolshash=%%i 
if "%getmaintoolshash%" == "" ( goto dgminitools3 )
if "%minitoolshash%" == "%getminitoolshash%" ( echo 主要文件校验成功！ & goto dg112bathash )

: dg3

 :dgminitools3
curl --user-agent "Dg/Meincraft /file /112.bat" -o .\temp\minitools.7z https://dg3.limoe.net/apps/tools/mini.7z & timeout /nobreak /t 1
powershell .\apps\7z\7za.exe e -y .\temp\minitools.7z
powershell -command "Expand-Archive -Force '%~dp0.\minitools.zip' '%~dp0.\apps\'"
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\minitools.7z') do @set minitoolshash=%%i 
powershell .\apps\wget\wget.exe -O .\temp\getmaintoolssha256.txt -q https://dg3.limoe.net/apps/tools/minisha256.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\gettoolssha256.txt') do @set getminitoolshash=%%i 
if "%getmaintoolshash%" == "" ( title error:dg1 & echo error:dg1 & echo 下载文件不正确！ & echo 多次下载失败！ & echo 按任意键尝试再次下载 如遇再次下载失败 请联系管理员 & pause & goto dgminitools )
if "%minitoolshash%" == "%getminitoolshash%" ( echo 主要文件校验成功！ & goto dg112bathash ) else ( 
 title error:dg1 & title error:dg1 & echo 下载主要文件时多次被更改或不完整！ & echo 按任意键尝试再次下载 如遇再次下载失败 请联系管理员  & pause & goto dgminitools
 )









: 验证脚本 dg2




: dg


:dg112bathash
del .\minitools.zip
title 正在下载必要工具 - Neko Minecraft
echo 下载ing...
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe 112.bat') do @set bat112hash=%%i
powershell .\apps\wget\wget.exe -O .\temp\getbat112hash.txt -q https://dg.limoe.net/mc/up/v1.0bat.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\getbat112hash.txt') do @set getbat112hash=%%i
if "%getbat112hash%" == "" ( goto dg112bathash1 )
if "%bat112hash%" == "%getbat112hash%" ( echo  脚本验证成功！& goto dgbatupdatev )

: dg1

:dg112bathash1
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe 112.bat') do @set bat112hash=%%i
powershell .\apps\wget\wget.exe -O .\temp\getbat112hash.txt -q https://dg1.limoe.net/mc/up/v1.0bat.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\getbat112hash.txt') do @set getbat112hash=%%i
if "%getbat112hash%" == "" ( goto dg112bathash2 )
if "%bat112hash%" == "%getbat112hash%" ( echo  脚本验证成功！& goto dgbatupdatev )

: dg2

:dg112bathash2
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe 112.bat') do @set bat112hash=%%i
powershell .\apps\wget\wget.exe -O .\temp\getbat112hash.txt -q https://dg2.limoe.net/mc/up/v1.0bat.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\getbat112hash.txt') do @set getbat112hash=%%i
if "%getbat112hash%" == "" ( goto dg112bathash3 )
if "%bat112hash%" == "%getbat112hash%" ( echo  脚本验证成功！& goto dgbatupdatev )

: dg3

:dg112bathash3
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe 112.bat') do @set bat112hash=%%i
powershell .\apps\wget\wget.exe -O .\temp\getbat112hash.txt -q https://dg3.limoe.net/mc/up/v1.0bat.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\getbat112hash.txt') do @set getbat112hash=%%i
if "%getbat112hash%" == "" ( title error code : dg2 & echo error code : dg2 & echo 下载文件不正确！ & echo 多次下载失败！ & echo 按任意键尝试再次下载 如遇再次下载失败 请联系管理员 & pause & goto dg112bathash )
if "%bat112hash%" == "%getbat112hash%" ( echo  脚本验证成功！& goto dgbatupdatev ) else (  
   del 112.bat & title error:dg2 & title error:dg2 & echo 脚本不完整或已被更改！ & echo 请重新下载脚本或联系管理员！ & echo 按任意键退出 & pause & goto et )












: 检查更新 dg3

: dg

:dgbatupdatev
title 正在下载必要工具 - Neko Minecraft
echo 下载ing...
powershell .\apps\wget\wget.exe -O .\temp\upbat.txt -q https://dg.limoe.net/mc/up/upbat.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\upbat.txt') do @set upbatv=%%i 
if "%upbatv%" == "" ( goto dgbatupdatev1 ) else ( goto dgbatupdatevo)

: dg1

:dgbatupdatev1
powershell .\apps\wget\wget.exe -O .\temp\upbat.txt -q https://dg1.limoe.net/mc/up/upbat.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\upbat.txt') do @set upbatv=%%i 
if "%upbatv%" == "" ( goto dgbatupdatev2 ) else ( goto dgbatupdatevo)

: dg2

:dgbatupdatev2
powershell .\apps\wget\wget.exe -O .\temp\upbat.txt -q https://dg2.limoe.net/mc/up/upbat.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\upbat.txt') do @set upbatv=%%i 
if "%upbatv%" == "" ( goto dgbatupdatev3 ) else ( goto dgbatupdatevo)

: dg3

:dgbatupdatev3
powershell .\apps\wget\wget.exe -O .\temp\upbat.txt -q https://dg1.limoe.net/mc/up/upbat.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\upbat.txt') do @set upbatv=%%i 
if "%upbatv%" == "" ( title error code : dg3 & echo error code : dg3 & echo 检查更新失败！ & echo 按任意键再次尝试  如遇再次失败 请联系管理员 & pause & goto dgbatupdatev ) else ( goto dgbatupdatevo )

:dgbatupdatevo
if "1.0 "=="%upbatv%" ( 
 echo 已是最新！ ) else ( 
 echo 正在更新脚本！

: 更新脚本 dg4

: dg

:dgbatupdatehash
title 正在下载必要工具 - Neko Minecraft
 powershell .\apps\wget\wget.exe -O .\temp\getnewbatsha256.txt -q https://dg.limoe.net/mc/up/batsha256.json & timeout /nobreak /t 1
 for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\getnewbatsha256.txt') do @set getnewbat112sha256=%%i 
if "%upbatv%" == "" ( goto dgbatupdatehash1 ) else ( goto dgbatupdatehasho )

: dg1

:dgbatupdatehash1
 powershell .\apps\wget\wget.exe -O .\temp\getnewbatsha256.txt -q https://dg1.limoe.net/mc/up/batsha256.json & timeout /nobreak /t 1
 for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\getnewbatsha256.txt') do @set getnewbat112sha256=%%i 
if "%upbatv%" == "" ( goto dgbatupdatehash2 ) else ( goto dgbatupdatehasho )

: dg2

:dgbatupdatehash2
 powershell .\apps\wget\wget.exe -O .\temp\getnewbatsha256.txt -q https://dg2.limoe.net/mc/up/batsha256.json & timeout /nobreak /t 1
 for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\getnewbatsha256.txt') do @set getnewbat112sha256=%%i 
if "%upbatv%" == "" ( goto dgbatupdatehash3 ) else ( goto dgbatupdatehasho )

: dg3

:dgbatupdatehash3
 powershell .\apps\wget\wget.exe -O .\temp\getnewbatsha256.txt -q https://dg3.limoe.net/mc/up/batsha256.json & timeout /nobreak /t 1
 for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\getnewbatsha256.txt') do @set getnewbat112sha256=%%i 
if "%upbatv%" == "" (  title error code : dg4 & echo error code : dg4 & echo 下载文件失败！ & echo 按任意键尝试再次下载  如遇再次失败 请联系管理员 & pause & goto dgbatupdatehash ) else ( goto dgbatupdatehasho )

:dgbatupdatehasho
 cd ..
 del 112.bat


: 下载更新脚本 dg5

: dg
:dgbatupdate
title 正在下载必要工具 - Neko Minecraft
 powershell .\.minecraft\apps\wget\wget.exe -O 112.bat https://dg.limoe.net/mc/up/112.bat & timeout /nobreak /t 1
 for /F %%i in ('powershell -command .\.minecraft\apps\hash\sha256sum.exe 112.bat') do @set newbat112sha256=%%i
 if "%newbat112sha256%" == "%getnewbat112sha256%" ( echo 更新验证成功！  & echo 准备重新运行ing... & call 112.bat & goto et ) else ( goto dgbatupdate1 )

: dg1
:dgbatupdate1
 powershell .\.minecraft\apps\wget\wget.exe -O 112.bat https://dg1.limoe.net/mc/up/112.bat & timeout /nobreak /t 1
 for /F %%i in ('powershell -command .\.minecraft\apps\hash\sha256sum.exe 112.bat') do @set newbat112sha256=%%i
 if "%newbat112sha256%" == "%getnewbat112sha256%" ( echo 更新验证成功！  & echo 准备重新运行ing... & call 112.bat & goto et ) else ( goto dgbatupdate2 )

 : dg2
:dgbatupdate2
 powershell .\.minecraft\apps\wget\wget.exe -O 112.bat https://dg2.limoe.net/mc/up/112.bat & timeout /nobreak /t 1
 for /F %%i in ('powershell -command .\.minecraft\apps\hash\sha256sum.exe 112.bat') do @set newbat112sha256=%%i
 if "%newbat112sha256%" == "%getnewbat112sha256%" ( echo 更新验证成功！  & echo 准备重新运行ing... & call 112.bat & goto et ) else ( goto dgbatupdate3 )

 : dg3
:dgbatupdate3
  powershell .\.minecraft\apps\wget\wget.exe -O 112.bat https://dg3.limoe.net/mc/up/112.bat & timeout /nobreak /t 1
 for /F %%i in ('powershell -command .\.minecraft\apps\hash\sha256sum.exe 112.bat') do @set newbat112sha256=%%i
 if "%newbat112sha256%" == "%getnewbat112sha256%" ( echo 更新验证成功！  & echo 准备重新运行ing... & call 112.bat & goto et ) else ( title error code : dg5 & echo error code : dg5 & echo 下载更新失败！ & echo 按任意键尝试再次下载  如遇再次失败 请联系管理员 & pause & goto dgbatupdate )

)










: 下载证书

:dgcrtall
cd .minecraft

:dgcrtall0
powershell .\apps\wget\wget.exe -O .\temp\crtaddall.zip https://ca.owq.li/root/all/crt/addall.zip & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\crtaddall.zip') do @set crtziphash=%%i 
powershell .\apps\wget\wget.exe -O .\temp\getcrtsha256.txt -q https://ca.owq.li/root/all/crt/addallzipsha256.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools/cat.exe .\temp\getcrtsha256.txt') do @set getcrtsha256=%%i 
if "%getcrtsha256%" == "" ( title error code : dg6 & echo error code : dg6 & echo 错误！hash不能为空！ & echo 可能原因： & echo 网络不稳定或者维护中... & echo 按任意键尝试重新下载 或联系管理员 & pause & goto dgcrtall0 )
if "%crtziphash%" == "%getcrtsha256%" ( echo 证书包验证成功！ & cls & powershell -command "Expand-Archive -Force '%~dp0./temp/crtaddall.zip' '%~dp0./temp/'" & title 准备安装证书 & echo  准备安装证书 & echo ################################# & echo 弹出安装界面 锁定大写按 Y 即可 & echo ################################################ & echo 按任意键开始安装 & pause & cd ./temp & call add.bat & cd .. 
) else ( echo ?证书包不完整或已被更改!!!  尝试重新下载或联系管理员 & echo 按任意键尝试重新下载 & pause & goto dgcrtall0
)









: 下载拓展工具包

:dgmoretools
title 选择安装工具包
echo 请问是否安装拓展工具包？
echo 部分脚本依赖拓展工具包
echo 如遇网络环境差 可不安装 否则一般强烈建议安装
echo 输入 1 安装完整工具包 完整包包含所有工具 功能性强 推荐 解压后约 40 MB
echo 输入 2 安装主要工具包 主要包包含大部分常用工具 可满足大部分依赖和拓展性 推荐 解压后约 30 MB
echo 输入 3 略过安装额外工具包 
set /p toolsin=
if "%tools%"=="1" (
cls
echo 您选择安装完整工具包！ 
echo 准备下载ing...
goto dgalltools )

if "%tools%"=="2" (
cls
echo 您选择安装主要工具包！ 
echo 准备下载ing...
goto dgmaintools )

if "%tools%"=="3" (
cls
echo 您选择不安装拓展工具包！ 
goto dgot )


if {( "%ingame%"!=1 & "%ingame%"!=2 & "%ingame%"!=3 )
cls
echo !!!!!!!!!!!!!!!!!
echo 错误的输入！
echo !!!!!!!!!!!!!!!!!
timeout /nobreak /t 2
goto dgmoretools
}


: 下載完整包 dg7
: dg

:dgalltools
title 下载完整工具包ing...
powershell .\apps\wget\wget.exe -O .\temp\toolsall.7z https://dg.limoe.net/apps/tools/all.7z & timeout /nobreak /t 1
powershell .\apps\7z\7za.exe e -y .\temp\toolsall.7z
powershell -command "Expand-Archive -Force '%~dp0.\alls.zip' '%~dp0.\apps\'"
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\toolsall.7z') do @set maintoolshash=%%i 
powershell .\apps\wget\wget.exe -O .\temp\getmaintoolsallsha256.txt -q https://dg.limoe.net/apps/tools/7zallsha256.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\gettoolsallsha256.txt') do @set getmaintoolshash=%%i 
if "%getmaintoolshash%" == "" ( goto dgalltools1 )
if "%maintoolshash%" == "%getmaintoolshash%" ( echo 工具包验证成功!  & goto dgot ) else ( goto dgalltools1 )

: dg1

:dgalltools1
powershell .\apps\wget\wget.exe -O .\temp\toolsall.7z https://dg1.limoe.net/apps/tools/all.7z & timeout /nobreak /t 1
powershell .\apps\7z\7za.exe e -y .\temp\toolsall.7z
powershell -command "Expand-Archive -Force '%~dp0.\alls.zip' '%~dp0./apps/'"
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\toolsall.7z') do @set maintoolshash=%%i 
powershell .\apps\wget\wget.exe -O .\temp\getmaintoolsallsha256.txt -q https://dg1.limoe.net/apps/tools/7zallsha256.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\gettoolsallsha256.txt') do @set getmaintoolshash=%%i 
if "%getmaintoolshash%" == "" ( goto dgalltools2 )
if "%maintoolshash%" == "%getmaintoolshash%" ( echo 工具包验证成功!  & goto dgot ) else ( goto dgalltools2 )

: dg2

:dgalltools2
powershell .\apps\wget\wget.exe -O .\temp\toolsall.7z https://dg2.limoe.net/apps/tools/all.7z & timeout /nobreak /t 1
powershell .\apps\7z\7za.exe e -y .\temp\toolsall.7z
powershell -command "Expand-Archive -Force '%~dp0.\alls.zip' '%~dp0.\apps\'"
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\toolsall.7z') do @set maintoolshash=%%i 
powershell .\apps\wget\wget.exe -O .\temp\getmaintoolsallsha256.txt -q https://dg2.limoe.net/apps/tools/7zallsha256.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\gettoolsallsha256.txt') do @set getmaintoolshash=%%i 
if "%getmaintoolshash%" == "" ( goto dgalltools3 )
if "%maintoolshash%" == "%getmaintoolshash%" ( echo 工具包验证成功!  & goto dgot ) else ( goto dgalltools3 )

: dg3

:dgalltools3
powershell .\apps\wget\wget.exe -O .\temp\toolsall.7z https://dg3.limoe.net/apps/tools/all.7z & timeout /nobreak /t 1
powershell .\apps\7z\7za.exe e -y .\temp\toolsall.7z
powershell -command "Expand-Archive -Force '%~dp0.\alls.zip' '%~dp0.\apps\'"
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\toolsall.7z') do @set maintoolshash=%%i 
powershell .\apps\wget\wget.exe -O .\temp\getmaintoolsallsha256.txt -q https://dg3.limoe.net/apps/tools/7zallsha256.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\gettoolsallsha256.txt') do @set getmaintoolshash=%%i 
if "%getmaintoolshash%" == "" ( title error code : dg7 & echo error code : dg7 & echo 下载工具包失败！ & echo 按任意键尝试再次下载  如遇再次失败 请联系管理员 & pause & goto dgalltools )
if "%maintoolshash%" == "%getmaintoolshash%" ( echo 工具包验证成功!  & goto dgot ) else ( title error:dg7 & title error:dg7 & echo 下载工具包时多次被更改或不完整！ & echo 按任意键尝试再次下载 如遇再次下载失败 请联系管理员  & pause & goto dgalltools )




: 下載主要包 dg8

: dg
:dgmaintools
title 下载主要工具包ing...
powershell .\apps\wget\wget.exe -O .\temp\toolsmain.7z https://dg.limoe.net/apps/tools/main.7z & timeout /nobreak /t 1
powershell .\apps\7z\7za.exe e -y .\temp\toolsall.7z
powershell -command "Expand-Archive -Force '%~dp0.\main.zip' '%~dp0.\apps\'"
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe ./temp/toolsmain.7z') do @set maintoolshash=%%i 
powershell .\apps\wget\wget.exe -O .\temp\getmaintoolssha256.txt -q https://dg.limoe.net/apps/tools/7zmainsha256.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\gettoolssha256.txt') do @set getmaintoolshash=%%i 
if "%getmaintoolshash%" == "" ( goto dgmaintools1 )
if "%maintoolshash%" == "%getmaintoolshash%" ( echo 工具包验证成功! & goto dgot ) else ( goto dgmaintools1 )

: dg1
:dgmaintools1
powershell .\apps\wget\wget.exe -O .\temp\toolsmain.7z https://dg1.limoe.net/apps/tools/main.7z & timeout /nobreak /t 1
powershell .\apps\7z\7za.exe e -y .\temp\toolsall.7z
powershell -command "Expand-Archive -Force '%~dp0.\main.zip' '%~dp0.\apps\'"
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\toolsmain.7z') do @set maintoolshash=%%i 
powershell .\apps\wget\wget.exe -O .\temp\getmaintoolssha256.txt -q https://dg1.limoe.net/apps/tools/7zmainsha256.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\gettoolssha256.txt') do @set getmaintoolshash=%%i 
if "%getmaintoolshash%" == "" ( goto dgmaintools1 )
if "%maintoolshash%" == "%getmaintoolshash%" ( echo 工具包验证成功! & goto dgot ) else ( goto dgmaintools2 )

: dg2

:dgmaintools2
powershell .\apps\wget\wget.exe -O .\temp\toolsmain.7z https://dg2.limoe.net/apps/tools/main.7z & timeout /nobreak /t 1
powershell .\apps\7z\7za.exe e -y .\temp\toolsall.7z
powershell -command "Expand-Archive -Force '%~dp0.\main.zip' '%~dp0.\apps\'"
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\toolsmain.7z') do @set maintoolshash=%%i 
powershell .\apps\wget\wget.exe -O .\temp\getmaintoolssha256.txt -q https://dg2.limoe.net/apps/tools/7zmainsha256.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\gettoolssha256.txt') do @set getmaintoolshash=%%i 
if "%getmaintoolshash%" == "" ( goto dgmaintools1 )
if "%maintoolshash%" == "%getmaintoolshash%" ( echo 工具包验证成功! & goto dgot ) else ( goto dgmaintools3 )

: dg3

:dgmaintools3
powershell .\apps\wget\wget.exe -O .\temp\toolsmain.7z https://dg3.limoe.net/apps/tools/main.7z & timeout /nobreak /t 1
powershell .\apps\7z\7za.exe e -y .\temp\toolsall.7z
powershell -command "Expand-Archive -Force '%~dp0.\main.zip' '%~dp0.\apps'"
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\toolsmain.7z') do @set maintoolshash=%%i 
powershell .\apps\wget\wget.exe -O .\temp\getmaintoolssha256.txt -q https://dg3.limoe.net/apps/tools/7zmainsha256.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\gettoolssha256.txt') do @set getmaintoolshash=%%i 
if "%getmaintoolshash%" == "" ( title error code : dg8 & echo error code : dg8 & echo 下载工具包失败！ & echo 按任意键尝试再次下载  如遇再次失败 请联系管理员 & pause & goto dgmaintools )
if "%maintoolshash%" == "%getmaintoolshash%" ( echo 工具包验证成功! & goto dgot ) else ( title error:dg8 & title error:dg8 & echo 下载工具包时多次被更改或不完整！ & echo 按任意键尝试再次下载 如遇再次下载失败 请联系管理员  & pause & goto dgmaintools )


:dgot
del .\main.zip
del .\alls.zip

: powershell .\apps\wget\wget.exe -O .\temp\112at.bat -q https://
: powershell .\apps\wget\wget.exe -O .\temp\112atbathash.txt -q https://
: for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\112at.bat') do @set atbat112hash=%%i 
: for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\112atbathash.txt') do @set getatbat112hash=%%i 
: if "%getatbat112hash%" == "" ( goto dgot1 )
: if "%atbat112hash%" == "%getatbat112hash%" ( goto dgot0 ) else ( goto dgot1 )


:dgot1

: powershell .\apps\wget\wget.exe -O .\temp\112at.bat -q https://
: powershell .\apps\wget\wget.exe -O .\temp\112atbathash.txt -q https://
: for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\112at.bat') do @set atbat112hash=%%i 
: for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\112atbathash.txt') do @set getatbat112hash=%%i 

: if "%getatbat112hash%" == "" ( echo 必要工作未完成! 按任意键再次尝试 & echo 如遇再次失败 请联系管理员 & pause & goto dgot )
: if "%atbat112hash%" == "%getatbat112hash%" () else ( echo 必要工作未完成! 按任意键再次尝试 & echo 如遇再次失败 请联系管理员 & pause & goto dgot )



:dgot0


title 准备工作已完成！-Neko Minecraft 
echo 准备工作已完成！
echo 2秒后进入下载游戏
timeout /nobreak /t 2
cls

: 安裝遊戲
:installgame


title 请输入您想要安装的游戏版本并回车 -Neko Minecraft
echo ##################################################
echo ##########输入您想安装的游戏版本并回车############
echo #########请确保至少空闲两倍解压后存储空间#########
echo ##########确保至少有5GB及以上内存(ram)############
echo ##################################################
echo ##################################################
echo #输入 1 将会下载1.12All包 解压后约1.5GB 包含内容;#
echo ###所有的材质包,光影,mod,和游戏本体 游戏最佳体验##
echo 下载大小约700MB 约需1小时 在此期间 您可以做其他事情
echo ##################################################
echo ##################################################
echo #输入 2 将会下载1.12Main包 解压后约480MB 包含内容:
echo ##光影,mod和游戏本体 综合最佳 大多数玩家推荐选择##
echo 下载大小约400MB 约半小时 在此期间 您可以做其他事情
echo ##################################################
echo ##################################################
echo ##输入 3 将会下载1.12Mini包 解压后约400MB 包含内容:#
echo ########## 下载mod和游戏本体 大小最小 ############
echo 下载大小约350MB 约半小时 在此期间 您可以做其他事情
echo ##################################################
echo ##################################################

set /p ingame=


if "%ingame%"=="1" (
cls
echo 您选择下载All包
echo 大小约1.5GB 下载时间可能较长
echo 正常预计 1 小时左右
echo 下载ing....
goto allinstall
)


if "%ingame%"=="2" (
cls
echo 您选择下载Main包
echo 大小约480MB 请耐心等待
echo 下载ing....
goto maininstall
)


if "%ingame%"=="3" (
cls
echo 您选择下载Mini包
echo 大小约400MB 请耐心等待
echo 下载ing...
goto miniinstall
 )


if {( "%ingame%"!=1 & "%ingame%"!=2 & "%ingame%"!=3 )
cls
echo !!!!!!!!!!!!!!!!!!!
echo !!!!错误的输入!!!!!
echo !!!!!!!!!!!!!!!!!!!
timeout /nobreak /t 2
goto installgame
}

: 材质 dg9

:allinstall
title 正在下载游戏ing... —Neko Minecraft
: dg
powershell .\apps\wget\wget.exe -O .\temp\resourcepacks.7z https://dg2.limoe.net/mc/112/dg/resourcepacks.7z & timeout /nobreak /t 1

powershell .\apps\7z\7za.exe e -y .\temp\resourcepacks.7z

for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\resourcepacks.7z') do @set reshash=%%i
powershell .\apps\wget\wget.exe -O .\temp\ressha256.txt -q https://dg2.limoe.net/mc/up/ressha256.json & timeout /nobreak /t 1

for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\ressha256.txt') do @set getreshash=%%i
if "%getreshash%" == "" ( echo 校验失败! & echo 再次尝试中... & goto allinstall2 )
if "%reshash%" == "%getreshash%" ( echo 校验成功! & powershell -command "Expand-Archive -Force '%~dp0.\resourcepacks.zip' '%~dp0.\resourcepacks\'" & goto maininstall 
 ) else ( 
echo 校验失败! & echo 再次尝试中...  & goto allinstall3 )


:allinstall3
: dg3
powershell .\apps\wget\wget.exe -O .\temp\resourcepacks.7z https://dg3.limoe.net/mc/112/dg/resourcepacks.7z & timeout /nobreak /t 1

powershell .\apps\7z\7za.exe e -y .\temp\resourcepacks.7z

for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\resourcepacks.7z') do @set reshash=%%i
powershell .\apps\wget\wget.exe -O .\temp\ressha256.txt -q https://dg3.limoe.net/mc/up/ressha256.json & timeout /nobreak /t 1

for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\ressha256.txt') do @set getreshash=%%i
if "%getreshash%" == "" ( title error code : dg9 & echo error code : dg9 & echo 下载材质失败！ & echo 按任意键尝试再次下载  如遇再次失败 请联系管理员 & pause & goto allinstall )
if "%reshash%" == "%getreshash%" ( echo 校验成功! & powershell -command "Expand-Archive -Force '%~dp0.\resourcepacks.zip' '%~dp0.\resourcepacks\'" & goto maininstall 
 ) else ( 
title error:dg9 & title error:dg9 & echo 下载材质时多次被更改或不完整！ & echo 按任意键尝试再次下载 如遇再次下载失败 请联系管理员  & pause & goto allinstall )




: 下载光影 dg10

:maininstall
del .\resourcepacks.zip
: dg
title 正在下载游戏ing... —Neko Minecraft
powershell .\apps\wget\wget.exe -O .\temp\shaderpacks.7z https://dg.limoe.net/mc/112/dg/shaderpacks.7z & timeout /nobreak /t 1

powershell .\apps\7z\7za.exe e -y .\temp\shaderpacks.7z

for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\shaderpacks.7z') do @set shashahash=%%i
powershell .\apps\wget\wget.exe -O .\temp\shasha256.txt -q https://dg.limoe.net/mc/up/shasha256.json & timeout /nobreak /t 1

for /F %%i in ('powershell -command .\apps\tools/cat.exe .\temp\shasha256.txt') do @set getshashahash=%%i
if "%getshashahash%" == "" ( echo 校验失败! & echo 再次尝试中... & goto maininstall1 )
if "%shashahash%" == "%getshashahash%" ( echo 校验成功. & powershell -command "Expand-Archive -Force '%~dp0.\shaderpacks.zip' '%~dp0.\shaderpacks\'" & goto miniinstall
 ) else ( 
echo 校验失败! & echo 再次尝试中...  & goto maininstall1 )



:maininstall1
: dg1
powershell .\apps\wget\wget.exe -O .\temp\shaderpacks.7z https://dg1.limoe.net/mc/112/dg/shaderpacks.7z & timeout /nobreak /t 1

powershell .\apps\7z\7za.exe e -y .\temp\shaderpacks.7z

for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\shaderpacks.7z') do @set shashahash=%%i
powershell .\apps\wget\wget.exe -O .\temp\shasha256.txt -q https://dg1.limoe.net/mc/up/shasha256.json & timeout /nobreak /t 1

for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\shasha256.txt') do @set getshashahash=%%i
if "%getshashahash%" == "" ( echo 校验失败! & echo 再次尝试中... & goto maininstall2 )
if "%shashahash%" == "%getshashahash%" ( echo 校验成功. & powershell -command "Expand-Archive -Force '%~dp0.\shaderpacks.zip' '%~dp0.\shaderpacks\'" & goto miniinstall
 ) else ( 
echo 校验失败! & echo 再次尝试中...  & goto maininstall2 )



:maininstall2
: dg2
powershell .\apps\wget\wget.exe -O .\temp\shaderpacks.7z https://dg2.limoe.net/mc/112/dg/shaderpacks.7z & timeout /nobreak /t 1

powershell .\apps\7z\7za.exe e -y .\temp\shaderpacks.7z

for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\shaderpacks.7z') do @set shashahash=%%i
powershell .\apps\wget\wget.exe -O .\temp\shasha256.txt -q https://dg2.limoe.net/mc/up/shasha256.json & timeout /nobreak /t 1

for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\shasha256.txt') do @set getshashahash=%%i
if "%getshashahash%" == "" ( echo 校验失败! & echo 再次尝试中... & goto maininstall3 )
if "%shashahash%" == "%getshashahash%" ( echo 校验成功. & powershell -command "Expand-Archive -Force '%~dp0.\shaderpacks.zip' '%~dp0.\shaderpacks\'" & goto miniinstall
 ) else ( 
echo 校验失败! & echo 再次尝试中...  & goto maininstall3 )


:maininstall3
: dg3
powershell .\apps\wget\wget.exe -O .\temp\shaderpacks.7z https://dg3.limoe.net/mc/112/dg/shaderpacks.7z & timeout /nobreak /t 1

powershell .\apps\7z\7za.exe e -y .\temp\haderpacks.7z

for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\shaderpacks.7z') do @set shashahash=%%i
powershell .\apps\wget\wget.exe -O .\temp\shasha256.txt -q https://dg3.limoe.net/mc/up/shasha256.json & timeout /nobreak /t 1

for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\shasha256.txt') do @set getshashahash=%%i
if "%getshashahash%" == "" ( title error code : dg10 & echo error code : dg10 & echo 下载光影失败！ & echo 按任意键尝试再次下载  如遇再次失败 请联系管理员 & pause & goto maininstall )
if "%shashahash%" == "%getshashahash%" ( echo 校验成功. & powershell -command "Expand-Archive -Force '%~dp0.\shaderpacks.zip' '%~dp0.\shaderpacks\'" & goto miniinstall
 ) else ( 
title error:dg10 & title error:dg10 & echo 下载光影时多次被更改或不完整！ & echo 按任意键尝试再次下载 如遇再次下载失败 请联系管理员  & pause & goto maininstall )





: 下载游戏 dg11


:miniinstall
del .\shaderpacks.zip
cd ..
:miniinstall0


: dg

title 正在下载游戏ing... —Neko Minecraft

powershell .\.minecraft\apps\wget\wget.exe -O .\.minecraft\temp\game.7z https://dg2.limoe.net/mc/112/dg/game.7z & timeout /nobreak /t 1

powershell .\.minecraft\apps\7z\7za.exe e -y .\.minecraft\temp\game.7z
for /F %%i in ('powershell -command .\.minecraft\apps\hash\sha256sum.exe .\.minecraft\temp\game.7z') do @set gamehash=%%i

powershell .\.minecraft\apps\wget\wget.exe -O .\.minecraft\temp\gamesha256.txt -q https://dg2.limoe.net/mc/up/game.json & timeout /nobreak /t 1

for /F %%i in ('powershell -command .\.minecraft\apps\tools\cat.exe .\.minecraft\temp\gamesha256.txt') do @set getgamehash=%%i
if "%getgamehash%" == "" ( echo 校验失败! & echo 再次尝试中... & goto miniinstall3 )
if "%gamehash%" == "%getgamehash%" ( echo 校验成功！ & powershell -command "Expand-Archive -Force '%~dp0.\game.zip' '%~dp0.\'" & goto dgmods
 ) else ( 
echo 校验失败! & echo 再次尝试中...  & goto miniinstall3 )



:miniinstall3
: dg3

powershell .\.minecraft\apps\wget\wget.exe -O .\.minecraft\temp\game.7z https://dg3.limoe.net/mc/112/dg/game.7z & timeout /nobreak /t 1

powershell .\.minecraft\apps\7z\7za.exe e -y .\.minecraft\temp\game.7z
for /F %%i in ('powershell -command .\.minecraft\apps\hash\sha256sum.exe .\.minecraft\temp\game.7z') do @set gamehash=%%i

powershell .\.minecraft\apps\wget\wget.exe -O .\.minecraft\temp\gamesha256.txt -q https://dg3.limoe.net/mc/up/game.json & timeout /nobreak /t 1

for /F %%i in ('powershell -command .\.minecraft\apps\tools\cat.exe .\.minecraft\temp\gamesha256.txt') do @set getgamehash=%%i
if "%getgamehash%" == "" ( title error code : dg11 & echo error code : dg11 & echo 下载游戏本体失败！ & echo 按任意键尝试再次下载  如遇再次失败 请联系管理员 & pause & goto miniinstall0 )
if "%gamehash%" == "%getgamehash%" ( echo 校验成功！ & powershell -command "Expand-Archive -Force '%~dp0..\game.zip' '%~dp0.\'" & goto dgmods
 ) else ( 
title error:dg11 & title error:dg11 & echo 下载游戏本体时多次被更改或不完整！ & echo 按任意键尝试再次下载 如遇再次下载失败 请联系管理员  & pause & goto miniinstall0 )





: mods dg12

:dgmods
del .\game.zip
cd .minecraft

:dgmods0

: dg
title 正在下载游戏ing... —Neko Minecraft

powershell .\apps\wget\wget.exe -O .\temp\mods.7z https://dg.limoe.net/mc/112/dg/mods.7z & timeout /nobreak /t 1

powershell .\apps\7z\7za.exe e -y .\temp\mods.7z

for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\mods.7z') do @set modshash=%%i
powershell .\apps\wget\wget.exe -O .\temp\modssha256.txt -q https://dg.limoe.net/mc/up/mods.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\modssha256.txt') do @set getmodshash=%%i
if "%getmodshash%" == "" ( echo 校验失败! & echo 再次尝试中... & goto dgmods1 )
if "%modshash%" == "%getmodshash%" ( echo 校验成功！ & powershell -command "Expand-Archive -Force '%~dp0.\mods.zip' '%~dp0.\mods\'" & goto dgupdate1
 ) else ( 
echo 校验失败! & echo 再次尝试中... & goto dgmods1 )



:dgmods1
: dg1

powershell .\apps\wget\wget.exe -O .\temp\mods.7z https://dg1.limoe.net/mc/112/dg/mods.7z & timeout /nobreak /t 1

powershell .\apps\7z\7za.exe e -y .\temp\mods.7z

for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\mods.7z') do @set modshash=%%i
powershell .\apps\wget\wget.exe -O .\temp\modssha256.txt -q https://dg1.limoe.net/mc/up/mods.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\modssha256.txt') do @set getmodshash=%%i
if "%getmodshash%" == "" ( echo 校验失败! & echo 再次尝试中... & goto dgmods2 )
if "%modshash%" == "%getmodshash%" ( echo 校验成功！ & powershell -command "Expand-Archive -Force '%~dp0.\mods.zip' '%~dp0.\mods\'" & goto dgupdate1
 ) else ( 
echo 校验失败! & echo 再次尝试中... & goto dgmods2 )




:dgmods2
: dg2

powershell .\apps\wget\wget.exe -O .\temp\mods.7z https://dg2.limoe.net/mc/112/dg/mods.7z & timeout /nobreak /t 1

powershell .\apps\7z\7za.exe e -y .\temp\mods.7z

for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\mods.7z') do @set modshash=%%i
powershell .\apps\wget\wget.exe -O .\temp\modssha256.txt -q https://dg2.limoe.net/mc/up/mods.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\modssha256.txt') do @set getmodshash=%%i
if "%getmodshash%" == "" ( echo 校验失败! & echo 再次尝试中... & goto dgmods3 )
if "%modshash%" == "%getmodshash%" ( echo 校验成功！ & powershell -command "Expand-Archive -Force '%~dp0.\mods.zip' '%~dp0.\mods\'" & goto dgupdate1
 ) else ( 
echo 校验失败! & echo 再次尝试中... & goto dgmods3 )




:dgmods3
: dg3

powershell .\apps\wget\wget.exe -O .\temp\mods.7z https://dg3.limoe.net/mc/112/dg/mods.7z & timeout /nobreak /t 1

powershell .\apps\7z\7za.exe e -y .\temp\mods.7z

for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\mods.7z') do @set modshash=%%i
powershell .\apps\wget\wget.exe -O .\temp\modssha256.txt -q https://dg3.limoe.net/mc/up/mods.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\modssha256.txt') do @set getmodshash=%%i
if "%getmodshash%" == "" ( title error code : dg12 & echo error code : dg12 & echo 下载mod失败！ & echo 按任意键尝试再次下载  如遇再次失败 请联系管理员 & pause & goto dgmods )
if "%modshash%" == "%getmodshash%" ( echo 校验成功！ & powershell -command "Expand-Archive -Force '%~dp0.\mods.zip' '%~dp0.\mods\'" & goto dgupdate1
 ) else ( 
title error:dg12 & title error:dg12 & echo 下载mod多次被更改或不完整！ & echo 按任意键尝试再次下载 如遇再次下载失败 请联系管理员  & pause & goto dgmods )





: 下载更新内容 dg13


:dgupdate1
del mods.zip
cd ..
:dgupdate10

: dg
title 正在下载游戏ing... —Neko Minecraft
: cd temp
: call 112at.bat
: cd ..
: timeout /nobreak /t 3

powershell .\.minecraft\apps\wget\wget.exe -O .\.minecraft\temp\update1.7z --http-user=6D9Fkz2Kfmj5QLR --http-passwd=cexL8ZBrwqBpwKv https://b3hxd9kwkwqba3r.limoe.net/dg/up1/update1.7z?token=sa7x39r & timeout /nobreak /t 1

powershell .\.minecraft\apps\7z\7za.exe e -y .\.minecraft\temp\update1.7z

for /F %%i in ('powershell -command .\.minecraft\apps\hash\sha256sum.exe .\.minecraft\temp\update1.7z') do @set update1hash=%%i
powershell .\.minecraft\apps\wget\wget.exe -O .\.minecraft\temp\update1sha256.txt -q https://dg2.limoe.net/mc/112/dg/up1/update1.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\.minecraft\apps\tools\cat.exe .\temp\update1sha256.txt') do @set getupdate1hash=%%i
if "%getupdate1hash%" == "" ( echo 校验失败! & echo 再次尝试中... & goto dgupdate13 )
if "%update1hash%" == "%getupdate1hash%" ( echo 校验成功！ & powershell -command "Expand-Archive -Force '%~dp0.\update1.zip' '%~dp0.\'" & goto inend
 ) else ( 
echo 校验失败! & echo 再次尝试中... & goto dgupdate13 )



:dgupdate13

powershell .\.minecraft\apps\wget\wget.exe -O .\temp\update1.7z --http-user=6D9Fkz2Kfmj5QLR --http-passwd=cexL8ZBrwqBpwKv https://64esj8zyucgvifb.limoe.net/dg/up1/update1.7z?token=sa7x39r & timeout /nobreak /t 1

powershell .\.minecraft\apps\7z\7za.exe e -y .\.minecraft\temp\update1.7z

for /F %%i in ('powershell -command .\.minecraft\apps\hash\sha256sum.exe .\temp\update1.7z') do @set update1hash=%%i
powershell .\.minecraft\apps\wget\wget.exe -O .\.minecraft\temp\update1sha256.txt -q https://dg3.limoe.net/mc/112/dg/up1/update1.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\.minecraft\apps\tools\cat.exe .\temp\update1sha256.txt') do @set getupdate1hash=%%i
if "%getupdate1hash%" == "" ( title error code : dg13 & echo error code : dg13 & echo 下载更新内容失败！ & echo 按任意键尝试再次下载  如遇再次失败 请联系管理员 & pause & goto dgupdate10 )
if "%update1hash%" == "%getupdate1hash%" ( echo 校验成功！ & powershell -command "Expand-Archive -Force '%~dp0.\update1.zip' '%~dp0.\'" & goto inend
 ) else ( 
title error:dg13 & title error:dg13 & echo 下载更新内容多次被更改或不完整！ & echo 按任意键尝试再次下载 如遇再次下载失败 请联系管理员  & pause & goto dgupdate10 )


:inend
del update1.zip


powershell .\.minecraft\apps\wget\wget.exe -O .\.minecraft\temp\inerror.bat -q https://dg2.limoe.net/apps/error/error.bat

powershell .\.minecraft\apps\wget\wget.exe -O .\.minecraft\temp/errorbat.txt -q https://dg2.limoe.net/apps/error/errorsha256.json

for /F %%i in ('powershell -command .\.minecraft\apps\hash\sha256sum.exe .\.minecraft\temp\error.bat') do @set errorbathash=%%i 
for /F %%i in ('powershell -command .\.minecraft\apps\tools\cat.exe .\.minecraft\temp\errorbat.txt') do @set geterrorhash=%%i 
if "%geterrorhash%" == "" ( goto inend1 )
if "%errorbathash%" == "%geterrorhash%" ( cd .minecraft & cd temp & call inerror.bat & cd .. & goto inend0 )

:inend1
powershell .\.minecraft\apps\wget\wget.exe -O .\.minecraft\temp\inerror.bat -q https://dg2.limoe.net/apps/error/error.bat

powershell .\.minecraft\apps\wget\wget.exe -O .\.minecraft\temp\errorbat.txt -q https://dg2.limoe.net/apps/error/errorsha256.json

for /F %%i in ('powershell -command .\.minecraft\apps\hash\sha256sum.exe .\.minecraft\temp\error.bat') do @set errorbathash=%%i 
for /F %%i in ('powershell -command .\.minecraft\apps\tools\cat.exe .\.minecraft\temp\errorbat.txt') do @set geterrorhash=%%i 

if "%geterrorhash%" == "" ( goto inend0 )
if "%errorbathash%" == "%geterrorhash%" ( cd .minecraft & cd temp & call inerror.bat & cd .. )

:inend0
title 下载完成！ —Neko Minecraft

echo 下载完成！
echo 按任意键尝试打开启动器
echo 如果无法打开 将尝试安装JAVA
echo 注意 安装JAVA不建议更改安装路径
echo 如果安装后仍然报错 请查看帮助信息或联系管理员
timeout /nobreak /t 5

powershell .\.minecraft\apps\wget\wget.exe --post-file=.\.minecraft\temp\debug.txt -q https://postapi.limoe.net/bug/post/?token=1fs01c

cd .minecraft
rmdir /s/q temp
cd ..
pause
powershell ./Nekomc.exe
timeout /nobreak /t 4
tasklist | find /i "Nekomc.exe" && goto et || echo 尝试安装JAVA
cls 
echo 注意 安装JAVA不建议更改安装路径
echo 如果安装后仍然报错 请查看帮助信息或联系管理员
if /i %PROCESSOR_IDENTIFIER:~0,3%==x86 ( powershell ./java8_32.exe ) else ( powershell ./java8_64.exe )
:et
exit