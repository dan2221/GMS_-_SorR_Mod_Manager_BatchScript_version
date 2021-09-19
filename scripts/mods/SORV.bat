set "proj=Streets of Rage V - demo 2017"

if "%installed_mod%" == "%Choosed_Mod%" goto inicio

call scripts\install.bat
if %msorr% equ 2 goto sorr_music
if %msorr% equ 1 goto move_m
%reset%

:sorr_music
if %msorr% equ 2 (
	For %%G IN (
		3 3a
	) do call:music %%G "sorr music"
)

if %msorr% equ 1 (
	for %%G in (
		29 3
	) do call:music %%G "on loop"
)

:inicio
mode con: cols=45 lines=12
call scripts\sorr_music.bat
cls
%mod%
echo.
%CECHO% {1E}%proj%{\n}
echo.
echo.
%exec%
if %msorr% equ 1 (%CECHO% {1E}[3]{1F} %t_music1%{\n})
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
if %msorr% equ 1 (
	cls
	echo.
	%t_music2%
	echo.
	echo 	Attack of the barbarian
	echo.
	pause
)
%reset%

:off
if %msorr% equ 1 (
	for %%G in (
		3 29
	) do call:music %%G "off loop"
)
call scripts\uninstall.bat
exit /b

:music
call scripts/music.bat "%~1" "%~2"
goto:eof