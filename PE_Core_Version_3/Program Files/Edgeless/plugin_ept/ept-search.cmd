@if not exist X:\Users\ept\Index call ept-update
@echo off
echo %time% ept-search-���У���һ������%1 >>X:\Users\Log.txt
echo %time% ept-search-����find��������£� >>X:\Users\Log.txt
find /n /i "%1" X:\Users\ept\Index >>X:\Users\Log.txt

echo ept-search �ڱ����������������²��
find /n /i "%1" X:\Users\ept\Index
echo ----------
echo.
echo ʹ��   ept install [���]    ��װ
echo %time% ept-search-������� >>X:\Users\Log.txt
echo on