count_level_boxes:
	ld      bc, 768	; must be 32*22 = 704
	ld      d, 0
	ld      hl, UNPACKED_ROOM

loop_count:
	ld      a, (hl)
	cp      OBJECT.BOX
	jr      nz, check_next_box

	inc     d

check_next_box:
	inc     hl
	dec     bc

	ld      a, b
	or      c
	jr      nz, loop_count

	ld      a, d
	ld      (BOXES_LEFT), a
	ld      (TOTAL_BOXES), a

	ret
