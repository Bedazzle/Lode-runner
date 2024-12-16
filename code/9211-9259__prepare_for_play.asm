prepare_for_play:
	; prepare room for play
	di

	call    paint_empty_cells

	ld      a, $FF
	ld      (FIRE_FRAME), a

	ld      de, HOLES_DATA+1
	ld      hl, HOLES_DATA
	ld      bc, HOLES_DATA_END - HOLES_DATA - 1
	ld      (hl), a
	ldir

	call    count_level_boxes

	ld      ix, PLAYER_COL
	ld      iy, PLAYER_DATA
	ld      b, 0

	call    prepare_men			; B=0 -> player

	ld      ix, ENEMIES			; coordinate pairs
	ld      a, (ENEMY_COUNT)
	ld      b, a
	ld      iy, ENEMIES_DATA

loop_for_enemies:
	push    bc

	call    prepare_men			; B>0 -> enemy

	ld      de, $0011			; size of STRUCT MAN
	add     iy, de
	ld      de, 2
	add     ix, de
	pop     bc
	djnz    loop_for_enemies

	; -------------------
loc_9253:
	call    wait_for_key

	cp      'c'
	jr      nz, loc_92A1
