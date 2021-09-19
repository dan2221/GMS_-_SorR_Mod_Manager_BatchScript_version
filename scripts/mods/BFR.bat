set "proj=Battle for Rio"

if "%installed_mod%" == "%Choosed_Mod%" goto inicio

call scripts\install.bat
if %msorr% equ 2 (
	for %%G in (
		16 19
	) do call scripts\music.bat "sorr music"
)
if %msorr% equ 1 (
	for %%G in (
		52 16
		63 19
		63a 19a
	) do call scripts\music.bat "on"
)


if %mmods% equ 2 (
	for %%G in (
		nervous	9
		rustic	43
		anna	20
	) do call scripts\music.bat "install"
)
if %mmods% equ (
	for %%G in (
		nervous	9
		rustic	43
		anna	20
	) do call scripts\music.bat "on"
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
echo    Rudra
echo    Max Man I
if %mmods% equ 1 goto mods_list
echo.
call scripts\pausa.bat
%reset%

:mods_list
echo.
%t_music3%
echo.
echo    Nervousness
echo    Rustic Asia
echo    Anna Willias - Tekken 3
echo.
call scripts\pausa.bat
%reset%

:off
if %msorr% equ 1 (
	for %%G in (
		16	52
		19	63
		19a 63a
	) do call scripts\music.bat %%G "off"
)
if %mmods% equ 1 (
	for %%G in (
		9	nervous
		43	rustic
		20	anna
	) do call scripts\music.bat %%G "off"
)

call scripts\uninstall.bat
exit /b

:music
call scripts/music.bat "%~1" "%~2"
goto:eof