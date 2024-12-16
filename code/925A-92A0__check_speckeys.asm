check_restarts:
	ld      a, high KEYS_ASDFG
	in      a, (KEYBOARD)
	bit     0, a				; key "A" + Caps, level restart
	jp      z, sound_catch2

	ld      a, high KEYS_QWERT
	in      a, (KEYBOARD)
	bit     3, a				; key "R" + Caps, game over
	jr      nz, check_cheatkeys

	ld      a, 1
	ld      (LIVES), a
	jp      sound_catch2


check_cheatkeys:
	ld      a, high KEYS_BNMsp
	in      a, (KEYBOARD)
	bit     2, a				; key "M" + Caps, extra life
	jr      nz, cheat_next_level

	ld      a, (GAME_TIMER)
	and     3
	jr      nz, loc_92A1

cheat_extra_life:
	ld      hl, LIVES
	inc     (hl)

	call    print_info_line

	ld      a, $FF
	ld      (CHEATED), a
	jr      loc_92A1

  
cheat_next_level:
	ld      a, high KEYS_HJKLe
	in      a, (KEYBOARD)
	bit     1, a				; key "L" + Caps, skip level
	jr      nz, loc_92A1

	ld      a, $FF
	ld      (CHEATED), a
	ld      a, 1
	ei

	ret
