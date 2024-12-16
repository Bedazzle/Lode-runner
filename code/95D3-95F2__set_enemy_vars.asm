set_enemy_vars: 
	ld      hl, (tmp_coords_enemy)
	ld      de, (tmp_XXX_enemy)
	ld      (ix + MAN.DIR.VERT), l
	ld      (ix + MAN.DIR.HOR), h
	ld      (ix + MAN.HAVE_BOX), e
	ld      (ix + MAN.GOUPDOWN), d

next_enemy:
	pop     af
	ld      de, $0011
	add     ix, de
	dec     a

	jp      nz, loop_enemy
	jp      loc_9253
