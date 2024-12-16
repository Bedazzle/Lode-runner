loc_9ADC:
	ld      bc, (COPY_MAN_COORDS)
	ld      a, c
	and     $F8

	cp      c
	jr      nz, loc_9B37

	ld      a, (tmp_coords_enemy+1)

	cp      $FF
	jr      nz, loc_9B0B

	ld      a, b
	and     a
	jr      z, loc_9B0B

	dec     b
	dec     b

	call    object_by_pixels

	cp      OBJECT.BRICKS
	jr      z, loc_9B0B

	cp      OBJECT.SOLID
	jr      z, loc_9B0B

	cp      OBJECT.HIDBRICKS
	jr      z, loc_9B0B

	ld      hl, $FF00
	xor     a
	ld      d, $10

	jp      loc_9A63
; ---------------------------------------

loc_9B0B:
	ld      a, (tmp_coords_enemy+1)
	ld      bc, (COPY_MAN_COORDS)

	cp      1
	jr      nz, loc_9B37

	ld      a, b

	cp      $F8
	jr      z, loc_9B37

	inc     b
	inc     b

	call    get_obj_horz

	ld      a, e

	cp      1
	jr      z, loc_9B37

	cp      2
	jr      z, loc_9B37

	cp      5
	jp      z, loc_9B37

	ld      hl, $0100
	xor     a
	ld      d, $10

	jp      loc_9A63
; ---------------------------------------

loc_9B37:
	ld      a, (tmp_coords_enemy)
	and     a
	jp      z, loc_9A73

	add     a, a
	ld      bc, (COPY_MAN_COORDS)
	add     a, c
	ld      c, a

	cp      $FE
	jp      z, loc_9A73

	call    object_by_pixels

	cp      OBJECT.BRICKS
	jp      z, loc_9A73

	cp      OBJECT.SOLID
	jp      z, loc_9A73

	cp      OBJECT.HIDBRICKS
	jp      z, loc_9A73

	ld      (word_98E3), bc
	ld      a, c
	and     $F8

	cp      c
	jr      nz, loc_9BCA

	call    object_by_pixels

L9B69:
	cp      OBJECT.ROPE		; !!! SMC
	jr      nz, loc_9B79

L9B6D:
	ld      a, 3
	ld      d, $1A
	ld      hl, (tmp_coords_enemy)
	ld      h, 0

	jp      loc_9A63
; ---------------------------------------

loc_9B79:
	ld      a, c
	add     a, 8
	ld      c, a

	cp      $B0
	jr      z, loc_9B8C

	call    object_by_pixels

	cp      1
	jr      z, loc_9B8C

	cp      2
	jr      nz, loc_9B98

loc_9B8C:
	ld      a, SPRITE.RIGHT1
	ld      (byte_98E7), a

	xor     a
	ld      (COPY_MAN_DATA), a

	jp      loc_9A2B
; ---------------------------------------

loc_9B98:
	ld      bc, (word_98E3)

	call    object_by_pixels

	and     a
	jr      z, loc_9BA6

	cp      OBJECT.ROPE
	jr      c, loc_9BCA

loc_9BA6:
	ld      a, c
	add     a, 8
	ld      c, a

	call    object_by_pixels

	cp      OBJECT.LADDER
	jr      z, loc_9BBE

	ld      a, 1
	ld      (COPY_MAN_DATA), a

	ld      a, $1E
	ld      (byte_98E7), a

	jp      loc_9A2B

  
loc_9BBE:
	xor     a
	ld      (COPY_MAN_DATA), a

	ld      a, SPRITE.RIGHT1
	ld      (byte_98E7), a

	jp      loc_9A2B
; ---------------------------------------

loc_9BCA:
	ld      hl, byte_98E8
	inc     (hl)
	res     1, (hl)

	ld      a, (hl)
	add     a, SPRITE.CLIMBER1
	ld      (byte_98E7), a

	jp      loc_9A2B
