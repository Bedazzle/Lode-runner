edit_screens:
	ld bc,$0a07

	ld a,COLOR.FLASH + COLOR.SKYBLUE	
	call sprite_color

	ld b,$11
	call enter_number	; enter room No, HL = entered number

	push af
	push hl

	call clear_screen

	ld a,(INPUT_METHOD)
	ld (KEEP_MENU_SEL),a

	xor a
	ld (INPUT_METHOD),a

	ld a,$0b
	ld (L8F73+1),a		; !!! set SMC

	ld a,$c9
	ld (L8F91),a		; !!! set SMC

	ld a,COLOR.BLUE
	out (BORDER),a

	ld a,PAPER.BLUE + COLOR.WHITE
	ld (VAR_BORDER),a

	ld bc,$0016
	ld d,$40
	ld hl,EDIT_KEYS_1
	call print_string	; print editor help

	pop hl
	ld a,h
	ld bc,$0e17

	add a,$30
	call print_symbol

	inc b
	ld a,l
	add a,$30
	call print_symbol

	pop af

	ld (CURRENT_ROOM),a
	call find_room_address
	call show_room

	ld bc,$0000
	ld (PLAYER_COL),bc
	call get_sprite_colr

	xor COLOR.FLASH
	call sprite_color

	xor a
	ld (L8DDE),a

	ld bc,$0216
	call get_sprite_colr

	or COLOR.FLASH
	call sprite_color

	ld bc,$0617

	ld a,COLOR.BRIGHT + PAPER.BLUE + COLOR.MAGENTA
	call sprite_color

L8CCA:
	call wait_for_key

	cp '0'
	jr c,L8d00

	cp ':'
	jr nc,L8d00

	sub '0'
	push af
	add a,a
	add a,a
	add a,$02
	ld b,a
	ld c,$16

	call get_sprite_colr

	xor COLOR.FLASH
	call sprite_color

	ld a,(L8DDE)
	add a,a
	add a,a
	add a,$02
	ld b,a
	ld c,$16

	call get_sprite_colr

	xor COLOR.FLASH
	call sprite_color

	pop af
	ld (L8DDE),a

	jp L8CCA

L8d00:
	cp 'p'
	jr nz,L8d27

	call encode_level

	ld a,(CURRENT_ROOM)
	call find_room_address

	ld de,TEMP_ROOM
	ex de,hl
	ld bc,$0108
	ldir

	xor a
	out (BORDER),a

	ld a,COLOR.WHITE
	ld (VAR_BORDER),a

	ld a,(KEEP_MENU_SEL)
	ld (INPUT_METHOD),a

	jp edit_screen

L8d27:
	call inkey_updown

	ld e,d

	call inkey_leftright

	ld hl,(PLAYER_COL)
	push hl
	ld a,l
	add a,e
	ld l,a
	ld a,h
	add a,d
	ld h,a

	cp $ff
	jr z,L8D49

	cp $20
	jr z,L8D49

	ld a,l

	cp $ff
	jr z,L8D49

	cp $16
	jr nz,L8D4C

L8D49:
	ld hl,(PLAYER_COL)
L8D4C:
	ld (PLAYER_COL),hl
	pop bc

	call get_sprite_colr

	xor COLOR.FLASH
	call sprite_color

	push hl
	pop bc

	call get_sprite_colr

	xor COLOR.FLASH
	call sprite_color

	call inkey_fire

	ld a,d
	and a
	jr z,do_pause

	ld a,(L8DDE)
	ld bc,(PLAYER_COL)

	cp $08
	jr nc,L8D89

	push bc

	call show_cell

	pop bc

L8D79:
	call get_sprite_colr

	xor COLOR.FLASH
	call sprite_color

do_pause:
	ld b,$05
loop_pause:
	halt
	djnz loop_pause

	jp L8CCA


L8D89:
	cp $08
	push af

	ld a,SPRITE.MAN
	call print_symbol

	pop af
	ld a,COLOR.WHITE
	jr z,set_man_color

	ld a,COLOR.BRIGHT + COLOR.MAGENTA
set_man_color:
	call sprite_color

	jr L8D79
