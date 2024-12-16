L6B74:
	LD A,$FF
	PUSH BC
	PUSH HL
	LD H,$58
	LD L,B
	SLA C
	SLA C
	SLA C
	SLA C
	JR NC,L6B87
	INC H
	INC H
L6B87:
	SLA C
	JR NC,L6B8C
	INC H
L6B8C:
	LD B,$00
	ADD HL,BC
	CP $FF
	JR NZ,L6B97

	; ------------ optimize start
	LD A,(HL)	; add jr to second pop hl
	POP HL
	POP BC
	RET

L6B97:
	LD (HL),A
	POP HL
	POP BC
	RET
	; ------------ optimize end
