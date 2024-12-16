inkey_leftright:
	ld      a, (INPUT_METHOD)
	and     a
	ld      d, 0
	jr      nz, check_kempston_LR

check_keyboard_LR:
	ld      bc, KEYS_YUIOP
KEYMAP_1:
	in      a, (c)
	bit     2, a            ; "I"
	jr      nz, check_key_right

	dec     d				; keyboard left

check_key_right:
	ld      bc, KEYS_YUIOP      ; Y, U, I, O, P
KEYMAP_2:
	in      a, (c)
	bit     0, a            ; P
	jr      nz, exit_default_LR
	inc     d				; keyboard right

exit_default_LR:
	ret


	; --------------


check_kempston_LR:
	cp      2
	jr      z, check_sinclair_LR
	jr      nc, check_cursor_LR

	xor     a
	in      a, (KEMPSTON)
	bit     JOYSTICK.RIGHT, a	; Kempston R
	jr      z, check_kemp_right

	dec     d

check_kemp_right:
	bit     JOYSTICK.LEFT, a		; Kempston L
	jr      z, exit_kempston_LR
	inc     d

exit_kempston_LR:
	ret


	; --------------


check_sinclair_LR:
	ld      a, high KEYS_67890
	in      a, (low KEYS_67890)
	bit     3, a            ; "7"
	jr      nz, check_sinc_left

	inc     d

check_sinc_left:
	bit     4, a            ; "6"
	jr      nz, exit_sinclair_LR
	dec     d

exit_sinclair_LR:
	ret


	; --------------


check_cursor_LR:
	ld      a, high KEYS_67890
	in      a, (low KEYS_67890)
	bit     2, a            ; "8"
	jr      nz, check_curs_left

	inc     d

check_curs_left:
	ld      a, high KEYS_12345
	in      a, (low KEYS_12345)
	bit     4, a            ; "5"
	jr      nz, exit_cursor_LR

	dec     d

exit_cursor_LR:
	ret
