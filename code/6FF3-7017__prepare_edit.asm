prepare_edit:
	LD BC,$0A09
	LD A,PAPER.BLACK + COLOR.SKYBLUE + COLOR.FLASH	;#85
	CALL sprite_color

	LD B,$11
	CALL enter_number

	LD (CURRENT_ROOM),A
	LD A,$01
	LD (LIVES),A
	DEC A
	LD (L8F73 + 1),A		; #8F74		!!! SMC
	LD (L8F91),A		; #8F91		!!! SMC
	CALL clear_score
	CALL play_room

	JP edit_screen 
