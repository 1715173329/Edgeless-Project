@echo off
@del /f /q List >nul
@copy /y X:\Users\Plugins_info\Preload\List.txt "%~dp0List" >nul
setlocal enabledelayedexpansion
set /a row=0
for /f "usebackq delims==; tokens=*" %%i in (List) do (
    set /a row+=1
    if !row!==%1 echo %%i >tmp.txt
)
if not exist tmp.txt (
    goto search
)
set /p tar=<tmp.txt
@del /f /q tmp.txt >nul
CHOICE /C yn /M "�Ƿ�ȷ���Ƴ�%tar%��"
if %errorlevel%==2 goto end
for /f "usebackq delims==; tokens=*" %%i in ("X:\Users\Plugins_info\Preload\Dir\%tar:~0,-1%.txt") do (
    del /f /s /q "X:\Program Files\Edgeless\%%i"
    rd /s /q "X:\Program Files\Edgeless\%%i"
)
echo ----------
echo �Ƴ����
goto end


:search
echo ept-remove �������²��
find /n /i "%1" List
echo ----------
echo ʹ��   ept-remove [���]    �Ƴ�

:end
echo on