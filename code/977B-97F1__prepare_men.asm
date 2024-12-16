prepare_men:
	ld      (iy + MAN.IS_ENEMY), b
	ld      a, b
	and     a		; first man (at zero index) is WHITE player

	ld      a, COLOR.BRIGHT + COLOR.WHITE
	jr      z, man_colorize

	ld      a, COLOR.BRIGHT + COLOR.MAGENTA

man_colorize:
	ld      c, (ix + COORDS.ROW)
	ld      b, (ix + COORDS.COL)

	call    sprite_color

	sla     b
	sla     b
	sla     b

	sla     c
	sla     c
	sla     c

	push    bc
	ld      (iy + MAN.CURR_POS.Y), c
	ld      (iy + MAN.CURR_POS.X), b
	ld      (iy + MAN.SPRITE), SPRITE.MAN
	ld      (iy + MAN.SPR_FRAME), 0
	ld      (iy + MAN.HAVE_BOX), 0
	ld      (iy + MAN.GOUPDOWN), 0

	ld      a, c
	add     a, 8
	ld      c, a

	cp      $B0 			; 176 = 192-16	screen bottom
	jr      nz, loc_97BD

loc_97BA:
	xor     a			; STATUS.WALKING
	jr      loc_97C9
; ---------------------------------------

loc_97BD:
	call    object_by_pixels

	and     a
	jr      z, loc_97C7

	cp      OBJECT.ROPE
	jr      c, loc_97BA

loc_97C7:
	ld      a, STATUS.FALLING	;1

loc_97C9:
	ld      (iy + MAN.ALLOW), a
	pop     bc

	ld      a, (iy + MAN.IS_ENEMY)
	and     a
	ret     z

	ld      d, 1						; x-> +1
	ld      a, (PLAYER_PIXELS + PIXELS.X)

	cp      b
	jr      nz, loc_97DE

same_x_pos:
	ld      d, 0
	jr      set_x_direction
; ---------------------------------------

loc_97DE:
	jr      nc, set_x_direction

	ld      d, $FF					; x-> -1

set_x_direction:
	ld      (iy + MAN.DIR.VERT), VECTOR.NONE		;0
	ld      (iy + MAN.DIR.HOR), d
	ld      (iy + MAN.GORIGHTLEFT), 0
	ld      (iy + MAN.VAR_10), 0

	ret
