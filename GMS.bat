@echo off
:: ---- Program colors ----
color 1f

:: -- identify if the system is 32bit or 64bit ---
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT

if %OS%==64BIT (set CECHO=scripts\cecho64) else (
	set CECHO=scripts\cecho32
)

set reset=goto inicio

:: ------ PROGRAM VERSION -----------------
set day=24
set month=08
set year=2021

:: ---- Reading GMS configuration ---------
:inicio
set "idioma="
if not exist "scripts\config.bat" (call:Missing_File "scripts\config.bat")
call scripts\config.bat

:: ------ Needed folders ------------------
for %%G in (
	data
	"mod\chars"
	"mod\themes"
	"mod\games"
) do IF NOT EXIST "%%G" (mkdir %%G)

for %%G in (
	"palettes/chars"
	"palettes/backup_chars"
	"palettes/enemies"
	"palettes/backup_enemies"
) do if not exist "%%G" (call:Missing_Folder %%G)

:: ------ Needed files ---------------------
if not exist "SorR.exe" (call:Missing_File SorR.exe)

for %%B in (
	chars
	chars_off
	chars_univ
	config
	config1
	config2
	download
	install
	music
	opchars
	pausa
	print_chars
	scan_bgms
	scan_chars
	scan_mods
	scan_themes
	sorr_music
	themes
	traducao
	uninstall
) do (
	IF NOT EXIST "scripts\%%B.bat" (call:Missing_File %%B)
)

:: ----------- Applying language settings -------------
if "%idioma%" == "PORTUGUES" (
	title Gerenciador de MODs de SORR
	set "mod=echo MOD instalado:"
	set "exec=%CECHO% {1E}[1]{1F} Jogar{\n}{1E}[2]{1F} Desinstalar{\n}"
	set "tchar=%CECHO% {1E}[C]{1F} Secao de Chars{\n}"
	set "opmenu=Opcoes disponiveis:"
	set "t_opcao=Digite a opcao desejada:"
	set "t_music1=Lista de musicas reusadas"
	set "t_music2=%CECHO% {1E}Musicas do SORR reusadas:{1F}{\n}"
	set "t_music3=%CECHO% {1E}Musicas do mods reusadas:{1F}{\n}"
	set "t_credit=Informacao sobre o mod"
) else (
	if "%idioma%" == "ENGLISH" (
		title SORR MOD Manager
		set "mod=echo Installed MOD:"
		set "exec=%CECHO% {1E}[1]{1F} Play{\n}{1E}[2]{1F} Uninstall{\n}"
		set "tchar=%CECHO% {1E}[C]{1F} Chars section{\n}"
		set "opmenu=Available options:"
		set "t_opcao=Type the desired option:"
		set "t_music1=List of reused songs"
		set "t_music2=%CECHO% {1E}Reused SORR songs:{1F}{\n}"
		set "t_music3=%CECHO% {1E}Reused mods songs:{1F}{\n}"
		set "t_credit=Information about the mod"
	) else (
		if "%idioma%" == "ESPANOL" (
			title Gerente de MODs de SORR
			set "mod=echo MOD instalado:"
			set "exec=%CECHO% {1E}[1]{1F} Jugar{\n}{1E}[2]{1F} Desinstalar{\n}"
			set "tchar=%CECHO% {1E}[C]{1F} Seccion de Chars{\n}"
			set "opmenu=Opciones disponibles:"
			set "t_opcao=Escribe la opcion desejada:"
			set "t_music1=Lista de musicas reutilizadas"
			set "t_music2=%CECHO% {1E}Musicas do SORR reutilizadas:{1F}{\n}"
			set "t_music3=%CECHO% {1E}Musicas de mods reutilizadas:{1F}{\n}"
			set "t_credit=Informacion del mod"
		)
	)
)

cls
echo.

:: --- Search for mods ---------------------------
call scripts\scan_mods.bat

set /A arqnum=0
if not "%installed_mod%" == "NONE" call:Select_Mod %installed_mod%

:: ------- There is no level mod installed (SorR default) --------
echo. 2>mod\sorr.txt

:: ------- Set window size --------
IF "%opA%" == "OFF" (
	IF "%opE%" == "ON" (
		set /A altura=%total%+10
	) else (
		set /A altura=%total%+8
	)
) else (
	set /A altura=%quant%+10
)
mode con: cols=42 lines=%altura%

:: ------ List of all mod names to print ----------------------
set /A mod_number=0
cls
echo %opmenu%
echo.
%CECHO% {1E}[0]{1F}  SORR{\n}
:: WARNING: The order below needs to follow the same defined in the scan_mods script!

::			 File 		Name to print
call:printar ADDRAGE	"Additional Rage v1.1"
call:printar BFR		"Battle for Rio"
call:printar BFR2		"Battle for Rio 2"
call:printar BRUTAL		"Brutal Justice v1.0"
call:printar BURN		"Burning Fight Prototype v1.2"
call:printar DOA		"DOA - Dead on Arrival"
call:printar DD3		"Double Dragon 3 - The Rosetta Stone"
call:printar HUNTER		"H.U.N.T.E.R MotY"
call:printar HUNTERD	"H.U.N.T.E.R - DC Infiltrators"
call:printar HUNTERG	"H.U.N.T.E.R - Nightsweeper v1.4"
call:printar KBASH		"Knuckle Bash Remake"
call:printar NBDOWN		"Never Back Down"
call:printar NSLASH		"Night Slashers"
call:printar BDRAG		"Rage Rise of The Black Dragon"
call:printar METRO		"Rescue Metro City"
call:printar R2029		"Rudra 2029 Pilot"
call:printar RUSH		"Rushing Beat Remake FE v2.1"
call:printar SOR1		"SoR1 Collection for V5 Vecta"
call:printar SOR2		"SoR2 Collection for V5 U"
call:printar SOR3		"SoR3 Ultimate Mod for V5"
call:printar SOR3A		"SoR3 Adam's History Extended"
call:printar SORIS		"SoR Ice/Silver"
call:printar SOR2FG		"SoR2 Flame/Gold"
call:printar SF2		"Street Fighter II"
call:printar GOTHAM		"Streets of Gotham"
call:printar SORV		"Streets of Rage V - demo 2017"
call:printar URBANR		"Urban Reign"
call:printar VENDETA	"Vendetta Dead End City Stories v1.0"
call:printar WAYW		"Way of the Warrior"

:: ------- Mods with no palettes --------------------------
IF "%opE%" == "ON" (
	call:printar V4			"V4 Remake v1.4"
	call:printar V4RUDRA	"SoRR v4 Bonus - Rudra's Story"
)

:: ---------- Print the options ------------------------------
echo.
if "%idioma%" == "PORTUGUES" (
	%CECHO% {1E}[C]{1F} Chars                 {1E}[O]{1F} Opcoes{\n}{1E}[T]{1F} Pacotes de temas      {1E}[I]{1F} Sobre o GMS{\n}{1E}[D]{1F} Download de MODs      {1E}[S]{1F} Sair{\n}
) else (
	if "%idioma%" == "ESPANOL" (
		%CECHO% {1E}[C]{1F} Chars                  {1E}[O]{1F} Opciones{\n}{1E}[T]{1F} Paquetes tematicos     {1E}[I]{1F} Acerca GMS{\n}{1E}[D]{1F} Descargar MODs         {1E}[S]{1F} Sair{\n}
	) else (
		%CECHO% {1E}[C]{1F} Chars               {1E}[O]{1F} Options{\n}{1E}[T]{1F} Themes packs        {1E}[I]{1F} About GMS{\n}{1E}[D]{1F} Download MODs       {1E}[S]{1F} Exit{\n}
	)
)
echo.

set /p opcao=%t_opcao%

if %opcao% equ 0 (
	start SorR.exe
	exit
)

:: The mod will be choosen if its position in the order is equal to the number typed by the user.
set /A count=0
for %%G in (%mod_order:~2%) do (
	call:Counter %%G
)

if "%opcao%" == "d" goto download
if "%opcao%" == "D" goto download
if "%opcao%" == "o" goto CONFIG
if "%opcao%" == "O" goto CONFIG
if "%opcao%" == "i" goto sobre
if "%opcao%" == "I" goto sobre
if "%opcao%" == "s" exit
if "%opcao%" == "S" exit
if "%opcao%" == "t" goto themes
if "%opcao%" == "T" goto themes
call scripts\opchars.bat
goto inicio

:: --------- OTHERS ------------------------
:download
call scripts\download.bat
%reset%

:themes
call scripts\themes.bat
%reset%

:CONFIG
mode con: cols=78 lines=32
call scripts\config.bat
call scripts\config1.bat
echo.

set /p opcao=%t_opcao%

if %opcao% equ 0 goto opcao0
if %opcao% equ 1 call:func_op %opA% A 1
if %opcao% equ 2 call:func_op %opB% B 1
if %opcao% equ 3 call:func_op %opC% C 1
if %opcao% equ 4 call:func_op %opD% D 1
if %opcao% equ 5 goto CONFIG2
goto inicio

:opcao0
IF "%idioma%" == "ENGLISH"	ren scripts\EN.txt PT.txt
IF "%idioma%" == "PORTUGUES" ren scripts\PT.txt ES.txt
IF "%idioma%" == "ESPANOL"	ren scripts\ES.txt EN.txt
goto CONFIG

:: ----------------------------------------

:CONFIG2
call scripts\config.bat
call scripts\config2.bat
echo.

set /p opcao=%t_opcao%
if %opcao% equ 5 call:func_op %opE% E 2
if %opcao% equ 6 call:func_op %opF% F 2
if %opcao% equ 7 call:func_op %opG% G 2
if %opcao% equ 8 goto opcaoH
if "%opcao%" == "v" goto CONFIG
if "%opcao%" == "V" goto CONFIG
if "%opcao%" == "d" goto desativar_tudo
if "%opcao%" == "D" goto desativar_tudo
goto inicio

:opcaoH
call scripts\scan_bgms.bat
goto CONFIG2

:desativar_tudo
for %%G in (A B C D E F G) do (
	IF EXIST "scripts\%%G1.txt" ren "scripts\%%G1.txt" "%%G0.txt"
)
goto CONFIG2

:func_op
IF "%~1" == "OFF" ren scripts\%~20.txt %~21.txt
IF "%~1" == "ON" ren scripts\%~21.txt %~20.txt
IF "%~3" == "1" (goto CONFIG) else (goto CONFIG2)

:: ------------------------- ABOUT ---------------------------------
:sobre
mode con: cols=78 lines=24
cls
echo.
call scripts\info.bat
echo.
set /p opcao=%t_opcao%

if %opcao% equ 1 (
	start http://www.deviantart.com/daniel2221
	goto sobre
)

if %opcao% equ 2 (
	start https://www.youtube.com/channel/UCvWEo-Qj_iOsRTsz4KqP_lA/
	goto sobre
)

if %opcao% equ 3 (
	start https://twitter.com/Daniel222114
	goto sobre
)

if "%opcao%" == "g" goto baixar_gms
if "%opcao%" == "G" goto baixar_gms

goto inicio

:baixar_gms
start https://sorr.forumotion.net/t755-utility-gms-sorr-mod-manager
goto sobre

::::::::::::::: FUNCTIONS ::::::::::::::::::

:printar
:: ---- Set the mod's option number ------
set /A encontrado=0
for %%U in (%mods_desativados%) do (
	if "%~1" == "%%U" (set /A encontrado=1)
)
if %encontrado% equ 1 (set /A mod_number+=1)

:: ---- Print missing mods -------------
if "%opA%" == "OFF" (
	for %%B in (%mods_ausentes:~2%) do (
		if "%~1" == "%%B" (
			%CECHO% {1E} - {18}  %~2{\n}
			goto:eof
		)
	)
)

:: ---- Print found mods --------------
for %%C in (%mods_desativados:~2%) do (
	if "%~1" == "%%C" (
		if %mod_number% leq 9 (
			%CECHO% {1E}[%mod_number%]{1F}  %~2{\n}
			goto:eof
		) else (
			%CECHO% {1E}[%mod_number%]{1F} %~2{\n}
			goto:eof
		)
	)
)
goto:eof

:Counter
set /A count+=1
if %opcao% equ %count% (call:Select_Mod %~1)
goto:eof

:Select_Mod
set Choosed_Mod=%~1
call scripts\mods\%~1.bat
goto inicio

:Missing_File
cls
echo.
if "%idioma%" == "PORTUGUES" (
	echo ERRO: Nao foi encontrado o arquivo %~1
	echo       O programa precisa dele para funcionar.
) else (
	if "%idioma%" == "ESPANOL" (
		echo ERROR: No se encontro el archivo %~1
		echo        El programa lo necesita para funcionar.
	) else (
		echo ERROR: The file %~1 was not found
		echo        The program needs it to work.
	)
)
echo.
call scripts\pausa.bat
exit

:Missing_Folder
cls
echo.
if "%idioma%" == "PORTUGUES" (
	echo ERRO: Nao foi encontrado o diretorio %~1
	echo       O programa precisa dele para funcionar.
) else (
	if "%idioma%" == "ESPANOL" (
		echo ERROR: No se encontro lo directorio %~1
		echo        El programa lo necesita para funcionar.
	) else (
		echo ERROR: The directory %~1 was not found
		echo        The program needs it to work.
	)
)
echo.
call scripts\pausa.bat
exit