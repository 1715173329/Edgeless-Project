@echo off
echo %time% �����³���-���� >>X:\Users\Log.txt
title ���ڼ��Edgeless����
color 3f
set /p vnw=<"X:\Program Files\version.txt"
echo %time% �����³���-wim��Ϣ%vnw% >>X:\Users\Log.txt


if %vnw:~9,4%==Alpa goto alpha

if not exist version_ol.txt "X:\Program Files\Edgeless\EasyDown\EasyDown.exe" -Down("http://s.edgeless.top/?token=version","version_ol.txt","X:\Program Files\Edgeless\system_update")
if not exist version_ol.txt goto df
set /p vol=<version_ol.txt
echo %time% �����³���-����Beta��Ϣ%vol% >>X:\Users\Log.txt

if %vol:~20,5%==%vnw:~20,5% goto newest
title ���ִ���Edgeless����
cls
echo.
echo.
echo   ��ǰ�汾��%vnw:~20,5%
echo   ���°汾��%vol:~20,5%
echo =========================================
echo.
echo.
echo      ���������ʼOTA����
echo.
echo.
echo.
echo.
echo.
pause
title ���ڼ��OTA�������
echo %time% �����³���-����burnername.txt >>X:\Users\Log.txt
cls
if not exist burnername.txt "X:\Program Files\Edgeless\EasyDown\EasyDown.exe" -Down("http://s.edgeless.top/?token=burnername","burnername.txt","X:\Program Files\Edgeless\system_update")
if not exist burnername.txt call checknet.cmd
set /p bname=<burnername.txt
    echo %time% �����³���-burnername���ƣ�%bname% >>X:\Users\Log.txt
if not defined bname (
    echo %time% �����³���-burnername����δ���壨��ִ��� >>X:\Users\Log.txt
    exit
)
:ctn
for %%1 in (Z Y X W V U T S R Q P O N M L K J I H G F E D C ) do if exist %%1:\Edgeless\version.txt echo %%1>Npath.txt
set /p Upath=<Npath.txt
echo %time% �����³���-ʹ��%Upath%��ΪEdgeless�̷� >>X:\Users\Log.txt
if not exist %Upath%:\ (
    echo %time% �����³���-δ��⵽�Ϸ���Edgeless������ >>X:\Users\Log.txt
    cls
    echo      δ��⵽�Ϸ���Edgeless������
    echo   �����Edgeless�����̣�Ȼ�������
    pause
    goto ctn
)
if not exist %Upath%:\Edgeless\Resource\%bname% (
    echo %time% �����³���-�����°�burner >>X:\Users\Log.txt
    title ���ڸ���OTA���
    cls
    call downloadburner.cmd
    pecmd exec="X:\Program Files\Edgeless\plugin_loader\load.cmd" "X:\Program Files\Edgeless\system_update\burner.7z"
    copy /y X:\Users\%bname% %Upath%:\Edgeless\Resource\%bname%
)
if not exist "X:\Program Files\Edgeless\��������������\����������.exe" (
    echo %time% �����³���-��������������δ���أ���ִ��� >>X:\Users\Log.txt
    cls
    title �����˺���ֵ����⣺��������������δ����
    call downloadburner.cmd
    pecmd exec="X:\Program Files\Edgeless\plugin_loader\load.cmd" "X:\Program Files\Edgeless\system_update\burner.7z"
)
pecmd exec "X:\Users\Default\Desktop\����������.LNK"
exit



:df
title ���ڼ������
ping cloud.tencent.com
if %errorlevel%==1 goto nonet
title Edgeless����������Ӧ
echo %time% �����³���-����������Ӧ >>X:\Users\Log.txt
cls
echo.
echo.
echo.
echo         ���ʧ�ܣ�Edgeless����������Ӧ
echo               ����ϵ���߽��������
echo.
echo.
pause
del /f /q version_ol.txt
exit


:nonet
echo %time% �����³���-Edgelessδ���� >>X:\Users\Log.txt
title �޷�������������
cls
echo.
echo.
echo.
echo         ���ʧ�ܣ���ǰϵͳδ���뻥����
echo.
echo.
echo.
pause
del /f /q version_ol.txt
exit

:newest
echo %time% �����³���-�������°汾 >>X:\Users\Log.txt
title ��ǰ�汾�������°汾
cls
echo.
echo.
echo.
echo  ��ϲ����ǰ�汾�����°汾��
echo =========================================
echo �汾��Ϣ��
echo �����汾�ţ�%vol%
echo ϵͳ���ƣ�%vol:~0,8%
echo �������ͣ�%vol:~9,4%
echo ���а汾��%vol:~14,5%
echo �汾��ţ�%vol:~20,5%
echo =========================================
echo.
echo.
echo.
pause
del /f /q version_ol.txt
exit


:alpha
if not exist "X:\Program Files\Edgeless\system_update\version_ola.txt" "X:\Program Files\Edgeless\EasyDown\EasyDown.exe" -Down("http://s.edgeless.top/?token=alpha","version_ola.txt","X:\Program Files\Edgeless\system_update")
if not exist "X:\Program Files\Edgeless\system_update\version_ola.txt" goto df
set /p voa=<"X:\Program Files\Edgeless\system_update\version_ola.txt"

if not exist "X:\Program Files\Edgeless\system_update\version_ol.txt" "X:\Program Files\Edgeless\EasyDown\EasyDown.exe" -Down("http://s.edgeless.top/?token=version","version_ol.txt","X:\Program Files\Edgeless\system_update")
if not exist "X:\Program Files\Edgeless\system_update\version_ol.txt" goto df
set /p vol=<"X:\Program Files\Edgeless\system_update\version_ol.txt"

echo %time% �����³���-����Alpha��Ϣ%voa% >>X:\Users\Log.txt
echo %time% �����³���-����Beta��Ϣ%vol% >>X:\Users\Log.txt

title Edgeless Alpha�ڲ��
cls
echo.
echo           Edgeless Alpha�ڲ��
echo        ��л����Edgeless��Ŀ��֧�֣�
echo ===============================================
echo ��ǰ�汾��%vnw%
echo ���°汾��Alpha�ڲ⣩��%voa%
echo ���°汾��Beta ��ʽ����%vol%
echo ===============================================
echo.
echo  Alpha�汾���ṩOTA�������Ҫ�������ֶ����и���
echo.
echo.
pause
exit