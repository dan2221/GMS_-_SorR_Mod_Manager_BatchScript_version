set "proj=Rescue Metro City"

if "%installed_mod%" == "%Choosed_Mod%" goto inicio

call scripts\install.bat

if %msorr% equ 2 (
	For %%G IN (
		3 3a
		6 6a
		23 23a
	) do call:music %%G "sorr music"
)
if %msorr% equ 1 (
	for %%G in (
		2	6
		29	3
		46	23
	) do call:music %%G "on loop"
)

if %mmods% equ 2 (
	for %%G in (
		ffcdta 11
	) do call:music %%G "install loop"
)
if %mmods% equ 1 (
	move mod\music\ffcdta.ogg	"mod\games\%proj%\11.ogg"
)

:: -------------- HOME -----------------------------------------
:inicio
mode con: cols=35 lines=13
call scripts\sorr_music.bat
cls
%mod%
echo.
%CECHO% {1E}%proj%{\n}
echo.
echo.
%exec%
%CECHO% {1E}[3]{1F} %t_credit%{\n}
if "%msorr%" == "1" (%CECHO% {1E}[4]{1F} %t_music1%{\n}) else (
	if "%mmods%" == "1" (%CECHO% {1E}[4]{1F} %t_music1%{\n})
)
call scripts\print_chars.bat
echo.

set /p opcao=%t_opcao%

if %opcao% equ 1 (start SorR.exe
			exit)
if %opcao% equ 2 goto off
if %opcao% equ 3 goto site
if %opcao% equ 4 goto music_list
call scripts\opchars.bat
goto inicio

:site
start http://www.arcade-collector.com/streets-of-rage-rescue-metro-city/
exit

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
echo    Attack of the barbarian
echo    Never return alive
echo    Boss - SOR3
if %mmods% equ 1 goto mods_list
echo.
call scripts\pausa.bat
%reset%

:mods_list
echo.
%t_music3%
echo.
echo    Time Attack FFCD
echo.
call scripts\pausa.bat
%reset%

:off
if %msorr% equ 1 (
	for %%G in (
	6	2
	3	29
	23	46
	) do call:music %%G "off loop"
)
if %mmods% equ 1 (
	move "mod\games\%proj%\11.ogg"	mod\music\ffcdta.ogg
)

call scripts\uninstall.bat
exit /b

:music
call scripts/music.bat "%~1" "%~2"
goto:eof