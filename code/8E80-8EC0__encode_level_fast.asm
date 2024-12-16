encode_level:
	ld de,TEMP_ROOM+1
	ld hl,TEMP_ROOM
	;ld (hl),$00
	ld (hl),%10000000
	ld bc,263		;$0107
	ldir			; clear buffer

	call store_edited_men

	ld hl, TEMP_ROOM + 263

	ld c,$15		; 21 rows
encode_rows:
	ld b,$1f		; 31 columns
encode_columns:
	push bc

	push hl
	call object_by_coords
	pop hl

	rra
	rr (hl)
	jr nc, encode_b1
	
	dec hl
encode_b1:
	rra
	rr (hl)
	jr nc, encode_b2
	
	dec hl
encode_b2:
	rra
	rr (hl)
	jr nc, encode_b3
	
	dec hl
encode_b3:

	pop bc

	ld a,' '
	;ld a, '#'
	call print_symbol

	dec b
	bit 7,b
	jr z,encode_columns

	dec c
	ld a,c

	cp $ff
	jr nz,encode_rows

	ret

	;defs 2, 0