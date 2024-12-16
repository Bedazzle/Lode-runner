L98EE:
	ld      a, (COPY_MAN_COORDS+1)
	ld      d, a
	and     $F8

	cp      d
	jp      nz, loc_9988

	ld      a, (tmp_coords_enemy)

	cp      $FF
	jr      nz, loc_9929

	ld      bc, (COPY_MAN_COORDS)

	call    object_by_pixels

	cp      OBJECT.LADDER
	jr      nz, loc_9959

	inc     c
	dec     c
	jr      z, loc_9959

	dec     c
	dec     c

	call    object_by_pixels

	cp      OBJECT.BRICKS
	jr      z, loc_9959

	cp      OBJECT.SOLID
	jr      z, loc_9959

	cp      OBJECT.HIDBRICKS
	jr      z, loc_9959

	ld      a, 2
	ld      hl, $00FF
	ld      d, $16

	jp      loc_9A63  



loc_9929:
	cp      1
	jr      nz, loc_9959

	ld      bc, (COPY_MAN_COORDS)
	ld      a, c
	add     a, 8

	cp      $B0
	jr      z, loc_9959

	ld      c, a

	call    object_by_pixels

	cp      OBJECT.BOX
	jr      z, loc_994B

	cp      OBJECT.HIDLADDER
	jr      z, loc_994B

	and     a
	jr      z, loc_994B

	cp      OBJECT.LADDER
	jr      nz, loc_9959

loc_994B:
	ld      a, c
	sub     6
	ld      c, a

	ld      a, 2
	ld      hl, $0001
	ld      d, $16

	jp      loc_9A63
; ---------------------------------------

loc_9959:
	ld      bc, (COPY_MAN_COORDS)
	call    object_by_pixels

	cp      OBJECT.LADDER
	jr      z, loc_9988

	ld      a, c
	add     a, 8

	cp      $B0			; 176 = 192-16 = last screen row
	jr      z, loc_9988

	ld      c, a
	call    object_by_pixels

	cp      OBJECT.BRICKS
	jr      z, loc_9988

	cp      OBJECT.SOLID
	jr      z, loc_9988

	cp      OBJECT.LADDER
	jr      z, loc_9988

man_to_hole:
	ld      d, SPRITE.MAN
	ld      hl, $0001

	ld      a, c
	sub     6
	ld      c, a

	ld      a, l

	jp      loc_9A63
; ---------------------------------------

loc_9988:
	ld      a, (tmp_coords_enemy+1)
	and     a
	jp      z, loc_9A73

	add     a, a
	ld      bc, (COPY_MAN_COORDS)
	add     a, b

	cp      $FE
	jp      z, loc_9A73

	cp      $FA
	jp      z, loc_9A73

	ld      b, a
	ld      (word_98E3), bc

	call    object_by_pixels

	cp      OBJECT.BRICKS
	jp      z, loc_9A73

	cp      OBJECT.SOLID
	jp      z, loc_9A73

	ld      a, b
	and     $F8

	cp      b
	jr      z, loc_99C9

	add     a, 8
	ld      b, a

	call    object_by_pixels

	cp      OBJECT.BRICKS
	jp      z, loc_9A73

	cp      OBJECT.SOLID
	jp      z, loc_9A73

	jr      loc_9A09
; ---------------------------------------

loc_99C9:
	ld      bc, (word_98E3)

	call    object_by_pixels

	cp      OBJECT.ROPE
	jr      nz, loc_99E0

	ld      a, 3
	ld      hl, (tmp_coords_enemy)
	ld      l, 0
	ld      d, $1D

	jp      loc_9A63
; ---------------------------------------

loc_99E0:
	ld      a, c
	add     a, 8
	ld      c, a

	cp      $B0				; last screen row	176=192-16
	jr      z, loc_9A09

	call    object_by_pixels

	cp      OBJECT.BRICKS
	jr      z, loc_9A09

	cp      OBJECT.SOLID
	jr      z, loc_9A09

	cp      OBJECT.LADDER
	jr      z, loc_9A09

	ld      a, c
	sub     8
	ld      c, a

	call    object_by_pixels

	cp      OBJECT.LADDER
	jr      z, loc_9A09

	ld      a, c
	add     a, 8
	ld      c, a

	jp      man_to_hole
; ---------------------------------------

loc_9A09:
	ld      a, (byte_98E8)
	inc     a

	cp      3
	jr      nz, loc_9A12

	xor     a

loc_9A12:
	ld      (byte_98E8), a
	ld      a, (tmp_coords_enemy+1)
	ld      d, $10

	cp      1
	jr      z, loc_9A20

	ld      d, $13

loc_9A20:
	ld      a, (byte_98E8)
	add     a, d
	ld      (byte_98E7), a
	ld      (ix + MAN.DIR.VERT), VECTOR.NONE		;0

loc_9A2B:
	ld      bc, (COPY_MAN_COORDS)
	ld      a, (byte_98E9)
	and     a
	jr      z, loc_9A44

	push    bc
	ld      de, (tmp_coords_enemy)

	call    sub_9F11
	jr      z, loc_9A43

	pop     bc
	ld      a, $FF

	ret
; ---------------------------------------

loc_9A43:
	pop     bc

loc_9A44:
	ld      a, (byte_98E2)		; sprite

	call    loc_9712

	ld      bc, $0005
	ld      de, COPY_MAN_COORDS
	ld      hl, word_98E3
	ldir

	ld      bc, (COPY_MAN_COORDS)		; coords
	ld      a, (byte_98E2)		; sprite

	call    loc_9712

	xor     a

	jp      restore_man_data
; ---------------------------------------

loc_9A63:
	ld      (COPY_MAN_DATA), a
	ld      a, d
	ld      (byte_98E7), a
	ld      (word_98E3), bc
	ld      (tmp_coords_enemy), hl

	jr      loc_9A2B
; ---------------------------------------

loc_9A73:
	ld      a, $FF

	ret
