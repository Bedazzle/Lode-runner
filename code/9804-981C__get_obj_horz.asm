get_obj_horz:
	push    bc

	call    object_by_pixels

	ld      d, a
	pop     bc
	ld      a, b
	and     $F8

	cp      b
	ld      e, 0
	ret     z

	push    bc
	push    de
	add     a, 8
	ld      b, a

	call    object_by_pixels

	pop     de
	ld      e, a
	pop     bc

	ret
