sub_9D05:
	ld      a, (FIRE_FRAME)
	cp      $FF
	jr      z, loc_9D84

	push    af
	ld      bc, (XXX_COORDS)
	and     a
	jr      nz, loc_9D1F

	ld      a, 8			; 8 pix lower than man
	add     a, c
	ld      c, a

	ld      a, SPRITE.BRICKS
	call    xor_put_coords

	jr      loc_9D32

  

loc_9D1F:
	dec     a
	add     a, a
	add     a, $F0
	push    af

	call    xor_put_coords

	pop     af
	inc     c
	inc     a

	call    xor_put_sprite

	ld      a, COLOR.BRIGHT + COLOR.WHITE
	call    sprite_color

loc_9D32:
	ld      bc, (XXX_COORDS)
	ld      a, 8
	add     a, c
	ld      c, a

	xor     a		; OBJECT.EMPTY
	call    put_object

	pop     af

	cp      4
	jr      nz, sound_fire

	ld      hl, HOLES_DATA
	ld      b, $14

loc_9D48:
	ld      a, (hl)
	cp      $FF
	jr      z, loc_9D52

	inc     hl
	inc     hl
	inc     hl
	djnz    loc_9D48

loc_9D52:
	ld      (hl), HOLE_LIFECYCLE
	inc     hl
	
	ld      bc, (XXX_COORDS)
	ld      (hl), c
	inc     hl

	ld      (hl), b

	ld      a, $FF
	ld      (FIRE_FRAME), a

	ret


sound_fire:
	add     a, a
	add     a, $F0
	ld      bc, (XXX_COORDS)
	push    af

	call    xor_put_coords

	pop     af
	inc     a
	inc     c

	call    xor_put_sprite

	ld      hl, FIRE_FRAME
	inc     (hl)
	ld      de, 2
	ld      a, (hl)
	add     a, a
	add     a, 4
	ld      h, a

	call    BEEPER

	di

	ret
