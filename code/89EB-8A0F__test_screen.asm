test_screen:
	ld	bc, $0A09
	ld	a, COLOR.FLASH + COLOR.SKYBLUE
	call sprite_color

	ld	b, $11
	call enter_number

	ld	(CURRENT_ROOM), a

	ld	a, 1
	ld	(LIVES), a

	dec	a
	ld	(L8F73+1), a	; !!! set SMC
	ld	(L8F91), a		; !!! set SMC

	call	clear_score
	call	play_room

	jp	edit_screen
