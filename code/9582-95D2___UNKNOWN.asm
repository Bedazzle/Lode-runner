loc_9582:
	call    get_obj_horz

	ld      a, d

	cp      1
	jr      z, loc_957C

	ld      a, e

	cp      1
	jr      z, loc_957C

loc_958F:
	ld      hl, (PLAYER_PIXELS)
	ld      de, $0101
	ld      bc, (COPY_MAN_COORDS)
	ld      a, h

	cp      b
	jr      nz, loc_959E

	dec     d

loc_959E:
	jr      nc, loc_95A2

	ld      d, $FF

loc_95A2:
	ld      a, l

	cp      c
	jr      nz, loc_95A7

	dec     e

loc_95A7:
	jr      nc, loc_95AB

	ld      e, $FF

loc_95AB:
	ld      (word_A130), de
	ld      bc, set_enemy_vars

	ld      hl, L9FFC		; some code

	ld      a, (COPY_MAN_DATA)
	and     a
	jr      z, loc_95CC

	ld      hl, L9F81		; some code
	cp      1
	jr      z, loc_95CC

	ld      hl, LA08A		; some code
	cp      2
	jr      z, loc_95CC

	ld      hl, L9F8C		; some code

loc_95CC:
	pop     af
	push    bc
	ld      bc, (COPY_MAN_COORDS)

	jp      (hl)
