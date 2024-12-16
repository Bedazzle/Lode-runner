; C=col, B=row, A=symbol to print

print_symbol:
	push    af
	push    bc
	push    de
	push    hl
	ld      h, $40		; find screen address, B=col, C=row
	push    af
	ld      a, c
	and     $18			; 0001 1000
	or      h
	ld      h, a
	ld      l, b
	sla     c
	sla     c
	sla     c
	sla     c
	sla     c
	ld      b, 0
	add     hl, bc		; HL = screen address
	pop     af
	push    hl
	ld      hl, GFX
	ld      b, 0
	add     a, a
	jr      nc, loc_8527

	ld      b, 4

loc_8527:
	add     a, a
	jr      nc, loc_852C

	set     1, b

loc_852C:
	add     a, a
	jr      nc, loc_8530

	inc     b

loc_8530:
	ld      c, a
	add     hl, bc
	ex      de, hl
	pop     hl
	ld      b, 8

loop_copy_cell:
	ld      a, (de)
	ld      (hl), a
	inc     h
	inc     de
	djnz    loop_copy_cell

	pop     hl
	pop     de
	pop     bc
	pop     af

	ret
