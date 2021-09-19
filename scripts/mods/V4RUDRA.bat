set "proj=SoRR v4 Bonus - Rudra's Story"

if "%installed_mod%" == "%Choosed_Mod%" goto inicio


call scripts\install.bat

if %msorr% equ 2 (
	For %%G IN (
		3 3a 9 9a
	) do call:music %%G "sorr music"
)
if %msorr% equ 1 (
	for %%G in (
		74 3
		47 9
	) do call:music %%G "on loop"
)

if %mmods% equ 2 (
	for %%G in (
		moonu		1
		neverru 	4
		unknown 	5
		v4vbreat	6
		lsoulu		7
		v4maxman	8
		v4rudra		63		
	) do call:music %%G "install loop"
)
if %mmods% equ 1 (
	for %%G in (
		moonu		1
		neverru 	4
		unknown		5
		v4vbreat 	6
		lsoulu		7
		v4maxman	8
		v4rudra		63
	) do call:music %%G "on loop"
)

:inicio
mode con: cols=41 lines=13
call scripts\sorr_music.bat
cls
%mod%
echo.
%CECHO% {1E}%proj%{\n}
echo.
echo.
%exec%
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
if %opcao% equ 3 goto music_list
call scripts\opchars.bat
goto inicio

:music_list
mode con: cols=39 lines=19
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
echo    Sojutso
echo    Stealthy Steps
if %mmods% equ 1 goto mods_list
echo.
call scripts\pausa.bat
%reset%

:mods_list
echo.
%t_music3%
echo.
echo    Rudra Awakening
echo    Violent Breathing - SORRV4
echo    Max Man - SORRV4
echo    Over The Bay
echo    Moon Unused - SORR
echo    The Last Soul Unused - SORR
echo    Never Return Alive Unused - SORR
echo.
call scripts\pausa.bat
%reset%

:off
if %msorr% equ 1 (
	for %%G in (
		3 74
		9 47
	) do call:music %%G "off loop"
)
if %mmods% equ 1 (
	for %%G in (
		1	moonu
		4	neverru
		5	unknown
		6	v4vbreat
		7	lsoulu
		8	v4maxman
		63	v4rudra
	) do call:music %%G "off loop"
)

ren mod\V4RUDRA.txt sorr.txt
exit /b

:music
call scripts/music.bat "%~1" "%~2"
goto:eof