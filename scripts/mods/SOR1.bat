set "proj=SoR1 Collection for V5 Vecta"

if "%installed_mod%" == "%Choosed_Mod%" goto inicio

call scripts\install.bat
if %mmods% equ 2 (
	for %%G in (
		hospital	50
		ulogic		41
		neverr		49
		fstretsm	30
		dtown		2
		moonb		3
		attack		9
		attackm		29
		beatnikm	33
		monalisa	61
		grovinm		32
	) do call:music %%G "install loop"
)
if %mmods% equ 1 (
	for %%G in (
		hospital 	50
		ulogic		41
		neverr		49
		fstretsm	30
		dtown		2
		moonb		3
		attack		9
		attackm		29
		beatnikm	33
		monalisa	61
		grovinm		32
	) do call:music %%G "on loop"
)

For %%G IN (
	"Convert to 8-Bit",
	"8bits",
	"normal"
) do move "mod\games\%proj%\data\%%G"	data

:inicio
mode con: cols=38 lines=17
if exist "data\Convert to 8-Bit" (ren "data\Convert to 8-Bit" 8bits)
if not exist "data\8bits" (set som=---) else (
	if exist "data\normal.txt" (set som=OFF) else (
		if exist "data\8bit.txt" (set som=ON) else (
			echo. 2>data\normal.txt
			set som=OFF)
		)
	)
)
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
if "%idioma%" == "PORTUGUES" (
	echo Opcao extra:
	echo.
	if "%som%" == "OFF" (
		%CECHO% {1E}[4]{1F} Som 8-bits: {1C}OFF
	) else (
		if "%som%" == "ON" (
			%CECHO% {1E}[4]{1F} Som 8-bits: {1A}ON
		) else (
			%CECHO% {1E}[4]{1F} Som 8-bits: {1E}---
		)
	)
) else (
	if "%idioma%" == "ESPANOL" (
		echo Opcion extra:
		echo.
		if "%som%" == "OFF" (
			%CECHO% {1E}[4]{1F} Sonido 8-bits: {1C}OFF
		) else (
			if "%som%" == "ON" (
				%CECHO% {1E}[4]{1F} Sonido 8-bits: {1A}ON
			) else (
				%CECHO% {1E}[4]{1F} Sonido 8-bits: {1E}---
			)
		)
	) else (
		echo Extra setting:
		echo.
		if "%som%" == "OFF" (
			%CECHO% {1E}[4]{1F} 8-bits sounds: {1C}OFF
		) else (
			if "%som%" == "ON" (
				%CECHO% {1E}[4]{1F} 8-bits sounds: {1A}ON
			) else (
				%CECHO% {1E}[4]{1F} 8-bits sounds: {1E}---
			)
		)
	)
)
%CECHO% {1F}{\n}{\n}
echo.
set /p opcao=%t_opcao%

if %opcao% equ 1 (start SorR.exe
			exit)
if %opcao% equ 2 goto sor1_off
if %opcao% equ 3 goto music_list
if %opcao% equ 4 goto mudar_som
call scripts\opchars.bat
goto inicio

:music_list
if %mmods% neq 1 %reset%
cls
echo.
%t_music3%
echo.
echo   Hospital - Jesper Kyd
echo   Attack of the Barbarian - BKM
echo   Fighting in the streets - BKM
echo   Beatnik on the Ship - BKM
echo   Keep the Groovin' - BKM
echo   Attack of the Barbarian
echo   Dilapidated Town
echo   Never Return Alive
echo   Under Logic
echo   Moon Beach
echo   Boss - SOR3
echo.
call scripts\pausa.bat
%reset%

:sor1_off
if %mmods% equ 1 (
	for %%G in (
		50	hospital
		41	ulogic
		49	neverr
		30	fstretsm
		2	dtown
		3	moonb
		9	attack
		29	attackm
		33	beatnikm
		61	monalisa
		32	grovinm
	) do call:music %%G "off loop"
)

for %%G in (
	8bits
	normal
	normal.txt
	8bit.txt
) do (
	if exist "data\%%G"		(move "data\%%G"	"mod\games\%proj%\data")
)

call scripts\uninstall.bat
exit /b

:mudar_som
if "%som%" == "---"	%reset%
if "%som%" == "ON" 	goto som_normal

if not exist "data\normal" (mkdir data\normal)
for %%G in (
	se6 se9
	se10 se11
	se12 se13
	se15 se21
	se24 se29
	se37 se46
	se49 se54
	se58 se59
	se60 se61
	se71 seg1
	seg2 seg3
	seg4 seg7
	seg9
) do move "data\%%G.wav" data\normal

for %%G in (
	mrx se6
	se9 se10
	se11 se12
	se13 se15
	se21 se24
	se29 se37
	se46 se49
	se54 se58
	se59 se60
	se61 se71
	seg1 seg2
	seg3 seg4
	seg7 seg9
) do move "data\8bits\%%G.wav" data
ren data\normal.txt 8bit.txt
%reset%

:som_normal
for %%G in (
	mrx se6
	se9 se10
	se11 se12
	se13 se15
	se21 se24
	se29 se37
	se46 se49
	se54 se58
	se59 se60
	se61 se71
	seg1 seg2
	seg3 seg4
	seg7 seg9
) do move "data\%%G.wav" data\8bits

for %%G in (
	se6	 se9
	se10 se11
	se12 se13
	se15 se21
	se24 se29
	se37 se46
	se49 se54
	se58 se59
	se60 se61
	se71 seg1
	seg2 seg3
	seg4 seg7
	seg9
) do move "data\normal\%%G.wav" data
ren data\8bit.txt normal.txt
%reset%

rem ---------- FUNCOES --------------

:music
call scripts/music.bat "%~1" "%~2"
goto:eof