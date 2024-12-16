transform_ladders:
	ld      hl, UNPACKED_ROOM
	ld      c, 0

loop_hidden_row:
	ld      b, 0

loop_hidden_col:
	ld      a, (hl)

	cp      OBJECT.HIDLADDER
	jr      nz, no_hid_ladder

	ld      (hl), OBJECT.LADDER

	ld      a, SPRITE.LADDER
	call    xor_put_sprite

no_hid_ladder:
	inc     hl
	inc     b
	bit     5, b
	jr      z, loop_hidden_col	; 32

	inc     c
	ld      a, 22

	cp      c
	jr      nz, loop_hidden_row
