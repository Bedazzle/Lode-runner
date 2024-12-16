start_game:
	call    clear_score

	ld      a, INITIAL_ROOM
	ld      (CURRENT_ROOM), a

	ld      a, INITIAL_LIVES
	ld      (LIVES), a

	xor     a				; code "NOP"
	ld      (L8F73+1), a		; !!! set SMC

	ld      a, $C9			; code "RET"
	ld      (L8F91), a		; !!! set SMC

	call    random_scr_fade

	ld      bc, $0A0B
	ld      de, $0D47
	ld      a, COLOR.BRIGHT + COLOR.WHITE
	ld      hl, aPressAnyKey_0 ; "PRESS ANY KEY"
	call    print_big_strng

	ld      b, $19

loop_start_game:
	halt
	djnz    loop_start_game

waitkey_start:
	call    wait_for_key

	cp      $FF
	jr      z, waitkey_start

loop_play_room:
	call    play_room

	and     a
	jr      nz, room_done

	ld      hl, LIVES
	dec     (hl)            ; decrease life
	jr      nz, loop_play_room

	jp      game_over
