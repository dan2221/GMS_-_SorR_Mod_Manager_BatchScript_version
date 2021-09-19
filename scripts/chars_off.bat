for %%G in (%chars_ativados:~2%) do (
	set Char_Var=%%G
	call scripts\chars\%%G.bat
	call scripts\chars_univ.bat
)