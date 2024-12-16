loc_9D84:
	call    inkey_fire

	ld      a, (PLAYER_DATA)

	cp      1
	ret     z

	ld      a, d
	and     a
	jr      nz, loc_9D95

	ld      (byte_A172), a

	ret

 
loc_9D95:
	ld      a, (byte_A172)
	and     a
	ret     nz

	inc     a
	ld      (byte_A172), a
	ld      hl, LA135
	ld      a, (byte_A178)
	and     a
	jr      z, loc_9DA8

	ld      (hl), a

loc_9DA8:
	ld      a, (hl)
	ld      bc, (PLAYER_PIXELS)
	ld      a, c
	and     7
	ret     nz

	ld      a, (hl)

	cp      1
	jr      z, loc_9DC8

	ld      a, b
	and     7

	cp      b
	cp      4
	cp      2
	jr      nz, loc_9DC2

	dec     b
	dec     b

loc_9DC2:
	and     a
	jr      nz, loc_9DC6
	dec     b

loc_9DC6:
	jr      loc_9DD9
; ---------------------------------------

loc_9DC8:
	ld      a, b

	cp      $F4
	ret     nc

	and     7
	ld      d, 8

	cp      6
	jr      nz, loc_9DD6

	ld      d, $0A

loc_9DD6:
	ld      a, b
	add     a, d
	ld      b, a

loc_9DD9:
	ld      a, b
	and     $F8
	ld      b, a
	ld      (XXX_COORDS), bc

	call    object_by_pixels

	cp      OBJECT.HIDLADDER
	jr      z, loc_9DEA

	and     a
	ret     nz

loc_9DEA:
	ld      a, 8
	add     a, c
	ld      c, a

	call    object_by_pixels

	cp      OBJECT.BRICKS
	ret     nz

	xor     a
	ld      (FIRE_FRAME), a
	ld      bc, (PLAYER_PIXELS)
	ld      a, b
	and     7
	ret     z

	ld      a, (byte_A179)			; sprite
	call    loc_9712

	ld      bc, (XXX_COORDS)
	ld      a, (byte_A178)
	neg
	add     a, a
	add     a, a
	add     a, a
	add     a, b
	ld      b, a
	ld      (PLAYER_PIXELS), bc

	ld      a, (byte_A179)			; sprite
	call    loc_9712

	ret
