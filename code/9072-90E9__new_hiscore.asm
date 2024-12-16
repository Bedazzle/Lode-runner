new_hiscore:
	ld      iy, CONGRATS_ATTRIB

	call    random_scr_fade

	ld      hl, aCongratulation ; "CONGRATULATIONS"
	ld      b, 5

loop_print_congrats:
	push    bc
	ld      a, (iy + CONGRATS.COLOR)
	ld      b, (iy + CONGRATS.COLUMN)
	ld      c, (iy + CONGRATS.ROW)
	ld      d, (iy + CONGRATS.LENGTH)

	call    print_string

	ld      e, 4
	add     iy, de
	pop     bc
	djnz    loop_print_congrats
	
	ld      bc, $0C0F
	call    enter_name

	ld      iy, HISCORE_PREV
	push    ix
	pop     hl
	ld      de, HISCORE_LAST
	ld      bc, $0011
	ldir

	ld      b, 1

loc_90AC:
	push    bc
	ld      l, (iy + HISCORE.SCORE1)
	ld      h, (iy + HISCORE.SCORE2)
	ld      e, (ix + SCOREPAIR.LO)
	ld      d, (ix + SCOREPAIR.HI)
	and     a
	sbc     hl, de
	jr      c, loc_90C4

	pop     bc

loc_90BF:
	ld      a, b
	ld      (CHEATED), a

	ret
; ---------------------------------------

loc_90C4:
	push    iy
	pop     hl
	push    hl
	ld      bc, $0011
	add     hl, bc
	ex      de, hl
	pop     hl
	ldir

	push    iy
	pop     de
	push    ix
	pop     hl
	ld      bc, $0011
	ldir

	ld      b, $11

loc_90DD:
	dec     iy
	djnz    loc_90DD

	pop     bc
	inc     b
	ld      a, (HALL_OF_FAME_END - HALL_OF_FAME)/HISCORE		;5

	cp      b
	jr      nz, loc_90AC
	jr      loc_90BF
