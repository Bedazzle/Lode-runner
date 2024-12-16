menu_editor:
;L6efa:
	CALL random_scr_fade

	LD BC,$0100
	LD A,PAPER.BLACK + COLOR.GREEN + COLOR.BRIGHT
	LD DE,$1D44
	LD HL,GAME_GENERATOR
	CALL print_big_strng

	LD C,$07
	LD E,$04
	LD A,PAPER.BLACK + COLOR.YELLOW
L6F11:
	LD D,$08
	LD B,$0A
	CALL print_string

	INC C
	INC C
	DEC E
	JR NZ,L6F11

	LD BC,$0517
	LD D,$15
	LD HL,SPACELINE
	LD A,PAPER.BLACK + COLOR.WHITE + COLOR.BRIGHT
	CALL print_string
L6F2A:
	CALL wait_for_key

	CP '4'
	JP Z,print_menu

	CP '3'
	JP Z,copy_screen

	CP '2'
	JP Z,test_screen

	CP '1'
	JP Z,edit_screens

	JR L6F2A
