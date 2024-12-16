L7257:
	LD BC,$0A07
	LD A,PAPER.BLACK + COLOR.SKYBLUE + COLOR.FLASH
	CALL sprite_color

	LD B,$11
	CALL enter_number

	PUSH AF
	PUSH HL
	CALL clear_screen

	LD A,(INPUT_METHOD)
	LD (KEEP_MENU_SEL),A
	XOR A
	LD (INPUT_METHOD),A
	LD A,$0B
	LD (L8F73+1),A		; !!! SMC
	LD A,$C9
	LD (L8F91),A
	LD A,COLOR.BLUE
	OUT ($FE),A
	LD A,$0F
	LD (VAR_BORDER),A
	LD BC,$0016
	LD D,$40
	LD HL,EDIT_KEYS_1
	CALL print_string

	POP HL
	LD A,H
	LD BC,$0E17
	ADD A,'0'
	CALL print_symbol

	INC B
	LD A,L
	ADD A,'0'
	CALL print_symbol

	POP AF
	LD (CURRENT_ROOM),A
	CALL find_room_address
	CALL show_room

	LD BC,$0000
	LD (PLAYER_COL),BC
	CALL get_sprite_colr

	XOR COLOR.FLASH
	CALL sprite_color

	XOR A
	LD (L8DDE),A
	LD BC,$0216
	CALL get_sprite_colr

	OR $80
	CALL sprite_color

	LD BC,$0617
	LD A,PAPER.BLUE + COLOR.MAGENTA + COLOR.BRIGHT
	CALL sprite_color
	CALL wait_for_key

	CP '0'
	JR C,L7308

	CP ':'
	JR NC,L7308

	SUB '0'
	PUSH AF
	ADD A,A
	ADD A,A
	ADD A,$02
	LD B,A
	LD C,$16
	CALL get_sprite_colr

	XOR COLOR.FLASH
	CALL sprite_color

	LD A,(L8DDE)
	ADD A,A
	ADD A,A
	ADD A,$02
	LD B,A
	LD C,$16
	CALL get_sprite_colr

	XOR COLOR.FLASH
	CALL sprite_color

	POP AF
	LD (L8DDE),A

	JP L8CCA

L7308:
	CP $70
	JR NZ,L732F

	CALL encode_level

	LD A,(CURRENT_ROOM)
	CALL find_room_address

	LD DE,TEMP_ROOM
	EX DE,HL
	LD BC,$0108		; 264
	LDIR
	XOR A
	OUT ($FE),A
	LD A,COLOR.WHITE
	LD (VAR_BORDER),A
	LD A,(KEEP_MENU_SEL)
	LD (INPUT_METHOD),A
	JP edit_screen

L732F:
	CALL inkey_updown

	LD E,D
	CALL inkey_leftright

	LD HL,(PLAYER_COL)
	PUSH HL
	LD A,L
	ADD A,E
	LD L,A
	LD A,H
	ADD A,D
	LD H,A
	CP $FF
	JR Z,L7351

	CP ' '
	JR Z,L7351

	LD A,L
	CP $FF
	JR Z,L7351

	CP $16
	JR NZ,L7354

L7351:
	LD HL,(PLAYER_COL)

L7354:
	LD (PLAYER_COL),HL
	POP BC
	CALL get_sprite_colr

	XOR COLOR.FLASH
	CALL sprite_color

	PUSH HL
	POP BC
	CALL get_sprite_colr

	XOR COLOR.FLASH
	CALL sprite_color
	CALL inkey_fire

	LD A,D
	AND A
	JR Z,L7389

	LD A,(L8DDE)
	LD BC,(PLAYER_COL)
	CP $08
	JR NC,L7391

	PUSH BC
	CALL show_cell

	POP BC
L7381:
	CALL get_sprite_colr

	XOR COLOR.FLASH
	CALL sprite_color

L7389:
	LD B,$05
L738B:
	HALT
	DJNZ L738B

	JP L8CCA

L7391:  
	CP $08
	PUSH AF
	LD A,$1E		; man sprite
	CALL print_symbol

	POP AF
	LD A,PAPER.BLACK + COLOR.WHITE
	JR Z,L73A0

	LD A,PAPER.BLACK + COLOR.MAGENTA + COLOR.BRIGHT

L73A0:
	CALL sprite_color

	JR L7381
