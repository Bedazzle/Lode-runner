loc_9BD9:
	ld      a, (tmp_coords_enemy)

	cp      1
	jr      nz, loc_9C1C

	ld      bc, (COPY_MAN_COORDS)
	ld      a, 8
	add     a, c
	ld      c, a

	cp      $B0
	jr      z, loc_9C1C

	ld      a, b
	and     $F8

	cp      b
	jr      nz, loc_9C07

	call    object_by_pixels

	cp      OBJECT.LADDER
	jr      nz, loc_9C07

	ld      a, c
	sub     6
	ld      c, a
	ld      hl, $0001
	ld      a, 2
	ld      d, $16

	jp      loc_9A63
; ---------------------------------------

loc_9C07:
	call    get_obj_horz

	ld      a, d
	and     a
	jr      z, loc_9C12

	cp      4
	jr      c, loc_9C1C

loc_9C12:
	ld      a, e
	and     a
	jp      z, man_to_hole

	cp      4
	jp      nc, man_to_hole

loc_9C1C:
	ld      a, (tmp_coords_enemy+1)
	and     a
	jp      z, loc_9A73

	add     a, a
	ld      bc, (COPY_MAN_COORDS)
	add     a, b
	ld      b, a

	cp      $FE
	jp      z, loc_9A73

	cp      $FA
	jp      z, loc_9A73

	call    get_obj_horz

	ld      a, d

	cp      1
	jp      z, loc_9A73

	cp      2
	jp      z, loc_9A73

	cp      5
	jp      z, loc_9A73

	ld      a, e
	cp      1
	jp      z, loc_9A73

	cp      2
	jp      z, loc_9A73

	cp      5
	jp      z, loc_9A73

	ld      a, b
	and     7
	jr      nz, loc_9CAE

	call    object_by_pixels

	cp      OBJECT.ROPE
	jr      z, loc_9CAE

	cp      OBJECT.LADDER
	jr      nz, loc_9C78

	ld      a, $16
	ld      (byte_98E7), a
	ld      a, 2
	ld      (COPY_MAN_DATA), a
	ld      (word_98E3), bc

	jp      loc_9A2B
; ---------------------------------------

loc_9C78:
	ld      a, 8
	add     a, c
	ld      c, a

	cp      $B0
	jr      z, loc_9C9F

	call    object_by_pixels

	cp      OBJECT.BRICKS
	jr      z, loc_9C9F

	cp      OBJECT.SOLID
	jr      z, loc_9C9F

	cp      OBJECT.LADDER
	jr      z, loc_9C9F

	ld      a, c
	sub     6
	ld      c, a

	ld      a, 1
	ld      hl, (tmp_coords_enemy)
	ld      l, 1
	ld      d, $16

	jp      loc_9A63
; ---------------------------------------

loc_9C9F:
	ld      a, c
	sub     8
	ld      c, a

	xor     a
	ld      d, $12
	ld      hl, (tmp_coords_enemy)
	ld      l, 0

	jp      loc_9A63
; ---------------------------------------

loc_9CAE:
	ld      a, (byte_98E8)
	inc     a

	cp      3
	jr      nz, loc_9CB7

	xor     a

loc_9CB7:
	ld      (byte_98E8), a
	ld      d, $18
	ld      l, a
	ld      a, (tmp_coords_enemy+1)

	cp      1
	jr      z, loc_9CC6

	ld      d, $1B

loc_9CC6:
	ld      a, d
	add     a, l
	ld      (byte_98E7), a
	ld      (word_98E3), bc

	jp      loc_9A2B
