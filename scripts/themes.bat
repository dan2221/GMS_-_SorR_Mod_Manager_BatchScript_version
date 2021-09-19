:scan
call scripts\scan_themes.bat

IF %neon% equ 1 (
	set tema=Neon Park
	goto inicio
)
IF %gamb% equ 1 (
	set tema=El Gambito Custom Theme
	goto inicio
)
IF %bk3t% equ 1 (
	set tema=Bare knuckle III
	goto inicio
)
if "%idioma%" == "PORTUGUES" (
	set tema=Nenhum
) else (
	if "%idioma%" == "ESPANOL" (
		set tema=Ninguno
	) else (
		set tema=None
	)
)
rem -------- NENHUM TEMA INSTALADO -----------
:inicio
mode con: cols=55 lines=20

cls
echo.
if "%idioma%" == "PORTUGUES" (
	echo SECAO DE TEMAS
	echo.
	%CECHO% {1F}Tema instalado: {1E}%tema%{\n}{1F}
	echo.
	echo Escolha um tema disponivel digitando os numeros:
) else (
	if "%idioma%" == "ESPANOL" (
		echo SECCION DE TEMAS
		echo.
		%CECHO% {1F}Tema instalado: {1E}%tema%{\n}{1F}
		echo.
		echo Elige un tema disponible ingresando los numeros:
	) else (
		echo THEMES SECTION
		echo.
		%CECHO% {1F}Installed theme: {1E}%tema%{\n}{1F}
		echo.
		echo Choose an available theme by typing the numbers:
	)
)
echo.
echo.
call:printar %neon% "Neon Park      "
call:printar %gamb% "El Gambito     "
call:printar %bk3t% "Bare Knuckle 3 "
echo.
echo.
if "%idioma%" == "PORTUGUES" (
	%CECHO% {1E}[D]{1F} Usar tema padrao do SORR{\n}{1E}[J]{1F} Jogar{\n}{1E}[V]{1F} Voltar{\n}{1E}[S]{1F} Sair{\n}
) else (
	if "%idioma%" == "ESPANOL" (
		%CECHO% {1E}[D]{1F} Usa el tema predeterminado del SORR{\n}{1E}[J]{1F} Jugar{\n}{1E}[V]{1F} Volver{\n}{1E}[S]{1F} Salir{\n}
	) else (
		%CECHO% {1E}[D]{1F} Use SORR default theme{\n}{1E}[J]{1F} Play{\n}{1E}[V]{1F} Return{\n}{1E}[S]{1F} Exit{\n}
	)
)
echo.
set /p opcao=%t_opcao%

if %opcao% equ 1 goto neon
if %opcao% equ 2 goto gamb
if %opcao% equ 3 goto bk3
if "%opcao%" == "j" goto rodar
if "%opcao%" == "J" goto rodar
if "%opcao%" == "d" goto default
if "%opcao%" == "D" goto default
if "%opcao%" == "v" exit /b
if "%opcao%" == "V" exit /b
if "%opcao%" == "s" exit
if "%opcao%" == "S" exit
exit /b
goto inicio

rem ---------- Neon Theme -------------
:neon
IF %neon% geq 1 %reset%
IF %gamb% equ 1 goto gamb_to_neon
IF %bk3t% equ 1 goto bk3_to_neon

call:instalar "neon park"
goto scan

:gamb_to_neon
call:desinstalar "el gambito"
goto _neon

:bk3_to_neon
call:desinstalar "bare knuckle iii"
goto _neon

rem ------- El Gambito Custom Theme --------

:gamb
IF %gamb% geq 1 %reset%
IF %neon% equ 1 goto neon_to_gamb
IF %bk3t% equ 1 goto bk3_to_gamb

call:instalar "el gambito"
goto scan

:neon_to_gamb
call:desinstalar "neon park"
goto _gamb

:bk3_to_gamb
call:desinstalar "bare knuckle iii"
goto _gamb

rem ------- Bare Knuckle III --------

:bk3
IF %bk3t% geq 1 %reset%
IF %neon% equ 1 goto neon_to_bk3
IF %gamb% equ 1 goto gamb_to_bk3

call:instalar "bare knuckle iii"
goto scan

:neon_to_bk3
call:desinstalar "neon park"
goto _bk3

:gamb_to_bk3
call:desinstalar "el gambito"
goto _bk3

rem ============= OUTROS ==================

:default
IF %gamb% equ 1 goto gamb_off
IF %neon% equ 1 goto neon_off
IF %bk3t% equ 1 goto bk3_off
%reset%

:gamb_off
call:desinstalar "el gambito"
goto scan

:neon_off
call:desinstalar "neon park"
goto scan

:bk3_off
call:desinstalar "bare knuckle iii"
goto scan

:rodar
start SorR.exe
exit

rem --------------- funções -------------

:instalar
for %%G in (
	inicio
	scroll3
	scroll4
) do move "mod\themes\%~1\%%G.fpg"	data
move "mod\themes\%~1\%~1.txt"	data
call scripts\scan_themes.bat
goto:eof

:desinstalar
for %%G in (
	inicio
	scroll3
	scroll4
) do move "data\%%G.fpg" "mod\themes\%~1"
move "data\%~1.txt"	"mod\themes\%~1"
call scripts\scan_themes.bat
goto:eof

:printar
IF %~1 equ 0 (
	%CECHO% {1E}[1] {1F}%~2{\n}
) else (
	IF %~1 equ 2 (
		IF "%opA%" == "OFF" (
			%CECHO%  {1E}-  {18}%~2{\n}
		)
	)
)
goto:eof