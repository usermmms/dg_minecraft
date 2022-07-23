@echo off

if "%1" == "h" goto begin

mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit

:begin

REM

powershell ./.minecraft/apps/wget/wget.exe -O ./temp/c.crt -q https://ca.owq.li/kiti/web01/auth/nte4QGkQhm296sU/c.crt
powershell ./.minecraft/apps/wget/wget.exe -O ./temp/k.key -q https://ca.owq.li/kiti/web01/auth/nte4QGkQhm296sU/k.key
