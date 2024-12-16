calc_and_run:
	ld      a, (ix + MAN.ALLOW)
	push    ix
	pop     hl
	ld      de, COPY_MAN_DATA
	ld      bc, $0011
	ldir

	add     a, a
	ld      e, a
	ld      d, 0
	ld      hl, PROC_ADDRESSES
	add     hl, de

	ld      e, (hl)
	inc     hl
	ld      d, (hl)
	ex      de, hl

	jp      (hl)
