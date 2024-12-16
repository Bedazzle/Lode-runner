paint_empty_cells:
	ld      c, 0
	ld      hl, UNPACKED_ROOM

loop_empty_rows:
	ld      b, 0

loop_empty_cols:
	ld      a, (hl)
	inc     hl
	and     a
	jr      nz, no_empty_paint

	ld      a, COLOR.BRIGHT + COLOR.WHITE
	call    sprite_color

no_empty_paint:
	inc     b
	bit     5, b
	jr      z, loop_empty_cols

	inc     c
	ld      a, 22		;$16

	cp      c
	jr      nz, loop_empty_rows

	ret
