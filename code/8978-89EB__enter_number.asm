enter_number:
	ld      a, ' '
	call    print_symbol

	inc     b
	call    print_symbol

	ld      a, COLOR.SKYBLUE
	call    sprite_color

	dec     b
	call    sprite_color

wait_first_digit:
	call    press_key

	cp      $FF
	jr      nz, wait_first_digit

not_a_digit_h:
	call    press_key

	cp      '0'
	jr      c, not_a_digit_h

	cp      CHECK_LVL_DIGIT
	jr      nc, not_a_digit_h		; check for levels 01-75 only

	call    print_symbol
	sub     '0'
	ld      h, a		; H=first digit
	inc     b

wait_second_digit:
	call    press_key

	cp      $FF
	jr      nz, wait_second_digit

not_a_digit_l:
	call    press_key

	cp      'c'       ; CAPS SHIFT
	jr      nz, second_digit

	dec     b
	jr      enter_number


second_digit:
	cp      '0'
	jr      c, not_a_digit_l

	cp      ':'
	jr      nc, not_a_digit_l

	call    print_symbol
	sub     '0'
	ld      l, a		; L=second digit

check_entered:
	call    press_key

	cp      'c'       ; CAPS SHIFT
	jr      nz, hl_to_decimal

	dec     b
	jr      enter_number


hl_to_decimal:
	cp      'e'       ; ENTER
	jr      nz, check_entered

	ld      a, h
	add     a, a
	ld      d, a
	add     a, a
	add     a, a
	add     a, d
	add     a, l            ; A = H*10 + L
	and     a
	jr      nz, nonzero_number

	dec     b
	jr      enter_number


nonzero_number:
	cp      LEVELS_COUNT+1	; levels = 75
	ret     c

	dec     b
	jr      enter_number


press_key:
	push    hl
	push    bc

	call    wait_for_key

	pop     bc
	pop     hl

	ret
