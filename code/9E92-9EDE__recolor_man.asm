recolor_man:
	ld      hl, 0
	ld      (KEEP_COLOR), a

check_row:
	ld      a, c
	and     7
	jr      z, check_col

	inc     l

check_col:
	ld      a, b
	and     7
	jr      z, convert_coords

	inc     h

convert_coords:
	srl     c
	srl     b
	srl     c
	srl     b
	srl     c
	srl     b

	call    recolor_cell

check_color_horiz:
	ld      a, l
	and     a
	jr      z, check_color_vert:

color_horiz:
	inc     c

	call    recolor_cell

	dec     c

	ret
; ---------------------------------------

check_color_vert:
	ld      a, h
	and     a
	ret     z

color_vert:
	inc     b

	call    recolor_cell

	ret


; =============== S U B R O U T I N E =======================================

recolor_cell:
	push    bc
	push    hl

	call    object_by_coords

	pop     hl
	pop     bc

	cp      OBJECT.BRICKS
	ret     z

	cp      OBJECT.SOLID
	ret     z

	cp      OBJECT.HIDBRICKS
	ret     z

	cp      OBJECT.BOX
	ret     z

	ld      a, (KEEP_COLOR)
	call    sprite_color

	ret
