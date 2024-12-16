blinking_stars:
	LD HL,ENEMIES		; starfield/enemies
	LD DE,ENEMIES+1
	LD (HL),$FF
	LD BC,$0017
	LDIR

	XOR A
	LD (STARS_LOOPS),A
	XOR A
	LD (byte_813B),A

	HALT
	HALT
	HALT
	HALT

	LD HL,ENEMIES		; starfield/enemies
	LD B,$08
L66C1:
	PUSH BC
	PUSH HL
	LD A,(HL)
	CP $FF
	JR NZ,L66FB

	LD A,(byte_813B)
	AND A
	JR NZ,L671D

	INC A
	LD (byte_813B),A
	LD (HL),#00
	INC HL
	CALL get_fake_rnd

	AND $1F
	LD B,A
loop_stars:
	CALL get_fake_rnd

	AND $1F
	CP 24			; stars count
	JR NC,loop_stars

	LD C,A
	CALL get_sprite_colr

	AND A
	JR NZ,loop_stars

	LD (HL),C
	INC HL
	LD (HL),B
	CALL get_fake_rnd

	AND $03
	ADD A,$44
	CALL sprite_color

	DEC HL
	DEC HL
	XOR A

L66FB:
	INC HL
	LD C,(HL)
	INC HL
	LD B,(HL)
	CP $05
	JR NZ,L670D

	XOR A
	CALL sprite_color

	DEC HL
	DEC HL
	LD (HL),#FF
	JR L671D

L670D:
	CP $03
	JR C,L6717

	SUB $03
	XOR $03
	SUB $02
L6717:
	CALL print_symbol

	DEC HL
	DEC HL
	INC (HL)

L671D:
	POP HL
	INC HL
	INC HL
	INC HL
	POP BC
	DJNZ L66C1

	LD HL,STARS_LOOPS
	DEC (HL)
	RET Z
	CALL wait_for_key

	CP $FF
	JR Z,L6734

	POP BC
	JP print_menu

L6734:
	CALL inkey_fire

	LD A,D
	AND A
	JR Z,L673F

	POP BC
	JP print_menu

L673F:
	JP loop_starfield
