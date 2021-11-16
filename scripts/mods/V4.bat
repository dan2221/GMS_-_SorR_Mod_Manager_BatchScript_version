set "proj=V4 Remake v1.4"
if exist "mod\games\%proj%\v4 Full Route Map.jpg" (set cred=1) else (set cred=0)

if "%idioma%" == "PORTUGUES" (set t_map=Mapa de rotas) else (
	if "%idioma%" == "ESPANOL" (set t_map=Mapa de rutas) else (
		set t_map=Route map
	)
)

if "%installed_mod%" == "%Choosed_Mod%" goto inicio

call scripts\install.bat

if %msorr% equ 2 (
	For %%G IN (
		5 5a 6 15 15a 19 19a 27 27a
	) do call:music %%G "sorr music"
)
if %msorr% equ 1 (
	for %%G in (
		23 5
		10 15
		28 19
		15 27
	) do call:music %%G "on loop"
	move mod\music\7.ogg	"mod\games\%proj%\6.ogg"
)

if %mmods% equ 2 (
	for %%G in (
		v4go		1
		v4neverr	4
		v4vbreat	9
		v4grovin	10
		v4dreamer	11
		v4tdeep		14
		v4attack	16
		fboat		18
		seclab		22
		unknown		26
		v4rudra		37		
	) do call:music %%G "install loop"
	for %%G in (
		hurry 33
	) do call:music %%G "install"
	call:complemento
)

if %mmods% equ 1 (
	for %%G in (
		v4go		1
		v4neverr	4
		v4vbreat	9
		v4grovin	10
		v4dreamer	11
		v4tdeep		14
		v4attack	16
		fboat		18
		seclab		22
		unknown		26
		v4maxman	28
		v4rudra		37
	) do call:music %%G "on loop"
	move mod\music\hurry.ogg	"mod\games\%proj%\33.ogg"
)

:: -------------- HOME ------------------------------------
:inicio
call scripts\sorr_music.bat
mode con: cols=39 lines=14
cls
%mod%
echo.
%CECHO% {1E}%proj%{\n}
echo.
echo.
%exec%
if %cred% equ 1		 %CECHO% {1E}[3]{1F} %t_map%{\n}
if %msorr% equ 1 	(%CECHO% {1E}[4]{1F} %t_music1%{\n}) else (
	if %mmods% equ 1 (%CECHO% {1E}[4]{1F} %t_music1%{\n})
)
call scripts\print_chars.bat
echo.
echo.

set /p opcao=%t_opcao%

if %opcao% equ 1 (start SorR.exe
			exit)
if %opcao% equ 2 goto off
if %opcao% equ 3 goto map
if %opcao% equ 4 goto music_list
call scripts\opchars.bat
goto inicio

:map
if %cred% equ 1 "mod\games\%proj%\v4 Full Route Map.jpg"
%reset%

:music_list
mode con: cols=39 lines=27
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
echo    Entertainment Street
echo    Night Club
echo    Jungle Base
echo    Dub Slash
echo    The Last Soul
if %mmods% equ 1 goto mods_list
echo.
call scripts\pausa.bat
%reset%

:mods_list
echo.
%t_music3%
echo.
echo    Attack of the Barbarian - SORRv4
echo    Never Return Alive - SORRv4
echo    Violent Breathing - SORRv4
echo    Keep the Groovin - SORRv4
echo    Go Straight - SORRv4
echo    Too Deep - SORRv4
echo    Max Man - SORRv4
echo    Dreamer - SORRv4
echo    Rudra Awakening
echo    Ferryboat
echo    Secret Laboratoy
echo    Hurry Up!
echo    Over The Bay
echo.
call scripts\pausa.bat
%reset%

:off
if %msorr% equ 1 (
	for %%G in (
		5	23
		15	10
		19	28
		27	15
	) do call:music %%G "off loop"
	move "mod\games\%proj%\6.ogg"	mod\music\7.ogg
)
if %mmods% equ 1 (
	for %%G in (
		1 v4go
		4 v4neverr
		9 v4vbreat
		10 v4grovin
		11 v4dreamer
		14 v4tdeep
		16 v4attack
		18 fboat
		22 seclab
		26 unknown
		28 v4maxman
		37 v4rudra
	) do call:music %%G "off loop"
	move "mod\games\%proj%\33.ogg"	mod\music\hurry.ogg
)

ren mod\V4.txt sorr.txt
exit /b

rem ------- Funcoes ----------

:music
call scripts/music.bat "%~1" "%~2"
goto:eof

:complemento
IF EXIST "mod\music\v4maxman.ogg" (
	IF EXIST "mod\music\v4maxman_a.ogg" (
		IF EXIST "mod\games\%proj%\28.ogg" (
			move "mod\games\%proj%\28.ogg"	"DELETAR\%proj%"
		)
	)
)
goto:eof