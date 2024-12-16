get_sprite_colr:
	ld      a, $FF

sprite_color:
	push    bc
	push    hl
	ld      h, high ATTRIB
	ld      l, b
	sla     c
	sla     c
	sla     c
	sla     c
	jr      nc, loc_857F

	inc     h
	inc     h

loc_857F:
	sla     c
	jr      nc, loc_8584

	inc     h

loc_8584:
	ld      b, 0
	add     hl, bc

	cp      $FF
	jr      nz, loc_858F

	ld      a, (hl)
	pop     hl
	pop     bc

	ret

loc_858F:
	ld      (hl), a
	pop     hl
	pop     bc

	ret
