;------------------
; IN:	C=y pixel, B=x pixel
; OUT:	A=object
;------------------
object_by_coords:
	push bc
	ld hl,UNPACKED_ROOM
	ld e,b
	ld d,$00
	add hl,de
	sla c		; x2
	sla c		; x4
	sla c		; x8
	sla c		; x16
	jr nc,increase_1

	inc h
	inc h		; row > 15, increase address by 512
increase_1:
	sla c
	jr nc,increase_no

	inc h		; 7 < row  < 16, increase address by 256
increase_no:
	ld b,$00
	add hl,bc
	ld a,(hl)
	pop bc

	ret
