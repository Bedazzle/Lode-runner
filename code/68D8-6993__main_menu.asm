main_menu:
;L68d8:
	CALL random_scr_fade
	XOR A
	OUT ($FE),A
	LD (#5C48),A
	LD IX,MENU_ATTR
	LD BC,$0100
	LD DE,$1D44
	LD A,PAPER.BLACK + COLOR.GREEN + COLOR.BRIGHT
	LD HL,MENU_TEXTS
	CALL print_big_strng

L68F3:	
	LD B,$07
	LD A,(IX+$00)
	CP $FF
	JR Z,L690D

	INC IX
	LD C,(IX+$00)
	INC IX
	LD D,(IX+$00)
	INC IX
	CALL print_string
	JR L68F3

L690D:
	LD A,(INPUT_METHOD)
	ADD A,A
	ADD A,#04
	LD C,A
	LD B,#06
	LD D,#0F
	LD A,#87
L691A:
	CALL sprite_color

	INC B
	DEC D
	JR NZ,L691A
	
L6921:
	CALL wait_for_key

	CP '6'
	JR NZ,L692C

	XOR A
	JP tape_menu

L692C:
	CP '7'
	JR NZ,L6935

	LD A,$01
	JP tape_menu

L6935:
	CP '8'
	JP Z,edit_screen

	CP 'F'
	JR NZ,L696C

	CALL wait_keypress

	CP 'I'
	JR NZ,L696C

	CALL wait_keypress

	CP 'D'
	JR NZ,L696C

	LD A,#38
	LD (#5C48),A
	LD A,$07
	OUT ($FE),A

	LD SP,(KEEP_STACK)
	IM 1
	EI
	RET

L695D:
	CALL wait_for_key

	CP $FF
	JR NZ,L695D

L6964:
	CALL wait_for_key

	CP $FF
	JR Z,L6964

	RET

L696C:
	CP '0'
	JP Z,start_game

	CP '5'
	JP Z,jump_redefine

	CP '1'
	JR C,L6921	; select input

	CP '5'
	JR NC,L6921	; select input

	SUB '1'
	LD HL,INPUT_METHOD
	CP (HL)
	JR Z,L6921

	LD (HL),A
	LD HL,#5880
	LD B,#00
L698C:
	RES 7,(HL)
	INC HL
	DJNZ L698C

	JP refresh_menu
