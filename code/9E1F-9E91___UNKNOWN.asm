sub_9E1F:
	ld      b, 20			; max number of holes
	ld      hl, HOLES_DATA

loop_holes:
	push    bc
	push    hl
	ld      a, (hl)

	cp      $FF
	jr      z, next_hole

	dec     a
	ld      (hl), a		; change lifetime

	inc     hl
	ld      c, (hl)		; ypos

	inc     hl
	ld      b, (hl)		; xpos

	cp      $FF
	jr      nz, loc_9E53

close_hole:
	ld      a, c
	add     a, 8			; hole is 8 pixels lower than enemy
	ld      c, a			; ypos
	push    bc

	ld      a, OBJECT.BRICKS
	call    put_object

	pop     bc
	srl     b
	srl     b
	srl     b			; pix to cells
	srl     c
	srl     c
	srl     c			; pix to cells

	ld      a, COLOR.BRIGHT + COLOR.RED
	call    sprite_color

	jr      next_hole


loc_9E53:
	cp      4
	jr      nc, next_hole

	xor     3
	add     a, $F8
	push    af
	ld      a, c
	add     a, 8
	ld      c, a

	call    object_by_pixels

	cp      OBJECT.BOX
	jr      nz, loc_9E6D

	pop     af
	pop     hl
	push    hl
	inc     (hl)

	jr      next_hole
; ---------------------------------------

loc_9E6D:
	pop     af
	push    af

	cp      $F8
	jr      nz, loc_9E82

	srl     b
	srl     b
	srl     b
	srl     c
	srl     c
	srl     c
	pop     af

	jr      loc_9E87
; ---------------------------------------

loc_9E82:
	call    xor_put_coords

	pop     af
	dec     a

loc_9E87:
	call    xor_put_sprite

next_hole:
	pop     hl
	inc     hl
	inc     hl
	inc     hl
	pop     bc
	djnz    loop_holes

	ret
