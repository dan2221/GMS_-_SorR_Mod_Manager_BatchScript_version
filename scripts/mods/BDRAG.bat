set "proj=Rage Rise of The Black Dragon"

if "%installed_mod%" == "%Choosed_Mod%" goto inicio

call scripts\install.bat

if %msorr% equ 2 (
	For %%G IN (
		1 1a
		5 5a
		6 6a
		11
	) do call:music %%G "sorr music"
)
if %msorr% equ 1 (
	for %%G in (
		35 1
		52 5
		53 6
		63 11
	) do call:music %%G "on loop"
)

if %mmods% equ 2 (
	for %%G in (
		v4neverr 2
	) do call:music %%G "install loop"
)

if %mmods% equ 1 (
	move mod\music\v4neverr.ogg	"mod\games\%proj%\2.ogg"
	move mod\music\v4neverr_a.ogg	"mod\games\%proj%\2a.ogg"
)

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
if "%msorr%" == "1" %CECHO% {1E}[3]{1F} %t_music1%{\n}
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
mode con: cols=39 lines=14
if %msorr% equ 1 goto sorr_list
cls
if %mmods% equ 1 goto mods_list
%reset%

:sorr_list
if %msorr% neq 1 %reset%
cls
echo.
%t_music2%
echo.
echo    Restaurant
echo    Rudra
echo    Shinobi Reverse
echo    Max man I
if %mmods% equ 1 goto mods_list
echo.
call scripts\pausa.bat
%reset%

:mods_list
echo.
%t_music3%
echo.
echo    Never Return Alive - SORRv4
echo.
call scripts\pausa.bat
%reset%

:off
if %msorr% equ 1 (
	for %%G in (
		1 35
		5 52
		6 53
		11 63
	) do call:music %%G "off loop"
)
if %mmods% equ 1 (
	for %%G in (
		2 v4neverr
	) do call:music %%G "off loop"
)

call scripts\uninstall.bat
exit /b

:music
call scripts/music.bat "%~1" "%~2"
goto:eof