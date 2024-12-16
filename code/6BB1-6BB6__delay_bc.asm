delay_bc:
L6BB1:
	DEC C
	JR NZ,delay_bc

	DJNZ delay_bc

	RET
