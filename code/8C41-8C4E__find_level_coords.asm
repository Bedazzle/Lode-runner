; in: A = level No
; out: HL = coords address

find_level_coords:
	ld l,a
	ld h,$00
	add hl,hl	; x2
	add hl,hl	; x4
	push hl
	pop de
	add hl,hl	; x8
	add hl,de	; x12
	ld de,MEN_COORDS
	add hl,de

	ret
