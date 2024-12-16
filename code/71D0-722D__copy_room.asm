copy_room:
	LD BC,$0A0B
	LD A,PAPER.BLACK + COLOR.SKYBLUE + COLOR.FLASH
	CALL sprite_color

	LD B,$11
	CALL enter_number

	PUSH AF
	LD (SOURCE_SCREEN),A
	INC B
	LD D,$04
	LD HL,aToScreen
	LD A,PAPER.BLACK + COLOR.YELLOW
	CALL print_string
	CALL enter_number

	LD (DEST_SCREEN),A
	CALL find_room_address

	POP AF
	PUSH HL
	CALL find_room_address

	EX DE,HL
	POP HL
	EX DE,HL
	LD BC,264	;$0108
	LDIR
	LD A,(SOURCE_SCREEN)
	CALL find_level_coords

	PUSH HL
	LD A,(DEST_SCREEN)
	CALL find_level_coords

	POP DE
	EX DE,HL
	LD BC,$000C	; 12
	LDIR
	LD BC,$110B
	LD HL,aSpaces
	LD D,$08
	LD A,PAPER.BLACK + COLOR.SKYBLUE
	CALL print_string

	LD BC,$0A0B
	LD A,PAPER.BLACK + COLOR.YELLOW
	CALL sprite_color

	JP edit_loop
