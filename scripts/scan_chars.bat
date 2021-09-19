set /A quant=0
set /A ativos=0

:: -- Count the quantity of batch files in "scripts\chars" folder ----------------
for /f %%a in ('dir scripts\chars\*.bat /b /a-d ^|find /c /v ""') do set /A total=%%a

set "char_order="
set "chars_ausentes="
set "chars_desativados="
set "chars_ativados="
set "fpg_order="

:: Chars to be loaded
for %%P in (
	BLAZEM
	AXELM
	CAXEL1
	VEGETA
	GEESE
	SSHIVA
	ABADEDE
	YAMATO
	MAZ
	CHUNLI

	AXEL1
	AXEL3
	AXELB3
	BLAZE1
	BLAZE3
	ADAM
	MAX
	SKATE2
	SKATE3
	SAMMY3
	ZAN
	SHIVA2F
	SHIVA2
	SHIVA3
	ROO
	ASH
	ELECTRA
) do call:scan %%P

exit /b

:: =============== FUNCTIONS ============================
:scan
IF NOT EXIST "scripts\chars\%~1.bat" (goto:eof) else (
	call "scripts\chars\%~1.bat"
)

if "%palettes%" == "yes" (
	call:scan_pal %~1 %Char_Fpg% "%Char_Dir%"
) else (
	call:only_fpg %~1 %Char_Fpg% "%Char_Dir%"
)
goto:eof

:only_fpg
:: Needed files and folders
IF NOT EXIST "mod\chars\%~3" (
	call:List_Missing %~1
	goto:eof
)

IF EXIST "mod\chars\%~3\%~2.fpg" (
	IF EXIST "mod\chars\%~3\%~1.txt" (
		call:List_Disabled %~1
	) ELSE (
		echo. 2>"mod\chars\%~3\%~1.txt"
		call:List_Disabled %~1
	)
) ELSE (
	IF NOT EXIST "data\%~1.txt" (call:List_Missing %~1) ELSE (
		call:List_Enabled %~1 %~2
	)
)
goto:eof

:scan_pal
:: Needed files and folders
for %%N in (
	"mod\chars\%~3\palettes\chars"
	"mod\chars\%~3\palettes\backup_chars"
	"palettes\chars\%~21.pal"
	"palettes\backup_chars\%~21.pal"
) do (
	IF NOT EXIST "%%N" (
		call:List_Missing %~1
		goto:eof
	)
)
IF EXIST "mod\chars\%~3\%~2.fpg" (
	IF EXIST "mod\chars\%~3\%~1.txt" (
		for %%G in (chars backup_chars) do (
			if not exist "mod\chars\%~3\palettes\%%G\%~21.pal" (
				call:List_Missing %~1
				goto:eof
			)
		)
		call:List_Disabled %~1
	) ELSE (
		for %%G in (chars backup_chars) do (
			if not exist "mod\chars\%~3\palettes\%%G\%~21.pal" (
				call:List_Missing %~1
				goto:eof
			)
		)
		echo. 2>"mod\chars\%~3\%~1.txt"
		call:List_Disabled %~1
	)
) ELSE (
	for %%G in (
		"data\%~1.txt"
		"data\%~2.fpg"
		"palettes\chars\[SORR]%~21.pal"
	) do (
		if not exist "%%G" (
			call:List_Missing %~1
			goto:eof
		)
	)
	call:List_Enabled %~1 %~2
)
goto:eof

:List_Missing
call set "chars_ausentes=%%chars_ausentes%%, %~1"
goto:eof

:List_Enabled
call set "chars_ativados=%%chars_ativados%%, %~1"
call set "fpg_order=%%fpg_order%%, %~2"
set /A ativos+=1
call:set_num %~1
goto:eof

:List_Disabled
call set "chars_desativados=%%chars_desativados%%, %~1"
call set "fpg_order=%%fpg_order%%, NONE"
call:set_num %~1
goto:eof

:set_num
call set "char_order=%%char_order%%, %~1"
set /A quant+=1
goto:eof