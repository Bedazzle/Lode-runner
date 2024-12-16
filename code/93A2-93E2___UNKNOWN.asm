	di

check_collected_boxes:
	ld      a, (BOXES_LEFT)
	and     a
	jr      nz, need_more_boxes	; not all collected

	ld      a, (COPY_MAN_COORDS)
	and     a
	jp      z, level_exit		; exit if on room top

need_more_boxes:
	call    sub_9D05

	ld      a, (GAME_TIMER)
	and     3

	call    z, sub_9E1F
	call    inkey_fire

	ld      a, d
	and     a
	jr      nz, loc_93C6

	xor     a
	ld      (byte_A172), a

loc_93C6:
	ei
	halt
	di

	call    wait_for_key

	nop
	nop
	nop
	nop
	nop

	cp      'H'				; halt game
	jr      nz, loc_93E3

pause_waitkey:
	call    wait_for_key

	cp      NO_KEY
	jr      nz, pause_waitkey

pause_endkey:
	call    wait_for_key

	cp      NO_KEY
	jr      z, pause_endkey
