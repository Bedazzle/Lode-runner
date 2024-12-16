; B=column
; C=row
; A=block index
show_cell:
	push bc
	ld hl,UNPACKED_ROOM
	ld e,b
	ld d,$00
	add hl,de
	sla c
	sla c
	sla c
	sla c
	jr nc,L8f6a

	inc h
	inc h
L8f6a:
	sla c
	jr nc,L8f6f

	inc h
L8f6f:
	ld b,$00
	add hl,bc
	ld (hl),a

L8F73:
	jr L8F80	; !!! SMC	jr L8F80 -> jr L8F00


	cp OBJECT.HIDBRICKS		;$05
	jr nz,L8f7b

	ld a,OBJECT.BRICKS		;$01

L8f7b:
	cp OBJECT.HIDLADDER		;$06
	jr nz,L8F80

	xor a	; OBJECT.EMPTY

L8F80: 
	add a,$20
	pop bc

	call print_symbol

	sub $20
	ld e,a
	ld hl,SPRITE_COLORS
	add hl,de
	ld a,(hl)

	call sprite_color

L8F91:
	ret		; !!! SMC ret->nop

L8f92:
	push bc
	call wait_for_key

	cp $ff
	pop bc
	ret z

	pop bc
	pop bc
	pop bc
	ei
	jp print_menu
