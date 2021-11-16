set "proj=Nightsweeper v1.4"
if exist "mod\games\%proj%\credits.txt" (set cred=1) else (set cred=0)

if "%installed_mod%" == "%Choosed_Mod%" goto inicio

call scripts\install.bat

if %msorr% equ 2 (
	For %%G IN (1 1a 17) do call:music %%G "sorr music"
)
if %msorr% equ 1 (
	for %%G in (
		72 1
		72a 1a
		49 17
	) do call:music %%G "on"
)

if %mmods% equ 2 (
	for %%G in (
		hospital	5
		lsoulu		7
		Whiskey		10
		naile		12
		v4neverr	15
		btiger		63
	) do call:music %%G "install loop"

	for %%G in (
		close	6
		rustic	11
		onmyown	18
	) do call:music %%G	"install"
)

if %mmods% equ 1 (
	for %%G in (
		hospital	5
		lsoulu		7
		Whiskey		10
		naile		12
		v4neverr	15
		btiger		63
	) do call:music %%G "on loop"

	for %%G in (
		close	6
		rustic	11
		onmyown	18
	) do call:music %%G	"on"
)

:: -------------- HOME ------------------------------
:inicio
mode con: cols=52 lines=18

call scripts\sorr_music.bat
cls
%mod%
echo.
%CECHO% {1E}H.U.N.T.E.R Gaiden - Operation %proj%{\n}
echo.
echo.
%exec%
if %cred% equ 1 %CECHO% {1E}[3]{1F} %t_credit%{\n}
if %msorr% equ 1 (%CECHO% {1E}[4]{1F} %t_music1%{\n}) else (
	if %mmods% equ 1 (%CECHO% {1E}[4]{1F} %t_music1%{\n})
)
call scripts\print_chars.bat
echo.
echo.

set /p opcao=%t_opcao%

if %opcao% equ 1 (start SorR.exe
			exit)
if %opcao% equ 2 goto off
if %opcao% equ 3 goto credit
if %opcao% equ 4 goto music_list
call scripts\opchars.bat
goto inicio

:credit
if %cred% equ 1 "mod\games\%proj%\credits.txt"
goto inicio

:music_list
mode con: cols=40 lines=19
if %msorr% equ 1 goto sorr_list
cls
if %mmods% equ 1 goto mods_list
%reset%

:sorr_list
cls
echo.
%t_music2%
echo.
echo    My little baby
echo    New wave
if %mmods% equ 1 goto mods_list
echo.
call scripts\pausa.bat
%reset%

:mods_list
echo.
%t_music3%
echo.
echo    Never Return Alive - SORRv4
echo    The Last Soul Unused - SORR
echo    Hospital - Jesper Kyd
echo    Close to you
echo    Blind Tiger
echo    Theme of Naile
echo    Whiskey e Rhapsody
echo    Rustic Asia
echo    On My Own
echo.
call scripts\pausa.bat
%reset%

:off
if %msorr% equ 1 (
	for %%G in (
		1	72
		1a	72a
		17	49
	) do call:music %%G "off"
)
if %mmods% equ 1 (
	for %%G in (
		6	close
		11	rustic
		18	onmyown
	) do call:music %%G "off"

	for %%G in (
		5	hospital
		7	lsoulu
		10	Whiskey
		12	naile
		15	v4neverr
		63	btiger
	) do call:music %%G "off loop"
)

call scripts\uninstall.bat
exit /b

:music
call scripts/music.bat "%~1" "%~2"
goto:eof