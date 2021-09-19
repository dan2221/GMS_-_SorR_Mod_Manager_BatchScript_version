set "proj=Rushing Beat Remake FE v2.1"
if exist "mod\games\%proj%\Read Me.txt" (set cred=1) else (set cred=0)

if "%installed_mod%" == "%Choosed_Mod%" goto inicio

call scripts\install.bat

:inicio
mode con: cols=39 lines=12

cls
%mod%
echo.
%CECHO% {1E}%proj%{\n}
echo.
echo.
%exec%
if %cred% equ 1 %CECHO% {1E}[3]{1F} %t_credit%{\n}
call scripts\print_chars.bat
echo.

set /p opcao=%t_opcao%

if %opcao% equ 1 (start SorR.exe
			exit)
if %opcao% equ 2 goto off
if %opcao% equ 3 goto info
call scripts\opchars.bat
goto inicio

:info
if %cred% equ 1 "mod\games\%proj%\Read Me.txt"
goto inicio

:off
call scripts\uninstall.bat