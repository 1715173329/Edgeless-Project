echo %time% 7zf�������-���� >>X:\Users\Log.txt
echo %time% 7zf�������-Ŀ������ >>X:\Users\Log.txt
echo %1 >>X:\Users\Log.txt
pecmd exec ="%ProgramFiles%\Edgeless\plugin_loader\p7zf.wcs"
if exist X:\Users\load7zf (
rd X:\Users\load7zf
echo %time% 7zf�������-�������� >>X:\Users\Log.txt
pecmd exec ="%ProgramFiles%\Edgeless\plugin_loader\load.cmd" %1
pecmd load "X:\Program Files\Edgeless\plugin_loader\7zftip.wcs"
exit
)
if not exist X:\Users\load7zf echo %time% 7zf�������-�û��رռ��ش��� >>X:\Users\Log.txt
exit