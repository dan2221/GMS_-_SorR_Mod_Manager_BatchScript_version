set "proj=SoR3 Ultimate Mod for V5"

if "%installed_mod%" == "%Choosed_Mod%" goto inicio

call scripts\install.bat
if %mmods% equ 2 (
	for %%G in (
		monalisa 5
		dslash	22
		fuze	2
		beatamb	18
		cycleii	24
		maxman	15
		attackm	25
		neverr	28
		expand	29
		jungle	31
		grovinm 45
		smoon	55
		dtown	57
		ulogic2	58
		mrxnev	59
	) do call:music %%G "install loop"
)
if %mmods% equ 1 (
	for %%G in (
		monalisa 5
		dslash	22
		fuze	2
		beatamb	18
		cycleii	24
		maxman	15
		attackm	25
		neverr	28
		expand	29
		jungle	31
		grovinm	45
		smoon	55
		dtown	57
		ulogic2	58
		mrxnev	59
	) do call:music %%G "on loop"
)

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
if %mmods% neq 1 %reset%
cls
mode con: cols=52 lines=22
echo.
%t_music3%
echo.
echo   Mona e Lisa
echo   Dub Slash
echo   Fuze
echo   Crazy Train
echo   Beat Ambience
echo   Cycle II
echo   Max Man
echo   Never Return Alive
echo   Expander
echo   Jungle Beat
echo   Slow Moon
echo   Dilapidated Town
echo   Attack of the Barbarian - BKM
echo   Keep the Groovin' - BKM
echo   Under Logic - GG and MD Mix
echo   Mix - The return of mr.x and Never Return Alive
echo.
call scripts\pausa.bat
%reset%

:off
if %mmods% equ 1 (
	for %%G in (
		5	monalisa
		22	dslash
		2	fuze
		18	beatamb
		24	cycleii
		15	maxman
		25	attackm
		28	neverr
		29	expand
		31	jungle
		45	grovinm
		55	smoon
		57	dtown
		58	ulogic2
		59	mrxnev
	) do call:music %%G "off loop"
)

call scripts\uninstall.bat
exit /b

rem ---------- FUNCOES --------------

:music
call scripts/music.bat "%~1" "%~2"
goto:eof