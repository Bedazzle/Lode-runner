print_intro:
	xor     a
	out     (BORDER), a

	call    random_scr_fade

	ld      hl, aSoftwareProjec
	ld      bc, $0701
	ld      a, COLOR.BRIGHT + COLOR.GREEN
	ld      de, $1144
	call    print_big_strng

	ld      a, COLOR.BRIGHT + COLOR.RED
	ld      e, 5				; height
	ld      c, 4				; row

print_triangle:
	ld      b, $0C			; column
	ld      d, 6				; width
	call    print_string

	inc     c
	dec     e
	jr      nz, print_triangle

	ld      bc, $080B
	ld      a, COLOR.BRIGHT + COLOR.YELLOW
	ld      d, $0F
	call    print_string

	ld      bc, $050D
	ld      d, $15
	call    print_string

	ld      de, $0B45
	ld      bc, $A0F
	ld      a, COLOR.BRIGHT + COLOR.SKYBLUE
	call    print_big_strng

	ld      bc, $0512
	ld      a, COLOR.BRIGHT + COLOR.WHITE
	ld      d, $15
	call    print_string

	ret
