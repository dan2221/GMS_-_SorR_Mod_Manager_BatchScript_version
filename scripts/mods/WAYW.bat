set "proj=Way of the Warrior"

if "%installed_mod%" == "%Choosed_Mod%" goto inicio

call scripts\traducao.bat 1
call scripts\install.bat

:: -------------- HOME ----------------------------
:inicio
mode con: cols=46 lines=13
call scripts\traducao.bat 0
cls
%mod%
echo.
%CECHO% {1E}%proj%{\n}
call scripts\traducao.bat 2
echo.
echo.
%exec%
call scripts\print_chars.bat
echo.

set /p opcao=%t_opcao%

if %opcao% equ 1 (start SorR.exe
			exit)
if %opcao% equ 2 goto off
call scripts\opchars.bat
goto inicio

:off
call scripts\uninstall.bat