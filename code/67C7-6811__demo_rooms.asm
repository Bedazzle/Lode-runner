demo_rooms:
L67c7:
	CALL random_scr_fade
	CALL clear_score

	XOR A
	LD (LIVES),A
	LD A,(ROOM_NO)
	PUSH AF
	ADD A,$05
	CP $4C		; 'L'
	JR NZ,L67DD

	LD A,$01
L67DD:
	LD (ROOM_NO),A
	XOR A
	LD (L8F73+1),A	; !!! SMC 8F74
	LD (L8F91),A	; !!! SMC nop/ret
	POP AF
	LD C,A
	LD B,$05
L67EB:
	PUSH BC
	LD A,C
	LD (CURRENT_ROOM),A
	PUSH AF
	CALL print_info_line

	LD BC,$0216
	LD HL,aPressAnyKeyFor
	LD D,$1B
	LD A,$43
	CALL print_string

	POP AF
	CALL find_room_address
	CALL show_room

	LD B,100
L680A:
	HALT
	DJNZ L680A

	POP BC
	INC C
	DJNZ L67EB

	RET
