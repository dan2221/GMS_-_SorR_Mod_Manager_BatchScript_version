cls
if "%idioma%" == "PORTUGUES" (goto PT) else (
	if "%idioma%" == "ESPANOL" (goto ES) else (
		goto EN
	)
)

:PT
set t_opcao=Digite a opcao desejada:
title Gerenciador de MODs de SORR
echo.
echo CONFIGURACOES DO PROGRAMA
echo.
%CECHO% {1E}[0]{1F} Idioma: {1E}%idioma%{\n}
echo.
if "%opA%" == "ON"	(
	%CECHO% {1E}[1]{1F} Ocultar MODs e CHARs indisponiveis: {1A}ON) else (
	%CECHO% {1E}[1]{1F} Ocultar MODs e CHARs indisponiveis: {1C}OFF)
echo.
echo.

if "%opB%" == "ON"	(
	%CECHO% {1E}[2]{1F} Usar paletas de players dos proprios mods: {1A}ON) else (
	%CECHO% {1E}[2]{1F} Usar paletas de players dos proprios mods: {1C}OFF)
%CECHO% {\n}{17}
echo     Obs: Se a opcao estiver ativada voce nao podera usar chars nos MODs que
echo     tenham paletas proprias para players.
echo.

if "%opC%" == "ON"	(
	%CECHO% {1E}[3]{1F} Reaproveitar musicas do SORR:       {1A}ON) else (
	%CECHO% {1E}[3]{1F} Reaproveitar musicas do SORR:       {1C}OFF)
%CECHO% {\n}{17}
echo     Os mods que contenham musicas do SORR terao as mesmas substituidas pelas
echo     musicas do diretorio "mod\music". Assim nao existirao copias de arquivos
echo     que voce ja possua, liberando espaco. Os arquivos anteriores serao movi-
echo     dos para a pasta "DELETAR", exclua ela depois.
echo.

if "%opD%" == "ON"	(
	%CECHO% {1E}[4]{1F} Reproveitar musicas dos mods:       {1A}ON) else (
	%CECHO% {1E}[4]{1F} Reproveitar musicas dos mods:       {1C}OFF)
%CECHO% {\n}{17}
echo     Funciona como a opcao anterior, porem usa arquivos dos mods. Apos ativar
echo     essa opcao e instalar um mod, as musicas que ele tem em comum com outros
echo     mods serao movidas para o diretorio "mod\music". As musicas serao utili-
echo     zadas nos respectivos mods quando forem instalados.
echo.

%CECHO% {1E}[5]{1F} Mais Opcoes {\n}
echo.
echo Obs: Apos instalar um mod com as opcoes 3 ou 4 ativadas as alteracoes
echo nos arquivos nao poderao ser desfeitas pelo programa.
echo.
%CECHO% {1E}[V]{1F} Voltar {\n}

exit /B

rem =========================  INGLES ===================================
:EN
set t_opcao=Type the desired option:
title SORR MOD Manager
echo.
echo PROGRAM SETTINGS
echo.
%CECHO% {1E}[0]{1F} Language: {1E}%idioma%{\n}
echo.
if "%opA%" == "ON"	(
	%CECHO% {1E}[1]{1F} Hide unavailable mods and chars: {1A}ON) else (
	%CECHO% {1E}[1]{1F} Hide unavailable mods and chars: {1C}OFF)
echo.
echo.

if "%opB%" == "ON"	(
	%CECHO% {1E}[2]{1F} Use mod's own player palettes:   {1A}ON) else (
	%CECHO% {1E}[2]{1F} Use mod's own player palettes:   {1C}OFF)
%CECHO% {\n}{17}
echo     Note: If the option is enabled you will not be able to use chars in mods
echo     that have their own palettes for players.
echo.

if "%opC%" == "ON"	(
	%CECHO% {1E}[3]{1F} Reuse SORR music files:          {1A}ON) else (
	%CECHO% {1E}[3]{1F} Reuse SORR music files:          {1C}OFF)
%CECHO% {\n}{17}
echo     Mods containing SORR songs will be replaced by songs from the mod\music
echo     directory. So there will be no copies of files you already own, freeing
echo     up space. Previous files will be moved to the "DELETAR" folder, delete
echo     it later.
echo.

if "%opD%" == "ON"	(
	%CECHO% {1E}[4]{1F} Reuse musics from mods:          {1A}ON) else (
	%CECHO% {1E}[4]{1F} Reuse musics from mods:          {1C}OFF)
%CECHO% {\n}{17}
echo     It works like the previous option, but uses files from the mods. After
echo     activating this option and installing a mod, the songs he has in common
echo     with other mods will be moved to the "mod\music" directory. The songs
echo     will be used in the respective mods when they are installed.
echo.

%CECHO% {1E}[5]{1F} More options {\n}
echo.
echo Note: After installing a mod with options 3 or 4 enabled, changes to the
echo files cannot be undone by the program.
echo.
%CECHO% {1E}[V]{1F} Return {\n}

exit /B


rem =========================  ESPANOL ===================================
:ES
set t_opcao=Escribe la opcion desejada:
title Gerente de MODs de SORR
echo.
echo AJUSTES DEL PROGRAMA
echo.
%CECHO% {1E}[0]{1F} Idioma: {1E}%idioma%{\n}
echo.
if "%opA%" == "ON"	(
	%CECHO% {1E}[1]{1F} Ocultar MODs y CHARs no disponibles: {1A}ON) else (
	%CECHO% {1E}[1]{1F} Ocultar MODs y CHARs no disponibles: {1C}OFF)
echo.
echo.

if "%opB%" == "ON"	(
	%CECHO% {1E}[2]{1F} Usar paletas de players de los mods: {1A}ON) else (
	%CECHO% {1E}[2]{1F} Usar paletas de players de los mods: {1C}OFF)
%CECHO% {\n}{17}
echo     Nota: Si la opcion esta habilitada, no podras usar chars en MODs que
echo     tengan sus propias paletas para players.
echo.

if "%opC%" == "ON"	(
	%CECHO% {1E}[3]{1F} Reutilizar musicas de SORR:          {1A}ON) else (
	%CECHO% {1E}[3]{1F} Reutilizar musicas de SORR:          {1C}OFF)
%CECHO% {\n}{17}
echo     Las modificaciones que contengan musicas del SORR seran reemplazadas por
echo     musicas del directorio "mod\music". Por lo tanto, no habra copias de los
echo     archivos que ya posee, liberando espacio. Los archivos anteriores se mo-
echo     veran a la carpeta "DELETAR", borralo mas tarde.
echo.

if "%opD%" == "ON"	(
	%CECHO% {1E}[4]{1F} Reutilizar musicas de los mods:      {1A}ON) else (
	%CECHO% {1E}[4]{1F} Reutilizar musicas de los mods:      {1C}OFF)
%CECHO% {\n}{17}
echo     Funciona como la opcion anterior, pero usa archivos de los mods. Despues
echo     de activar esta opcion e instalar un mod, las musicas que tiene en comun
echo     con otros mods se moveran al directorio "mod\music". Las musicas se uti-
echo     lizaran en los mods respectivos cuando se instalen.
echo.

%CECHO% {1E}[5]{1F} Mas Opciones {\n}
echo.
echo Nota: Despues de instalar un mod con las opciones 3 o 4 habilitadas, el
echo programa no puede deshacer los cambios en los archivos.
echo.
%CECHO% {1E}[V]{1F} Volver {\n}