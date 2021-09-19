IF EXIST "data\ptbr.txt" (set trad=ptbr) ELSE (set trad=---)

if %~1 equ 1 goto on_off
if %~1 equ 2 goto escrever
exit /b

:on_off
IF NOT "%trad%" == "---" (
	move data\cutscenesa.fpg	"mod\ptbr.fpg"
	move data\ptbr.txt			"mod\games\%proj%"
	exit /b
)
IF EXIST "mod\games\%proj%\script\ptbr.fpg" (
	set trad=ptbr
	echo. 2>data\ptbr.txt
	IF EXIST "mod\ptbr.fpg" (
		IF NOT EXIST "DELETAR" (
			mkdir DELETAR
			move "mod\games\%proj%\script\ptbr.fpg" DELETAR
			move mod\ptbr.fpg data\cutscenesa.fpg
		) else (
			move "mod\games\%proj%\script\ptbr.fpg" DELETAR
			move mod\ptbr.fpg data\cutscenesa.fpg
		)
	) else (
		move "mod\games\%proj%\script\ptbr.fpg" "data\cutscenesa.fpg"
	)
) else (
	IF EXIST "mod\ptbr.fpg" (
		set trad=ptbr
		move mod\ptbr.fpg data\cutscenesa.fpg
		IF EXIST "mod\games\%proj%\ptbr.txt" (
			move "mod\games\%proj%\ptbr.txt" data
		) else (
			echo. 2>data\ptbr.txt
		)
	)
)
exit /b

:escrever
echo.
if "%trad%" == "ptbr" (
	if "%idioma%" == "PORTUGUES" (
		%CECHO% {1F}Traducao do mod: {1E}Portugues {1A}Brasileiro
	) else (
		if "%idioma%" == "ESPANOL" (
			%CECHO% {1F}Traduccion de mod: {1E}Portugues {1A}Brasileno
		) else (
			%CECHO% {1F}Mod translate: {1E}Brazilian {1A}Portuguese
		)
	)
) else (
	if "%idioma%" == "PORTUGUES" (
		%CECHO% {1F}Traducao do mod: {18}Nenhuma
	) else (
		if "%idioma%" == "ESPANOL" (
			%CECHO% {1F}Traduccion de mod: {18}Ninguna
		) else (
			%CECHO% {1F}Mod translate: {18}None
		)
	)
)
echo.