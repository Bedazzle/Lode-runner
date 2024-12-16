sound_catched:
	pop     af

sound_catch2:
	ld      b, $32

loop_sound_catch:
	push    bc
	ld      a, $32
	sub     b

	ld      h, a
	ld      l, 0
	ld      de, 3
	call    BEEPER

	pop     bc
	djnz    loop_sound_catch

	xor     a
	ei

	ret
