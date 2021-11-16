set "proj=H.U.N.T.E.R MotY"

if "%installed_mod%" == "%Choosed_Mod%" goto inicio

call scripts\install.bat

if %msorr% equ 2 (
	For %%G IN (
		29
		29a
	) do call:music %%G "sorr music"
)
if %msorr% equ 1 (
	move mod\music\29.ogg	"mod\games\%proj%"
	move mod\music\29a.ogg	"mod\games\%proj%"
)

if %mmods% equ 2 (
	for %%G in (
		unknown2	3
		close		8
		nervous		20
		rustic		31
		onmyown		33
	) do call:music %%G "install"

	for %%G in (
		naile	11
		Whiskey	14
		seclab	19
		btiger 	63
	) do call:music %%G "install loop"

	call:complemento
)

if %mmods% equ 1 (
	for %%G in (
		unknown2	3
		ffcdta		7
		close		8
		nervous		20
		rustic		31
		onmyown		33
	) do call:music %%G "on"

	for %%G in (
		naile	11
		moonb	13
		Whiskey	14
		seclab	19
		btiger	63
	) do call:music %%G "on loop"
)

:: -------------- HOME ------------------------------
:inicio
mode con: cols=35 lines=12
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
mode con: cols=35 lines=20
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
echo    Attack of the barbarian
if %mmods% equ 1 goto mods_list
echo.
call scripts\pausa.bat
%reset%

:mods_list
echo.
%t_music3%
echo.
echo    Moon Beach
echo    Secret Laboratory
echo    Close to you
echo    Blind Tiger
echo    Theme of Naile
echo    Whiskey e Rhapsody
echo    Rustic Asia
echo    On My Own
echo    Time Attack FFCD
echo    Nervousness
echo    Title Unknown
echo.
call scripts\pausa.bat
%reset%

:off
if %msorr% equ 1 (
	move "mod\games\%proj%\29.ogg"	mod\music
	move "mod\games\%proj%\29a.ogg"	mod\music
)
if %mmods% equ 1 (
	for %%G in (
		3	unknown2
		7	ffcdta
		8	close
		31	rustic
		33	onmyown
		20	nervous
	) do call:music %%G "off"

	for %%G in (
		11 naile
		13 moonb
		14 Whiskey
		19 seclab
		63 btiger
	) do call:music %%G "off loop"
)

call scripts\uninstall.bat
exit /b

rem ---------- FUNCOES ------------
:music
call scripts/music.bat "%~1" "%~2"
goto:eof

:complemento
IF NOT EXIST "mod\music\ffcdta.ogg" (
	move "mod\games\%proj%\7.ogg"	mod\music\ffcdta.ogg
) else (
	IF EXIST "mod\games\%proj%\7.ogg" (
		move mod\music\ffcdta.ogg	DELETAR
		move "mod\games\%proj%\7.ogg"	mod\music\ffcdta.ogg
	)
)

IF NOT EXIST "mod\music\moonb.ogg" (
	move "mod\games\%proj%\13.ogg"	mod\music\moonb.ogg
	move "mod\games\%proj%\13a.ogg"	mod\music\moonb_a.ogg
) else (
	IF EXIST "mod\games\%proj%\13.ogg" (
		move mod\music\moonb.ogg	DELETAR
		move mod\music\moonb_a.ogg	DELETAR
		move "mod\games\%proj%\13.ogg"	mod\music\moonb.ogg
		move "mod\games\%proj%\13a.ogg"	mod\music\moonb_a.ogg
	)
)
goto:eof