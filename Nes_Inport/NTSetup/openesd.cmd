cd /d %~dp0
echo %time% openesd-���� >>X:\Users\Log.txt
echo %1 >>X:\Users\Log.txt
echo [WinNT6]>WinNTSetup.txt
::�趨����Դ
echo Source=%1>>WinNTSetup.txt
::��������������
if exist Z:\ echo BootDest=Z:>>WinNTSetup.txt else echo BootDest=C:>>WinNTSetup.txt
if exist Z:\ echo %time% openesd-����z���� >>X:\Users\Log.txt
if not exist Z:\ echo %time% openesd-������z���� >>X:\Users\Log.txt
echo [WinNT6\TWEAKS]>>WinNTSetup.txt
::��ʾ�����ļ�
echo ShowHidden=1 >>WinNTSetup.txt
::��ʾ��չ��
echo ShowFileExt=1 >>WinNTSetup.txt
::��ʾ�˵��ԣ���̨���ԣ�
echo MyCompOnDesktop=1 >>WinNTSetup.txt
::�������ȫ������ֵ���ļ���ʹ��
if exist X:\AutoUnattend.xml echo %time% openesd-ʹ��ȫ������ֵ���ļ� >>X:\Users\Log.txt
if exist X:\AutoUnattend.xml echo UnattendedFile=X:\AutoUnattend.xml >>WinNTSetup.txt

if exist WinNTSetup.ini del WinNTSetup.ini
ren WinNTSetup.txt WinNTSetup.ini
pecmd exec WinNTSetup_x64.exe
exit

