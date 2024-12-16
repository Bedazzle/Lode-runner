loc_9712:
	add     a, a		; x2
	add     a, a		; x4
	add     a, a		; x8
	ld      e, a
	ld      d, high GFX		; DE=sprite address

	ld      a, b
	and     7
	ld      (loc_974D+1), a		; !!! set SMC

	ld      a, 5
	jr      z, loc_9723

	xor     a

loc_9723:
	ld      (loc_975C+1), a		; !!! set SMC
	srl     b
	srl     b
	srl     b
	ld      a, c
	and     7
	add     a, $40
	bit     6, c
	jr      z, loc_9737

	add     a, 8

loc_9737:
	bit     7, c
	jr      z, loc_973D

	add     a, $10

loc_973D:
	ld      h, a
	ld      a, c
	and     $38
	add     a, a
	add     a, a
	add     a, b
	ld      l, a
	ld      b, 8

loc_9747:
	push    bc
	ld      a, (de)
	ld      c, a
	inc     de
	ld      b, 0

loc_974D:
	ld      a, 0				; !!! SMC
	and     a
	jr      z, loc_9759

loc_9752:
	rr      c
	rr      b
	dec     a
	jr      nz, loc_9752

loc_9759:
	ld      a, (hl)
	xor     c
	ld      (hl), a

loc_975C:
	jr      loc_975E			; !!! SMC 975E / 9763
; ---------------------------------------

loc_975E:					; <---
	inc     hl
	ld      a, (hl)
	xor     b
	ld      (hl), a
	dec     hl
	
loc_9763:					; <---
	inc     h
	ld      a, h
	and     7
	jr      nz, loc_9777

	ld      a, l

	cp      $E0
	jr      nc, loc_9774

	ld      bc, -2016	;$F820
	add     hl, bc
	jr      loc_9777
; ---------------------------------------

loc_9774:
	add     a, $20
	ld      l, a

loc_9777:
	pop     bc
	djnz    loc_9747

	ret
