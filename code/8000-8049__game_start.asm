GAME_START:
	ld      hl, PATCH_END_OF_MEMORY
	ld      de, LEVELS_END-4
	ld      bc, 4
	ldir						; optimize (restoring tail of last level corrupted by stack)

	xor     a
	ld      (INPUT_METHOD), a

	inc     a
	ld      (ROOM_NO), a

	di
	ld      a, $AA
	ld      i, a

	ld      hl, $EDFB			; EI / RETI (FB, ED, 4D)
	ld      (GFX_1+$258), hl	; set interrupt

	ld      a, $4D
	ld      (GFX_1+$25A), a

	ld      hl, INTERRUPT_TABLE

	ld      b, 0
loop_vectors:
	ld      (hl), $60
	inc     hl
	djnz    loop_vectors

	ld      (hl), $60
	im      2
	ld      (KEEP_STACK), sp
	ld      sp, STACK
	ei

loop_screens:
	call    print_intro
	call    starfield
	call    show_demo

show_hall:
	call    hall_of_fame
	call    starfield
	jr      loop_screens
