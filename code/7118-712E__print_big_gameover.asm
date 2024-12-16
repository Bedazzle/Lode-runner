print_big_gameover:
	LD BC,$0B0B
	LD DE,$0947
	LD HL,aGameOver
	LD A,PAPER.BLACK + COLOR.WHITE + COLOR.BRIGHT
	CALL print_big_strng

	LD B,200
L7129:
	HALT
	DJNZ L7129

	JP check_hiscore
