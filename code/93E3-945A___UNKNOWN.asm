loc_93E3:
	ld      ix, ENEMIES_DATA
	ld      a, (ENEMY_COUNT)

loop_enemy:
	push    af
	ld      hl, GAME_TIMER
	xor     (hl)
	and     1
	jp      z, next_enemy

	ld      a, (ix + MAN.ALLOW)

	cp      5
	jp      z, loc_95F3

	ld      c, (ix + MAN.CURR_POS.Y)
	ld      b, (ix + MAN.CURR_POS.X)
	ld      a, b
	or      c
	and     7
	jr      nz, loc_9436

	call    object_by_pixels

	cp      OBJECT.BRICKS
	jp      z, kill_enemy

	cp      OBJECT.SOLID
	jr      nz, loc_9436

	push    bc

	ld      a, (ix + MAN.VAR_10)
	and     a
	jr      z, loc_9432

	cp      6
	jr      c, loc_9435
	jr      nz, loc_9432

	ld      a, (BOXES_LEFT)
	and     a
	ld      a, 6
	jr      nz, loc_9432

	push    bc

	ld      a, SPRITE.LADDER
	call    xor_put_coords

	pop     bc
	ld      a, OBJECT.LADDER

loc_9432:
	call    put_object

loc_9435:
	pop     bc

loc_9436:
	ld      a, COLOR.BRIGHT + COLOR.WHITE

	call    recolor_man
	call    calc_and_run

	ld      (LA1D8), a
	push    af
	ld      bc, (COPY_MAN_COORDS)
	push    bc

	ld      a, b
	or      c
	and     7
	jp      nz, loc_953F

	push    bc
	ld      a, c
	sub     8
	ld      c, a
	jr      c, loc_94D3

	ld      a, (byte_98E1)
	and     a
	jr      nz, loc_94D3
