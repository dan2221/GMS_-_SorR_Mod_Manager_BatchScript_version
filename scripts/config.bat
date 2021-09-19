for %%C in (A B C D E F G) do (
	IF EXIST "scripts\%%C0.txt" (set op%%C=OFF) ELSE (
		IF EXIST "scripts\%%C1.txt" (set op%%C=ON) ELSE (
			echo. 2>scripts\%%C0.txt
			set op%%C=OFF
		)
	)
)

IF EXIST "scripts\EN.txt" (set idioma=ENGLISH) ELSE (
	IF EXIST "scripts\PT.txt" (set idioma=PORTUGUES) ELSE (
		IF EXIST "scripts\ES.txt" (set idioma=ESPANOL) ELSE (
			echo. 2>scripts\EN.txt
			set idioma=ENGLISH
		)
	)
)