if "%opG%" == "ON" (
	move palettes\chars	"mod\games\%proj%\palettes"
	ren palettes\sorr_chars chars
) else (
	if "%opB%" == "ON" (
		move palettes\chars	"mod\games\%proj%\palettes"
		ren palettes\sorr_chars chars
	)
)

:: --- Move chars files ---
For %%G IN (
	adam
	ash_char
	axel
	beta_max
	bk3_axel
	blaze
	electra_char
	max
	mry
	roo_char
	sor1_axel
	sor1_blaze
	sor2_blaze
	sor2_shiva
	sor2_skate
	sor3_shiva
	zan
	skate
	rudra_char
) do (
	if exist "data\[mod]%%G.fpg" (
		move "data\[mod]%%G.fpg" "mod\games\%proj%\data\%%G.fpg"
	) else (
		if exist "data\%%G.fpg" (
			move "data\%%G.fpg"	"mod\games\%proj%\data"
		)
	)
	if exist "data\[mod]f_%%G.fpg" (
		move "data\[mod]f_%%G.fpg" "mod\games\%proj%\data\f_%%G.fpg"
	) else (
		if exist "data\f_%%G.fpg" (
			move "data\f_%%G.fpg"	"mod\games\%proj%\data"
		)
	)
)

:: --- Move theme files ---
For %%G IN (
	inicio.fpg
	scroll3.fpg
	scroll4.fpg
) do (
	if exist "data\[mod]%%G" (
		move "data\[mod]%%G" "mod\games\%proj%\data\%%G"
	) else (
		if exist "data\[theme]%%G" (
			move "data\%%G"	"mod\games\%proj%\data"
			ren "data\[theme]%%G" "%%G"
		)
	)
)

move palettes\enemies		"mod\games\%proj%\palettes"
ren	palettes\sorr enemies

:: Move all files listed in mod txt file.
FOR /F %%T in (mod\%installed_mod%.txt) do (
	if exist "data\[mod]%%T" (
		move "data\[mod]%%T" "mod\games\%proj%\data\%%T"
	) else (
		if exist "data\%%T" (
			move "data\%%T" "mod\games\%proj%\data"
		)
	)
)
ren "mod\%installed_mod%.txt" sorr.txt