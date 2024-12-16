loc_9A76:
	ld      hl, $0001
	ld      (tmp_coords_enemy), hl
	xor     a
	ld      (byte_98E8), a
	ld      bc, (COPY_MAN_COORDS)
	inc     c
	inc     c
	ld      (word_98E3), bc
	ld      a, c
	and     $F8

	cp      c
	jr      nz, loc_9AD4

	add     a, 8
	ld      c, a

	cp      $B0
	jr      z, loc_9AC8

	call    get_obj_horz

	ld      a, d
	and     a
	jr      z, loc_9AA2

	cp      4
	jr      c, loc_9AC8

loc_9AA2:
	ld      a, e
	and     a
	jr      z, loc_9AAA

	cp      4
	jr      c, loc_9AC8

loc_9AAA:
	ld      bc, (word_98E3)

	call    get_obj_horz

	ld      a, d

	cp      4
	jr      z, loc_9ABB

	ld      a, e

	cp      4
	jr      nz, loc_9AD4

loc_9ABB:
	ld      a, $18
	ld      (byte_98E7), a

	ld      a, 3
	ld      (COPY_MAN_DATA), a

	jp      loc_9A2B
; ---------------------------------------

loc_9AC8:
	xor     a
	ld      (COPY_MAN_DATA), a
	ld      a, $1E
	ld      (byte_98E7), a

	jp      loc_9A2B
; ---------------------------------------

loc_9AD4:
	ld      a, $1E
	ld      (byte_98E7), a

	jp      loc_9A2B
