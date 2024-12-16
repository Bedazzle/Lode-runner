print_colored_str:  
	PUSH AF
	LD A,(HL)
	CALL print_symbol

	POP AF
	CALL sprite_color

	INC B
	BIT 5,B
	JR Z,L6BAC

	LD B,$00
	INC C
L6BAC:
	INC HL
	DEC D
	JR NZ,print_colored_str

	RET
