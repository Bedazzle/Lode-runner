clear_score:
	ld      hl, $3030
	ld      (SCORE_TXT), hl
	ld      (SCORE_TXT+2), hl
	ld      (SCORE_TXT+4), hl
	ld      (SCORE_TXT+5), hl
	ld      hl, 0
	ld      (SCORE), hl

	ret
