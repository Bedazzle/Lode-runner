loc_95F3:
	dec     (ix + MAN.GORIGHTLEFT)
	ld      c, (ix + MAN.CURR_POS.Y)
	ld      b, (ix + MAN.CURR_POS.X)
	ld      a, (ix + MAN.GORIGHTLEFT)

	cp      4
	jr      c, loc_9613

	call    object_by_pixels

	cp      OBJECT.BRICKS
	jr      nz, next_enemy

	ld      (ix + MAN.GORIGHTLEFT), 0
	jp      kill_enemy
; -------------------
	jr next_enemy			; optimize by remove
; -------------------

loc_9613:
	ld      (ix + MAN.DIR.VERT), VECTOR.TOUP		;$FF
	ld      (ix + MAN.DIR.HOR), VECTOR.NONE		;0
	ld      a, c
	and     7
	jr      z, loc_9624

increase_y_coord:
	ld      a, c
	add     a, 8
	ld      c, a		; C=C+8

loc_9624:
	call    object_by_pixels

	cp      OBJECT.BRICKS
	jr      nz, loc_9632

	ld      (ix + MAN.GORIGHTLEFT), STATUS.WALKING	;0
	jp      kill_enemy
; --------------------

loc_9632:
	ld      a, (ix + MAN.GORIGHTLEFT)

	cp      3
	jr      nz, loc_963E

	ld      a, OBJECT.LADDER
	call    put_object

loc_963E:
	ld      a, STATUS.LADDER		;2
	ld      (ix + MAN.ALLOW), a

	call    calc_and_run

	cp      -1
	ld      a, STATUS.ALLOW_5	;5
	ld      (ix + MAN.ALLOW), a
	jr      nz, loc_9655

	inc     (ix + MAN.GORIGHTLEFT)
	jp      next_enemy
; --------------------

loc_9655:
	ld      bc, (COPY_MAN_COORDS)

	srl     b
	srl     b
	srl     b

	srl     c
	srl     c
	srl     c

	call    get_sprite_colr

	cp      COLOR.BRIGHT + COLOR.WHITE
	jr      nz, loc_9671

	ld      a, COLOR.BRIGHT + COLOR.MAGENTA
	call    sprite_color

loc_9671:
	ld      a, (ix + MAN.GORIGHTLEFT)
	and     a
	jp      nz, next_enemy

	xor     a
	ld      (ix + MAN.ALLOW), a		; STATUS.WALKING
	ld      bc, (COPY_MAN_COORDS)

	ld      a, c
	add     a, 8
	ld      c, a

	push    bc
	ld      a, (PLAYER_PIXELS + PIXELS.X)

	cp      b
	ld      d, VECTOR.TORIGHT	;1
	jr      nc, set_hor_vector

	ld      d, VECTOR.TOLEFT		;-1

set_hor_vector:
	ld      (ix + MAN.DIR.HOR), d
	ld      (ix + MAN.DIR.VERT), VECTOR.NONE		;0

	call    calc_and_run

	pop     bc

	call    object_by_pixels

	cp      OBJECT.LADDER
	jp      nz, next_enemy

	xor     a			; OBJECT.EMPTY
	call    put_object

	jp      next_enemy
