enter_level_number:
L6F80:
	LD A,' '
	CALL print_symbol

	INC B
	CALL print_symbol

	LD A,PAPER.BLACK + COLOR.SKYBLUE
	CALL sprite_color

	DEC B
	CALL sprite_color
L6F92:
	CALL press_key

	CP $FF
	JR NZ,L6F92

L6F99:
	CALL press_key

	CP '0'
	JR C,L6F99

	CP '8'
	JR NC,L6F99

	CALL print_symbol

	SUB '0'
	LD H,A
	INC B
L6FAB:
	CALL press_key

	CP $FF
	JR NZ,L6FAB

L6FB2:
	CALL press_key

	CP 'c'
	JR NZ,L6FBC

	DEC B
	JR L6F80

L6FBC:
	CP '0'
	JR C,L6FB2

	CP ':'
	JR NC,L6FB2

	CALL print_symbol

	SUB '0'
	LD L,A
L6FCA:
	CALL press_key

	CP 'c'
	JR NZ,L6FD4

	DEC B
	JR L6F80

L6FD4:
	CP 'e'
	JR NZ,L6FCA

	LD A,H
	ADD A,A
	LD D,A
	ADD A,A
	ADD A,A
	ADD A,D
	ADD A,L
	AND A
	JR NZ,L6FE5

	DEC B
	JR L6F80

L6FE5:
	CP 'L'
	RET C

	DEC B
	JR L6F80

	PUSH HL
	PUSH BC
	CALL wait_for_key

	POP BC
	POP HL
	RET
