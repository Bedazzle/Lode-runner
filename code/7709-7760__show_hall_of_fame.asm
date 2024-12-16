show_hall_of_fame:
	CALL random_scr_fade

	LD A,PAPER.BLACK + COLOR.SKYBLUE + COLOR.BRIGHT
	LD HL,aLodeRunner_2
	LD BC,$0A03
	LD DE,$0B45
	CALL print_big_strng

	LD BC,$0912
	LD A,PAPER.BLACK + COLOR.SKYBLUE + COLOR.BRIGHT
	LD DE,$0C45
	CALL print_big_strng

	LD C,$07
	LD E,$05
	LD HL,HALL_OF_FAME
	LD A,PAPER.BLACK + COLOR.WHITE + COLOR.BRIGHT

L772E:
	PUSH DE
	LD B,A
	LD A,(CHEATED)
	CP E
	JR NZ,L7738

	SET 7,B
L7738:
	LD A,B
	INC HL
	INC HL
	LD B,PAPER.BLACK + COLOR.WHITE
	CALL sprite_color

	INC B
	LD D,$07
	CALL print_string
	CALL sprite_color

	INC B
	CALL sprite_color

	INC B
	CALL sprite_color

	INC B
	LD D,$08
	CALL print_string

	INC C
	INC C
	DEC A
	RES 7,A
	POP DE
	DEC E
	JR NZ,L772E

	RET
