check_score:
	LD HL,CHEATED
	LD A,(HL)
	CP $FF
	LD (HL),$00
	JP Z,show_hall

	LD DE,(HISCORE_LAST)
	LD HL,(SCORE)
	LD IX,SCORE
	SCF
	SBC HL,DE
	CALL P,new_hiscore

	JP show_hall
