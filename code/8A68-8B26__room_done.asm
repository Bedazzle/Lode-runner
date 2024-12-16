room_done:
	ld      hl, CURRENT_ROOM
	inc     (hl)
	ld      a, (hl)

	ld      hl, LIVES
	inc     (hl)
	jr      nz, no_max_lives

	dec     (hl)

no_max_lives:
	cp      LEVELS_COUNT+1		; max room = 75
	jr      nz, loop_play_room

	call    random_scr_fade
	call    print_info_line

	ld      bc, $0C02
	ld      de, $0947
	ld      a, $47
	ld      hl, aMadeIt   ; "MADE IT.."

	call    print_big_strng

	ld      a, (CHEATED)

	cp      $FF
	jr      nz, print_bonus

	ld      d, $40
	ld      bc, 5
	ld      a, COLOR.BRIGHT + COLOR.GREEN

	call    print_string

print_bonus:
	ld      hl, aBonus500PerLif ; "BONUS :  500 PER LIFE REMAINING"
	ld      bc, $0109
	ld      d, $1F
	ld      a, COLOR.BRIGHT + COLOR.YELLOW
	call    print_string

	ld      bc, $060C
	ld      de, $0C45
	ld      a, COLOR.BRIGHT + COLOR.SKYBLUE
	call    print_big_strng

lives_to_bonus:
	ld      hl, LIVES
	dec     (hl)

	ld      bc, SCORE_LIVES	;50			; 50*5=250
	call    change_score

	ld      bc, SCORE_LIVES	;50			; 50*5=250
	call    change_score

	call    print_info_line

	ld      de, $0745
	ld      bc, $130C
	ld      a, COLOR.BRIGHT + COLOR.SKYBLUE
	ld      hl, SCORE_TXT
	call    print_big_strng

	ld      hl, $03E8
	ld      de, $0064
	call    BEEPER

	halt
	ld      hl, LIVES
	ld      a, (hl)
	and     a
	jr      nz, lives_to_bonus

	ld      hl, aWellDone
	ld      a, COLOR.BRIGHT + COLOR.RED
	ld      de, $0942
	ld      bc, $0B10
	call    print_big_strng

	ld      bc, $0914
	ld      a, COLOR.BRIGHT + COLOR.MAGENTA
	ld      d, $0D
	call    print_string

	ld      hl, L8B08
	ld      (loc_8129+1), hl		; !!! set SMC
	call    starfield

L8B08:
	ld      hl, print_menu
	ld      (loc_8129+1), hl		; !!! set SMC
	jp      check_hiscore

game_over:
	ld      bc, $0B0B
	ld      de, $0947
	ld      hl, aGameOver   ; "GAME OVER"

	ld      a, COLOR.BRIGHT + COLOR.WHITE
	call    print_big_strng

	ld      b, 200
loop_game_over:
	halt
	djnz    loop_game_over

	jp      check_hiscore
