@echo off
echo %time% ept-get-���У���һ������%1���ڶ�������%2������������%3 >>X:\Users\Log.txt
if "%1"=="install" (
    echo %time% ept-get-�ض�����ept-install >>X:\Users\Log.txt
    call ept-install %2 %3
    goto endOfEtp
)

if "%1"=="remove" (
    echo %time% ept-get-�ض�����ept-remove >>X:\Users\Log.txt
    call ept-remove %2 %3
    goto endOfEtp
)

if "%1"=="update" (
    echo %time% ept-get-�ض�����ept-update >>X:\Users\Log.txt
    call ept-update
    goto endOfEtp
)
call ept-help.cmd
:endOfEtp
@echo on