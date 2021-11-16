set "proj=Additional Rage v1.1"

if "%installed_mod%" == "%Choosed_Mod%" goto inicio

call scripts\install.bat

:: -------------- HOME -----------------
:inicio
mode con: cols=32 lines=16

cls
%mod%
echo.
%CECHO% {1E}%proj%{\n}
echo.
echo.
%exec%
call scripts\print_chars.bat
echo.
echo.
set /p opcao=%t_opcao%

if %opcao% equ 1 (
	start SorR.exe
	exit
)
if %opcao% equ 2 goto off
call scripts\opchars.bat
goto inicio

:off
call scripts\uninstall.bat