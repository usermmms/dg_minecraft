echo 错误提交排查v0.1
echo 如您遇到错误 无法启动 游戏崩溃等问题
echo 运行本脚本以便帮助您解决问题
echo 请问是否确认运行？
echo 输入 y 并回车 确认    按 n 并回车 取消运行并退出
title 错误提交排查

set /p erin=
if "%erin%"=="n" (
title 取消运行 两秒后退出
cls
echo 您已取消运行!
echo 2秒后退出!
timeout /nobreak /t 2
exit )
if "%erin%"=="y" (
cls
goto st
)
if{("%erin%"!=y && "%mcin%"!=n)
cls
echo 错误的输入!
goto sin
}
:st
title 下载必要的工具
echo 下载必要的工具
curl --user-agent "Dg/Meincraft /error /error.bat" -o ./temp/errortools.zip https://dg.limoe.net/apps/tools/error.zip & timeout /nobreak /t 1
powershell -command "Expand-Archive -Force '%~dp0./temp/error.zip' '%~dp0./.minecraft/apps/'"
for /F %%i in ('powershell -command ./.minecraft/apps/hash/sha256sum.exe ./temp/error.zip') do @set errorziphash=%%i
powershell ./.minecraft/apps/wget/wget.exe -O ./temp/geterrorsha256.txt https://dg.limoe.net/apps/tools/errorsha256.json & timeout /nobreak /t 1 
for /F %%i in ('powershell -command ./.minecraft/apps/tools/cat.exe ./temp/geterrorsha256.txt') do @set geterrorzipash=%%i 
if "%getmaintoolshash%" == "" ( title 按任意键重试 & echo hash为空! 可能原因： & echo 网络不稳定 下载失败/超时 & echo 建议重新尝试一次 或联系管理员 & echo 按任意键 将尝试重新运行一次 您也可以直接关闭本窗口 & pause & goto st
)
if "%errorziphash%" == "%geterrorziphash%" ( echo 工具包校验成功!  ) else ( 
 echo 错误工具包不完整或已被更改！ 请尝试重新执行或联系管理员 & echo 按任意键退出 & pause & goto et
 )
: 验证脚本完整性
for /F %%i in ('powershell -command ./.minecraft/apps/hash/sha256sum.exe error.bat') do @set baterrorhash=%%i
powershell ./.minecraft/apps/wget/wget.exe -O ./temp/getbaterrorhash.txt https://dg.limoe.net/mc/up/v0.1errorbat.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command ./.minecraft/apps/tools/cat.exe ./temp/getbaterrorhash.txt') do @set getbaterrorhash=%%i
if "%baterrorhash%" == "%geterrorhash%" ( 
echo 脚本校验成功！ ) else ( 
echo 脚本不完整或已被更改!!! 请尝试重新执行或联系管理员 & echo 按任意键退出 & pause & goto et )



cd .minecraft
cd apps
cd error
call error.bat
echo 正在收集崩溃信息...
echo 请稍后...
timeout /nobreak /t 9
cd ..
cd ..
powershell ./apps/7z/7za.exe a error.zip ./*.log ./.minecraft/*.log ./.minecraft/logs/* ./.minecraft/apps/error/*.log
set /p inname=
echo 请输入您的暱称 以便更快解决问题
curl --user-agent "up/Meincraft /errror" -F "%inname%" -s -X POST -F './error.zip' https://postapi.limoe.net/upload/error/?token=asdmcvb98
echo 已提交反馈！
echo 请耐心等待 重复提交不会让您的处理更快速
echo 按任意键退出
pause
:et
exit