random_fade_screen:
;L6B57:  
	LD B,$04
	LD DE,$0000
L6B5C:
	PUSH BC
	LD BC,$1B00
	LD HL,$4000
L6B63:
	LD A,(DE)
	AND (HL)
	LD (HL),A
	INC HL
	DEC BC
	INC DE
	LD A,C
	OR B
	JR NZ,L6B63
	POP BC
	HALT
	DJNZ L6B5C

	JP clear_screen
