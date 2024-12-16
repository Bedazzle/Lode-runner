check_sinclair_UD:
	ld      a, high KEYS_67890
	in      a, (low KEYS_67890)
	bit     1, a            ; "9"
	jr      nz, check_sinc_down

	dec     d

check_sinc_down:
	bit     2, a            ; "8"
	jr      nz, exit_sinclair_UD

	inc     d

exit_sinclair_UD:
	ret


	; --------------


check_cursor_UD:
	ld      a, high KEYS_67890
	in      a, (low KEYS_67890)
	bit     3, a            ; "7"
	jr      nz, check_curs_down

	dec     d

check_curs_down:
	bit     4, a            ; "6"
	jr      nz, exit_cursor_UD

	inc     d

exit_cursor_UD:
	ret


	; --------------


inkey_updown:
	ld      d, 0
	ld      a, (INPUT_METHOD)
	and     a
	jr      nz, check_kempston_UD

	ld      bc, KEYS_QWERT
KEYMAP_3:
	in      a, (c)
	bit     0, a            ; "Q"
	jr      nz, check_key_down

	dec     d

check_key_down:
	ld      bc, KEYS_cZXCV
KEYMAP_4:
	in      a, (c)
	bit     1, a            ; "Z"
	jr      nz, exit_keyboard_UD

	inc     d

exit_keyboard_UD:
	ret


	; --------------


check_kempston_UD:
	cp      2
	jr      z, check_sinclair_UD
	jr      nc, check_cursor_UD

	xor     a
	in      a, (KEMPSTON)
	bit     JOYSTICK.DOWN, a
	jr      z, check_kemp_down

	dec     d

check_kemp_down:
	bit     JOYSTICK.UP, a
	jr      z, exit_kempston_UD

	inc     d

exit_kempston_UD:
	ret
