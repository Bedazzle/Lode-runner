encode_level:
	ld de,TEMP_ROOM+1
	ld hl,TEMP_ROOM
	ld (hl),$00
	ld bc,263		;$0107
	ldir			; clear buffer

	call store_edited_men

	ld c,$15		; 21 rows
encode_rows:
	ld b,$1f		; 31 columns
encode_columns:
	push bc

	call object_by_coords

	ld b,$03		; 3 bits encoded object
encode_object:
	push bc
	rr a
	ld hl,TEMP_ROOM

	ld c,$08		; 33*8=264 bytes encoded level
loop_outer:
	ld b,$21		; 33

loop_encode:
	rr (hl)
	inc hl
	djnz loop_encode

	dec c
	jr nz,loop_outer

	pop bc
	djnz encode_object

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
