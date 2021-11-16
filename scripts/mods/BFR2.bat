set "proj=Battle for Rio 2"

if "%installed_mod%" == "%Choosed_Mod%" goto inicio

call scripts\install.bat

if %mmods% equ 2 (
	for %%G in (
		18 Whiskey
	) do call:music %%G "install"
)
if %mmods% equ 1 (
	move mod\music\Whiskey.ogg	"mod\games\%proj%\18.ogg"
)

:: -------------- HOME ------------------------------
:inicio
mode con: cols=39 lines=12
call scripts\sorr_music.bat
cls
%mod%
echo.
%CECHO% {1E}%proj%{\n}
echo.
echo.
%exec%
if %mmods% equ 1 (%CECHO% {1E}[3]{1F} %t_music1%{\n})
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
cls
echo.
%t_music3%
echo.
echo    Whiskey e Rhapsody
echo.
call scripts\pausa.bat
%reset%

:off
if %mmods% equ 1 (
	move "mod\games\%proj%\18.ogg"	mod\music\Whiskey.ogg
)

call scripts\uninstall.bat
exit /b

:music
call scripts/music.bat "%~1" "%~2"
goto:eof