print_info_line:
	ld      bc, $0017
	ld      d, $20
	ld      a, COLOR.SKYBLUE
	ld      hl, aScoreLivesLeve
	call    print_string

	ld      hl, 0
	ld      a, (CURRENT_ROOM)

loc_8239:
	cp      10
	jr      c, loc_8242

	sub     10
	inc     h
	jr      loc_8239
; ---------------------------------------

loc_8242:
	add     a, '0'
	ld      bc, $1F17
	call    print_symbol

	dec     b
	ld      a, h
	add     a, '0'
	call    print_symbol

	ld      a, COLOR.BRIGHT + COLOR.YELLOW
	call    sprite_color

	inc     b
	call    sprite_color

	ld      b, $16
	ld      a, (LIVES)
	ld      h, 0

loc_8261:
	cp      100
	jr      c, loc_826A

	sub     100
	inc     h
	jr      loc_8261
; ---------------------------------------

loc_826A:
	cp      10
	jr      c, loc_8273

	sub     10
	inc     l
	jr      loc_826A
; ---------------------------------------

loc_8273:
	add     a, '0'
	call    print_symbol

	dec     b
	ld      a, l

	add     a, '0'
	call    print_symbol

	dec     b
	ld      a, h

	add     a, '0'
	call    print_symbol

	ld      a, COLOR.BRIGHT + COLOR.YELLOW
	call    sprite_color

	inc     b
	call    sprite_color

	inc     b
	call    sprite_color

	ld      d, 7
	ld      b, 6
	ld      hl, SCORE_TXT
	call    print_string

	ld      bc, $0016

loc_82A0:
	ld      a, 5
	call    print_symbol

	ld      a, COLOR.MAGENTA
	call    sprite_color

	inc     b
	bit     5, b
	jr      z, loc_82A0

	ret
