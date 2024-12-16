check_hiscore:
	ld hl,CHEATED
	ld a,(hl)

	cp $ff
	ld (hl),$00
	jp z,show_hall

	ld de,(HISCORE_LAST)
	ld hl,(SCORE)
	ld ix,SCORE
	scf
	sbc hl,de
	call p,new_hiscore

	jp show_hall
