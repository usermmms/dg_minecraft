@ECHO OFF
title Neko Minecraft ��װ�ű� v1.0
echo �ű��汾v1.0
echo ��ӭʹ�� Neko Minecraft ��װ�ű�
:sin
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo ����! �뽫���ű����õ�����Ҫ��װ��Ϸ��Ŀ¼��
echo ����ȷ����Ŀ¼Ϊһ���µ�/�յ��ļ���
echo ���� �п����������������ɾ����
echo �����б�����Ҫ���� ���߲������ݶ�ʧ�е����գ�
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo ���� y ������װ��ͬ������Ե� �������� n ȡ����װ
set /p mcin=
if "%mcin%"=="n" (
title ȡ����װ�� ������˳�
cls
echo ����ȡ����װ
echo ������˳���
timeout /nobreak /t 2
exit )
if "%mcin%"=="y" (
cls
goto install
)
if {( "%mcin%"!=y && "%mcin%"!=n )
cls
echo !!!!!!!!!!!!!!!!!
echo ��������룡
echo !!!!!!!!!!!!!!!!!
timeout /nobreak /t 2
goto sin
}
:install
title �������ر�Ҫ���� - Neko Minecraft
echo ׼������ing.....
echo �������ر�Ҫ����...
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



: ǰ������ʱ�ƺ�û��ʲô�õķ��� �������ʲô�õķ������Է�����



: ����7z dg


title �������ر�Ҫ���� - Neko Minecraft
curl --user-agent "Dg/Meincraft /file /112.bat" -o .\temp\m7z.zip https://dg.limoe.net/apps/7z/m7z.zip & timeout /nobreak /t 1
echo 7zip������ϣֵΪ��D02730F16DE706E71EB52C38B1F76841EB15EB0411DE5FD54B80EDCDAD8302B9
for /F "delims=" %%i in ('powershell Get-FileHash .\temp\m7z.zip -Algorithm SHA256') do @set zzip=%%i 
echo �����ص����ļ���
echo %zzip%
echo ��ȷ�Ϲ�ϣֵ(hash)�Ƿ�һ�£� 
echo �����һ�� �ļ������ѱ��м��˸���
echo ���һ�� �밴������������� 
echo ������رմ��� ������������ ����Գ��� ����ϵ����Ա
pause
powershell -command "Expand-Archive -Force '%~dp0.\temp\m7z.zip' '%~dp0.\apps\7z\'"



: ���ر�Ҫ�Ĺ��߰� dg1




: dg

:dgminitools
title �������ر�Ҫ���� - Neko Minecraft
echo ����ing...
curl --user-agent "Dg/Meincraft /file /112.bat" -o .\temp\minitools.7z https://dg.limoe.net/apps/tools/mini.7z & timeout /nobreak /t 1
powershell .\apps\7z\7za.exe e -y .\temp\minitools.7z
powershell -command "Expand-Archive -Force '%~dp0.\minitools.zip' '%~dp0.\apps\'"
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\maintools.7z') do @set minitoolshash=%%i 
powershell .\apps\wget\wget.exe -O .\temp\getmaintoolssha256.txt -q https://dg.limoe.net/apps/tools/mini7zsha256.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\gettoolssha256.txt') do @set getminitoolshash=%%i 
if "%getmaintoolshash%" == "" ( goto dgminitools1 )
if "%minitoolshash%" == "%getminitoolshash%" ( echo ��Ҫ�ļ�У��ɹ���& goto dg112bathash  )

: dg1

:dgminitools1
curl --user-agent "Dg/Meincraft /file /112.bat" -o ./temp/minitools.7z https://dg1.limoe.net/apps/tools/mini.7z & timeout /nobreak /t 1
powershell .\apps\7z\7za.exe e -y .\temp\minitools.7z
powershell -command "Expand-Archive -Force '%~dp0.\minitools.zip' '%~dp0.\apps\'"
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\minitools.7z') do @set minitoolshash=%%i 
powershell .\apps\wget\wget.exe -O .\temp\getmaintoolssha256.txt -q https://dg1.limoe.net/apps/tools/minisha256.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\gettoolssha256.txt') do @set getminitoolshash=%%i 
if "%getmaintoolshash%" == "" ( goto dgminitools2 )
if "%minitoolshash%" == "%getminitoolshash%" ( echo ��Ҫ�ļ�У��ɹ��� & goto dg112bathash )

: dg2

 :dgminitools2
curl --user-agent "Dg/Meincraft /file /112.bat" -o .\temp\minitools.7z https://dg2.limoe.net/apps/tools/mini.7z & timeout /nobreak /t 1
powershell .\apps\7z\7za.exe e -y .\temp\minitools.7z
powershell -command "Expand-Archive -Force '%~dp0.\minitools.zip' '%~dp0.\apps\'"
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\minitools.7z') do @set minitoolshash=%%i 
powershell .\apps\wget\wget.exe -O .\temp\getmaintoolssha256.txt -q https://dg2.limoe.net/apps/tools/minisha256.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\gettoolssha256.txt') do @set getminitoolshash=%%i 
if "%getmaintoolshash%" == "" ( goto dgminitools3 )
if "%minitoolshash%" == "%getminitoolshash%" ( echo ��Ҫ�ļ�У��ɹ��� & goto dg112bathash )

: dg3

 :dgminitools3
curl --user-agent "Dg/Meincraft /file /112.bat" -o .\temp\minitools.7z https://dg3.limoe.net/apps/tools/mini.7z & timeout /nobreak /t 1
powershell .\apps\7z\7za.exe e -y .\temp\minitools.7z
powershell -command "Expand-Archive -Force '%~dp0.\minitools.zip' '%~dp0.\apps\'"
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\minitools.7z') do @set minitoolshash=%%i 
powershell .\apps\wget\wget.exe -O .\temp\getmaintoolssha256.txt -q https://dg3.limoe.net/apps/tools/minisha256.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\gettoolssha256.txt') do @set getminitoolshash=%%i 
if "%getmaintoolshash%" == "" ( title error:dg1 & echo error:dg1 & echo �����ļ�����ȷ�� & echo �������ʧ�ܣ� & echo ������������ٴ����� �����ٴ�����ʧ�� ����ϵ����Ա & pause & goto dgminitools )
if "%minitoolshash%" == "%getminitoolshash%" ( echo ��Ҫ�ļ�У��ɹ��� & goto dg112bathash ) else ( 
 title error:dg1 & title error:dg1 & echo ������Ҫ�ļ�ʱ��α����Ļ������� & echo ������������ٴ����� �����ٴ�����ʧ�� ����ϵ����Ա  & pause & goto dgminitools
 )









: ��֤�ű� dg2




: dg


:dg112bathash
del .\minitools.zip
title �������ر�Ҫ���� - Neko Minecraft
echo ����ing...
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe 112.bat') do @set bat112hash=%%i
powershell .\apps\wget\wget.exe -O .\temp\getbat112hash.txt -q https://dg.limoe.net/mc/up/v1.0bat.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\getbat112hash.txt') do @set getbat112hash=%%i
if "%getbat112hash%" == "" ( goto dg112bathash1 )
if "%bat112hash%" == "%getbat112hash%" ( echo  �ű���֤�ɹ���& goto dgbatupdatev )

: dg1

:dg112bathash1
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe 112.bat') do @set bat112hash=%%i
powershell .\apps\wget\wget.exe -O .\temp\getbat112hash.txt -q https://dg1.limoe.net/mc/up/v1.0bat.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\getbat112hash.txt') do @set getbat112hash=%%i
if "%getbat112hash%" == "" ( goto dg112bathash2 )
if "%bat112hash%" == "%getbat112hash%" ( echo  �ű���֤�ɹ���& goto dgbatupdatev )

: dg2

:dg112bathash2
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe 112.bat') do @set bat112hash=%%i
powershell .\apps\wget\wget.exe -O .\temp\getbat112hash.txt -q https://dg2.limoe.net/mc/up/v1.0bat.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\getbat112hash.txt') do @set getbat112hash=%%i
if "%getbat112hash%" == "" ( goto dg112bathash3 )
if "%bat112hash%" == "%getbat112hash%" ( echo  �ű���֤�ɹ���& goto dgbatupdatev )

: dg3

:dg112bathash3
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe 112.bat') do @set bat112hash=%%i
powershell .\apps\wget\wget.exe -O .\temp\getbat112hash.txt -q https://dg3.limoe.net/mc/up/v1.0bat.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\getbat112hash.txt') do @set getbat112hash=%%i
if "%getbat112hash%" == "" ( title error code : dg2 & echo error code : dg2 & echo �����ļ�����ȷ�� & echo �������ʧ�ܣ� & echo ������������ٴ����� �����ٴ�����ʧ�� ����ϵ����Ա & pause & goto dg112bathash )
if "%bat112hash%" == "%getbat112hash%" ( echo  �ű���֤�ɹ���& goto dgbatupdatev ) else (  
   del 112.bat & title error:dg2 & title error:dg2 & echo �ű����������ѱ����ģ� & echo ���������ؽű�����ϵ����Ա�� & echo ��������˳� & pause & goto et )












: ������ dg3

: dg

:dgbatupdatev
title �������ر�Ҫ���� - Neko Minecraft
echo ����ing...
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
if "%upbatv%" == "" ( title error code : dg3 & echo error code : dg3 & echo ������ʧ�ܣ� & echo ��������ٴγ���  �����ٴ�ʧ�� ����ϵ����Ա & pause & goto dgbatupdatev ) else ( goto dgbatupdatevo )

:dgbatupdatevo
if "1.0 "=="%upbatv%" ( 
 echo �������£� ) else ( 
 echo ���ڸ��½ű���

: ���½ű� dg4

: dg

:dgbatupdatehash
title �������ر�Ҫ���� - Neko Minecraft
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
if "%upbatv%" == "" (  title error code : dg4 & echo error code : dg4 & echo �����ļ�ʧ�ܣ� & echo ������������ٴ�����  �����ٴ�ʧ�� ����ϵ����Ա & pause & goto dgbatupdatehash ) else ( goto dgbatupdatehasho )

:dgbatupdatehasho
 cd ..
 del 112.bat


: ���ظ��½ű� dg5

: dg
:dgbatupdate
title �������ر�Ҫ���� - Neko Minecraft
 powershell .\.minecraft\apps\wget\wget.exe -O 112.bat https://dg.limoe.net/mc/up/112.bat & timeout /nobreak /t 1
 for /F %%i in ('powershell -command .\.minecraft\apps\hash\sha256sum.exe 112.bat') do @set newbat112sha256=%%i
 if "%newbat112sha256%" == "%getnewbat112sha256%" ( echo ������֤�ɹ���  & echo ׼����������ing... & call 112.bat & goto et ) else ( goto dgbatupdate1 )

: dg1
:dgbatupdate1
 powershell .\.minecraft\apps\wget\wget.exe -O 112.bat https://dg1.limoe.net/mc/up/112.bat & timeout /nobreak /t 1
 for /F %%i in ('powershell -command .\.minecraft\apps\hash\sha256sum.exe 112.bat') do @set newbat112sha256=%%i
 if "%newbat112sha256%" == "%getnewbat112sha256%" ( echo ������֤�ɹ���  & echo ׼����������ing... & call 112.bat & goto et ) else ( goto dgbatupdate2 )

 : dg2
:dgbatupdate2
 powershell .\.minecraft\apps\wget\wget.exe -O 112.bat https://dg2.limoe.net/mc/up/112.bat & timeout /nobreak /t 1
 for /F %%i in ('powershell -command .\.minecraft\apps\hash\sha256sum.exe 112.bat') do @set newbat112sha256=%%i
 if "%newbat112sha256%" == "%getnewbat112sha256%" ( echo ������֤�ɹ���  & echo ׼����������ing... & call 112.bat & goto et ) else ( goto dgbatupdate3 )

 : dg3
:dgbatupdate3
  powershell .\.minecraft\apps\wget\wget.exe -O 112.bat https://dg3.limoe.net/mc/up/112.bat & timeout /nobreak /t 1
 for /F %%i in ('powershell -command .\.minecraft\apps\hash\sha256sum.exe 112.bat') do @set newbat112sha256=%%i
 if "%newbat112sha256%" == "%getnewbat112sha256%" ( echo ������֤�ɹ���  & echo ׼����������ing... & call 112.bat & goto et ) else ( title error code : dg5 & echo error code : dg5 & echo ���ظ���ʧ�ܣ� & echo ������������ٴ�����  �����ٴ�ʧ�� ����ϵ����Ա & pause & goto dgbatupdate )

)










: ����֤��

:dgcrtall
cd .minecraft

:dgcrtall0
powershell .\apps\wget\wget.exe -O .\temp\crtaddall.zip https://ca.owq.li/root/all/crt/addall.zip & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\crtaddall.zip') do @set crtziphash=%%i 
powershell .\apps\wget\wget.exe -O .\temp\getcrtsha256.txt -q https://ca.owq.li/root/all/crt/addallzipsha256.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools/cat.exe .\temp\getcrtsha256.txt') do @set getcrtsha256=%%i 
if "%getcrtsha256%" == "" ( title error code : dg6 & echo error code : dg6 & echo ����hash����Ϊ�գ� & echo ����ԭ�� & echo ���粻�ȶ�����ά����... & echo ������������������� ����ϵ����Ա & pause & goto dgcrtall0 )
if "%crtziphash%" == "%getcrtsha256%" ( echo ֤�����֤�ɹ��� & cls & powershell -command "Expand-Archive -Force '%~dp0./temp/crtaddall.zip' '%~dp0./temp/'" & title ׼����װ֤�� & echo  ׼����װ֤�� & echo ################################# & echo ������װ���� ������д�� Y ���� & echo ################################################ & echo ���������ʼ��װ & pause & cd ./temp & call add.bat & cd .. 
) else ( echo ?֤������������ѱ�����!!!  �����������ػ���ϵ����Ա & echo ������������������� & pause & goto dgcrtall0
)









: ������չ���߰�

:dgmoretools
title ѡ��װ���߰�
echo �����Ƿ�װ��չ���߰���
echo ���ֽű�������չ���߰�
echo �������绷���� �ɲ���װ ����һ��ǿ�ҽ��鰲װ
echo ���� 1 ��װ�������߰� �������������й��� ������ǿ �Ƽ� ��ѹ��Լ 40 MB
echo ���� 2 ��װ��Ҫ���߰� ��Ҫ�������󲿷ֳ��ù��� ������󲿷���������չ�� �Ƽ� ��ѹ��Լ 30 MB
echo ���� 3 �Թ���װ���⹤�߰� 
set /p toolsin=
if "%tools%"=="1" (
cls
echo ��ѡ��װ�������߰��� 
echo ׼������ing...
goto dgalltools )

if "%tools%"=="2" (
cls
echo ��ѡ��װ��Ҫ���߰��� 
echo ׼������ing...
goto dgmaintools )

if "%tools%"=="3" (
cls
echo ��ѡ�񲻰�װ��չ���߰��� 
goto dgot )


if {( "%ingame%"!=1 & "%ingame%"!=2 & "%ingame%"!=3 )
cls
echo !!!!!!!!!!!!!!!!!
echo ��������룡
echo !!!!!!!!!!!!!!!!!
timeout /nobreak /t 2
goto dgmoretools
}


: ���d������ dg7
: dg

:dgalltools
title �����������߰�ing...
powershell .\apps\wget\wget.exe -O .\temp\toolsall.7z https://dg.limoe.net/apps/tools/all.7z & timeout /nobreak /t 1
powershell .\apps\7z\7za.exe e -y .\temp\toolsall.7z
powershell -command "Expand-Archive -Force '%~dp0.\alls.zip' '%~dp0.\apps\'"
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\toolsall.7z') do @set maintoolshash=%%i 
powershell .\apps\wget\wget.exe -O .\temp\getmaintoolsallsha256.txt -q https://dg.limoe.net/apps/tools/7zallsha256.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\gettoolsallsha256.txt') do @set getmaintoolshash=%%i 
if "%getmaintoolshash%" == "" ( goto dgalltools1 )
if "%maintoolshash%" == "%getmaintoolshash%" ( echo ���߰���֤�ɹ�!  & goto dgot ) else ( goto dgalltools1 )

: dg1

:dgalltools1
powershell .\apps\wget\wget.exe -O .\temp\toolsall.7z https://dg1.limoe.net/apps/tools/all.7z & timeout /nobreak /t 1
powershell .\apps\7z\7za.exe e -y .\temp\toolsall.7z
powershell -command "Expand-Archive -Force '%~dp0.\alls.zip' '%~dp0./apps/'"
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\toolsall.7z') do @set maintoolshash=%%i 
powershell .\apps\wget\wget.exe -O .\temp\getmaintoolsallsha256.txt -q https://dg1.limoe.net/apps/tools/7zallsha256.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\gettoolsallsha256.txt') do @set getmaintoolshash=%%i 
if "%getmaintoolshash%" == "" ( goto dgalltools2 )
if "%maintoolshash%" == "%getmaintoolshash%" ( echo ���߰���֤�ɹ�!  & goto dgot ) else ( goto dgalltools2 )

: dg2

:dgalltools2
powershell .\apps\wget\wget.exe -O .\temp\toolsall.7z https://dg2.limoe.net/apps/tools/all.7z & timeout /nobreak /t 1
powershell .\apps\7z\7za.exe e -y .\temp\toolsall.7z
powershell -command "Expand-Archive -Force '%~dp0.\alls.zip' '%~dp0.\apps\'"
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\toolsall.7z') do @set maintoolshash=%%i 
powershell .\apps\wget\wget.exe -O .\temp\getmaintoolsallsha256.txt -q https://dg2.limoe.net/apps/tools/7zallsha256.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\gettoolsallsha256.txt') do @set getmaintoolshash=%%i 
if "%getmaintoolshash%" == "" ( goto dgalltools3 )
if "%maintoolshash%" == "%getmaintoolshash%" ( echo ���߰���֤�ɹ�!  & goto dgot ) else ( goto dgalltools3 )

: dg3

:dgalltools3
powershell .\apps\wget\wget.exe -O .\temp\toolsall.7z https://dg3.limoe.net/apps/tools/all.7z & timeout /nobreak /t 1
powershell .\apps\7z\7za.exe e -y .\temp\toolsall.7z
powershell -command "Expand-Archive -Force '%~dp0.\alls.zip' '%~dp0.\apps\'"
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\toolsall.7z') do @set maintoolshash=%%i 
powershell .\apps\wget\wget.exe -O .\temp\getmaintoolsallsha256.txt -q https://dg3.limoe.net/apps/tools/7zallsha256.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\gettoolsallsha256.txt') do @set getmaintoolshash=%%i 
if "%getmaintoolshash%" == "" ( title error code : dg7 & echo error code : dg7 & echo ���ع��߰�ʧ�ܣ� & echo ������������ٴ�����  �����ٴ�ʧ�� ����ϵ����Ա & pause & goto dgalltools )
if "%maintoolshash%" == "%getmaintoolshash%" ( echo ���߰���֤�ɹ�!  & goto dgot ) else ( title error:dg7 & title error:dg7 & echo ���ع��߰�ʱ��α����Ļ������� & echo ������������ٴ����� �����ٴ�����ʧ�� ����ϵ����Ա  & pause & goto dgalltools )




: ���d��Ҫ�� dg8

: dg
:dgmaintools
title ������Ҫ���߰�ing...
powershell .\apps\wget\wget.exe -O .\temp\toolsmain.7z https://dg.limoe.net/apps/tools/main.7z & timeout /nobreak /t 1
powershell .\apps\7z\7za.exe e -y .\temp\toolsall.7z
powershell -command "Expand-Archive -Force '%~dp0.\main.zip' '%~dp0.\apps\'"
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe ./temp/toolsmain.7z') do @set maintoolshash=%%i 
powershell .\apps\wget\wget.exe -O .\temp\getmaintoolssha256.txt -q https://dg.limoe.net/apps/tools/7zmainsha256.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\gettoolssha256.txt') do @set getmaintoolshash=%%i 
if "%getmaintoolshash%" == "" ( goto dgmaintools1 )
if "%maintoolshash%" == "%getmaintoolshash%" ( echo ���߰���֤�ɹ�! & goto dgot ) else ( goto dgmaintools1 )

: dg1
:dgmaintools1
powershell .\apps\wget\wget.exe -O .\temp\toolsmain.7z https://dg1.limoe.net/apps/tools/main.7z & timeout /nobreak /t 1
powershell .\apps\7z\7za.exe e -y .\temp\toolsall.7z
powershell -command "Expand-Archive -Force '%~dp0.\main.zip' '%~dp0.\apps\'"
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\toolsmain.7z') do @set maintoolshash=%%i 
powershell .\apps\wget\wget.exe -O .\temp\getmaintoolssha256.txt -q https://dg1.limoe.net/apps/tools/7zmainsha256.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\gettoolssha256.txt') do @set getmaintoolshash=%%i 
if "%getmaintoolshash%" == "" ( goto dgmaintools1 )
if "%maintoolshash%" == "%getmaintoolshash%" ( echo ���߰���֤�ɹ�! & goto dgot ) else ( goto dgmaintools2 )

: dg2

:dgmaintools2
powershell .\apps\wget\wget.exe -O .\temp\toolsmain.7z https://dg2.limoe.net/apps/tools/main.7z & timeout /nobreak /t 1
powershell .\apps\7z\7za.exe e -y .\temp\toolsall.7z
powershell -command "Expand-Archive -Force '%~dp0.\main.zip' '%~dp0.\apps\'"
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\toolsmain.7z') do @set maintoolshash=%%i 
powershell .\apps\wget\wget.exe -O .\temp\getmaintoolssha256.txt -q https://dg2.limoe.net/apps/tools/7zmainsha256.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\gettoolssha256.txt') do @set getmaintoolshash=%%i 
if "%getmaintoolshash%" == "" ( goto dgmaintools1 )
if "%maintoolshash%" == "%getmaintoolshash%" ( echo ���߰���֤�ɹ�! & goto dgot ) else ( goto dgmaintools3 )

: dg3

:dgmaintools3
powershell .\apps\wget\wget.exe -O .\temp\toolsmain.7z https://dg3.limoe.net/apps/tools/main.7z & timeout /nobreak /t 1
powershell .\apps\7z\7za.exe e -y .\temp\toolsall.7z
powershell -command "Expand-Archive -Force '%~dp0.\main.zip' '%~dp0.\apps'"
for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\toolsmain.7z') do @set maintoolshash=%%i 
powershell .\apps\wget\wget.exe -O .\temp\getmaintoolssha256.txt -q https://dg3.limoe.net/apps/tools/7zmainsha256.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\gettoolssha256.txt') do @set getmaintoolshash=%%i 
if "%getmaintoolshash%" == "" ( title error code : dg8 & echo error code : dg8 & echo ���ع��߰�ʧ�ܣ� & echo ������������ٴ�����  �����ٴ�ʧ�� ����ϵ����Ա & pause & goto dgmaintools )
if "%maintoolshash%" == "%getmaintoolshash%" ( echo ���߰���֤�ɹ�! & goto dgot ) else ( title error:dg8 & title error:dg8 & echo ���ع��߰�ʱ��α����Ļ������� & echo ������������ٴ����� �����ٴ�����ʧ�� ����ϵ����Ա  & pause & goto dgmaintools )


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

: if "%getatbat112hash%" == "" ( echo ��Ҫ����δ���! ��������ٴγ��� & echo �����ٴ�ʧ�� ����ϵ����Ա & pause & goto dgot )
: if "%atbat112hash%" == "%getatbat112hash%" () else ( echo ��Ҫ����δ���! ��������ٴγ��� & echo �����ٴ�ʧ�� ����ϵ����Ա & pause & goto dgot )



:dgot0


title ׼����������ɣ�-Neko Minecraft 
echo ׼����������ɣ�
echo 2������������Ϸ
timeout /nobreak /t 2
cls

: ���b�[��
:installgame


title ����������Ҫ��װ����Ϸ�汾���س� -Neko Minecraft
echo ##################################################
echo ##########�������밲װ����Ϸ�汾���س�############
echo #########��ȷ�����ٿ���������ѹ��洢�ռ�#########
echo ##########ȷ��������5GB�������ڴ�(ram)############
echo ##################################################
echo ##################################################
echo #���� 1 ��������1.12All�� ��ѹ��Լ1.5GB ��������;#
echo ###���еĲ��ʰ�,��Ӱ,mod,����Ϸ���� ��Ϸ�������##
echo ���ش�СԼ700MB Լ��1Сʱ �ڴ��ڼ� ����������������
echo ##################################################
echo ##################################################
echo #���� 2 ��������1.12Main�� ��ѹ��Լ480MB ��������:
echo ##��Ӱ,mod����Ϸ���� �ۺ���� ���������Ƽ�ѡ��##
echo ���ش�СԼ400MB Լ��Сʱ �ڴ��ڼ� ����������������
echo ##################################################
echo ##################################################
echo ##���� 3 ��������1.12Mini�� ��ѹ��Լ400MB ��������:#
echo ########## ����mod����Ϸ���� ��С��С ############
echo ���ش�СԼ350MB Լ��Сʱ �ڴ��ڼ� ����������������
echo ##################################################
echo ##################################################

set /p ingame=


if "%ingame%"=="1" (
cls
echo ��ѡ������All��
echo ��СԼ1.5GB ����ʱ����ܽϳ�
echo ����Ԥ�� 1 Сʱ����
echo ����ing....
goto allinstall
)


if "%ingame%"=="2" (
cls
echo ��ѡ������Main��
echo ��СԼ480MB �����ĵȴ�
echo ����ing....
goto maininstall
)


if "%ingame%"=="3" (
cls
echo ��ѡ������Mini��
echo ��СԼ400MB �����ĵȴ�
echo ����ing...
goto miniinstall
 )


if {( "%ingame%"!=1 & "%ingame%"!=2 & "%ingame%"!=3 )
cls
echo !!!!!!!!!!!!!!!!!!!
echo !!!!���������!!!!!
echo !!!!!!!!!!!!!!!!!!!
timeout /nobreak /t 2
goto installgame
}

: ���� dg9

:allinstall
title ����������Ϸing... ��Neko Minecraft
: dg
powershell .\apps\wget\wget.exe -O .\temp\resourcepacks.7z https://dg2.limoe.net/mc/112/dg/resourcepacks.7z & timeout /nobreak /t 1

powershell .\apps\7z\7za.exe e -y .\temp\resourcepacks.7z

for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\resourcepacks.7z') do @set reshash=%%i
powershell .\apps\wget\wget.exe -O .\temp\ressha256.txt -q https://dg2.limoe.net/mc/up/ressha256.json & timeout /nobreak /t 1

for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\ressha256.txt') do @set getreshash=%%i
if "%getreshash%" == "" ( echo У��ʧ��! & echo �ٴγ�����... & goto allinstall2 )
if "%reshash%" == "%getreshash%" ( echo У��ɹ�! & powershell -command "Expand-Archive -Force '%~dp0.\resourcepacks.zip' '%~dp0.\resourcepacks\'" & goto maininstall 
 ) else ( 
echo У��ʧ��! & echo �ٴγ�����...  & goto allinstall3 )


:allinstall3
: dg3
powershell .\apps\wget\wget.exe -O .\temp\resourcepacks.7z https://dg3.limoe.net/mc/112/dg/resourcepacks.7z & timeout /nobreak /t 1

powershell .\apps\7z\7za.exe e -y .\temp\resourcepacks.7z

for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\resourcepacks.7z') do @set reshash=%%i
powershell .\apps\wget\wget.exe -O .\temp\ressha256.txt -q https://dg3.limoe.net/mc/up/ressha256.json & timeout /nobreak /t 1

for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\ressha256.txt') do @set getreshash=%%i
if "%getreshash%" == "" ( title error code : dg9 & echo error code : dg9 & echo ���ز���ʧ�ܣ� & echo ������������ٴ�����  �����ٴ�ʧ�� ����ϵ����Ա & pause & goto allinstall )
if "%reshash%" == "%getreshash%" ( echo У��ɹ�! & powershell -command "Expand-Archive -Force '%~dp0.\resourcepacks.zip' '%~dp0.\resourcepacks\'" & goto maininstall 
 ) else ( 
title error:dg9 & title error:dg9 & echo ���ز���ʱ��α����Ļ������� & echo ������������ٴ����� �����ٴ�����ʧ�� ����ϵ����Ա  & pause & goto allinstall )




: ���ع�Ӱ dg10

:maininstall
del .\resourcepacks.zip
: dg
title ����������Ϸing... ��Neko Minecraft
powershell .\apps\wget\wget.exe -O .\temp\shaderpacks.7z https://dg.limoe.net/mc/112/dg/shaderpacks.7z & timeout /nobreak /t 1

powershell .\apps\7z\7za.exe e -y .\temp\shaderpacks.7z

for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\shaderpacks.7z') do @set shashahash=%%i
powershell .\apps\wget\wget.exe -O .\temp\shasha256.txt -q https://dg.limoe.net/mc/up/shasha256.json & timeout /nobreak /t 1

for /F %%i in ('powershell -command .\apps\tools/cat.exe .\temp\shasha256.txt') do @set getshashahash=%%i
if "%getshashahash%" == "" ( echo У��ʧ��! & echo �ٴγ�����... & goto maininstall1 )
if "%shashahash%" == "%getshashahash%" ( echo У��ɹ�. & powershell -command "Expand-Archive -Force '%~dp0.\shaderpacks.zip' '%~dp0.\shaderpacks\'" & goto miniinstall
 ) else ( 
echo У��ʧ��! & echo �ٴγ�����...  & goto maininstall1 )



:maininstall1
: dg1
powershell .\apps\wget\wget.exe -O .\temp\shaderpacks.7z https://dg1.limoe.net/mc/112/dg/shaderpacks.7z & timeout /nobreak /t 1

powershell .\apps\7z\7za.exe e -y .\temp\shaderpacks.7z

for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\shaderpacks.7z') do @set shashahash=%%i
powershell .\apps\wget\wget.exe -O .\temp\shasha256.txt -q https://dg1.limoe.net/mc/up/shasha256.json & timeout /nobreak /t 1

for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\shasha256.txt') do @set getshashahash=%%i
if "%getshashahash%" == "" ( echo У��ʧ��! & echo �ٴγ�����... & goto maininstall2 )
if "%shashahash%" == "%getshashahash%" ( echo У��ɹ�. & powershell -command "Expand-Archive -Force '%~dp0.\shaderpacks.zip' '%~dp0.\shaderpacks\'" & goto miniinstall
 ) else ( 
echo У��ʧ��! & echo �ٴγ�����...  & goto maininstall2 )



:maininstall2
: dg2
powershell .\apps\wget\wget.exe -O .\temp\shaderpacks.7z https://dg2.limoe.net/mc/112/dg/shaderpacks.7z & timeout /nobreak /t 1

powershell .\apps\7z\7za.exe e -y .\temp\shaderpacks.7z

for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\shaderpacks.7z') do @set shashahash=%%i
powershell .\apps\wget\wget.exe -O .\temp\shasha256.txt -q https://dg2.limoe.net/mc/up/shasha256.json & timeout /nobreak /t 1

for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\shasha256.txt') do @set getshashahash=%%i
if "%getshashahash%" == "" ( echo У��ʧ��! & echo �ٴγ�����... & goto maininstall3 )
if "%shashahash%" == "%getshashahash%" ( echo У��ɹ�. & powershell -command "Expand-Archive -Force '%~dp0.\shaderpacks.zip' '%~dp0.\shaderpacks\'" & goto miniinstall
 ) else ( 
echo У��ʧ��! & echo �ٴγ�����...  & goto maininstall3 )


:maininstall3
: dg3
powershell .\apps\wget\wget.exe -O .\temp\shaderpacks.7z https://dg3.limoe.net/mc/112/dg/shaderpacks.7z & timeout /nobreak /t 1

powershell .\apps\7z\7za.exe e -y .\temp\haderpacks.7z

for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\shaderpacks.7z') do @set shashahash=%%i
powershell .\apps\wget\wget.exe -O .\temp\shasha256.txt -q https://dg3.limoe.net/mc/up/shasha256.json & timeout /nobreak /t 1

for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\shasha256.txt') do @set getshashahash=%%i
if "%getshashahash%" == "" ( title error code : dg10 & echo error code : dg10 & echo ���ع�Ӱʧ�ܣ� & echo ������������ٴ�����  �����ٴ�ʧ�� ����ϵ����Ա & pause & goto maininstall )
if "%shashahash%" == "%getshashahash%" ( echo У��ɹ�. & powershell -command "Expand-Archive -Force '%~dp0.\shaderpacks.zip' '%~dp0.\shaderpacks\'" & goto miniinstall
 ) else ( 
title error:dg10 & title error:dg10 & echo ���ع�Ӱʱ��α����Ļ������� & echo ������������ٴ����� �����ٴ�����ʧ�� ����ϵ����Ա  & pause & goto maininstall )





: ������Ϸ dg11


:miniinstall
del .\shaderpacks.zip
cd ..
:miniinstall0


: dg

title ����������Ϸing... ��Neko Minecraft

powershell .\.minecraft\apps\wget\wget.exe -O .\.minecraft\temp\game.7z https://dg2.limoe.net/mc/112/dg/game.7z & timeout /nobreak /t 1

powershell .\.minecraft\apps\7z\7za.exe e -y .\.minecraft\temp\game.7z
for /F %%i in ('powershell -command .\.minecraft\apps\hash\sha256sum.exe .\.minecraft\temp\game.7z') do @set gamehash=%%i

powershell .\.minecraft\apps\wget\wget.exe -O .\.minecraft\temp\gamesha256.txt -q https://dg2.limoe.net/mc/up/game.json & timeout /nobreak /t 1

for /F %%i in ('powershell -command .\.minecraft\apps\tools\cat.exe .\.minecraft\temp\gamesha256.txt') do @set getgamehash=%%i
if "%getgamehash%" == "" ( echo У��ʧ��! & echo �ٴγ�����... & goto miniinstall3 )
if "%gamehash%" == "%getgamehash%" ( echo У��ɹ��� & powershell -command "Expand-Archive -Force '%~dp0.\game.zip' '%~dp0.\'" & goto dgmods
 ) else ( 
echo У��ʧ��! & echo �ٴγ�����...  & goto miniinstall3 )



:miniinstall3
: dg3

powershell .\.minecraft\apps\wget\wget.exe -O .\.minecraft\temp\game.7z https://dg3.limoe.net/mc/112/dg/game.7z & timeout /nobreak /t 1

powershell .\.minecraft\apps\7z\7za.exe e -y .\.minecraft\temp\game.7z
for /F %%i in ('powershell -command .\.minecraft\apps\hash\sha256sum.exe .\.minecraft\temp\game.7z') do @set gamehash=%%i

powershell .\.minecraft\apps\wget\wget.exe -O .\.minecraft\temp\gamesha256.txt -q https://dg3.limoe.net/mc/up/game.json & timeout /nobreak /t 1

for /F %%i in ('powershell -command .\.minecraft\apps\tools\cat.exe .\.minecraft\temp\gamesha256.txt') do @set getgamehash=%%i
if "%getgamehash%" == "" ( title error code : dg11 & echo error code : dg11 & echo ������Ϸ����ʧ�ܣ� & echo ������������ٴ�����  �����ٴ�ʧ�� ����ϵ����Ա & pause & goto miniinstall0 )
if "%gamehash%" == "%getgamehash%" ( echo У��ɹ��� & powershell -command "Expand-Archive -Force '%~dp0..\game.zip' '%~dp0.\'" & goto dgmods
 ) else ( 
title error:dg11 & title error:dg11 & echo ������Ϸ����ʱ��α����Ļ������� & echo ������������ٴ����� �����ٴ�����ʧ�� ����ϵ����Ա  & pause & goto miniinstall0 )





: mods dg12

:dgmods
del .\game.zip
cd .minecraft

:dgmods0

: dg
title ����������Ϸing... ��Neko Minecraft

powershell .\apps\wget\wget.exe -O .\temp\mods.7z https://dg.limoe.net/mc/112/dg/mods.7z & timeout /nobreak /t 1

powershell .\apps\7z\7za.exe e -y .\temp\mods.7z

for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\mods.7z') do @set modshash=%%i
powershell .\apps\wget\wget.exe -O .\temp\modssha256.txt -q https://dg.limoe.net/mc/up/mods.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\modssha256.txt') do @set getmodshash=%%i
if "%getmodshash%" == "" ( echo У��ʧ��! & echo �ٴγ�����... & goto dgmods1 )
if "%modshash%" == "%getmodshash%" ( echo У��ɹ��� & powershell -command "Expand-Archive -Force '%~dp0.\mods.zip' '%~dp0.\mods\'" & goto dgupdate1
 ) else ( 
echo У��ʧ��! & echo �ٴγ�����... & goto dgmods1 )



:dgmods1
: dg1

powershell .\apps\wget\wget.exe -O .\temp\mods.7z https://dg1.limoe.net/mc/112/dg/mods.7z & timeout /nobreak /t 1

powershell .\apps\7z\7za.exe e -y .\temp\mods.7z

for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\mods.7z') do @set modshash=%%i
powershell .\apps\wget\wget.exe -O .\temp\modssha256.txt -q https://dg1.limoe.net/mc/up/mods.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\modssha256.txt') do @set getmodshash=%%i
if "%getmodshash%" == "" ( echo У��ʧ��! & echo �ٴγ�����... & goto dgmods2 )
if "%modshash%" == "%getmodshash%" ( echo У��ɹ��� & powershell -command "Expand-Archive -Force '%~dp0.\mods.zip' '%~dp0.\mods\'" & goto dgupdate1
 ) else ( 
echo У��ʧ��! & echo �ٴγ�����... & goto dgmods2 )




:dgmods2
: dg2

powershell .\apps\wget\wget.exe -O .\temp\mods.7z https://dg2.limoe.net/mc/112/dg/mods.7z & timeout /nobreak /t 1

powershell .\apps\7z\7za.exe e -y .\temp\mods.7z

for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\mods.7z') do @set modshash=%%i
powershell .\apps\wget\wget.exe -O .\temp\modssha256.txt -q https://dg2.limoe.net/mc/up/mods.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\modssha256.txt') do @set getmodshash=%%i
if "%getmodshash%" == "" ( echo У��ʧ��! & echo �ٴγ�����... & goto dgmods3 )
if "%modshash%" == "%getmodshash%" ( echo У��ɹ��� & powershell -command "Expand-Archive -Force '%~dp0.\mods.zip' '%~dp0.\mods\'" & goto dgupdate1
 ) else ( 
echo У��ʧ��! & echo �ٴγ�����... & goto dgmods3 )




:dgmods3
: dg3

powershell .\apps\wget\wget.exe -O .\temp\mods.7z https://dg3.limoe.net/mc/112/dg/mods.7z & timeout /nobreak /t 1

powershell .\apps\7z\7za.exe e -y .\temp\mods.7z

for /F %%i in ('powershell -command .\apps\hash\sha256sum.exe .\temp\mods.7z') do @set modshash=%%i
powershell .\apps\wget\wget.exe -O .\temp\modssha256.txt -q https://dg3.limoe.net/mc/up/mods.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\apps\tools\cat.exe .\temp\modssha256.txt') do @set getmodshash=%%i
if "%getmodshash%" == "" ( title error code : dg12 & echo error code : dg12 & echo ����modʧ�ܣ� & echo ������������ٴ�����  �����ٴ�ʧ�� ����ϵ����Ա & pause & goto dgmods )
if "%modshash%" == "%getmodshash%" ( echo У��ɹ��� & powershell -command "Expand-Archive -Force '%~dp0.\mods.zip' '%~dp0.\mods\'" & goto dgupdate1
 ) else ( 
title error:dg12 & title error:dg12 & echo ����mod��α����Ļ������� & echo ������������ٴ����� �����ٴ�����ʧ�� ����ϵ����Ա  & pause & goto dgmods )





: ���ظ������� dg13


:dgupdate1
del mods.zip
cd ..
:dgupdate10

: dg
title ����������Ϸing... ��Neko Minecraft
: cd temp
: call 112at.bat
: cd ..
: timeout /nobreak /t 3

powershell .\.minecraft\apps\wget\wget.exe -O .\.minecraft\temp\update1.7z --http-user=6D9Fkz2Kfmj5QLR --http-passwd=cexL8ZBrwqBpwKv https://b3hxd9kwkwqba3r.limoe.net/dg/up1/update1.7z?token=sa7x39r & timeout /nobreak /t 1

powershell .\.minecraft\apps\7z\7za.exe e -y .\.minecraft\temp\update1.7z

for /F %%i in ('powershell -command .\.minecraft\apps\hash\sha256sum.exe .\.minecraft\temp\update1.7z') do @set update1hash=%%i
powershell .\.minecraft\apps\wget\wget.exe -O .\.minecraft\temp\update1sha256.txt -q https://dg2.limoe.net/mc/112/dg/up1/update1.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\.minecraft\apps\tools\cat.exe .\temp\update1sha256.txt') do @set getupdate1hash=%%i
if "%getupdate1hash%" == "" ( echo У��ʧ��! & echo �ٴγ�����... & goto dgupdate13 )
if "%update1hash%" == "%getupdate1hash%" ( echo У��ɹ��� & powershell -command "Expand-Archive -Force '%~dp0.\update1.zip' '%~dp0.\'" & goto inend
 ) else ( 
echo У��ʧ��! & echo �ٴγ�����... & goto dgupdate13 )



:dgupdate13

powershell .\.minecraft\apps\wget\wget.exe -O .\temp\update1.7z --http-user=6D9Fkz2Kfmj5QLR --http-passwd=cexL8ZBrwqBpwKv https://64esj8zyucgvifb.limoe.net/dg/up1/update1.7z?token=sa7x39r & timeout /nobreak /t 1

powershell .\.minecraft\apps\7z\7za.exe e -y .\.minecraft\temp\update1.7z

for /F %%i in ('powershell -command .\.minecraft\apps\hash\sha256sum.exe .\temp\update1.7z') do @set update1hash=%%i
powershell .\.minecraft\apps\wget\wget.exe -O .\.minecraft\temp\update1sha256.txt -q https://dg3.limoe.net/mc/112/dg/up1/update1.json & timeout /nobreak /t 1
for /F %%i in ('powershell -command .\.minecraft\apps\tools\cat.exe .\temp\update1sha256.txt') do @set getupdate1hash=%%i
if "%getupdate1hash%" == "" ( title error code : dg13 & echo error code : dg13 & echo ���ظ�������ʧ�ܣ� & echo ������������ٴ�����  �����ٴ�ʧ�� ����ϵ����Ա & pause & goto dgupdate10 )
if "%update1hash%" == "%getupdate1hash%" ( echo У��ɹ��� & powershell -command "Expand-Archive -Force '%~dp0.\update1.zip' '%~dp0.\'" & goto inend
 ) else ( 
title error:dg13 & title error:dg13 & echo ���ظ������ݶ�α����Ļ������� & echo ������������ٴ����� �����ٴ�����ʧ�� ����ϵ����Ա  & pause & goto dgupdate10 )


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
title ������ɣ� ��Neko Minecraft

echo ������ɣ�
echo ����������Դ�������
echo ����޷��� �����԰�װJAVA
echo ע�� ��װJAVA��������İ�װ·��
echo �����װ����Ȼ���� ��鿴������Ϣ����ϵ����Ա
timeout /nobreak /t 5

powershell .\.minecraft\apps\wget\wget.exe --post-file=.\.minecraft\temp\debug.txt -q https://postapi.limoe.net/bug/post/?token=1fs01c

cd .minecraft
rmdir /s/q temp
cd ..
pause
powershell ./Nekomc.exe
timeout /nobreak /t 4
tasklist | find /i "Nekomc.exe" && goto et || echo ���԰�װJAVA
cls 
echo ע�� ��װJAVA��������İ�װ·��
echo �����װ����Ȼ���� ��鿴������Ϣ����ϵ����Ա
if /i %PROCESSOR_IDENTIFIER:~0,3%==x86 ( powershell ./java8_32.exe ) else ( powershell ./java8_64.exe )
:et
exit