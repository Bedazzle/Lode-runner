L6b09:
	PUSH AF
	PUSH BC
	PUSH DE
	PUSH HL

	LD H,$40
	PUSH AF
	LD A,C
	AND $18
	OR H
	LD H,A
	LD L,B
	SLA C
	SLA C
	SLA C
	SLA C
	SLA C
	LD B,$00
	ADD HL,BC
	POP AF
	PUSH HL
	LD HL,GFX
	LD B,$00
	ADD A,A
	JR NC,L6B2F

	LD B,$04
L6B2F:
	ADD A,A
	JR NC,L6B34

	SET 1,B
L6B34:
	ADD A,A
	JR NC,L6B38

	INC B
L6B38:
	LD C,A
	ADD HL,BC
	EX DE,HL
	POP HL
	LD B,$08

L6B3E:
	LD A,(DE)
	LD (HL),A
	INC H
	INC DE
	DJNZ L6B3E

	POP HL
	POP DE
	POP BC
	POP AF
	RET
