;	ds 13,0

show_room:  
	ld e,1

	ld c,$00
looop_show_row:
	ld b,$00
looop_show_col:
	;*************
	xor a

bit_1:
	rlc (hl)		; 2
	rla				; 1
	rlc e			; 2
	
	jr nc, bit_2	; 2
	inc hl			; 1
bit_2:
	rlc (hl)
	rla
	rlc e
	
	jr nc, bit_3
	inc hl
bit_3:
	rlc (hl)
	rla
	rlc e

	jr nc, ready
	inc hl
ready:
	
	;push bc
	push de
	push hl
	call show_cell
	pop hl
	pop de
	;pop bc

	inc b
	bit 5,b				; 32
	jr z,looop_show_col

	inc c
	ld a,c

	cp $16				; 22
	jr nz,looop_show_row
	
	
	ei

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
	add hl,de	; HL = room number x 12 + MEN_COORDS

	ld a,(hl)
	ld (PLAYER_COL),a

	inc hl

	ld a,(hl)				; rrrr reee		r = player row, e = enemy count
	ld b,a
	and $07
	ld (ENEMY_COUNT),a

	ld a,b
	srl a
	srl a
	srl a
	ld (PLAYER_ROW),a
	inc hl

	ld de,ENEMIES
	ld bc,$000a
	ldir					; copy enemies coords

	ld bc,(PLAYER_COL)		; player coords, C=col, b=row

	ld a,SPRITE.MAN			; player
	call print_symbol

	ld a,COLOR.WHITE
	call sprite_color

	ld a,(ENEMY_COUNT)
	ld d,a
	ld hl,ENEMIES
	
show_enemies:
	ld c,(hl)				; enemy col
	inc hl

	ld b,(hl)				; enemy row
	inc hl

	ld a,SPRITE.MAN			; enemy
	call print_symbol

	ld a,COLOR.BRIGHT + COLOR.MAGENTA
	call sprite_color

	dec d
	jr nz,show_enemies

	ret

	ds 13+2,0
