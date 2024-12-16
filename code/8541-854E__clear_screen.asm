clear_screen:
	ld de,$4001
	ld hl,$4000
	ld (hl),$00
	ld bc,$1aff
	ldir

	ret
