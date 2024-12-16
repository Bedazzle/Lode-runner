print_score:
	LD HL,(SCORE)
	ADD HL,BC
	LD (SCORE),HL
	LD A,C
	ADD A,A		; x2
	ADD A,A		; x4
	ADD A,C		; x5
	LD C,A
L776D:
	LD HL,NAME_BUFFER-1
	LD B,$07

L7772:
	INC (HL)
	LD A,(HL)
	CP ':'
	JR NZ,L777D

	LD (HL),'0'
	DEC HL
	DJNZ L7772

L777D:
	DEC C
	JR NZ,L776D

	LD A,PAPER.BLACK + COLOR.YELLOW + COLOR.BRIGHT
	LD D,$07
	LD HL,SCORE_TXT
	LD BC,$0617
	CALL print_string
	RET  
