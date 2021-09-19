:verificar
if exist "mod\games\SoR Silver\script\[ice]stage1a.ogg" (
	if not exist "mod\games\SoR Silver\Files Silver\*.ogg" (
		set "proj=SoR Silver"
	) else (
		goto erro
	)
) else (
	if exist "mod\games\SoR Ice\script\[silver]stage1a.ogg" (
		if not exist "mod\games\SoR Ice\Files Ice\*.ogg" (
			set "proj=SoR Ice"
		) else (
			goto erro
		)
	)
)

if "%installed_mod%" == "%Choosed_Mod%" goto inicio

call scripts\install.bat
set SORIS=1

:inicio
if exist "mod\games\%proj%\End Credits.wmv" (set cred=1) else (set cred=0)
mode con: cols=38 lines=14
cls
%mod%
echo.
if "%proj%" == "SoR Silver" (
	%CECHO% {1F}S{17}o{1F}R {17}S{1F}i{17}l{1F}v{17}e{1F}r{\n}
) else (
	%CECHO% {1B}SoR Ice{\n}
)
echo.
echo.
%exec%
if "%idioma%" == "PORTUGUES" (
	%CECHO% {1E}[3]{1F} Trocar versao do mod{\n}
) else (
	if "%idioma%" == "ESPANOL" (
		%CECHO% {1E}[3]{1F} Cambiar la version del mod{\n}
	) else (
		%CECHO% {1E}[3]{1F} Change mod version{\n}
	)
)
if %cred% equ 1 (
	if "%idioma%" == "PORTUGUES" (
		%CECHO% {1E}[4]{1F} Creditos do mod{\n}
	) else (
		if "%idioma%" == "ESPANOL" (
			%CECHO% {1E}[4]{1F} Creditos del mod{\n}
		) else (
			%CECHO% {1E}[4]{1F} Mod credits{\n}
		)
	)
)
call scripts\print_chars.bat
echo.
set /p opcao=%t_opcao%

if %opcao% equ 1 (start SorR.exe
			exit)
if %opcao% equ 2 goto off
if %opcao% equ 3 (
	if "%proj%" == "SoR Silver" (
		call:Change Silver Ice
		goto verificar
	) else (
		call:Change Ice Silver
		goto verificar
	)
)
if %opcao% equ 4 (
	if %cred% equ 1 "mod\games\%proj%\End Credits.wmv"
)
call scripts\opchars.bat
goto inicio


:off
call scripts\uninstall.bat
exit /b

rem ---- Seções e Funções ----
:erro
mode con: cols=60 lines=12
cls
if "%idioma%" == "PORTUGUES" (
	%CECHO% {1F}Erro:{1F} Nao foram encontrados os arquivos necessarios{\n}para instalar o mod. Baixe ele novamente!{\n}
) else (
	if "%idioma%" == "ESPANOL" (
		%CECHO% {1F}Error:{1F} No se encontraron los archivos para instalar el mod. {\n}Descargalo de nuevo!{\n}
	) else (
		%CECHO% {1F}Error:{1F} The files needed to install the mod were not found. {\n}Download it again!{\n}
	)
)
echo.
call scripts\pausa.bat
exit /b

:Change
ren "mod\games\%proj%\script\stage1a.ogg" "[%~1]stage1a.ogg"
ren "mod\games\%proj%\script\[%~2]stage1a.ogg" "stage1a.ogg"
for %%G in (png ogg) do (
	move "mod\games\%proj%\*.%%G" "mod\games\%proj%\Files %~1"
)
move "mod\games\%proj%\Files %~2\*.*" "mod\games\%proj%"
ren "mod\games\SoR %~1" "SoR %~2"
goto:eof