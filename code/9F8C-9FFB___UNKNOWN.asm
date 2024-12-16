L9F8C:
	cp      $FF
	jr      z, loc_9FD3

	ld      a, b
	and     7
	jr      nz, loc_9FB1

	ld      d, 1
	ld      a, (word_A130)

	cp      1
	jr      nz, loc_9FB1

	ld      de, 1

	call    sub_9EDF
	jr      nz, loc_9FB1

	ld      (tmp_coords_enemy), de
	ld      hl, 0
	ld      (tmp_XXX_enemy), hl

	ret
; ---------------------------------------

loc_9FB1:
	ld      a, (word_A130+1)
	ld      d, a
	ld      a, (byte_98E1)
	and     a
	jr      nz, loc_9FBC

	ld      a, d

loc_9FBC:
	cp      d
	ld      a, 0
	jr      z, loc_9FC2

	inc     a

loc_9FC2:
	ld      (tmp_XXX_enemy+1), a

loc_9FC5:
	and     a
	ld      a, d
	jr      z, loc_9FCB

	neg

loc_9FCB:
	ld      (tmp_coords_enemy+1), a
	xor     a
	ld      (tmp_coords_enemy), a

	ret
; ---------------------------------------

loc_9FD3:
	ld      a, b
	and     7
	jr      nz, loc_9FF1

	ld      a, (tmp_XXX_enemy+1)
	and     a
	jr      z, loc_9FF1

	ld      de, 1

	call    sub_9EDF
	jr      nz, loc_9FF1

	ld      (tmp_coords_enemy), de
	ld      hl, 0
	ld      (tmp_XXX_enemy), hl

	ret
; ---------------------------------------

loc_9FF1:
	ld      a, (tmp_XXX_enemy+1)
	xor     1
	ld      hl,  word_A130+1
	ld      d, (hl)

	jr      loc_9FC5
