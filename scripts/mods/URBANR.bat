set "proj=Urban Reign"

if "%installed_mod%" == "%Choosed_Mod%" goto inicio

call scripts\install.bat

:: -------------- HOME ----------------------------
:inicio
mode con: cols=35 lines=12
cls
%mod%
echo.
%CECHO% {1E}%proj%{\n}
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