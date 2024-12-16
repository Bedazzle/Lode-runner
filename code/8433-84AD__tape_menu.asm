tape_menu:
	push af

	call random_scr_fade

	ld hl,TAPE_OPTION
	ld de,$0f44
	ld bc,$0301
	ld a,COLOR.BRIGHT + COLOR.GREEN

	call print_big_strng	; D=length, E=?, B=col, C=row, A=color

	pop af
	push af
	and a
	jr z,tape_print

	ld hl,SAVE_OPTION
tape_print:
	ld de,$0bc4
	ld a,COLOR.FLASH + COLOR.BRIGHT + COLOR.GREEN

	call print_big_strng

	ld bc,$060c
	ld d,$14
	ld hl,PRESS_BREAK
	ld a,COLOR.BRIGHT + COLOR.WHITE

	call print_string	; press break to abort

	ld bc,$0f0e
	ld d,$02

	call print_string	; or

	ld bc,$0410
	ld d,$18

	call print_string	; enter when tape is ready
L8472:
	call wait_for_key

	cp $65
	jr z,L8485

	cp $63
	jr z,L8481

	cp $70
	jr nz,L8472

L8481:
	pop af
	jp print_menu

	; ------------------------
L8485:
	ld hl,$5960
	ld b,$00
L848A:
	ld (hl),$00
	inc hl
	djnz L848A

	pop af

	ld hl,$0556		; LD-BYTES
	and a
	jr z,tape_init

	ld hl,$04c2		; SA-BYTES
	and a
	jr tape_proc

tape_init:
	scf
tape_proc:
	ld a,$ff
	ld ix,LEVELS	; AF24 = 44836 destination
	ld de,$50dc		; 20700 length
	ld bc,print_menu	; return address
	push bc

	jp (hl)
	jp print_menu
