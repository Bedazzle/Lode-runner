L75A9:  
	CALL random_scr_fade
	CALL print_info_line

	LD A,(CURRENT_ROOM)
	CALL find_room_address
	CALL show_room

L75B8:
	LD BC,(PLAYER_COL)
	LD A,$00
	CALL sprite_color

	EI
	LD B,$05
L75C4:
	HALT
	DJNZ L75C4

	LD BC,(PLAYER_COL)
	LD A,$07
	CALL sprite_color

	LD B,$05
L75D2:
	HALT
	PUSH BC
	CALL wait_for_key

	INC A
	LD E,A
	CALL inkey_fire

	LD A,D
	OR E
	POP BC
	JR NZ,L75E5

	DJNZ L75D2

	JR L75B8

L75E5:
	CALL jp_to_prepare_for_play

	RET
