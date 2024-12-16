process_traps:
	ld      de, HOLE
	ld      iy, HOLES_DATA
	ld      a, (HOLES_DATA_END - HOLES_DATA) / HOLE

loop_traps:
	ld      l, (iy + HOLE.PIX.Y)
	ld      h, (iy + HOLE.PIX.X)
	and     a
	sbc     hl, bc

	jr      nz, next_trap

	ld      (ix + MAN.ALLOW), STATUS.ALLOW_5

	ld      a, (ix + MAN.GORIGHTLEFT)
	and     a
	jr      z, loc_9497

	call    object_by_pixels

	cp      OBJECT.BOX
	jr      nz, drop_box

	ld      hl, BOXES_LEFT
	dec     (hl)
	jr      loc_9497
; ---------------------------------------

drop_box:
	push    bc
	ld      a, OBJECT.BOX
	call    put_object
	pop     bc

	ld      a, SPRITE.BOX
	call    xor_put_coords

	ld      a, COLOR.BRIGHT + COLOR.YELLOW
	call    sprite_color

loc_9497:
	ld      (ix + MAN.GORIGHTLEFT), SPRITE.TRAPPED	;MAN_IN_HOLE
	pop     bc

	call    object_by_pixels

	cp      OBJECT.BRICKS
	jr      nz, trap_enemy

	pop     bc
	ld      (ix + MAN.GORIGHTLEFT), STATUS.WALKING	;0
	jp      loc_957C
; ---------------------------------------


	include "code/94AB-94CD__trap_enemy.asm"


next_trap:
	add     iy, de
	dec     a
	jr      nz, loop_traps
