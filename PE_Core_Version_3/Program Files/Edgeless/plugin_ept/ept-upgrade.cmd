@echo off
echo %time% ept-upgrade-���У���һ������%1 >>X:\Users\Log.txt
if exist Spath.txt del /f /q Spath.txt
for %%1 in (Z Y X W V U T S R Q P O N M L K J I H G F E D C ) do if exist %%1:\Edgeless\version_Disk.txt echo %%1>Spath.txt
for %%1 in (Z Y X W V U T S R Q P O N M L K J I H G F E D C ) do if exist %%1:\Edgeless\version.txt echo %%1>Spath.txt
if not exist Spath.txt (
    echo ept-upgrade �������Ч��Edgeless������
    echo %time% ept-upgrade-û�м�⵽������ >>X:\Users\Log.txt
    goto endUpgrade
)
if exist Spath.txt del /f /q Spath.txt
echo ept-upgrade ���ڶԱȲ����Ϣ...
pecmd load "X:\Program Files\Edgeless\plugin_ept\ept-upgrade.wcs"
if not exist "X:\Users\ept\upgrade\UpgradeList_User.txt" (
    echo ept-upgrade û�п��������Ĳ��
    echo %time% ept-upgrade-û�п��������Ĳ�� >>X:\Users\Log.txt
    goto endUpgrade
)
echo ept-upgrade ��⵽���¸���
echo.
echo ----------
type "X:\Users\ept\upgrade\UpgradeList_User.txt"
echo ----------
echo.
if /i "%1" == "-y" echo ept-upgrade ����ִ���Զ�����
if /i "%1" neq "-y" CHOICE /C yn /M "�Ƿ�ִ�и���?"
if %errorlevel%==2 goto endUpgrade
echo %time% ept-upgrade-�û�ȷ�Ͻ��и��� >>X:\Users\Log.txt

echo Start >X:\Users\ept\upgrade\UpgradeTime.txt

set /p EL_Part=<X:\Users\ept\upgrade\EL_Part.txt
if not defined EL_Part set /p EL_Part=<Spath.txt
if exist Spath.txt del /f /q Spath.txt

echo ept-upgrade ����ת�ƹ��ڵĲ����...
if not exist %EL_Part%:\Edgeless\Resource\���ڲ���� md %EL_Part%:\Edgeless\Resource\���ڲ����
if not exist %EL_Part%:\Edgeless\Resource\���ڲ���� (
    echo ept-upgrade ��%EL_Part%�̵ķ�����ܾ�
    echo %time% ept-upgrade-��%EL_Part%�̵ķ�����ܾ� >>X:\Users\Log.txt
    goto endUpgrade
)
echo ept-upgrade ��ʼ���ظ��£��ּ�������ں�ɫ���ֻᵼ�³�����ͣ
for /f "usebackq delims==; tokens=*" %%i in ("X:\Users\ept\upgrade\UpgradeList_Path.txt") do (
    move /y "%%i" %EL_Part%:\Edgeless\Resource\���ڲ���� >nul
)
ren %EL_Part%:\Edgeless\Resource\���ڲ����\*.7z *.7zf

for /f "usebackq delims==; tokens=*" %%i in ("X:\Users\ept\upgrade\UpgradeList_Name.txt") do (
    echo ept-upgrade ���ڸ���%%i
    pecmd exec =!cmd.exe /c "ept-install %%i -a"
)
if exist X:\Users\ept\upgrade\UpgradeTime.txt del /f /q X:\Users\ept\upgrade\UpgradeTime.txt
echo ept-upgrade �������

:endUpgrade
@echo on