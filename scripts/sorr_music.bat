rem ---------- Check for music txts --------------
IF EXIST "mod\games\%proj%\sorr_music.txt" (set /A msorr=1) ELSE (
	IF "%opC%" == "ON" (set /A msorr=2) ELSE (set /A msorr=0)
)

IF EXIST "mod\games\%proj%\mods_music.txt" (set /A mmods=1) ELSE (
	IF "%opD%" == "ON" (set /A mmods=2) ELSE (set /A mmods=0)
)