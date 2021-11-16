set "proj=Burning Fight Prototype"
if exist "mod\games\%proj%\Readme.rtf" (set cred=1) else (set cred=0)
set "enemies="

if "%installed_mod%" == "%Choosed_Mod%" goto inicio

:: ------- MOD enemies ----------------------
call:check_enemies
if "%enemies%" == "OFF" (
	For %%G IN (
		abadede
		barbon
		bongo
		bronz
		bruce
		cody
		donovan
		electra_sor1
		fat
		galsia_sor1
		galsiax
		galvice
		garnet
		mrx
		payaso
		rbear
		shiva
		signal
		soozie
		storm
		stormx
		yamato
	) do (
		if exist "mod\games\%proj%\data\%%G.fpg" (
			ren "mod\games\%proj%\data\%%G.fpg" "[mod]%%G.fpg"
		)
	)
)

call scripts\install.bat

:: -------------- HOME --------------------------------------------
:inicio
call:check_enemies
mode con: cols=45 lines=16
cls
%mod%
echo.
%CECHO% {1E}%proj%{\n}
echo.
echo.
%exec%
if %cred% equ 1 %CECHO% {1E}[3]{1F} %t_credit%{\n}
call scripts\print_chars.bat
echo.

if "%idioma%" == "PORTUGUES" (
	echo Opcao extra:
	echo.
	if "%enemies%" == "OFF" (
		%CECHO% {1E}[4]{1F} Inimigos do Burning Fight: {1C}OFF
	) else (
		%CECHO% {1E}[4]{1F} Inimigos do Burning Fight: {1A}ON
	)
) else (
	if "%idioma%" == "ESPANOL" (
		echo Opcion extra:
		echo.
		if "%enemies%" == "OFF" (
			%CECHO% {1E}[4]{1F} Enemigos del Burning Fight: {1C}OFF
		) else (
			%CECHO% {1E}[4]{1F} Enemigos del Burning Fight: {1A}ON
		)
	) else (
		echo Extra setting:
		echo.
		if "%enemies%" == "OFF" (
			%CECHO% {1E}[4]{1F} Burning Fight enemies: {1C}OFF
		) else (
			%CECHO% {1E}[4]{1F} Burning Fight enemies: {1A}ON
		)
	)
)
%CECHO% {1F} {\n}
echo.
set /p opcao=%t_opcao%

if %opcao% equ 1 (start SorR.exe
			exit)
if %opcao% equ 2 goto off
if %opcao% equ 3 (
	if "%cred%" == "1" "mod\games\%proj%\Readme.rtf"
)
if %opcao% equ 4 goto _enemies
call scripts\opchars.bat
goto inicio

:_enemies
For %%G IN (
	abadede
	barbon
	bongo
	bronz
	bruce
	cody
	donovan
	electra_sor1
	fat
	galsia_sor1
	galsiax
	galvice
	garnet
	mrx
	payaso
	rbear
	shiva
	signal
	soozie
	storm
	stormx
	yamato
) do (
	IF "%enemies%" == "ON" (
		ren "data\%%G.fpg" "[mod]%%G.fpg"
		if exist "mod\games\%proj%\enemies_on.txt" (
			ren "mod\games\%proj%\enemies_on.txt"	enemies_off.txt
		)
	) ELSE (
		ren "data\[mod]%%G.fpg" "%%G.fpg"
		if exist "mod\games\%proj%\enemies_off.txt" (
			ren "mod\games\%proj%\enemies_off.txt"	enemies_on.txt
		)
	)
)
goto inicio

:off
call scripts\uninstall.bat

exit /b

:check_enemies
IF EXIST "mod\games\%proj%\enemies_on.txt" (set enemies=ON) ELSE (
	IF EXIST "mod\games\%proj%\enemies_off.txt" (set enemies=OFF) ELSE (
		echo. 2>"mod\games\%proj%\enemies_on.txt"
		set enemies=ON
	)
)
goto:eof