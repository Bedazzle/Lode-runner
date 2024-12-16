loc_92A1:
	ld      hl, GAME_TIMER
	inc     (hl)
	ei
	halt
	di

	ld      bc, (PLAYER_PIXELS)

	call    get_obj_horz

	ld      a, d

	cp      1
	jp      z, sound_catch2

	ld      a, e

	cp      1
	jp      z, sound_catch2
