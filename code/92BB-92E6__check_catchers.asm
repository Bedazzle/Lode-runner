check_catchers:
	ld      ix, ENEMIES_DATA+1	; ix=ypixels
	ld      de, $0011			; size of STRUCT MAN
	ld      a, (ENEMY_COUNT)

loop_catch:
	push    af
	ld      l, (ix + MAN.CURR_POS.Y - 1)
	ld      h, (ix + MAN.CURR_POS.X - 1)
	add     ix, de
	ld      a, h
	sub     b
	jr      nc, check_x_difference

	neg

check_x_difference:
	cp      6
	IFNDEF CHEAT_INVISIBLE
		jr      nc, next_catcher
	ELSE
		jr      next_catcher
	ENDIF

	ld      a, l
	sub     c
	jr      nc, check_y_difference

	neg

check_y_difference:
	cp      6
	jp      c, sound_catched

next_catcher:
	pop     af
	dec     a
	jr      nz, loop_catch
