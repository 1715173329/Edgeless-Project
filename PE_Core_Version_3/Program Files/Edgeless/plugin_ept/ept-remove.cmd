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
set /p tar=<tmp.txt
echo %time% ept-remove-tar:%tar% >>X:\Users\Log.txt
if exist tmp.txt del /f /q tmp.txt >nul
if /i "%2" neq "-y" CHOICE /C yn /M "���Ƿ�ȷ���Ƴ�%tar%?"
if %errorlevel%==2 goto end
echo %time% ept-remove-�û�ȷ�Ͽ�ʼ�Ƴ� >>X:\Users\Log.txt
echo ept-remove �����Ƴ�%tar%...
for /f "usebackq delims==; tokens=*" %%i in ("X:\Users\Plugins_info\Preload\Dir\%tar:~0,-1%.txt") do (
    @del /f /s /q "X:\Program Files\Edgeless\%%i" >nul
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