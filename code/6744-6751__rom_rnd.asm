rom_rnd:
;L6744:
	PUSH HL
	LD HL,(FAKE_RND)
	INC HL
	INC H
	RES 5,H
	LD A,(HL)
	LD (FAKE_RND),HL
	POP HL
	RET
