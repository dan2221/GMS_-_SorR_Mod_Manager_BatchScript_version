set "proj=Never Back Down"

if "%installed_mod%" == "%Choosed_Mod%" goto inicio

call scripts\install.bat

:: -------------- HOME --------------------------------------------
:inicio
if exist "mod\games\%proj%\_info.txt" (set cred=1) else (set cred=0)
mode con: cols=38 lines=12
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
if %cred% equ 1 (
	if %opcao% equ 3 "mod\games\%proj%\_info.txt"
)
call scripts\opchars.bat
goto inicio

:off
call scripts\uninstall.bat