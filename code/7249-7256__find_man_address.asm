; in:	A=man number
; out:	HL=address
find_man_address:
	LD L,A
	LD H,$00
	ADD HL,HL		; x2
	ADD HL,HL		; x4
	PUSH HL
	POP DE
	ADD HL,HL		; x8
	ADD HL,DE		; x12
	LD DE,MEN_COORDS
	ADD HL,DE
	RET
