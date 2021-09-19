mode con: cols=40 lines=14
:inicio
cls
echo.
echo DOWNLOADS
echo.
echo.
if "%idioma%" == "PORTUGUES" (
	%CECHO% {1E}[1]{1F} Mods de fases 1{\n}{1E}[2]{1F} Mods de fases 2{\n}{1E}[3]{1F} Chars{\n}{1E}[4]{1F} Pacotes de temas{\n}{1E}[5]{1F} Traducoes de mods{\n}{\n}{1E}[V]{1F} Voltar{\n}
) else (
	if "%idioma%" == "ENGLISH" (
		%CECHO% {1E}[1]{1F} Levels mods 1{\n}{1E}[2]{1F} Levels mods 2{\n}{1E}[3]{1F} Chars{\n}{1E}[4]{1F} Themes packs{\n}{1E}[5]{1F} Mods translations{\n}{\n}{1E}[V]{1F} Return{\n}
	) else (
		%CECHO% {1E}[1]{1F} Mods de stages 1{\n}{1E}[2]{1F} Mods de stages 2{\n}{1E}[3]{1F} Chars{\n}{1E}[4]{1F} Paquetes tematicos{\n}{1E}[5]{1F} Traducciones de mods{\n}{\n}{1E}[V]{1F} Volver{\n}
	)
)
echo.

set /p opcao=%t_opcao%

if %opcao% equ 1 (
	start https://drive.google.com/folderview?id=19jzn3LEN2apTbjf4nogApUN0o9qHCaJn
	%reset%
)
if %opcao% equ 2 (
	start https://drive.google.com/drive/folders/1Ow2v27RJxT_iSZYVwyUpf1d_AOcc7Yx0
	%reset%
)
if %opcao% equ 3 (
	start https://drive.google.com/drive/folders/1g7hv-NlSbdW26NRR-OvfZN0S6exLrreG
	%reset%
)
if %opcao% equ 4 (
	start https://drive.google.com/drive/folders/1DfBJYW-ef5TQLxQN205iTEGHQJbrSqV6
	%reset%
)
if %opcao% equ 5 (
	start https://drive.google.com/drive/folders/1aqt1NWZSpevHygZ_7l-ieMzB7pe2IaqD?usp=sharing
	%reset%
)
exit /b