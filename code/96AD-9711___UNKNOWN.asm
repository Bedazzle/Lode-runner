kill_enemy:
	ld      c, (ix + MAN.CURR_POS.Y)
	ld      b, (ix + MAN.CURR_POS.X)
	ld      a, (ix + MAN.SPRITE)

	call    loc_9712

	ld      bc, SCORE_KILL
	call    change_score

loc_96BF:
	ld      e, 0

loc_96C1:
	ld      d, $0A

loc_96C3:
	call    get_fake_rnd

	and     $1F
	ld      b, a
	ld      c, e
	push    de

	call    object_by_coords

	pop     de
	and     a
	ld      l, STATUS.WALKING	;0
	jr      z, set_man_status

	cp      OBJECT.ROPE
	ld      l, STATUS.ROPE		;3
	jr      z, set_man_status

	cp      OBJECT.HIDLADDER
	ld      l, STATUS.WALKING	;0
	jr      z, set_man_status

	cp      OBJECT.BOX
	jr      z, set_man_status

	dec     d
	jr      nz, loc_96C3

	inc     e
	ld      a, 4
	cp      e
	jr      z, loc_96BF

	jr      loc_96C1
; ---------------------------------------

set_man_status:
	ld      (ix + MAN.ALLOW), l

	ld      a, b
	add     a, a
	add     a, a
	add     a, a
	ld      b, a		; B=B*8

	ld      a, c
	add     a, a
	add     a, a
	add     a, a
	ld      c, a		; C=C*8

	ld      (ix + MAN.CURR_POS.Y), c
	ld      (ix + MAN.CURR_POS.X), b
	ld      (ix + MAN.SPRITE), SPRITE.MAN
	ld      (ix + MAN.VAR_10), 2
	ld      a, SPRITE.MAN

	call    loc_9712

	jp      next_enemy
