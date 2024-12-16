play_room:
	call random_scr_fade
	call print_info_line

	ld a,(CURRENT_ROOM)

	call find_room_address
	call show_room

blink_player:
	ld bc,(PLAYER_COL)
	ld a,COLOR.BLACK
	call sprite_color

	ei

	ld b,$05
pause_play:
	halt
	djnz pause_play

	ld bc,(PLAYER_COL)
	ld a,COLOR.WHITE
	call sprite_color

	ld b,$05
L8fca:
	halt
	push bc

	call wait_for_key

	inc a
	ld e,a

	call inkey_fire

	ld a,d
	or e
	pop bc
	jr nz,play_one_room

	djnz L8fca

	jr blink_player

play_one_room:
	call jp_to_prepare_for_play

	ret
