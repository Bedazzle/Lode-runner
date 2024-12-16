trap_enemy:
	ld      a, OBJECT.SOLID		; enemy as solid block, so others can walk over it
	push    bc
	call    put_object
	pop     bc

	srl     c
	srl     c
	srl     c

	srl     b
	srl     b
	srl     b

	ld      a, COLOR.BRIGHT + COLOR.MAGENTA
	call    sprite_color

	pop     bc
	pop     bc

	ld      bc, SCORE_TRAP	;15			; 15 * 5 = 75
	call    change_score

	jp      next_enemy
