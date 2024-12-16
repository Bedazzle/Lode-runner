show_publisher:
	XOR A
	OUT ($FE),A
	CALL random_scr_fade

	LD HL,aSoftwareProjec
	LD BC,$0701			; coords B=col, C=row
	LD A,PAPER.BLACK + COLOR.GREEN + COLOR.BRIGHT
	LD DE,#1144
	CALL print_big_strng

	LD A,PAPER.BLACK + COLOR.RED + COLOR.BRIGHT
	LD E,$05		; strings count
	LD C,$04		; row
loop_triangle:
	LD B,$0C		; col
	LD D,$06		; string width
	CALL print_string

	INC C
	DEC E
	JR NZ,loop_triangle

	LD BC,$080B
	LD A,PAPER.BLACK + COLOR.YELLOW + COLOR.BRIGHT
	LD D,$0F
	CALL print_string		; proudly present

	LD BC,$050D
	LD D,$15
	CALL print_string		; Broderbund software's

	LD DE,#0B45
	LD BC,$0A0F				; coords
	LD A,PAPER.BLACK + COLOR.SKYBLUE + COLOR.BRIGHT
	CALL print_big_strng	; lode runner

	LD BC,$0512
	LD A,PAPER.BLACK + COLOR.WHITE + COLOR.BRIGHT	;#47
	LD D,$15
	CALL print_string		; spaces
	RET
