edit_screen:
	call random_scr_fade

	ld bc,$0100
	ld a,COLOR.BRIGHT + COLOR.GREEN
	ld de,$1d44
	ld hl,GAME_GENERATOR

	call print_big_strng

	ld c,$07
	ld e,$04
	ld a,COLOR.YELLOW
loop_menu_gen:
	ld d,$08
	ld b,$0a

	call print_string

	inc c
	inc c
	dec e
	jr nz,loop_menu_gen

	ld bc,$0517
	ld d,$15
	ld hl,SPACELINE
	ld a,COLOR.BRIGHT + COLOR.WHITE

	call print_string

edit_loop:
	call wait_for_key

	cp $34			; 4 Return
	jp z,print_menu

	cp $33			; 3 Move
	jp z,copy_screen

	cp $32			; 2 Test
	jp z,test_screen

	cp $31			; 1 Edit
	jp z,edit_screens

	jr edit_loop
