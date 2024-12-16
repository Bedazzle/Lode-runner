hall_of_fame:
	call    random_scr_fade

	ld      a, COLOR.BRIGHT + COLOR.SKYBLUE
	ld      hl, aLodeRunner_2 		; "LODE RUNNER"
	ld      bc, $0A03
	ld      de, $0B45
	call    print_big_strng

	ld      bc, $0912
	ld      a, COLOR.BRIGHT + COLOR.SKYBLUE
	ld      de, $0C45
	call    print_big_strng

	ld      c, 7						; screen row
	ld      e, 5						; length of list
	ld      hl, HALL_OF_FAME
	ld      a, COLOR.BRIGHT + COLOR.WHITE

print_score_line:
	push    de
	ld      b, a
	ld      a, (CHEATED)

	cp      e
	jr      nz, no_bright_change

force_bright:
	set     7, b

no_bright_change:
	ld      a, b
	inc     hl
	inc     hl

	ld      b, 7
	call    sprite_color		; empty cell

	inc     b
	ld      d, 7

	call    print_string		; score
	call    sprite_color		; empty cell

	inc     b
	call    sprite_color		; empty cell

	inc     b
	call    sprite_color		; empty cell

	inc     b
	ld      d, 8
	call    print_string		; name

	inc     c
	inc     c
	dec     a
	res     7, a
	pop     de
	dec     e
	jr      nz, print_score_line

	ret
