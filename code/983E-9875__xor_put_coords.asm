xor_put_coords:
	srl     b
	srl     b
	srl     b
	srl     c
	srl     c
	srl     c

xor_put_sprite:
	push    bc
	push    de
	push    hl
	push    af
	ld      a, $18
	and     c
	add     a, $40
	ld      h, a
	ld      a, c			; row
	add     a, a			; x2
	add     a, a			; x4
	add     a, a			; x8
	add     a, a			; x16
	add     a, a			; x32
	add     a, b			; add column
	ld      l, a
	pop     af
	push    hl			; screen address

	ld      l, a
	ld      h, 0
	add     hl, hl		; x2
	add     hl, hl		; x4
	add     hl, hl		; x8
	ld      de, GFX
	add     hl, de
	pop     de			; screen address
	ld      b, 8

loop_xor_put:
	ld      a, (de)
	xor     (hl)
	ld      (de), a
	inc     hl
	inc     d
	djnz    loop_xor_put

	pop     hl
	pop     de
	pop     bc

	ret
