wait_for_key:
	ld      bc, $08FE

check_keyport:
	ld      de, $051E

check_one_key:
	ld      a, c
	in      a, (KEYBOARD)
	and     1Fh

	cp      e
	jr      z, key_pressed

	rlc     e
	set     0, e
	res     5, e
	dec     d
	jr      nz, check_one_key

	rlc     c
	djnz    check_keyport

	ld      a, $FF

	ret


key_pressed:
	push    de
	push    bc
	xor     a
	dec     b
	jr      z, loc_8701

loc_86FD:
	add     a, 5
	djnz    loc_86FD

loc_8701:
	dec     d
	add     a, d
	pop     bc
	pop     de
	push    hl
	ld      hl, KEYMAP
	add     a, l
	ld      l, a
	jr      nc, loc_870E

	inc     h

loc_870E:
	ld      a, (hl)
	pop     hl

	ret
