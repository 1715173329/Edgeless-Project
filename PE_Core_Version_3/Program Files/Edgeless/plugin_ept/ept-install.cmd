@if not exist X:\Users\ept\Index call ept-update
@echo off
echo %time% ept-install-���У���һ������%1���ڶ�������%2 >>X:\Users\Log.txt
if exist tmp.txt del /f /q tmp.txt >nul
if exist name.txt del /f /q name.txt >nul
if exist ver.txt del /f /q ver.txt >nul
if exist au.txt del /f /q au.txt >nul
if exist cate.txt del /f /q cate.txt >nul
if exist X:\Users\ept\pack.7zf del /f /q X:\Users\ept\pack.7zf >nul
setlocal enabledelayedexpansion
set /a row=0
echo ept-install ���ڶ�ȡ���ز������...
echo %time% ept-install-��ȡ���ز������ >>X:\Users\Log.txt
for /f "usebackq delims==; tokens=*" %%i in (X:\Users\ept\Index) do (
    set /a row+=1
    if !row!==%1 echo %%i >tmp.txt
)
if not exist tmp.txt (
    echo %time% ept-install-������tmp.txt���ض�����ept-search >>X:\Users\Log.txt
    call ept-search %1
    @echo off
    goto end
)

echo %time% ept-install-��ʼ����tmp.txt�����ݣ� >>X:\Users\Log.txt
type tmp.txt >>X:\Users\Log.txt
echo ept-install ���ڽ��������Ϣ...
for /f "usebackq delims==_ tokens=1,2,3,4*" %%i in (tmp.txt) do (
    echo %%i>name.txt
    echo %%j>ver.txt
    echo %%k>au.txt
    echo %%l>cate.txt
)
set /p name=<name.txt
set /p ver=<ver.txt
set /p au=<au.txt
set /p cate=<cate.txt
echo %time% ept-install-name:%name%,ver:%ver%,au:%au%,cate:%cate% >>X:\Users\Log.txt
if exist tmp.txt del /f /q tmp.txt >nul
if exist name.txt del /f /q name.txt >nul
if exist ver.txt del /f /q ver.txt >nul
if exist au.txt del /f /q au.txt >nul
if exist cate.txt del /f /q cate.txt >nul

echo ept-install �˲��������װ��
echo ----------
echo �������%name%
echo �汾�ţ�%ver%
echo ����ߣ�%au%
echo ���ࣺ%cate%
echo ----------
echo.
if /i "%2" neq "-y" CHOICE /C yn /M "��ϣ����ʼ��װ%name%��?"
if %errorlevel%==2 goto end
echo %time% ept-install-�û�ȷ�Ͽ�ʼ��װ����ʼ���� >>X:\Users\Log.txt
echo ept-install �����������������������...
::pause
"X:\Program Files\Edgeless\EasyDown\aria2c.exe" -x16 -c -d X:\Users\ept -o pack.7zf "http://s.edgeless.top/ept.php?name=%name%&version=%ver%&author=%au%&category=%cate:~0,-1%"
echo ept-install ���ڰ�װ�����%name%...
echo %time% ept-install-��ʼ��װ >>X:\Users\Log.txt
pecmd exec -min ="%ProgramFiles%\Edgeless\plugin_loader\load.cmd" "X:\Users\ept\pack.7zf"
echo ept-install �����%name%�İ�װ����
:end
echo %time% ept-install-������� >>X:\Users\Log.txt
if exist tmp.txt del /f /q tmp.txt >nul
if exist name.txt del /f /q name.txt >nul
if exist ver.txt del /f /q ver.txt >nul
if exist au.txt del /f /q au.txt >nul
if exist cate.txt del /f /q cate.txt >nul
echo on