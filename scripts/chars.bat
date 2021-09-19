:scanc
set /A first_order=0
set /A second_order=0
set /A mod_number=0
set "other_char="
cls
:: --- Search for chars --------------
call scripts\scan_chars.bat

:: --- Set window size --------------
IF "%opA%" == "OFF" (
	set /A altura=%total%+13
	set /A loops=%total%
) else (
	set /A altura=%quant%+13
	set /A loops=%quant%
)

if "%idioma%" == "PORTUGUES" (
	set /A largura=46
) else (
	if "%idioma%" == "ESPANOL" (
		set /A largura=53
	) else (
		set /A largura=49
	)
)
mode con: cols=%largura% lines=%altura%

:: ------ First text ----------------------
cls
if "%idioma%" == "PORTUGUES" (
	echo.SECAO DE CHARS
	echo.
	echo Ative ou desative chars digitando os numeros:
) else (
	if "%idioma%" == "ESPANOL" (
		echo.SECCION DE CHARS
		echo.
		echo Habilite o deshabilite chars ingresando los numeros:
	) else (
		echo.CHARS SECTION
		echo.
		echo Enable or disable chars by entering the numbers:
	)
)
echo.
:: ------ List of all char names to print ----------------------

:: WARNING: The order below needs to follow the same defined in the scan_chars script!

::		   File		Name to print
call:print BLAZEM	"Blaze BK Mobile "
call:print AXELM	"Axel BK Mobile  "
call:print CAXEL1	"Axel Classic    "
call:print VEGETA	"Vegeta          "
call:print GEESE	"Geese           "
call:print SSHIVA	"Super Shiva     "
call:print ABADEDE	"Abadede         "
call:print YAMATO	"Yamato          "
call:print MAZ		"Maz             "
call:print CHUNLI	"Chun-Li         "

%CECHO% {1F}{\n}
if "%idioma%" == "PORTUGUES" (echo Patches de hurt/hitbox, cores ou sprites:) else (
	if "%idioma%" == "ESPANOL" (echo Patches de hurt/hitbox, colores o sprites:) else (
		echo Patches in hurt/hitboxes, colors or sprites:
	)
)
echo.
:: Patches
call:print AXEL1	"Axel SOR1       "
call:print AXEL3	"Axel SOR3       "
call:print AXELB3	"Axel BK3        "
call:print BLAZE1 	"Blaze SOR1      "
call:print BLAZE3 	"Blaze SOR3      "
call:print ADAM 	"Adam            "
call:print MAX		"Max             "
call:print SKATE2 	"Skate SOR2      "
call:print SKATE3 	"Skate SOR3      "
call:print SAMMY3 	"Sammy BK3       "
call:print ZAN 		"Zan             "
call:print SHIVA2F	"Shiva 2 C.flames"
call:print SHIVA2 	"Shiva 2 R.flames"
call:print SHIVA3 	"Shiva SOR3      "
call:print ROO 		"Roo             "
call:print ASH 		"Ash             "
call:print ELECTRA 	"Electra         "

:: ---------- Print options ------------------------------
echo.
if "%idioma%" == "PORTUGUES" (
	%CECHO% {1E}[D]{1F} Desativar todos    {1E}[V]{1F} Voltar{\n}{1E}[J]{1F} Jogar              {1E}[S]{1F} Sair{\n}
) else (
	if "%idioma%" == "ESPANOL" (
		%CECHO% {1E}[D]{1F} Deshabilitar todos	 {1E}[V]{1F} Volver{\n}{1E}[J]{1F} Jugar                {1E}[S]{1F} Salir{\n}
	) else (
		%CECHO% {1E}[D]{1F} Disable all    {1E}[V]{1F} Return{\n}{1E}[J]{1F} Play           {1E}[S]{1F} Exit{\n}
	)
)

echo.
set /p opcao=%t_opcao%

if "%opcao%" == "j" (start SorR.exe
			exit)
if "%opcao%" == "J" (start SorR.exe
			exit)
if "%opcao%" == "d" goto off_all
if "%opcao%" == "D" goto off_all
if "%opcao%" == "v" exit /b
if "%opcao%" == "V" exit /b
if "%opcao%" == "s" exit
if "%opcao%" == "S" exit

:: The char will be choosen if its position in the order is equal to the number typed by the user.
set /A count=0
for %%G in (%char_order:~2%) do (
	call:Counter %%G
)

if not "%opcao%" == "v" (
	if not "%opcao%" == "V" (
		goto scanc
	)
)

exit /b

:off_all
call scripts/chars_off.bat
goto scanc

::::::::::::::::::::::::: FUNCTIONS ::::::::::::::::::::::::::::::
:print
:: ---- Set the char's option number ------
set /A encontrado=0
for %%U in (%chars_ausentes%) do (
	if "%~1" == "%%U" (set /A encontrado=1)
)
if %encontrado% equ 0 (set /A mod_number+=1)

:: ---- Print disabled chars --------------
for %%D in (%chars_desativados%) do (
	if "%~1" == "%%D" (
		if %mod_number% leq 9 (
			%CECHO% {1E}[%mod_number%]{1F}  %~2 {1C}OFF{\n}
			goto:eof
		) else (
			%CECHO% {1E}[%mod_number%]{1F} %~2 {1C}OFF{\n}
			goto:eof
		)
	)
)

:: ---- Print enabled chars --------------
for %%A in (%chars_ativados%) do (
	if "%~1" == "%%A" (
		if %mod_number% leq 9 (
			%CECHO% {1E}[%mod_number%]{1F}  %~2 {1A}ON{\n}
			goto:eof
		) else (
			%CECHO% {1E}[%mod_number%]{1F} %~2 {1A}ON{\n}
			goto:eof
		)
	)
)

:: ---- Print missing chars -------------
if "%opA%" == "OFF" (
	for %%B in (%chars_ausentes%) do (
		if "%~1" == "%%B" (
			%CECHO% {1E} -  {18} %~2 {1E}---{\n}
			goto:eof
		)
	)
)
goto:eof

:Counter
set /A count+=1
if %opcao% equ %count% (
	call scripts\chars\%~1.bat
	call:execucao %~1
)
goto:eof

:execucao
set char_to_install=%~1
set other_char=%~1

for %%S in (%chars_ativados:~2%) do (
	if not "%%S" == "%~1" (
		:: The Selected char is disabled.
		:: Now checking if exist an installed char with the same FPG name.
		for %%F in (%fpg_order:~2%) do (
			call:get_order1
			if "%%F" == "%Char_Fpg%" (
				for %%O in (%char_order:~2%) do (
					call:get_order2 %%O
				)
			)
		)
	)
)

set Char_Var=%char_to_install%
call scripts\chars\%char_to_install%.bat
call scripts\chars_univ.bat
goto:eof

:get_order1
set /A first_order+=1
goto:eof

:get_order2
set /A second_order+=1
set other_char=%~1
if %first_order% equ %second_order% (
	if not "%char_to_install%" == "%other_char%" (
		set Char_Var=%~1
		call scripts\chars\%~1.bat
		call scripts\chars_univ.bat
		set /A first_order=100
	)
)
goto:eof