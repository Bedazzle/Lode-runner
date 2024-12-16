collect_box:
	push    bc

	srl     b
	srl     b
	srl     b

	srl     c
	srl     c
	srl     c

	ld      a, COLOR.BRIGHT + COLOR.WHITE
	call    sprite_color

	ld      a, SPRITE.BOX
	call    xor_put_sprite

	pop     bc
	xor     a				; OBJECT.EMPTY
	call    put_object

	ld      bc, SCORE_BOX
	call    change_score

	ld      de, 7
	ld      hl, $03E8
	call    BEEPER

	di
	ld      hl, BOXES_LEFT
	dec     (hl)
	jr      nz, check_collected_boxes
