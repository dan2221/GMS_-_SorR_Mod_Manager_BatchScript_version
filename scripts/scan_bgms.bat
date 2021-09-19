IF NOT EXIST "DELETAR" (mkdir DELETAR)
cls
echo.
if "%idioma%" == "PORTUGUES" (echo Musicas nao utilizadas:) else (
	if "%idioma%" == "ESPANOL" (echo Musicas sin usar:) else (
		echo Unused songs:
	)
)
echo.



IF NOT EXIST "mod\games\Nightsweeper v1.4" (
	IF NOT EXIST "mod\games\SoR3 - Adam's Story Extended" (
		IF NOT EXIST "mod\games\SoR1 Collection for V5 Vecta" (
			call:s_bgm hospital
			call:s_bgm hospital_a
		)
	)
)

IF NOT EXIST "mod\games\DOA" (
	IF NOT EXIST "mod\games\SoR3 - Adam's Story Extended" (
		for %%G in (
			Karma
			Karma_a
			jungleu
			jungleu_a
		) do call:s_bgm %%G
	)
)

IF NOT EXIST "mod\games\DOA" (
	IF NOT EXIST "mod\games\SoR3 - Adam's Story Extended" (
		IF NOT EXIST "mod\games\SoRR v4 Bonus - Rudra's Story" (
			call:s_bgm moonu
			call:s_bgm moonu_a
		)
	)
)

IF NOT EXIST "mod\games\DOA" (
	IF NOT EXIST "mod\games\V4 Remake v1.4" (
		for %%G in (
			fboat
			fboat_a
			v4tdeep
			v4tdeep_a
		) do call:s_bgm %%G
	)
)

IF NOT EXIST "mod\games\SoR2 Collection for V5 U" (
	IF NOT EXIST "mod\games\H.U.N.T.E.R MotY" (
		IF NOT EXIST "mod\games\SoR1 Collection for V5 Vecta" (
			call:s_bgm moonb
			call:s_bgm moonb_a
		)
	)
)

IF EXIST "mod\music\anna.ogg" (
	IF NOT EXIST "mod\games\Brutal Justice v1.0" (
		IF NOT EXIST "mod\games\Battle for Rio" (
			call:s_bgm anna
		)
	)
)

IF EXIST "mod\music\unknown2.ogg" (
	IF NOT EXIST "mod\games\H.U.N.T.E.R MotY" (
		IF NOT EXIST "mod\games\DOA" (
			call:s_bgm unknown2
		)
	)
)

IF EXIST "mod\music\ffcdta.ogg" (
	IF NOT EXIST "mod\games\H.U.N.T.E.R MotY" (
		IF NOT EXIST "mod\games\Rescue Metro City"	(
			call:s_bgm ffcdta
		)
	)
)

IF EXIST "mod\music\rustic.ogg" (
	IF NOT EXIST "mod\games\H.U.N.T.E.R MotY" (
		IF NOT EXIST "mod\games\Nightsweeper v1.4" (
			IF NOT EXIST "mod\games\Battle for Rio"	(
				call:s_bgm rustic
			)
		)
	)
)

IF EXIST "mod\music\Whiskey.ogg" (
	IF NOT EXIST "mod\games\H.U.N.T.E.R MotY" (
		IF NOT EXIST "mod\games\Nightsweeper v1.4" (
			IF NOT EXIST "mod\games\Battle for Rio 2" (
				call:s_bgm Whiskey
			)
		)
	)
)

IF EXIST "mod\music\nervous.ogg" (
	IF NOT EXIST "mod\games\H.U.N.T.E.R MotY" (
		IF NOT EXIST "mod\games\Battle for Rio" (
			call:s_bgm nervous
		)
	)
)

IF NOT EXIST "mod\games\H.U.N.T.E.R MotY" (
	IF NOT EXIST "mod\games\Nightsweeper v1.4" (
		for %%G in (
			close
			onmyown
			naile
			naile_a
			btiger
			btiger_a
			Whiskey_a
		) do call:s_bgm %%G
	)
)

IF NOT EXIST "mod\games\DOA" (
	IF NOT EXIST "mod\games\H.U.N.T.E.R MotY" (
		IF NOT EXIST "mod\games\V4 Remake v1.4" (
			call:s_bgm seclab
			call:s_bgm seclab_a
		)
	)
)

IF NOT EXIST "mod\games\V4 Remake v1.4" (
	IF NOT EXIST "mod\games\SoRR v4 Bonus - Rudra's Story" (
		for %%G in (
			v4rudra
			v4rudra_a
			v4vbreat
			v4vbreat_a
			unknown
			unknown_a
		) do call:s_bgm %%G
	)
)

IF NOT EXIST "mod\games\SoR3 - Adam's Story Extended" (
	IF NOT EXIST "mod\games\V4 Remake v1.4" (
		IF NOT EXIST "mod\games\DOA" (
			for %%G in (
				v4grovin
				v4grovin_a
				v4vbreat
				v4vbreat_a
				v4vbreat
				v4vbreat_a
			) do call:s_bgm %%G
		)
	)
)

IF NOT EXIST "mod\games\SoR3 - Adam's Story Extended" (
	IF NOT EXIST "mod\games\V4 Remake v1.4" (
		for %%G in (
			v4go
			v4go_a
			v4dreamer
			v4dreamer_a
			hurry
		) do call:s_bgm %%G
	)
)

IF NOT EXIST "mod\games\SoR1 Collection for V5 Vecta" (
	IF NOT EXIST "mod\games\SoR2 Collection for V5 U" (
		IF NOT EXIST "mod\games\SoR3 Ultimate Mod for V5" (
			for %%G in (
				attackm
				attackm_a
				dtown
				dtown_a
				neverr
				neverr_a
			) do call:s_bgm %%G
		)
	)
)

IF NOT EXIST "mod\games\SoR1 Collection for V5 Vecta" (
	IF NOT EXIST "mod\games\SoR2 Collection for V5 U" (
		for %%G in (
			fstretsm
			fstretsm_a
			beatnikm
			beatnikm_a
			attack
			attack_a
			ulogic
			ulogic_a
		) do call:s_bgm %%G
	)
)

IF NOT EXIST "mod\games\SoR1 Collection for V5 Vecta" (
	IF NOT EXIST "mod\games\SoR3 Ultimate Mod for V5" (
		for %%G in (
			monalisa
			monalisa_a
			grovinm
			grovinm_a
		) do call:s_bgm %%G
	)
)

IF NOT EXIST "mod\games\SoR2 Collection for V5 U" (
	IF NOT EXIST "mod\games\SoR3 Ultimate Mod for V5" (
		for %%G in (
			ulogic2
			ulogic2_a
			mrxnev
			mrxnev_a
			smoon
			smoon_a
			jungle
			jungle_a
			expand
			expand_a
			maxman
			maxman_a
			beatamb
			beatamb_a
			ctrain
			ctrain_a
			dslash
			dslash_a
			cycleii
			cycleii_a
			fuze
			fuze_a
		) do call:s_bgm %%G
	)
)

IF NOT EXIST "mod\games\DOA" (
	IF NOT EXIST "mod\games\SoRR v4 Bonus - Rudra's Story" (
		IF NOT EXIST "mod\games\Nightsweeper v1.4" (
			call:s_bgm lsoulu
			call:s_bgm lsoulu_a
		)
	)
)

IF NOT EXIST "mod\games\V4 Remake v1.4" (
	IF NOT EXIST "mod\games\SoRR v4 Bonus - Rudra's Story" (
		IF NOT EXIST "mod\games\DOA" (
			call:s_bgm v4maxman
			call:s_bgm v4maxman_a
		)
	)
)

IF NOT EXIST "mod\games\SoRR v4 Bonus - Rudra's Story" (
	IF NOT EXIST "mod\games\DOA" (
		call:s_bgm neverru
		call:s_bgm neverru_a
	)
)

IF NOT EXIST "mod\games\V4 Remake v1.4" (
	IF NOT EXIST "mod\games\Nightsweeper v1.4" (
		IF NOT EXIST "mod\games\Rage Rise of The Black Dragon" (
			call:s_bgm v4neverr
			call:s_bgm v4neverr_a
		)
	)
)

if "%bgm%" == "1" goto aviso
cls
echo.
if "%idioma%" == "PORTUGUES" (
	echo Nao existem musicas inutilizadas!
) else (
	if "%idioma%" == "ESPANOL" (
		echo No hay musica sin usar!
	) else (
		echo There are no unused songs!
	)
)
echo.
call scripts\pausa.bat
exit /b

:aviso
echo.
if "%idioma%" == "PORTUGUES" (
	echo Os arquivos foram movidos para a pasta "DELETAR"!
) else (
	if "%idioma%" == "ESPANOL" (
		echo Los archivos se han movido a la carpeta "DELETAR"!
	) else (
		echo The files have been moved to the "DELETAR" folder!
	)
)
echo.
call scripts\pausa.bat
exit /b

:s_bgm
IF EXIST "mod\music\%~1.ogg"	(
	echo %~1.ogg
	move "mod\music\%~1.ogg" DELETAR
	set bgm=1
)
goto:eof