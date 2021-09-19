if "%~2" == "sorr music" (
	set snd[1]=%~1
	goto sorr_music
)

if %arqnum% equ 2 (
	:: Set the second ogg file
	set snd[2]=%~1
	call:Count_Lenght
	set /A arqnum=1
	:: Check the operation:
	if "%~2" == "on loop" (call:bgm_on_loop) else (
		if "%~2" == "on" (call:bgm_on) else (
			if "%~2" == "off loop" (call:bgm_off_loop) else (
				if "%~2" == "off" (call:bgm_off) else (
					if "%~2" == "install loop" (call:instal_bgm_loop) else (
						if "%~2" == "install" (call:instal_bgm) else (
							cls
							echo ERROR: Operation not identified!
							call scripts\pausa.bat
							exit
						)
					)
				)
			)
		)
	)
) else (
	:: Set the first ogg file
	set snd[1]=%~1
	set /A arqnum=2
)
exit /b

:bgm_on_loop
move "mod\music\%snd[1]%.ogg"		"mod\games\%proj%\%snd[2]%.ogg"
move "mod\music\%snd[1]%%loop%.ogg"	"mod\games\%proj%\%snd[2]%a.ogg"
goto:eof

:bgm_on
move "mod\music\%snd[1]%.ogg"		"mod\games\%proj%\%snd[2]%.ogg"
goto:eof

:bgm_off_loop
move "mod\games\%proj%\%snd[1]%.ogg"	"mod\music\%snd[2]%.ogg"
move "mod\games\%proj%\%snd[1]%a.ogg"	"mod\music\%snd[2]%%loop%.ogg"
goto:eof

:bgm_off
move "mod\games\%proj%\%snd[1]%.ogg"		"mod\music\%snd[2]%.ogg"
goto:eof



:instal_bgm_loop
call:mkdelet
IF NOT EXIST "mod\music\%snd[1]%.ogg" (
	move "mod\games\%proj%\%snd[2]%.ogg"	"mod\music\%snd[1]%.ogg"
	move "mod\games\%proj%\%snd[2]%a.ogg"	"mod\music\%snd[1]%%loop%.ogg"
) else (
	move "mod\games\%proj%\%snd[2]%.ogg"	"DELETAR\%proj%"
	move "mod\games\%proj%\%snd[2]%a.ogg"	"DELETAR\%proj%"
)
if not exist "mod\games\%proj%\mods_music.txt" (
	echo 2>"mod\games\%proj%\mods_music.txt"
)
set /A mmods=1
goto:eof

:instal_bgm
call:mkdelet
IF NOT EXIST "mod\music\%snd[1]%.ogg" (
	move "mod\games\%proj%\%snd[2]%.ogg"		"mod\music\%snd[1]%.ogg"
) else (move "mod\games\%proj%\%snd[2]%.ogg"	"DELETAR\%proj%")

if not exist "mod\games\%proj%\mods_music.txt" (
	echo 2>"mod\games\%proj%\mods_music.txt"
)
set /A mmods=1
goto:eof

:sorr_music
call:mkdelet
move "mod\games\%proj%\%snd[1]%.ogg" "DELETAR\%proj%"
if not exist "mod\games\%proj%\sorr_music.txt" (
	echo 2>"mod\games\%proj%\sorr_music.txt"
)
set /A msorr=1
exit /b

:mkdelet
IF NOT EXIST "DELETAR"			(mkdir DELETAR)
IF NOT EXIST "DELETAR\%proj%"	(mkdir "DELETAR\%proj%")
goto:eof

:Count_Lenght
:: Count the lenghts of the two music files.
(echo "%snd[1]%" & echo.) | findstr /O . | more +1 | (set /P RESULT= & call exit /B %%RESULT%%)
set /A STRLENGTH[1]=%ERRORLEVEL%-5
(echo "%snd[2]%" & echo.) | findstr /O . | more +1 | (set /P RESULT= & call exit /B %%RESULT%%)
set /A STRLENGTH[2]=%ERRORLEVEL%-5

:: If one of the files have a name lenght more than 3 it means that the file is from a mod, else the file is from SorR.
if %STRLENGTH[1]% gtr 3 (
	set loop=_a
) else (
	if %STRLENGTH[2]% gtr 3 (
		set loop=_a
	) else (
		set loop=a
	)
)
goto:eof