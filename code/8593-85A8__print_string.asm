; B=col
; C=row
; D=length
; A=color

print_string:
	push    af

	ld      a, (hl)
	call    print_symbol

	pop     af
	call    sprite_color

	inc     b
	bit     5, b            ; check if B (column) is 32
	jr      z, next_symbol

	ld      b, 0
	inc     c               ; go to next row

next_symbol:
	inc     hl
	dec     d
	jr      nz, print_string

	ret
