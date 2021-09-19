set "proj=SoR3 - Adam's Story Extended"

if "%installed_mod%" == "%Choosed_Mod%" goto inicio

call scripts\install.bat

if %msorr% equ 2 (
	For %%G IN (
		1 1a
		2 2a
	) do call:music %%G "sorr music"
)
if %msorr% equ 1 (
	for %%G in (
		70 1
		14 2
	) do call:music %%G "on loop"
)

if %mmods% equ 2 (
	for %%G in (
		v4grovin 	4
		v4attack 	6
		jungleu		7
		v4dreamer	13
		karma		29
		v4go		33
		hospital	35
		v4vbreat	38
		v4lsoul		40
	) do call:music %%G "install loop"

	for %%G in (hurry 8) do (
		call:music %%G "install"
	)
)
if %mmods% equ 1 (
	for %%G in (
		4	v4grovin
		6	v4attack
		7	jungleu
		13	v4dreamer
		29	karma
		33	v4go
		35	v4hospital
		38	v4vbreat
		40	v4lsoul
	) do call:music %%G "on loop"
	move mod\music\hurry.ogg	"mod\games\%proj%\8.ogg"
)

:inicio
mode con: cols=64 lines=20
call scripts\sorr_music.bat
cls
%mod%
echo.
%CECHO% {1E}%proj%{\n}
echo.
echo.
%exec%
if %msorr% equ 1 (%CECHO% {1E}[3]{1F} %t_music1%{\n}) else (
	if %mmods% equ 1 (%CECHO% {1E}[3]{1F} %t_music1%{\n})
)
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
echo 	The poets I
echo 	Max man II
if %mmods% equ 1 goto mods_list
echo.
call scripts\pausa.bat
%reset%

:mods_list
echo.
%t_music3%
echo.
echo 	Attack of the Barbarian - SORRv4
echo 	Keep the Groovin' - SORRv4
echo 	Violent Breathing - SORRv4
echo 	The Last Soul - SORRv4
echo 	Go Straight - SORRv4
echo 	Dreamer - SORRV4
echo 	Jungle Beat Unused - SORR
echo 	Hurry Up!
echo 	Karma - Tekken 6
echo 	Hospital - Jesper Kyd
echo.
call scripts\pausa.bat
%reset%

:off
if %msorr% equ 1 (
	for %%G in (
		1 70
		2 14
	) do call:music %%G "off loop"
)
if %mmods% equ 1 (
	for %%G in (
		4	v4grovin
		6	v4attack
		7	jungleu
		13	v4dreamer
		29	karma
		33	v4go
		35	v4hospital
		38	v4vbreat
		40	v4lsoul
	) do call:music %%G "off loop"
	move "mod\games\%proj%\8.ogg"	mod\music\hurry.ogg
)

call scripts\uninstall.bat
exit /b

:music
call scripts/music.bat "%~1" "%~2"
goto:eof