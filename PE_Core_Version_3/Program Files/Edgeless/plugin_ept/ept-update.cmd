@echo off
echo ept-update ��ʼ���²��������
"X:\Program Files\Edgeless\EasyDown\aria2c.exe" -x16 -c -d X:\Users -o Data.txt http://s.edgeless.top/?token=index
if exist X:\Users\Data.txt (
    if exist X:\Users\Data del /f /q X:\Users\Data>nul
    ren X:\Users\Data.txt Data
    echo ept-update �����������
) else (
    echo ept-update ��������ʧ�ܣ�������������
)
echo on