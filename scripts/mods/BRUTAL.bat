set "proj=Brutal Justice v1.0"

if "%installed_mod%" == "%Choosed_Mod%" goto inicio

call scripts\install.bat
call scripts\traducao.bat 1

if %mmods% equ 2 (
	for %%G in (
		anna 39
	) do call:music %%G "install"
)
if %mmods% equ 1 (
	move mod\music\anna.ogg	"mod\games\%proj%\39.ogg"
)

:inicio
mode con: cols=46 lines=15
call scripts\traducao.bat 0
call scripts\sorr_music.bat
cls
%mod%
echo.
%CECHO% {1E}%proj%{\n}
call scripts\traducao.bat 2
echo.
echo.
%exec%

if %mmods% equ 1 %CECHO% {1E}[3]{1F} %t_music1%{\n}
call scripts\print_chars.bat
echo.

set /p opcao=%t_opcao%

if %opcao% equ 1 (start SorR.exe
			exit)
if %opcao% equ 2 goto off
if %opcao% equ 3 goto music_list
call scripts\opchars.bat
goto inicio

:music_list
if %mmods% equ 0 %reset%
if %mmods% equ 2 %reset%
cls
echo.
%t_music3%
echo.
echo 	Anna Willias - Tekken 3
echo.
call scripts\pausa.bat
%reset%

:off
if %mmods% equ 1 (
	move "mod\games\%proj%\39.ogg"	mod\music\anna.ogg
)

call scripts\uninstall.bat
exit /b

:music
call scripts/music.bat "%~1" "%~2"
goto:eof