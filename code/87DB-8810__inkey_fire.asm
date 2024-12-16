inkey_fire:
	ld      d, 0
	ld      a, (INPUT_METHOD)
	and     a
	jr      nz, check_kempston_FIRE

check_keyboard_FIRE:
	ld      bc, KEYS_BNMsp
KEYMAP_5:
	in      a, (c)
	bit     3, a            ; "N"
	jr      nz, exit_keyboard_FIRE

	inc     d

exit_keyboard_FIRE:
	ret


	; --------------


check_kempston_FIRE:
	cp      2
	jr      nc, check_sinclair_FIRE

	xor     a
	in      a, ($1F)
	bit     JOYSTICK.FIRE, a
	jr      z, exit_kempston_FIRE

	inc     d

exit_kempston_FIRE:
	ret


	; --------------


check_sinclair_FIRE:
	ld      a, high KEYS_67890
	in      a, (low KEYS_67890)
	bit     0, a         ; "0"
	ret     nz

	inc     d

	ret


; --------------


check_keyboard_HALT:
	ld      d, 0
	ld      bc, KEYS_HJKLe
	in      a, (c)
	bit     4, a            ; "H"
	jr      nz, exit_keyboard_HALT

	inc     d

exit_keyboard_HALT:
	ret
