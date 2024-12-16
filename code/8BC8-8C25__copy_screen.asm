copy_screen:
	ld      bc, $0A0B
	ld      a, COLOR.FLASH + COLOR.SKYBLUE
	call    sprite_color

	ld      b, $11
	call    enter_number

	push    af
	ld      (SOURCE_SCREEN), a
	inc     b
	ld      d, 4
	ld      hl, aToScreen        ; " TO "
	ld      a, COLOR.YELLOW
	call    print_string

	call    enter_number

	ld      (DEST_SCREEN), a

	call    find_room_address

	pop     af
	push    hl

	call    find_room_address

	ex      de, hl
	pop     hl
	ex      de, hl
	ld      bc, $0108
	ldir
	ld      a, (SOURCE_SCREEN)

	call    find_level_coords

	push    hl
	ld      a, (DEST_SCREEN)

	call    find_level_coords

	pop     de
	ex      de, hl
	ld      bc, $000C
	ldir

	ld      bc, $110B
	ld      hl, aSpaces     ; "          "
	ld      d, 8
	ld      a, COLOR.SKYBLUE
	call    print_string

	ld      bc, $0A0B
	ld      a, COLOR.YELLOW
	call    sprite_color

	jp      edit_loop
