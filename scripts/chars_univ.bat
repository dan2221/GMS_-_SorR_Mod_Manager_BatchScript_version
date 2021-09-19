:: Check if the selected char is installed
for %%S in (%chars_ativados%) do (
	if "%%S" == "%Char_Var%" goto off
)

:: Install a character mod -----------------------------------------------------------------------
:on
if not "%Char_Wav%" == "no" (
	for %%G in (%Char_Wav%) do (
		if exist "data\%%G.wav" (ren "data\%%G.wav"	"[mod]%%G.wav")
	)
	move "mod\chars\%Char_Dir%\*.wav" data
)
move "mod\chars\%Char_Dir%\%Char_Fpg%.fpg" data
move "mod\chars\%Char_Dir%\f_%Char_Fpg%.fpg" data

if "%Palettes%" == "yes" (
	For %%G IN ( . 1. 2. 3. 4. 5. 6. 7.) do (
		ren "palettes\chars\%Char_Fpg%%%Gpal"			"[SORR]%Char_Fpg%%%Gpal"
		ren "palettes\backup_chars\%Char_Fpg%%%Gpal"	"[SORR]%Char_Fpg%%%Gpal"
		move "mod\chars\%Char_Dir%\palettes\backup_chars\%Char_Fpg%%%Gpal"	palettes\backup_chars
		move "mod\chars\%Char_Dir%\palettes\chars\%Char_Fpg%%%Gpal"			palettes\chars
	)
)
move	"mod\chars\%Char_Dir%\%Char_Var%.txt" data
call:var_off
exit /b

:: Uninstall a character mod ---------------------------------------------------------------------
:off
move	"data\%Char_Fpg%.fpg"	"mod\chars\%Char_Dir%"
move	"data\f_%Char_Fpg%.fpg"	"mod\chars\%Char_Dir%"

if not "%Char_Wav%" == "no" (
	For %%G IN (%Char_Wav%) do (
		move "data\%%G.wav"	"mod\chars\%Char_Dir%"
		if exist "data\[mod]%%G.wav" (ren "data\[mod]%%G.wav" "%%G.wav")
	)
)

if "%Palettes%" == "yes" (
	For %%G IN ( . 1. 2. 3. 4. 5. 6. 7.) do (
		move "palettes\chars\%Char_Fpg%%%Gpal"			"mod\chars\%Char_Dir%\palettes\chars"
		move "palettes\backup_chars\%Char_Fpg%%%Gpal"	"mod\chars\%Char_Dir%\palettes\backup_chars"
		ren "palettes\chars\[SORR]%Char_Fpg%%%Gpal"			"%Char_Fpg%%%Gpal"
		ren "palettes\backup_chars\[SORR]%Char_Fpg%%%Gpal"	"%Char_Fpg%%%Gpal"
	)
)

move "data\%Char_Var%.txt" "mod\chars\%Char_Dir%"
call:var_off
exit/b

:var_off
:: Remove variables
set "Char_Var="
set "Char_Dir="
set "Char_Fpg="
set "Palettes="
set "Char_Wav="
goto:eof