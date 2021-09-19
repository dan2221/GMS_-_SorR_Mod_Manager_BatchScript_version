set "proj=DOA"
if exist "mod\games\DOA\_info.txt" (set cred=1) else (set cred=0)

if "%installed_mod%" == "%Choosed_Mod%" goto inicio

call scripts\install.bat

if %msorr% equ 2 (
	For %%G IN (
		9 9a 17 17a 23 23a 28 28a 32 32a
	) do call:music %%G "sorr music"
)
if %msorr% equ 1 (
	for %%G in (
		2	17
		3	28
		31	23
		34	32
		68	9
	) do call:music %%G "on loop"
)

if %mmods% equ 2 (
	for %%G in (
		moonu		5
		v4attack	6
		v4vbreat	10
		neverru		11
		jungleu		15
		v4tdeep		16
		fboat		19
		v4grovin	20
		lsoulu		21
		seclab		24
		karma		34
	) do call:music %%G "install loop"

	for %%G in (
		unknown2 34
	) do call:music %%G "install"

	IF NOT EXIST "mod\music\v4maxman.ogg"	(
		move mod\games\DOA\22.ogg	mod\music\v4maxman.ogg
		move mod\games\DOA\22a.ogg	mod\music\v4maxman_a.ogg
	) else (
		IF NOT EXIST "mod\music\v4maxman_a.ogg" (
			move mod\music\v4maxman.ogg	DELETAR
			move mod\games\DOA\22.ogg	mod\music\v4maxman.ogg
			move mod\games\DOA\22a.ogg	mod\music\v4maxman_a.ogg
		) else (
			move mod\games\DOA\22.ogg	DELETAR\DOA
			move mod\games\DOA\22a.ogg	DELETAR\DOA
		)
	)
)
if %mmods% equ 1 (
	for %%G in (
		moonu		5
		v4attack	6
		v4vbreat	10
		neverru		11
		jungleu		15
		v4tdeep		16
		fboat		19
		v4grovin	20
		lsoulu		21
		v4maxman	22
		seclab		24
		karma		37
	) do call:music %%G "on loop"
	move mod\music\unknown2.ogg	mod\games\DOA\34.ogg
)

:inicio
mode con: cols=40 lines=13
call scripts\sorr_music.bat
cls
%mod%
echo.
%CECHO% {1E}Dead on Arrival{\n}
echo.
echo.
%exec%
if %cred% equ 1 %CECHO% {1E}[3]{1F} %t_credit%{\n}
if %msorr% equ 1 (%CECHO% {1E}[4]{1F} %t_music1%{\n}) else (
	if %mmods% equ 1 (%CECHO% {1E}[4]{1F} %t_music1%{\n})
)
call scripts\print_chars.bat
echo.

set /p opcao=%t_opcao%

if %opcao% equ 1 (start SorR.exe
			exit)
if %opcao% equ 2 goto off
if %opcao% equ 3 goto info
if %opcao% equ 4 goto music_list
call scripts\opchars.bat
goto inicio

:info
if %cred% equ 1 "mod\games\DOA\_info.txt"
if %cred% equ 0 goto doa_inicio
%reset%

:music_list
mode con: cols=40 lines=27
if %msorr% equ 1 goto sorr_list
cls
if %mmods% equ 1 goto mods_list
%reset%

:sorr_list
cls
echo.
%t_music2%
echo.
echo    SMS Power II
echo    Never Return Alive
echo    Too Deep
echo    Fuze
echo    Dilapidated  Town
if "%mmods%" == "1" goto mods_list
echo.
call scripts\pausa.bat
%reset%

:mods_list
echo.
%t_music3%
echo.
echo    Attack of the Barbarian - SORRv4
echo    Violent Breating - SORRv4
echo    Too Deep - SORRv4
echo    Keep in the Groovin' - SORRv4
echo    Max Man - SORRv4
echo    Ferryboat
echo    Secret Laboratory
echo    Never Return Alive Unused - SORR
echo    The Last Soul Unused - SORR
echo    Jungle Beat Unused - SORR
echo    Moon Unused - SORR
echo    Karma - Tekken 6
echo    Title Unknown
echo.
call scripts\pausa.bat
%reset%

:off
if %msorr% equ 1 (
	for %%G in (
		9	68
		17	2
		23	31
		28	3
		32	34
	) do call:music %%G "off loop"
)
if %mmods% equ 1 (
	for %%G in (
		5	moonu
		6	v4attack
		10	v4vbreat
		11	neverru
		15	jungleu
		16	v4tdeep
		19	fboat
		20	v4grovin
		21	lsoulu
		22	v4maxman
		24	seclab
		37	karma		
	) do call:music %%G "off loop"
	move mod\games\DOA\34.ogg	mod\music\unknown2.ogg
)

call scripts\uninstall.bat
exit /b

:music
call scripts/music.bat "%~1" "%~2"
goto:eof