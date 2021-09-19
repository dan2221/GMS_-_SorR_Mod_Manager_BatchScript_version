set /A quant=0

:: -- Count the quantity of batch files in "scripts\mods" folder ----------------
for /f %%a in ('dir scripts\mods\*.bat /b /a-d ^|find /c /v ""') do set /A total=%%a

set installed_mod=NONE
set "mod_order="
set "mods_ausentes="
set "mods_desativados="

::				File	Folder
call:scan_all	ADDRAGE	"Additional Rage v1.1"
call:scan_all	BFR		"Battle for Rio"
call:scan_all	BFR2	"Battle for Rio 2"
call:scan_pal	BRUTAL	"Brutal Justice v1.0"
call:scan_all	BURN	"Burning Fight Prototype"
call:scan_pal	DOA		"DOA"
call:scan_all	DD3		"Double Dragon 3 (Arcade)"
call:scan_all	HUNTER	"H.U.N.T.E.R MotY"
call:scan_all	HUNTERD	"DC Infiltrators"
call:scan_all	HUNTERG	"Nightsweeper v1.4"
call:scan_all	KBASH	"Knuckle Bash Remake"
call:scan_pal	NBDOWN	"Never Back Down"
call:scan_all	NSLASH	"Night Slashers"
call:scan_pal	BDRAG	"Rage Rise of The Black Dragon"
call:scan_all	METRO	"Rescue Metro City"
call:scan_all	R2029	"Rudra 2029 Pilot"
call:scan_all	RUSH	"Rushing Beat Remake FE v2.1"
call:scan_all	SOR1	"SoR1 Collection for V5 Vecta"
call:scan_all	SOR2	"SoR2 Collection for V5 U"
call:scan_all	SOR3	"SoR3 Ultimate Mod for V5"
call:scan_pal	SOR3A	"SoR3 - Adam's Story Extended"

IF EXIST "mod\games\SoR Ice" (
	call:scan_all	SORIS	"SoR Ice"
) else (
	call:scan_all	SORIS	"SoR Silver"
)

IF EXIST "mod\games\SoR2 Flame" (
	call:scan_all	SOR2FG	"SoR2 Flame"
) else (
	call:scan_all	SOR2FG	"SoR2 Gold"
)
call:scan_all	SF2		"Street Fighter II"
call:scan_all	GOTHAM	"Streets of Gotham"
call:scan_pal	SORV	"Streets of Rage V - demo 2017"
call:scan_pal	URBANR	"Urban Reign"
call:scan_all	VENDETA	"Vendetta Dead End City Stories v1.0"
call:scan_pal	WAYW	"Way of the Warrior"

call:scan_txt	V4		"V4 Remake v1.4"
call:scan_txt	V4RUDRA	"SoRR v4 Bonus - Rudra's Story"

exit /b

::::::::::::::::: FUNCTIONS :::::::::::::::::::

:: -- Scan Palettes and Data files ------------
:scan_all
if not "%installed_mod%" == "NONE" goto:eof
for %%G in (
	"mod\games\%~2"
	"scripts\mods\%~1.bat"
) do (
	if exist %%G (
		IF NOT EXIST "mod\games\%~2\palettes" (
			MKDIR "mod\games\%~2\palettes"
		)
	) ELSE (
		call:List_Missing %~1
		goto:eof
	)
)


IF EXIST "mod\games\%~2\data" (
	IF EXIST "mod\games\%~2\palettes\enemies\*.pal" (
		call:List_Disabled %~1
	) ELSE (
		IF EXIST "mod\games\%~2\enemies\*.pal" (
			move "mod\games\%~2\enemies" "mod\games\%~2\palettes"
			
			call:set_num %~1
		) ELSE (
			IF EXIST "palettes\sorr\*.pal" (
				IF NOT "%installed_mod%" == "NONE" (exit /b) ELSE (
					IF EXIST "mod\%~1.txt" (
						call:Set_Enabled %~1
						exit /b
					) ELSE (call:List_Missing %~1)
				)
			) ELSE (call:List_Missing %~1)
		)
	)
) ELSE (call:List_Missing %~1)
goto:eof

:: -- Scan only Palettes ------------
:scan_pal
if not "%installed_mod%" == "NONE" goto:eof
for %%G in (
	"mod\games\%~2"
	"scripts\mods\%~1.bat"
) do (
	if exist %%G (
		IF NOT EXIST "mod\games\%~2\palettes" (
			MKDIR "mod\games\%~2\palettes"
		)
	) ELSE (
		call:List_Missing %~1
		goto:eof
	)
)

IF EXIST "mod\games\%~2\palettes\enemies\*.pal" (
	call:List_Disabled %~1
) ELSE (
	IF EXIST "mod\games\%~2\enemies\*.pal" (
		move "mod\games\%~2\enemies" "mod\games\%~2\palettes"
		call:List_Disabled %~1
	) ELSE (
		IF EXIST "palettes\sorr\*.pal" (
			IF NOT "%installed_mod%" == "NONE" (exit /b) else (
				IF EXIST "mod\%~1.txt" (
					call:Set_Enabled %~1
					exit /b
				) ELSE (call:List_Missing %~1)
			)
		) ELSE (call:List_Missing %~1)
	)
)
goto:eof

:: -- Search for the mod txt file ------------
:scan_txt
if not "%installed_mod%" == "NONE" goto:eof
for %%G in (
	"scripts\mods\%~1.bat"
	"mod\games\%~2"
) do (
	if not exist "%%G" (
		call:List_Missing %~1
		goto:eof
	)
)

IF EXIST "mod\%~1.txt" (
	call:Set_Enabled %~1
	exit /b
) ELSE (
	if "%opE%" == "ON" (
		call:List_Disabled %~1
	)
)
goto:eof

:List_Missing
call set "mods_ausentes=%%mods_ausentes%%, %~1"
goto:eof

:Set_Enabled
set installed_mod=%~1
call:set_num %~1
goto:eof

:List_Disabled
call set "mods_desativados=%%mods_desativados%%, %~1"
call:set_num %~1
goto:eof

:: -- Count mods and order them ---------------
:set_num
set /A quant+=1
call set "mod_order=%%mod_order%%, %~1"
goto:eof