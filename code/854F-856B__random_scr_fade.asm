random_scr_fade:	;L854f:
	ld b,$04
	ld de,$0000

iterate_fade:
	push bc
	ld bc,$1b00
	ld hl,$4000

loop_fade:
	ld a,(de)
	and (hl)
	ld (hl),a
	inc hl
	dec bc
	inc de
	ld a,c
	or b
	jr nz,loop_fade

	pop bc
	halt
	djnz iterate_fade

	jp clear_screen
