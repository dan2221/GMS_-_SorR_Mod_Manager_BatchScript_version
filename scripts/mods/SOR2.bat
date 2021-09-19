set "proj=SoR2 Collection for V5 U"

if "%installed_mod%" == "%Choosed_Mod%" goto inicio

call scripts\install.bat
if %mmods% equ 2 (
	for %%G in (
		ulogic	15
		neverr	2
		jungle	5
		smoon	6
		expand	11
		maxman	13
		fstretsm 55
		dtown	56
		moonb	57
		attack	58
		beatnikm 60
		attackm	61
		dslash	26
		fuze	27
		ctrain	28
		beatamb	29
		cycleii	30
		ulogic2	50
		mrxnev	35
	) do call:music %%G "install loop"
)
if %mmods% equ 1 (
	for %%G in (
		ulogic	15
		neverr	2
		jungle	5
		smoon	6
		expand	11
		maxman	13
		fstretsm 55
		dtown	56
		moonb	57
		attack	58
		beatnikm 60
		attackm	61
		dslash	26
		fuze	27
		ctrain	28
		beatamb	29
		cycleii	30
		ulogic2	50
		mrxnev	35
	) do call:music %%G "on loop"
)

for %%G in (
	"8bits",
	"normal",
	"Convert to 8-Bit"
) do (
	if exist "mod\games\%proj%\data\%%G" (
		move "mod\games\%proj%\data\%%G" data
	) 
)

:inicio
mode con: cols=40 lines=17
call scripts\sorr_music.bat
if exist "data\Convert to 8-Bit" (ren "data\Convert to 8-Bit" 8bits)
if not exist "data\8bits" (set som=---) else (
	if exist "data\normal.txt" (set som=OFF) else (
		if exist "data\8bit.txt" (set som=ON) else (
			echo. 2>data\normal.txt
			set som=OFF)
		)
	)
)

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
	echo Opcoes extras:
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
		echo Opciones extras:
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
		echo Extra settings:
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
if %opcao% equ 2 goto off
if %opcao% equ 3 goto music_list
if %opcao% equ 4 goto mudar_som
call scripts\opchars.bat
goto inicio

:music_list
if %mmods% neq 1 %reset%
mode con: cols=51 lines=25
cls
echo.
%t_music3%
echo.
echo   Attack of The Barbarian - BKM
echo   Fighting in the streets - BKM
echo   Beatnik on the Ship - BKM
echo   Attack of the Barbarian
echo   Dilapidated Town
echo   Moon Beach
echo   Never Return Alive
echo   Under Logic
echo   Max Man
echo   Expander
echo   Jungle Beat
echo   Slow Moon
echo   Fuze
echo   Cycle II
echo   Dub Slash
echo   Crazy Train
echo   Beat Ambience
echo   Under Logic - GG and MD Mix
echo   Mix - The return of mr.x and Never Return Alive
echo.
call scripts\pausa.bat
%reset%

:off
if %mmods% equ 1 (
	for %%G in (
		15	ulogic
		2	neverr
		55	fstretsm
		56	dtown
		57	moonb
		58	attack
		60	beatnikm
		61	attackm

		26	dslash
		27	fuze
		28	ctrain
		29	beatamb
		30	cycleii
		13	maxman
		11	expand
		5	jungle
		6	smoon
		50	ulogic2
		35	mrxnev
	) do call:music %%G "off loop"
)

for %%G in (
	8bits
	normal
	normal.txt
	8bit.txt
) do (
	if exist "data\%%G"	(move "data\%%G"	"mod\games\%proj%\data")
)

call scripts\uninstall.bat
exit /b

:mudar_som
if "%som%" == "---"	%reset%
if "%som%" == "ON" 	goto som_normal

if not exist "data\normal" (mkdir data\normal)
for %%G in (
	mrx se1
	se6 se7
	se9 se10
	se11 se12
	se13 se15
	se17 se20
	se21 se24
	se25 se29
	se33 se37
	se45 se46
	se49 se52
	se54 se58
	se59 se60
	se61 se71
	seg1 seg2
	seg3 seg4
	seg5 seg6
	seg7 seg9
	sev38
	sor2_blaze2
	sor2_skate1
) do (
	move "data\%%G.wav"			data\normal
	move "data\8bits\%%G.wav"	data
)
ren data\normal.txt 8bit.txt
%reset%

:som_normal
for %%G in (
	mrx se1
	se6 se7
	se9 se10
	se11 se12
	se13 se15
	se17 se20
	se21 se24
	se25 se29
	se33 se37
	se45 se46
	se49 se52
	se54 se58
	se59 se60
	se61 se71
	seg1 seg2
	seg3 seg4
	seg5 seg6
	seg7 seg9
	sev38
	sor2_blaze2
	sor2_skate1
) do (
	move "data\%%G.wav" data\8bits
	move "data\normal\%%G.wav" data
)
ren data\8bit.txt normal.txt
%reset%

rem ---------- FUNCOES --------------

:music
call scripts/music.bat "%~1" "%~2"
goto:eof