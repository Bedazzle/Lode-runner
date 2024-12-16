print_menu:
	call random_scr_fade

	xor a
	out (BORDER),a
	ld (VAR_BORDER),a

	ld ix,MENU_ATTR
	ld bc,$0100
	ld de,$1d44
	ld a,COLOR.BRIGHT + COLOR.GREEN
	ld hl,MENU_TEXTS
	call print_big_strng

show_menu_items:
	ld b,$07
	ld a,(ix+$00)		; menu color of FF terminator

	cp $ff
	jr z,refresh_menu

	inc ix
	ld c,(ix+$00)		; row
	inc ix
	ld d,(ix+$00)		; length
	inc ix

	call print_string

	jr show_menu_items


refresh_menu:
	ld a,(INPUT_METHOD)
	add a,a
	add a,$04
	ld c,a
	ld b,$06			; col pos of bar
	ld d,$0f			; width of flashed bar

	ld a,COLOR.FLASH + COLOR.WHITE

set_menu_flash:
	call sprite_color

	inc b
	dec d
	jr nz,set_menu_flash


loop_main_wait:
	call wait_for_key

	cp '6'				; 6 Load screens
	jr nz,check_save

	xor a
	jp tape_menu

check_save:
	cp '7'				; 7 Save screens
	jr nz,check_edit

	ld a,$01
	jp tape_menu

check_edit:
	cp '8'				; 8 Edit screens
	jp z,edit_screen

	; check for exit DOS
	cp 'F'				; key F
	jr nz,check_menu_digits

	call wait_keypress

	cp 'I'				; key I
	jr nz,check_menu_digits

	call wait_keypress

	cp 'D'				; key D
	jr nz,check_menu_digits

exit_dos:
	ld a,$38
	ld (VAR_BORDER),a

	ld a,$07
	out (BORDER),a

	ld sp,(KEEP_STACK)
	im 1
	ei

	ret


wait_keypress:
	call wait_for_key

	cp $ff
	jr nz,wait_keypress

loop_keypress:
	call wait_for_key

	cp $ff
	jr z,loop_keypress

	ret


check_menu_digits:
	cp '0'
	jp z,start_game

	cp '5'
	jp z,jump_redefine

	cp '1'
	jr c,loop_main_wait

	cp '5'
	jr nc,loop_main_wait

input_method:
	; 1 keyboard
	; 2 kempston
	; 3 interface 2
	; 4 cursor
	sub '1'
	ld hl,INPUT_METHOD

	cp (hl)
	jr z,loop_main_wait

	ld (hl),a
	ld hl,ATTRIB + $80
	ld b,$00

reset_menu_flash:
	res 7,(hl)
	inc hl
	djnz reset_menu_flash

	jp refresh_menu
