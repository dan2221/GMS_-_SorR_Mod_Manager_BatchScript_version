if not exist "palettes\sorr_chars" (
	if "%opcao%" == "c" (
		call scripts\chars.bat
	) else (
		if "%opcao%" == "C" (
			call scripts\chars.bat
		)
	)
)