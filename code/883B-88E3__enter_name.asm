enter_name:
	ld      hl, NAME_BUFFER
	call    get_sprite_colr

	push    bc

	ld      d, 8
	call    print_string
	call    sprite_color

	pop     bc

	xor     COLOR.FLASH
	call    sprite_color

	ld      a, 1
	ld      hl, NAME_BUFFER

loc_8855:
	push    af
	push    bc

wait_name_key:
	call    wait_for_key

	cp      NO_KEY
	jr      z, wait_name_key

	cp      'e'
	jr      z, loc_88D8

	cp      'p'
	jr      nz, loc_8868

	ld      a, ' '

loc_8868:
	cp      's'
	jr      z, loc_88C8

	cp      'c'
	jr      nz, loc_88A5

	ld      a, high KEYS_67890
	in      a, (low KEYS_67890)
	bit     0, a
	jr      nz, loc_88C8

	pop     bc
	pop     af
	dec     a
	jr      nz, loc_8882

	inc     a
	push    af
	push    bc
	jr      loc_88C8

; ---------------------------------------

loc_8882:
	dec     hl
	ld      (hl), $20 ; ' '
	dec     b
	push    af
	push    bc

	ld      a, ' '
	call    print_symbol
	call    get_sprite_colr

	or      COLOR.FLASH
	call    sprite_color

	inc     b

	xor     COLOR.FLASH
	call    sprite_color

wait_zero_up:
	ld      a, high KEYS_67890
	in      a, (low KEYS_67890)
	bit     0, a			; "0" key
	jr      z, wait_zero_up
	jr      loc_88C8

; ---------------------------------------

loc_88A5:
	pop     bc
	ld      d, a
	pop     af

	cp      9
	jr      z, loc_88C6

	push    af

	ld      a, d
	call    print_symbol

	ld      (hl), a
	inc     hl
	call    get_sprite_colr

	xor     COLOR.FLASH
	call    sprite_color

	inc     b
	call    get_sprite_colr

	or      COLOR.FLASH
	call    sprite_color

	pop     af
	inc     a

loc_88C6:
	push    af
	push    bc

loc_88C8:
	call    wait_for_key

	cp      'c'
	jr      z, loc_88D3

	cp      NO_KEY
	jr      nz, loc_88C8

loc_88D3:
	pop     bc
	pop     af
	jp      loc_8855
; ---------------------------------------

loc_88D8:
	pop     bc
	ex      de, hl
	pop     af

	call    get_sprite_colr

	xor     COLOR.FLASH
	call    sprite_color

	ret
