LA08A:
	and     a
	jr      nz, loc_A0F7

	push    bc
	ld      a, c
	and     256-8		;$F8

	cp      c
	jr      nz, loc_A0C7

	add     a, 8
	ld      c, a

	cp      192-16		;$B0
	jr      z, loc_A0B0

	ld      a, (word_A130+1)
	and     a
	jr      z, loc_A0C7

	add     a, a
	add     a, a
	add     a, a
	add     a, b
	ld      b, a		; b = b + a*8

	call    object_by_pixels

	and     a
	jr      z, loc_A0C7

	cp      OBJECT.HIDBRICKS
	jr      nc, loc_A0C7

loc_A0B0:
	pop     bc
	ld      a, (word_A130+1)
	ld      d, a
	ld      e, 0

	call    sub_9EDF
	jr      nz, loc_A0C8

	ld      (tmp_coords_enemy), de
	ld      hl, 0
	ld      (tmp_XXX_enemy), hl

	ret
; ---------------------------------------

loc_A0C7:
	pop     bc

loc_A0C8:
	ld      hl, tmp_coords_enemy
	ld      a, (hl)
	and     a
	ld      a, (word_A130)
	jr      nz, loc_A0D3

	ld      (hl), a

loc_A0D3:
	ld      d, $00

	cp      (hl)
	jr      z, loc_A0D9

	inc     d

loc_A0D9:
	ld      a, d
	ld      (tmp_XXX_enemy), a

loc_A0DD:
	and     a
	ld      a, (word_A130)
	jr      z, loc_A0E5

	neg

loc_A0E5:
	and     a
	jr      nz, loc_A0EF

	ld      a, (byte_A177)
	and     a
	jr      nz, loc_A0EF

	dec     a

loc_A0EF:
	ld      (tmp_coords_enemy), a
	xor     a
	ld      (tmp_coords_enemy+1), a

	ret
