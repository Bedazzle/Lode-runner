show_infoline:
	LD BC,$0017
	LD D,$20
	LD A,$05
	LD HL,aScoreLivesLeve
	CALL print_string

	LD HL,$0000
	LD A,(CURRENT_ROOM)
L6841:
	CP $0A
	JR C,L684A

	SUB $0A
	INC H
	JR L6841

L684A:
	ADD A,'0'
	LD BC,$1F17
	CALL print_symbol

	DEC B
	LD A,H
	ADD A,'0'
	CALL print_symbol

	LD A,PAPER.BLACK + COLOR.YELLOW + COLOR.BRIGHT
	CALL sprite_color

	INC B
	CALL sprite_color

	LD B,$16
	LD A,(LIVES)
	LD H,0
L6869:
	CP 100
	JR C,L6872

	SUB 100
	INC H
	JR L6869

L6872:	
	CP 10
	JR C,L687B

	SUB 10
	INC L
	JR L6872

L687B:	
	ADD A,'0'
	CALL print_symbol

	DEC B
	LD A,L
	ADD A,'0'
	CALL print_symbol

	DEC B
	LD A,H
	ADD A,'0'
	CALL print_symbol

	LD A,$46
	CALL sprite_color

	INC B
	CALL sprite_color

	INC B
	CALL sprite_color

	LD D,$07
	LD B,$06
	LD HL,SCORE_TXT
	CALL print_string

	LD BC,$0016
L68A8:
	LD A,$05
	CALL print_symbol

	LD A,PAPER.BLACK + COLOR.MAGENTA
	CALL sprite_color

	INC B
	BIT 5,B
	JR Z,L68A8

	RET
