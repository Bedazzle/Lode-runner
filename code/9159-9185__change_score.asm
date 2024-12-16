change_score:
	ld      hl, (SCORE)
	add     hl, bc
	ld      (SCORE), hl
	ld      a, c
	add     a, a
	add     a, a
	add     a, c
	ld      c, a		; C = C * 5

loop_change:
	ld      hl, SCORE_TXT + 6
	ld      b, 7

add_zeroes:
	inc     (hl)
	ld      a, (hl)

	cp      ':'
	jr      nz, not_zero

	ld      (hl), '0'
	dec     hl
	djnz    add_zeroes

not_zero:
	dec     c
	jr      nz, loop_change

	ld      a, COLOR.BRIGHT + COLOR.YELLOW
	ld      d, 7
	ld      hl, SCORE_TXT
	ld      bc, $0617
	call    print_string

	ret
