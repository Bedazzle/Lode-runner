put_object:
	srl     b
	srl     b
	srl     b
	ld      e, b
	ld      b, 0
	ld      d, a
	ld      a, c
	and     $F8
	add     a, a
	jr      nc, loc_982F

	ld      b, 2

loc_982F:
	add     a, a
	jr      nc, loc_9833

	inc     b

loc_9833:
	ld      c, a
	ld      a, d
	ld      hl, UNPACKED_ROOM
	add     hl, bc
	ld      d, 0
	add     hl, de
	ld      (hl), a

	ret
