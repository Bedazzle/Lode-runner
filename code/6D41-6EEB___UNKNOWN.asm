L6D41:
	LD A,(INPUT_METHOD)
	AND A
	LD D,$00
	JR NZ,L6D5E

	LD BC,KEYS_YUIOP
	IN A,(C)
	BIT 2,A
	JR NZ,L6D53

	DEC D
L6D53:
	LD BC,KEYS_YUIOP
	IN A,(C)
	BIT 0,A
	JR NZ,L6D5D

	INC D
L6D5D:
	RET

	; ---------------
L6D5E:
	CP $02
	JR Z,L6D72
	JR NC,L6D81

	XOR A
	IN A,($1F)
	BIT 1,A
	JR Z,L6D6C

	DEC D
L6D6C:
	BIT 0,A
	JR Z,L6D71
	INC D
L6D71:
	RET

	; ---------------
L6D72:
	LD A,$EF
	IN A,($FE)
	BIT 3,A
	JR NZ,L6D7B

	INC D
L6D7B:
	BIT 4,A
	JR NZ,L6D80

	DEC D
L6D80:
	RET

	; ---------------
L6D81:
	LD A,$EF
	IN A,($FE)
	BIT 2,A
	JR NZ,L6D8A

	INC D
L6D8A:
	LD A,$F7
	IN A,($FE)
	BIT 4,A
	JR NZ,L6D93
	DEC D
L6D93:
	RET

	; ---------------
L6D94:
	LD A,$EF
	IN A,($FE)
	BIT 1,A
	JR NZ,L6D9D

	DEC D
L6D9D:
	BIT 2,A
	JR NZ,L6DA2

	INC D
L6DA2:
	RET

	; ---------------
L6DA3:
	LD A,$EF
	IN A,($FE)
	BIT 3,A
	JR NZ,L6DAC

	DEC D
L6DAC:
	BIT 4,A
	JR NZ,L6DB1

	INC D
L6DB1:
	RET

	; ---------------
L6DB2:
	LD D,$00
	LD A,(INPUT_METHOD)
	AND A
	JR NZ,L6DCF

	LD BC,KEYS_QWERT
	IN A,(C)
	BIT 0,A
	JR NZ,L6DC4

	DEC D
L6DC4:
	LD BC,KEYS_cZXCV
	IN A,(C)
	BIT 1,A
	JR NZ,L6DCE
	INC D
L6DCE:
	RET


	; ---------------
L6DCF:
	CP $02
	JR Z,L6D94
	JR NC,L6DA3

	XOR A
	IN A,($1F)
	BIT 3,A
	JR Z,L6DDD

	DEC D
L6DDD:
	BIT 2,A
	JR Z,L6DE2

	INC D
L6DE2:
	RET

	; ---------------
L6DE3:
	LD D,$00
	LD A,(INPUT_METHOD)
	AND A
	JR NZ,L6DF6

	LD BC,KEYS_BNMsp
	IN A,(C)
	BIT 3,A
	JR NZ,L6DF5

	INC D
L6DF5:
	RET

	; ---------------
L6DF6:
	CP $02
	JR NC,L6E03

	XOR A
	IN A,($1F)
	BIT 4,A
	JR Z,L6E02

	INC D
L6E02:
	RET

	; ---------------
L6E03:
	LD A,$EF
	IN A,($FE)
	BIT 0,A
	RET NZ
	INC D
	RET

	; ---------------
L6E0C:
	LD D,$00
	LD BC,KEYS_HJKLe
	IN A,(C)
	BIT 4,A
	JR NZ,L6E18

	INC D
L6E18:
	RET


	; ---------------
L6E19:
	PUSH AF
	CALL sprite_color

	LD A,(HL)
	CP $20
	JR NZ,L6E24

	LD A,$5D
L6E24:
	CP $3A
	JR NC,L6E2A

	ADD A,$3B
L6E2A:
	SUB $41
	ADD A,A
	ADD A,$5B
	CALL print_symbol

	INC C
	INC A
	CALL print_symbol

	LD A,E
	CALL sprite_color

	POP AF
	DEC C
	INC B
	INC HL
	DEC D
	JR NZ,L6E19

	RET


	; ---------------
L6E43:
	LD HL,NAME_BUFFER
	CALL get_sprite_colr

	PUSH BC
	LD D,$08
	CALL print_string
	CALL sprite_color

	POP BC
	XOR $80
	CALL sprite_color

	LD A,$01
	LD HL,NAME_BUFFER
	PUSH AF
	PUSH BC
L6E5F:
	CALL wait_for_key

	CP $FF
	JR Z,L6E5F

	CP $65
	JR Z,L6EE0

	CP $70
	JR NZ,L6E70

	LD A,$20
L6E70:
	CP $73
	JR Z,L6ED0

	CP $63
	JR NZ,L6EAD

	LD A,$EF
	IN A,($FE)
	BIT 0,A
	JR NZ,L6ED0

	POP BC
	POP AF
	DEC A
	JR NZ,L6E8A

	INC A
	PUSH AF
	PUSH BC
	JR L6ED0

L6E8A:
	DEC HL
	LD (HL),$20
	DEC B
	PUSH AF
	PUSH BC
	LD A,$20
	CALL print_symbol
	CALL get_sprite_colr

	OR $80
	CALL sprite_color

	INC B
	XOR $80
	CALL sprite_color

L6EA3:
	LD A,$EF
	IN A,($FE)
	BIT 0,A
	JR Z,L6EA3
	JR L6ED0

L6EAD:
	POP BC
	LD D,A
	POP AF
	CP $09
	JR Z,L6ECE

	PUSH AF
	LD A,D
	CALL print_symbol

	LD (HL),A
	INC HL
	CALL get_sprite_colr

	XOR $80
	CALL sprite_color

	INC B
	CALL get_sprite_colr

	OR $80
	CALL sprite_color

	POP AF
	INC A
L6ECE:
	PUSH AF
	PUSH BC
L6ED0:
	CALL wait_for_key

	CP $63
	JR Z,L6EDB

	CP $FF
	JR NZ,L6ED0

L6EDB:
	POP BC
	POP AF
	JP loc_8855

L6EE0:
	POP BC
	EX DE,HL
	POP AF
	CALL get_sprite_colr

	XOR $80
	CALL sprite_color

	RET
