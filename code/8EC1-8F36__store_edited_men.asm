store_edited_men:
	ld c,$00
	ld d,$00
	ld iy,ENEMIES

	ld hl,$0001
	ld (PLAYER_COL),hl
	inc h
	ld (ENEMIES),hl

L8ed3:
	ld b,$00

L8ed5:
	call get_sprite_colr
	and $7f

	cp $07
	jr nz,L8eeb

	push bc

	ld a,b
	add a,a
	add a,a
	add a,a
	ld b,a

	ld (PLAYER_COL),bc
	pop bc
	jr L8f06

L8eeb:
	cp COLOR.BRIGHT + COLOR.MAGENTA	;$43
	jr nz,L8f06

	ld a,d

	cp $05
	jr nz,L8efb

	ld a,' '
	call print_symbol

	jr L8f06

L8efb:
	inc d
	ld (iy+$00),c
	ld (iy+$01),b
	inc iy
	inc iy

L8f06:
	inc b
	bit 5,b
	jr z,L8ed5

	inc c
	ld a,$16

	cp c
	jr nz,L8ed3

	inc d
	dec d
	jr nz,L8f16

	inc d

L8f16:
	ld a,(PLAYER_ROW)
	or d
	ld (PLAYER_ROW),a

	ld a,(CURRENT_ROOM)
	ld l,a
	ld h,$00
	add hl,hl	; x2
	add hl,hl	; x4
	push hl
	pop de
	add hl,hl	; x8
	add hl,de	; x12
	ld de,MEN_COORDS
	add hl,de	; HL=room no x 12 + MEN_COORDS

	ld de,PLAYER_COL
	ld bc,$000c
	ex de,hl
	ldir

	ret
