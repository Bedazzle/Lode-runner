show_room:  
	ld de,TEMP_ROOM		;LEVELS-300	; $adf8
	di
	ld bc,$0108			; 264
	ldir

	ld c,$00
looop_show_row:
	ld b,$00
looop_show_col:
	push bc
	ld a,(TEMP_ROOM)
	and $E0				; 1110 0000


	; optimize for speed rlc a three times
	; 6 bytes, 7+5*8+4*13+8=107 Ts
	ld b,$05
loop_srl:
	srl a				; shift A right
	djnz loop_srl

	; 6 bytes, 24 Ts
	;rlc a
	;rlc a
	;rlc a

	; 5+1 bytes, 20+4 Ts
	;and a
	;rla
	;rla
	;rla
	;rla
	;nop	; <- remove

	; optimize end

	push af

	; --------------
	ld b,$03			; scroll whole room data 3 bits left
loop_3_bits:
	push bc
	and a
	ld hl,TEMP_ROOM+263		;$aeff

	ld c,$08				; 8 x 33 = 264  ($08 x $21 = $108)
loop_264_bytes:
	ld b,$21				; 33
loop_33_bytes:
	rl (hl)
	dec hl
	djnz loop_33_bytes

	dec c
	jr nz,loop_264_bytes

	pop bc
	djnz loop_3_bits
	; --------------

	pop af
	pop bc

	call show_cell

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
