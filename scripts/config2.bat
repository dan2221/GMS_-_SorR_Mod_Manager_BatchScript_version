cls
echo.
if "%idioma%" == "PORTUGUES" (goto PT) else (
	if "%idioma%" == "ESPANOL" (goto ES) else (
		goto EN
	)
)

:PT
echo CONFIGURACOES DO PROGRAMA
echo.
if "%opE%" == "ON"	(
	%CECHO% {1E}[5]{1F} Incluir mods sem paleta: {1A}ON) else (
	%CECHO% {1E}[5]{1F} Incluir mods sem paleta: {1C}OFF)
%CECHO% {\n}{17}
echo     Essa opcao adiciona os mods "V4 Remake v1.4" e "Rudra's Story" para a
echo     biblioteca, a instalacao deles se baseia nas duas opcoes anteriores.
echo.
if "%opF%" == "ON"	(
	%CECHO% {1E}[6]{1F} Nao usar imagens de menu dos proprios mods: {1A}ON) else (
	%CECHO% {1E}[6]{1F} Nao usar imagens de menu dos proprios mods: {1C}OFF)
echo.
echo.
if "%opG%" == "ON"	(
	%CECHO% {1E}[7]{1F} Usar chars dos proprios mods: {1A}ON) else (
	%CECHO% {1E}[7]{1F} Usar chars dos proprios mods: {1C}OFF)
echo.
echo.
%CECHO% {1E}[8]{1F} Verificar se as musicas aproveitadas estao sendo usadas.{\n}
echo.
%CECHO% {1E}[D]{1F} Desativar todas as opcoes.{\n}
echo.
echo.
echo Obs: Apos instalar um mod com a opcao 5 ativada as alteracoes
echo nos arquivos nao poderao ser desfeitas pelo programa.
echo.
%CECHO% {1E}[V]{1F} Voltar{\n}
exit /B

rem ===================== ESPANOL =============================
:ES
echo AJUSTES DEL PROGRAMA
echo.
if "%opE%" == "ON"	(
	%CECHO% {1E}[5]{1F} Incluir mods sin paleta: {1A}ON) else (
	%CECHO% {1E}[5]{1F} Incluir mods sin paleta: {1C}OFF)
%CECHO% {\n}{17}
echo     Esta opcion agrega los mods "V4 Remake v1.4" y "Rudra's Story" a la
echo     biblioteca, su instalacion se basa en las dos opciones anteriores.
echo.
if "%opF%" == "ON"	(
	%CECHO% {1E}[6]{1F} No usar imagenes de menu de los mods: {1A}ON) else (
	%CECHO% {1E}[6]{1F} No usar imagenes de menu de los mods: {1C}OFF)
echo.
echo.
if "%opG%" == "ON"	(
	%CECHO% {1E}[7]{1F} Usar chars de los proprios mods: {1A}ON) else (
	%CECHO% {1E}[7]{1F} Usar chars de los proprios mods: {1C}OFF)
echo.
echo.
%CECHO% {1E}[8]{1F} Compruebe si se esta utilizando las musicas reutilizadas.{\n}
echo.
%CECHO% {1E}[D]{1F} Deshabilitar todas las opciones.{\n}
echo.
echo.
echo Nota: Despues de instalar un mod con la opcion 5 habilitada, el
echo programa no puede deshacer los cambios en los archivos.
echo.
%CECHO% {1E}[V]{1F} Volver{\n}
exit /B

rem ======================== INGLES ================================
:EN
echo PROGRAM SETTINGS
echo.
if "%opE%" == "ON"	(
	%CECHO% {1E}[5]{1F} Include mods without palette: {1A}ON) else (
	%CECHO% {1E}[5]{1F} Include mods without palette: {1C}OFF)
%CECHO% {\n}{17}
echo     This option adds the mod's "V4 Remake v1.4" and "Rudra's Story" to the
echo     library, their installation is based on the two previous options.
echo.
if "%opF%" == "ON"	(
	%CECHO% {1E}[6]{1F} Do not use menu images of the mods themselves: {1A}ON) else (
	%CECHO% {1E}[6]{1F} Do not use menu images of the mods themselves: {1C}OFF)
echo.
echo.
if "%opG%" == "ON"	(
	%CECHO% {1E}[7]{1F} Use chars from the levels mods themselves: {1A}ON) else (
	%CECHO% {1E}[7]{1F} Use chars from the levels mods themselves: {1C}OFF)
echo.
echo.
%CECHO% {1E}[8]{1F} Check if the reused musics is being used.{\n}
echo.
%CECHO% {1E}[D]{1F} Disable all options.{\n}
echo.
echo.
echo Note: After installing a mod with option 5 enabled, changes
echo to the files cannot be undone by the program.
echo.
%CECHO% {1E}[V]{1F} Return{\n}