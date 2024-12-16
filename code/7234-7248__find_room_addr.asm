; in:	A=room number
; out:	HL=room address
find_room_addr:
	LD L,A
	LD H,$00
	LD B,$03
L7239:
	ADD HL,HL
	DJNZ L7239	; x2 x4 x8

	PUSH HL
	POP DE
	LD B,$05
L7240:
	ADD HL,HL
	DJNZ $7240

	ADD HL,DE		; x264
	LD DE,$B1A0		; -20064
	ADD HL,DE
	RET
