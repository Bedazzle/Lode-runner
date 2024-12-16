print_big_strng:
	push    af

	call    sprite_color

	ld      a, (hl)

	cp      ' '
	jr      nz, loc_881C

	ld      a, $5D		; 93 ']'

loc_881C:
	cp      ':'
	jr      nc, loc_8822

	add     a, $3B		; 59 ';'

loc_8822:
	sub     'A'			; 65 = $41
	add     a, a
	add     a, '['		; [ = sprite 91 = upper part of big "A"

	call    print_symbol

	inc     c			; next row
	inc     a			; lower part of big symbol

	call    print_symbol

	ld      a, e
	call    sprite_color

	pop     af
	dec     c
	inc     b
	inc     hl
	dec     d
	jr      nz, print_big_strng

	ret
