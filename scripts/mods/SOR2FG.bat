:verificar
if exist "mod\games\SoR2 Gold\script\[Flame]stage1a.ogg" (
	if not exist "mod\games\SoR2 Gold\Files Gold\*.ogg" (
		set "proj=SoR2 Gold"
	) else (
		goto erro
	)
) else (
	if exist "mod\games\SoR2 Flame\script\[Gold]stage1a.ogg" (
		if not exist "mod\games\SoR2 Flame\Files Flame\*.ogg" (
			set "proj=SoR2 Flame"
		) else (
			goto erro
		)
	)
)

set Sdir="mod\games\%proj%\data"

if "%installed_mod%" == "%Choosed_Mod%" goto inicio


call scripts\install.bat
set SOR2FG=1

:inicio
mode con: cols=38 lines=13
cls
%mod%
echo.
if "%proj%" == "SoR2 Gold" (
	%CECHO% {1E}SoR2 Gold{\n}
) else (
	%CECHO% {1C}SoR2 Flame{\n}
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

call scripts\print_chars.bat
echo.
set /p opcao=%t_opcao%

if %opcao% equ 1 (start SorR.exe
			exit)
if %opcao% equ 2 goto off
if %opcao% equ 3 (
	if "%proj%" == "SoR2 Gold" (
		call:trocar Gold Flame
		goto verificar
	) else (
		call:trocar Flame Gold
		goto verificar
	)
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

:trocar
for %%G in (txt ogg) do (
	ren "mod\games\%proj%\script\stage1a.%%G" "[%~1]stage1a.%%G"
	ren "mod\games\%proj%\script\[%~2]stage1a.%%G" "stage1a.%%G"
)
for %%G in (png ogg) do (
	move "mod\games\%proj%\*.%%G" "mod\games\%proj%\Files %~1"
)
move "mod\games\%proj%\stage1b.fpg" "mod\games\%proj%\Files %~1"

move "mod\games\%proj%\Files %~2\*.*" "mod\games\%proj%"
ren "mod\games\SoR2 %~1" "SoR2 %~2"
goto:eof