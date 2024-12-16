L7488:
	LD DE,TEMP_ROOM+1
	LD HL,TEMP_ROOM
	LD (HL),$00
	LD BC,$0107		; 263
	LDIR
	CALL store_edited_men

	LD C,$15
L749A:
	LD B,$1F
L749C:
	PUSH BC
	CALL object_by_coords

	LD B,$03
L74A2:
	PUSH BC
	RR A
	LD HL,TEMP_ROOM
	LD C,$08
L74AA:
	LD B,$21
L74AC:
	RR (HL)
	INC HL
	DJNZ L74AC

	DEC C
	JR NZ,L74AA

	POP BC
	DJNZ L74A2

	POP BC
	LD A,$20
	CALL print_symbol

	DEC B
	BIT 7,B
	JR Z,L749C

	DEC C
	LD A,C
	CP $FF
	JR NZ,L749A

	RET
