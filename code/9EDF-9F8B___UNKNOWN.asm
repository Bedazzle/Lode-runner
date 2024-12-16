sub_9EDF:
	push    bc
	push    de

	srl     b
	srl     b
	srl     b

	srl     c
	srl     c
	srl     c

	ld      a, d

	cp      $FF
	jp      z, loc_9F72

	cp      1
	jp      z, loc_9F7A

	ld      a, e

	cp      $FF
	jp      z, loc_9F54

	inc     c
	ld      a, $16

	cp      c
	jr      z, loc_9F4F

	call    object_by_coords

	cp      OBJECT.BRICKS
	jr      z, loc_9F4F

	cp      OBJECT.SOLID
	jr      z, loc_9F4F

loc_9F0F:
	pop     de
	pop     bc


; =============== S U B R O U T I N E =======================================

sub_9F11:
	ld      a, d
	push    bc
	push    de

	add     a, a
	add     a, a
	add     a, b
	ld      b, a		; B=B+D*4

	ld      a, e
	add     a, a
	add     a, a
	add     a, c		; C=C+E*4
	ld      c, a

	ld      a, (ENEMY_COUNT)
	ld      iy, ENEMIES_DATA
	ld      de, $0011

loop_enemies:
	push    af

	cp      (ix + MAN.IS_ENEMY)
	jr      z, loc_9F45

	ld      a, (iy + MAN.CURR_POS.X)
	sub     b
	jr      nc, loc_9F35

	neg

loc_9F35:
	cp      5
	jr      nc, loc_9F45

	ld      a, (iy + MAN.CURR_POS.Y)
	sub     c
	jr      nc, loc_9F41

	neg

loc_9F41:
	cp      5
	jr      c, loc_9F4E

loc_9F45:
	add     iy, de
	pop     af
	dec     a
	jr      nz, loop_enemies

	pop     de
	pop     bc

	ret
; ---------------------------------------

loc_9F4E:
	pop     af

loc_9F4F:
	xor     a
	inc     a
	pop     de
	pop     bc

	ret

; ---------------------------------------

loc_9F54:
	ld      a, (ix + MAN.VAR_10)

	cp      3
	jr      nz, loc_9F4F

	dec     c
	ld      a, c

	cp      $FF
	jr      z, loc_9F4F

loc_9F61:
	call    object_by_coords

	cp      OBJECT.BRICKS
	jr      z, loc_9F4F

	cp      OBJECT.SOLID
	jr      z, loc_9F4F

	cp      OBJECT.HIDBRICKS
	jr      z, loc_9F4F

	jr      loc_9F0F
; ---------------------------------------

loc_9F72:
	dec     b
	ld      a, b

	cp      $FF
	jr      z, loc_9F4F
	jr      loc_9F61
; ---------------------------------------

loc_9F7A:
	inc     b
	bit     5, b
	jr      nz, loc_9F4F
	jr      loc_9F61

; ---------------------------------------
L9F81:
	ld      hl, $0001
	ld      (tmp_coords_enemy), hl
	dec     l
	ld      (tmp_XXX_enemy), hl

	ret
