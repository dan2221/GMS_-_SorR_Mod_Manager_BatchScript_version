rem ---------- Check for music txts --------------
IF EXIST "mod\games\%proj%\sorr_music.txt" (set /A msorr=1) ELSE (
	IF "%opC%" == "ON" (set /A msorr=2) ELSE (set /A msorr=0)
)

IF EXIST "mod\games\%proj%\mods_music.txt" (set /A mmods=1) ELSE (
	IF "%opD%" == "ON" (set /A mmods=2) ELSE (set /A mmods=0)
)

rem --------- List all data files in a txt -------
IF EXIST "mod\games\%proj%\data" (
	for /f tokens^=* %%i in ('WHERE /r "mod\games\%proj%\data" *.*')do (
		echo %%~nxi>> mod\sorr.txt
	)
)

rem ---------- Char FPGs and Palettes -----------
if "%opG%" == "ON" (
	if exist "mod\games\%proj%\palettes\chars\*.pal" (
		call scripts\chars_off.bat
	)
) else (
	For %%G IN (
		adam
		ash_char
		axel
		beta_max
		bk3_axel
		blaze
		electra_char
		max
		mry
		roo_char
		sor1_axel
		sor1_blaze
		sor2_blaze
		sor2_shiva
		sor2_skate
		sor3_shiva
		zan
		skate
		rudra_char
	) do (
		if exist "mod\games\%proj%\data\%%G.fpg" (
			ren "mod\games\%proj%\data\%%G.fpg" "[mod]%%G.fpg"
		)
		if exist "mod\games\%proj%\data\f_%%G.fpg" (
			ren "mod\games\%proj%\data\f_%%G.fpg" "[mod]f_%%G.fpg"
		)
	)
)

:pal
set /A ativos=0
if "%opG%" == "ON" (call scripts\scan_chars.bat) else (
	if "%opB%" == "ON" (call scripts\scan_chars.bat)
)

if "%opG%" == "ON" (call:pal_apply) else (
	if "%opB%" == "ON" (call:pal_apply)
)

:: ---------- Theme files ------------------------
For %%G IN (
	inicio
	scroll3
	scroll4
) do (
	if "%opF%" == "ON" (
		if exist "mod\games\%proj%\data\%%G.fpg" (
			ren "mod\games\%proj%\data\%%G.fpg" "[mod]%%G.fpg"
		)
	) else (
		if exist "data\%%G.fpg" (
			ren "data\%%G.fpg" "[theme]%%G.fpg"
		)
	)
)

rem --------- Enemy palettes and others data files ------------

if exist "mod\games\%proj%\palettes\enemies" (
	ren palettes\enemies sorr
	move "mod\games\%proj%\palettes\enemies"	palettes
)

IF EXIST "mod\games\%proj%\data" (
	for /f tokens^=* %%i in ('WHERE /r "mod\games\%proj%\data" *.*')do (
		if exist "data\%%~nxi" (
			ren "mod\games\%proj%\data\%%~nxi"	"[mod]%%~nxi"
		)
	)
	move "mod\games\%proj%\data\*.*" data
)

ren "mod\sorr.txt" "%Choosed_Mod%.txt"
set installed_mod=%Choosed_Mod%

exit /b
::::::::::::::::::::::::::::::: FUNCTIONS :::::::::::::::::::::::::::::::

:warning
:: Undo changes to fpg files.
for %%G IN (
	adam
	ash_char
	axel
	beta_max
	bk3_axel
	blaze
	electra_char
	max
	mry	
	roo_char
	skate
	sor1_axel
	sor1_blaze
	sor2_blaze
	sor2_shiva
	sor2_skate
	sor3_shiva
	zan
) do (
	if exist "mod\games\%proj%\data\[mod]%%G.fpg" (
		ren "mod\games\%proj%\data\[mod]%%G.fpg" "%%G.fpg"
	)
	if exist "mod\games\%proj%\data\[mod]f_%%G.fpg" (
		ren "mod\games\%proj%\data\[mod]f_%%G.fpg" "f_%%G.fpg"
	)
)

:: ------------ Print the warning ------------------------------------
cls
mode con: cols=70 lines=12
echo.

if "%idioma%" == "PORTUGUES" (
	echo Para usar as paletas de players do MOD desative todos os chars.
	echo Caso queira usar chars e recusar as paletas do MOD va nas
	echo configuracoes e desative a opcao 2.
	echo.
	%CECHO% {1E}[D]{1F} Desativar todos os chars{\n}{1E}[V]{1F} Sair{\n}
) else (
	if "%idioma%" == "ESPANOL" (
		echo Para usar las paletas de players del MOD, deshabilite todos los chars.
		echo Si desea utilizar chars y rechazar las paletas del MOD, vaya a la
		echo configuracion y desactive la opcion 2.
		echo.
		%CECHO% {1E}[D]{1F} Deshabilitar todos los chars{\n}{1E}[V]{1F} Salie{\n}
	) else (
		echo To use the MOD player palettes, disable all chars.
		echo If you want to use chars and refuse the MOD palettes go to the
 		echo settings and disable option 2.
		echo.
		%CECHO% {1E}[D]{1F} Disable all chars{\n}{1E}[V]{1F} Exit{\n}
	)
)
echo.
echo.
set /p opcao=%t_opcao%

if "%opcao%" == "D" goto ativar
if "%opcao%" == "d" goto ativar
exit

:ativar
:: Disable all chars and return to pal section.
call scripts\chars_off.bat
goto pal

:pal_apply
:: Use the mod's character palettes
if exist "mod\games\%proj%\palettes\chars\*.pal" (
	if %ativos% geq 1 (goto warning) else (
		ren palettes\chars sorr_chars
		move "mod\games\%proj%\palettes\chars"	palettes
	)
)
goto:eof