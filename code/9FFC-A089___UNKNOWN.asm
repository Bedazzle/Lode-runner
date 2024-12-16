L9FFC:
	and     a
	jr      nz, loc_A059

	ld      a, b
	and     7
	jr      nz, loc_A023

	ld      a, (tmp_XXX_enemy)
	and     a
	jr      nz, loc_A023

	ld      a, (word_A130)
	and     a
	jr      z, loc_A023

	ld      e, a
	ld      d, 0

	call    sub_9EDF
	jr      nz, loc_A023

	ld      (tmp_coords_enemy), de
	ld      hl, 0
	ld      (tmp_XXX_enemy), hl

	ret
; ---------------------------------------

loc_A023:
	ld      hl,  tmp_coords_enemy+1
	ld      a, (hl)
	and     a
	ld      a, (word_A130+1)
	jr      nz, loc_A02E

	ld      (hl), a

loc_A02E:
	ld      d, 0

	cp      (hl)
	jr      z, loc_A034

	inc     d

loc_A034:
	ld      a, d
	ld      (tmp_XXX_enemy+1), a

loc_A038:
	ld      a, (word_A130+1)
	ld      hl,  tmp_XXX_enemy+1
	bit     0, (hl)
	jr      z, loc_A044

	neg

loc_A044:
	and     a
	jr      nz, loc_A04E

	ld      a, (byte_A178)
	and     a
	jr      nz, loc_A04E

	inc     a

loc_A04E:
	ld      (tmp_coords_enemy+1), a
	xor     a
	ld      (tmp_coords_enemy), a
	ld      (tmp_XXX_enemy), a

	ret
; ---------------------------------------

loc_A059:
	ld      a, b
	and     7
	jr      nz, loc_A081

	ld      a, (word_A130)
	and     a
	jr      nz, loc_A065

	inc     a

loc_A065:
	ld      e, a
	ld      d, 0

	call    sub_9EDF

	jr      nz, loc_A078

loc_A06D:
	ld      (tmp_coords_enemy), de
	ld      hl, 0
	ld      (tmp_XXX_enemy), hl

	ret
; ---------------------------------------

loc_A078:
	ld      a, e
	neg
	ld      e, a

	call    sub_9EDF

	jr      z, loc_A06D

loc_A081:
	ld      hl,  tmp_XXX_enemy+1
	ld      a, (hl)
	xor     1
	ld      (hl), a

	jr      loc_A038
