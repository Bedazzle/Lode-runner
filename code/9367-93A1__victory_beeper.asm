	; victory sound
	ld      hl, $086B
	ld      de, $001D
	call    BEEPER

	ld      hl, $067C
	ld      de, $0024
	call    BEEPER

	ld      hl, $04B8
	ld      de, $0032
	call    BEEPER

	ld      hl, $042B
	ld      de, $0037
	call    BEEPER

	ld      b, 5
loc_938D:
	halt
	djnz    loc_938D

	ld      hl, $04B8
	ld      de, $0027
	call    BEEPER

	ld      hl, $042B
	ld      de, $006E
	call    BEEPER
	; victory sound
