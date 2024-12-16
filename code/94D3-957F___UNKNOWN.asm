loc_94D3:
	pop     bc

	ld      a, (LA1D8)
	cp      $FF
	jr      z, loc_953F

	ld      a, (COPY_MAN_DATA)
	and     a
	jp      nz, loc_953F

	srl     b
	srl     b
	srl     b

	srl     c
	srl     c
	srl     c

	ld      a, (byte_98EC)
	and     a
	jr      nz, enemy_drop_box

	call    object_by_coords

	cp      OBJECT.BOX
	jr      nz, loc_953F

enemy_try_pickup:
	call    get_fake_rnd
	and     1
	jr      nz, loc_953F

pickup_box:
	ld      a, SPRITE.BOX
	call    xor_put_sprite

	ld      a, COLOR.BRIGHT + COLOR.WHITE
	call    sprite_color

	ld      a, 1
	ld      (ix + MAN.GORIGHTLEFT), a
	dec     a						; OBJECT.EMPTY
	ld      bc, (COPY_MAN_COORDS)

	call    put_object

	jr      loc_953F
; ---------------------------------------

enemy_drop_box:
	call    object_by_coords
	and     a
	jr      nz, loc_953F

enemy_try_drop:
	call    get_fake_rnd
	and     7
	jr      nz, loc_953F

enemy_drop:
	ld      a, SPRITE.BOX
	call    xor_put_sprite

	ld      a, COLOR.BRIGHT + COLOR.YELLOW
	call    sprite_color

	ld      a, OBJECT.BOX
	ld      bc, (COPY_MAN_COORDS)

	call    put_object

	xor     a
	ld      (ix + MAN.GORIGHTLEFT), a

loc_953F:
	pop     bc
	push    bc

	ld      a, COLOR.BRIGHT + COLOR.MAGENTA
	call    recolor_man

	pop     bc
	ld      a, b
	or      c
	and     7
	jr      nz, loc_9563

	call    object_by_pixels

	cp      OBJECT.BRICKS
	jr      z, loc_957C

	ld      (ix + MAN.VAR_10), a
	and     a
	jr      z, loc_955E

	cp      OBJECT.HIDLADDER
	jr      nz, loc_9563

loc_955E:
	ld      a, OBJECT.SOLID
	call    put_object

loc_9563:
	ld      bc, (COPY_MAN_COORDS)
	ld      a, b
	and     7
	jr      nz, loc_9582

	ld      a, c
	and     7
	jr      z, loc_9575

	ld      a, c
	add     a, 8
	ld      c, a

loc_9575:
	call    object_by_pixels

	cp      OBJECT.BRICKS
	jr      nz, loc_9580

loc_957C:
	pop     af

	jp      kill_enemy
