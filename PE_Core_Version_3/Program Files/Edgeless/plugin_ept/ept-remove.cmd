@echo off
echo %time% ept-remove-���У���һ������%1���ڶ�������%2 >>X:\Users\Log.txt
if not exist X:\Users\ept md X:\Users\ept
if exist X:\Users\ept\List del /f /q X:\Users\ept\List >nul
@copy /y X:\Users\Plugins_info\Preload\List.txt "X:\Users\ept\List" >nul
if not exist "X:\Users\ept\List" echo %time% ept-remove-List����ʧ�ܣ� >>X:\Users\Log.txt
setlocal enabledelayedexpansion
set /a row=0
echo ept-remove ���ڶ�ȡ���״̬��Ϣ...
echo %time% ept-remove-��ʼ����List >>X:\Users\Log.txt
for /f "usebackq delims==; tokens=*" %%i in (X:\Users\ept\List) do (
    set /a row+=1
    if !row!==%1 echo %%i >tmp.txt
)
if not exist tmp.txt (
    echo %time% ept-remove-������tmp.txt����ת��search��ǩ >>X:\Users\Log.txt
    goto search
)
if /i "%2" == "-y" echo ept-remove ����ִ���Զ��Ƴ�
set /p tar=<tmp.txt
echo %time% ept-remove-tar:%tar% >>X:\Users\Log.txt
if exist tmp.txt del /f /q tmp.txt >nul
if /i "%2" neq "-y" CHOICE /C yn /M "���Ƿ�ȷ���Ƴ�%tar:~0,-1%?"
if %errorlevel%==2 goto end
echo %time% ept-remove-�û�ȷ�Ͽ�ʼ�Ƴ�����ʼ�������ݷ�ʽ >>X:\Users\Log.txt

echo ept-remove ����׷��%tar:~0,-1%�����Ŀ�ݷ�ʽ...
if exist run.wcs del /f /q run.wcs
if exist run.cmd del /f /q run.cmd
if exist "X:\Program Files\Edgeless\run.wcs" del /f /q "X:\Program Files\Edgeless\run.wcs"
if exist "X:\Program Files\Edgeless\run.cmd" del /f /q "X:\Program Files\Edgeless\run.cmd"
for /f "usebackq delims==; tokens=*" %%i in ("X:\Users\Plugins_info\Preload\Batch\%tar:~0,-1%.txt") do (
    findstr /i "X:\Users\Default\Desktop" "X:\Program Files\Edgeless\��װ����\%%i">run.wcs
)
echo %time% ept-remove-���ڴ�����ݷ�ʽ����伯�ϣ� >>X:\Users\Log.txt
type run.wcs >>X:\Users\Log.txt
if not exist run.wcs (
    echo ept-remove ���δ���������ݷ�ʽ
    echo %time% ept-remove-���δ���������ݷ�ʽ��������run.wcs >>X:\Users\Log.txt
    goto skipRLink
)
set /p nullCheck=<run.wcs
if not defined nullCheck (
    echo ept-remove ���δ���������ݷ�ʽ
    echo %time% ept-remove-���δ���������ݷ�ʽ��run.wcsΪ�� >>X:\Users\Log.txt
    goto skipRLink
)
pecmd file X:\Users\Default\Desktop\tmp
if not exist X:\Users\Default\Desktop\tmp md X:\Users\Default\Desktop\tmp
move "X:\Users\Default\Desktop\*.lnk" X:\Users\Default\Desktop\tmp >nul

move /y run.wcs "X:\Program Files\Edgeless\run.wcs" >nul
pecmd load "X:\Program Files\Edgeless\run.wcs"
ren "X:\Program Files\Edgeless\run.wcs" run.cmd
pecmd exec !"X:\Program Files\Edgeless\run.cmd"
del /f /q "X:\Program Files\Edgeless\run.cmd"

if not exist "X:\Users\Default\Desktop\*.lnk" (
    echo ept-remove ��ǰ����������ݷ�ʽ��ʧЧ��׷��ʧ��
    echo %time% ept-remove-��ݷ�ʽ��ʧЧ��׷��ʧ�ܣ�������.lnk�ļ� >>X:\Users\Log.txt
    goto skipRLink
)
dir /b "X:\Users\Default\Desktop\*.lnk">link.txt
echo %time% ept-remove-�ռ����Ŀ�ݷ�ʽ�� >>X:\Users\Log.txt
type link.txt >>X:\Users\Log.txt

if exist "X:\Users\Default\Desktop\*.lnk" del /f /q "X:\Users\Default\Desktop\*.lnk"
move X:\Users\Default\Desktop\tmp\*.lnk X:\Users\Default\Desktop >nul
pecmd file X:\Users\Default\Desktop\tmp

if not exist link.txt (
    echo ept-remove ��ǰ����������ݷ�ʽ��ʧЧ��׷��ʧ��
    echo %time% ept-remove-��ݷ�ʽ��ʧЧ��׷��ʧ�ܣ�link.txt����ʧ�� >>X:\Users\Log.txt
    goto skipRLink
)
for /f "usebackq delims==; tokens=*" %%i in ("link.txt") do (
    pecmd file "X:\Users\Default\Desktop\%%i"
)
del /f /q link.txt

:skipRLink
echo ept-remove �����Ƴ�%tar:~0,-1%...
for /f "usebackq delims==; tokens=*" %%i in ("X:\Users\Plugins_info\Preload\Dir\%tar:~0,-1%.txt") do (
    pecmd file "X:\Program Files\Edgeless\%%i"
)
echo ept-remove �Ƴ����
echo %time% ept-remove-�Ƴ���� >>X:\Users\Log.txt
goto end


:search
echo ept-remove �������²��
echo %time% ept-remove-����find��������£� >>X:\Users\Log.txt
find /n /i "%1" X:\Users\ept\List >>X:\Users\Log.txt
find /n /i "%1" X:\Users\ept\List
echo ----------
echo ʹ��   ept remove [���]    �Ƴ�

:end
echo %time% ept-remove-������� >>X:\Users\Log.txt
echo on