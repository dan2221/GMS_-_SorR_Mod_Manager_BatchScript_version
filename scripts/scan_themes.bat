call:scan neon "neon park"
call:scan gamb "el gambito"
call:scan bk3t "bare knuckle iii"

exit /b

:scan
IF NOT EXIST "mod\themes\%~2" (set /A %~1=2) ELSE (
	IF EXIST "mod\themes\%~2\inicio.fpg" (
		IF EXIST "mod\themes\%~2\%~2.txt" (set /A %~1=0) ELSE (
			echo. 2>"mod\themes\%~2\%~2.txt"
			set /A %~1=0
		)
	) ELSE (
		IF EXIST "data\%~2.txt" (set /A %~1=1) ELSE (set /A %~1=2)
	)
)
goto:eof