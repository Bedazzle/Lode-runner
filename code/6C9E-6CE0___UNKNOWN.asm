L6C9E:
	PUSH BC
	PUSH AF
	LD H,$58
	LD DE,#0202
	LD A,B
	AND $F8
	CP B
	JR Z,L6CAC

	INC D
L6CAC:
	SRL B
	SRL B
	SRL B
	LD L,B
	LD A,C
	AND $F8
	CP C
	JR Z,L6CBA

	INC E
L6CBA:
	LD A,C
	AND $F8
	LD B,$00
	ADD A,A
	JR NC,L6CC4

	LD B,$02
L6CC4:
	ADD A,A
	JR NC,L6CC8

	INC B
L6CC8:
	LD C,A
	ADD HL,BC
	LD BC,$001E
	LD A,D
	CP $03
	JR NZ,L6CD3

	DEC C
L6CD3:
	POP AF
L6CD4:
	PUSH DE
L6CD5:
	LD (HL),A
	INC HL
	DEC D
	JR NZ,L6CD5

	POP DE
	ADD HL,BC
	DEC E
	JR NZ,L6CD4

	POP BC
	RET 
