restore_man_data:
	push    ix
	pop     de
	ld      hl, COPY_MAN_DATA
	ld      bc, $000F
	ldir

	xor     a

	ret
