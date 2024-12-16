show_demo:
	call    random_scr_fade
	call    clear_score

	xor     a
	ld      (LIVES), a

	ld      a, (ROOM_NO)
	push    af
	add     a, 5

	cp      LEVELS_COUNT + 1	; 75 levels total
	jr      nz, loc_81D5

	ld      a, 1

loc_81D5:
	ld      (ROOM_NO), a

	xor     a
	ld      (L8F73+1), a
	ld      (L8F91), a		; !!! set SMC

	pop     af
	ld      c, a
	ld      b, 5

loop_demo_room:
	push    bc
	ld      a, c
	ld      (CURRENT_ROOM), a
	push    af

	call    print_info_line

	ld      bc, $0216
	ld      hl, aPressAnyKeyFor
	ld      d, $1B
	ld      a, COLOR.BRIGHT + COLOR.MAGENTA
	call    print_string

	pop     af

	call    find_room_address
	call    show_room

	ld      b, 100
wait_demo_room:
	halt
	djnz    wait_demo_room

	pop     bc
	inc     c
	djnz    loop_demo_room

	ret
