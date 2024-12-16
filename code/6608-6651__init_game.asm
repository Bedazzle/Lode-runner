init_game:
	LD HL,PATCH_END_OF_MEMORY
	LD DE,$FFFC					; TODO: need to be defined!!!
	LD BC,$0004
	LDIR
	XOR A
	LD (INPUT_METHOD),A
	INC A
	LD (ROOM_NO),A

set_int_vectors:
	DI
	LD A,high INTERRUPT_TABLE
	LD I,A
	LD HL,$EDFB			; FB=ei	ED4D=reti
	LD (interrupt),HL	; change interrupt SMC
	LD A,$4D
	LD (interrupt+2),A	; SMC
	
	LD HL,INTERRUPT_TABLE
	LD B,$00
fill_int_table:
	LD (HL),high interrupt
	INC HL
	DJNZ fill_int_table:

	LD (HL),high interrupt
	IM 2
	LD (KEEP_STACK),SP
	LD SP,STACK
	EI

loop_demo:
	CALL print_intro
	CALL starfield
	CALL show_demo
	CALL hall_of_fame
	CALL starfield
	JR loop_demo
