get_player_move:
	ld      a, (PLAYER_DATA)

	cp      STATUS.FALLING	;1
	jr      z, player_move		; disable inkey when falling ?

	; -----------
	call    inkey_leftright

	ld      b, d		; 1=right, -1=left, 0=none
	push    bc

	call    inkey_updown

	pop     bc
	ld      c, d		; 1=down, -1=up, 0=none
	ld      (PLAYER_DIRECT), bc
	; -----------

player_move:
	ld      ix, PLAYER_DATA
	call    calc_and_run

	ld      bc, (COPY_MAN_COORDS)
	ld      a, c
	or      b
	and     7
	jp      nz, check_collected_boxes

	call    object_by_pixels

	cp      OBJECT.BOX
	jp      nz, check_collected_boxes
