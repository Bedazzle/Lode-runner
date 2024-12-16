level_exit:
	ld      b, 30

loop_level_bonus:
	push    bc
	ld      a, b
	srl     a
	ld      h, a
	ld      l, $80
	ld      de, 3
	call    BEEPER

	ld      bc, SCORE_BONUS	;10
	call    change_score

	pop     bc
	djnz    loop_level_bonus

	ld      a, 1

	ret
