loc_A0F7:
	ld      a, c
	and     7
	jr      nz, loc_A126

	ld      a, (word_A130+1)
	ld      d, a
	ld      e, 0

	call    sub_9EDF
	jr      nz, loc_A112

	ld      (tmp_coords_enemy), de
	ld      hl, 1
	ld      (tmp_XXX_enemy), hl

	ret
; ---------------------------------------

loc_A112:
	ld      a, d
	neg
	ld      d, a

	call    sub_9EDF
	jr      nz, loc_A126

	ld      (tmp_coords_enemy), de
	ld      hl, $0100
	ld      (tmp_XXX_enemy), hl

	ret
; ---------------------------------------

loc_A126:
	ld      hl, tmp_XXX_enemy
	ld      a, (hl)
	xor     1
	ld      (hl), a

	jr      loc_A0DD
