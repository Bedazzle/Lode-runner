find_room_address:
	ld l,a
	ld h,$00

	; speed+size optimize to add hl,hl three times
	ld b,$03
loop_mult8:
	add hl,hl
	djnz loop_mult8		; HL=A * 8
	;optimize end
	
	push hl
	pop de

	; speed optimize to add hl,hl five times
	ld b,$05
loop_mult256:
	add hl,hl
	djnz loop_mult256	; HL=A * 256
	;optimize end

	add hl,de			; HL=A * 264
	ld de,LEVELS_DATA-264
	add hl,de			; HL= $B1A0 + A * 264		// $B1A0 = 45472 = -20064

	ret
