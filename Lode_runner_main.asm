  include "Lode_constants.asm"
  include "ZX_constants.asm"


L5B00:
  defs 743

L5D37:
	LD (HL),A
	LDIR
	LD IY,#5C3A
	JP L5DFA

	JP NC,#0000

	XOR A
	OUT (#FE),A
	JP #5BE3

L5DFA:
	LD HL,#E603
	LD DE,#FFFB
	LD BC,#87FC
	LDDR
	JP GAME_START

;5E08	
GFX_1:
	include "data/Lode_runner_norm_gfx1.asm"

	include "code/6608-6651__init_game.asm"

L6652:
	defb $49, $24, $92, $49

	include "code/6656-66A2__show_publisher.asm"
	include "code/66A3-6741__blinking_stars.asm"

	NOP
	NOP

	include "code/6744-6751__rom_rnd.asm"
  
  defb $00,$00


L6754:
  defm "SOFTWARE PROJECTS"

;triangle logo
L6765:
  defb $ce,$cf,$d0,$d1,$d2,$d3
  defb $d4,$d5,$d6,$d7,$d8,$d9
  defb $da,$db,$dc,$dd,$de,$d9
  defb $df,$e0,$e1,$e2,$de,$d9
  defb $ce,$cf,$e3,$e4,$e5,$e6


L6783:
  defm "PROUDLY PRESENT"
  defm "BRODERBUND SOFTWARE(S"
  defm "LODE RUNNER"
  defm "                     "


	include "code/67C7-6811__demo_rooms.asm"

	nop		; used!

L6813:
  defm "PRESS"
  defb $05
  defm "ANY"
  defb $05
  defm "KEY"
  defb $05
  defm "FOR"
  defb $05
  defm "MAIN"
  defb $05
  defm "MENU"

	include "code/682E-68B7__show_infoline.asm"


L68b8:
  defm "SCORE         LIVES     LEVEL   "


	include "code/68D8-6993__main_menu.asm"


L6994:
  defm "LODE RUNNER -  GAME SELECTION"
  defm "1 KEYBOARD"
  defm "2 KEMPSTON"
  defm "3 INTERFACE 2"
  defm "4 CURSOR"
  defm "5 REDEFINE KEYS"
  defm "6 LOAD SCREENS"
  defm "7 SAVE SCREENS"
  defm "8 EDIT SCREENS"
  defm "0 START GAME"


	include "code/6A1F-6AB2__tape_option.asm"

	JP print_menu


L6ab6:
  defm "LODE RUNNER -  LOAD OPTION"
  defm "SAVE OPTION"
  defm "PRESS BREAK TO ABORT"
  defm "OR"
  defm "ENTER "
  defm "WHEN TAPE IS READY"


	include "code/6B09-6B48___UNKNOWN.asm"
	include "code/6B49-6B56__cls.asm"
	include "code/6B57-6B73__random_fade_screen.asm"
	include "code/6B74-6B9A___UNKNOWN.asm"
	include "code/6B9B-6BB0__print_colored_str.asm"
	include "code/6BB1-6BB6__delay_bc.asm"

L6BB7:  
	defs 33

	include "code/6BD8-6C9D___UNKNOWN.asm"

	include "code/6C00-77FF___UNUSED.asm"

GFX:
	display "graphics start: ", /A, $
	include "data/Lode_runner_norm_gfx2.asm"
	display "graphics end: ", /A, $

	include "code/8000-8049__game_start.asm"


PATCH_END_OF_MEMORY:
  defb $49,$24,$92,$49


	include "code/804E-809A__print_intro.asm"
	include "code/809B-8139__starfield.asm"

STARS_LOOPS:
	db $D7
byte_813B:
	db 0


	include "code/813C-8149__get_fake_rnd.asm"


FAKE_RND:
	dw $01A1


aSoftwareProjec:
	IFDEF CHAMPIONSHIP
	defm "-TEST 2023.02.03-"
	ELSE
	defm "SOFTWARE PROJECTS"
	ENDIF

TRIANGLE_LOGO:				; 6x5 cells
  defb $ce,$cf,$d0,$d1,$d2,$d3
  defb $d4,$d5,$d6,$d7,$d8,$d9
  defb $da,$db,$dc,$dd,$de,$d9
  defb $df,$e0,$e1,$e2,$de,$d9
  defb $ce,$cf,$e3,$e4,$e5,$e6


L817b:
  defm "PROUDLY PRESENT"
  defm "BRODERBUND SOFTWARE(S"
  defm "LODE RUNNER"

SPACELINE:
  defm "                     "


	include "code/81BF-8209__show_demo.asm"


ROOM_NO:
  defb $01

aPressAnyKeyFor:
  defm "PRESS"
  defb $05
  defm "ANY"
  defb $05
  defm "KEY"
  defb $05
  defm "FOR"
  defb $05
  defm "MAIN"
  defb $05
  defm "MENU"


	include "code/8226-82AF__print_info_line.asm"


aScoreLivesLeve:
  defm "SCORE         LIVES     LEVEL   "


	include "code/82D0-838B__print_menu.asm"


MENU_TEXTS:
	IFDEF CHAMPIONSHIP
  defm "  LODE RUNNER - CHAMPIONSHIP "
	ELSE
  defm "LODE RUNNER -  GAME SELECTION"
	ENDIF

  defm "1 KEYBOARD"
  defm "2 KEMPSTON"
  defm "3 INTERFACE 2"
  defm "4 CURSOR"
  defm "5 REDEFINE KEYS"

  defm "6 LOAD SCREENS"
  defm "7 SAVE SCREENS"
  defm "8 EDIT SCREENS"

  defm "0 START GAME"

MENU_ATTR:
				 ; row len
  defb COLOR.WHITE,$04,$0a	; keyboard
  defb COLOR.WHITE,$06,$0a	; kempston...
  defb COLOR.WHITE,$08,$0d
  defb COLOR.WHITE,$0a,$08
  defb COLOR.WHITE,$0c,$0f

  defb COLOR.SKYBLUE,$0f,$0e
  defb COLOR.SKYBLUE,$11,$0e
  defb COLOR.SKYBLUE,$13,$0e

  defb COLOR.YELLOW,$16,$0c	; ...start game
  defb $ff
  

	include "code/8433-84AD__tape_menu.asm"


TAPE_OPTION:
  defm "LODE RUNNER -  LOAD OPTION"
SAVE_OPTION:
  defm "SAVE OPTION"
PRESS_BREAK:
  defm "PRESS BREAK TO ABORT"
  defm "OR"
  defm "ENTER WHEN TAPE IS READY"


	include "code/8501-8540__print_symbol.asm"
	include "code/8541-854E__clear_screen.asm"
	include "code/854F-856B__random_scr_fade.asm"
	include "code/856C-8592__sprite_color.asm"
	include "code/8593-85A8__print_string.asm"


loc_85A9:
	dec     c
	jr      nz, loc_85A9
	djnz    loc_85A9

	ret


	include "data/85AF-86D8___UNUSED.asm"
	include "code/86D9-8710__wait_for_key.asm"


KEYMAP:
	defm "BNMsp"
	defm "HJKLe"
	defm "YUIOP"
	defm "67890"
	defm "54321"
	defm "TREWQ"
	defm "GFDSA"
	defm "VCXZc"


	include "code/8739-878B__inkey_leftright.asm"
	include "code/878C-87DA__inkey_updown.asm"
	include "code/87DB-8810__inkey_fire.asm"
	include "code/8811-883A__print_big_strng.asm"
	include "code/883B-88E3__enter_name.asm"


INPUT_METHOD:
  defb $00
KEEP_STACK:
  defb $01,$ff
  defb $00


aSpaces:
  defm "          "


	include "code/88F2-893A__edit_screen.asm"


GAME_GENERATOR:
  defm "LODE RUNNER -  GAME GENERATOR"
  defm "1 EDIT  "
  defm "2 TEST  "
  defm "3 MOVE  "
  defm "4 RETURN"


	include "code/8978-89EB__enter_number.asm"
	include "code/89EB-8A0F__test_screen.asm"
	include "code/8A10-8A25__clear_score.asm"
	include "code/8A26-8A67__start_game.asm"
	include "code/8A68-8B26__room_done.asm"


aMadeIt:
  defm "MADE IT.. "
  defm "PITY YOU HAD TO CHEAT ISN(T IT"
  defm "      BETTER LUCK NEXT TIME      "

aBonus500PerLif:
  defm "BONUS :  500 PER LIFE REMAINING"
  defm "FINAL SCORE. "

aWellDone:
  defm "WELL DONE"
  defm "PRESS ANY KEY"

aPressAnyKey_0:
  defm "PRESS ANY KEY"

aGameOver:
  defm "GAME OVER"


	include "code/8BC8-8C25__copy_screen.asm"


aToScreen:
  defm " TO "


SOURCE_SCREEN:
  defb $00
DEST_SCREEN:
  defb $00
  

	include "code/8C2C-8C40__find_room_address.asm"
	include "code/8C41-8C4E__find_level_coords.asm"
	include "code/8C4F-8D9C__edit_screens.asm"


EDIT_KEYS_1:
  defm "0=  1=! 2=\" 3=# 4=$ 5=% 6=& 7=' 8="
  defb SPRITE.MAN
  defm " 9="
  defb SPRITE.MAN

L8dc4:
  defm "    NO 00 (SPACE( TO EXIT"


KEEP_MENU_SEL:
  defb $00
L8DDE:
  defb $00


SPRITE_COLORS:
  defb COLOR.BRIGHT + COLOR.WHITE	; 0 blank
  defb COLOR.BRIGHT + COLOR.RED		; 1 bricks
  defb COLOR.BRIGHT + COLOR.RED		; 2 solid blocks
  defb COLOR.BRIGHT + COLOR.WHITE	; 3 ladders
  defb COLOR.BRIGHT + COLOR.WHITE	; 4 hangers
  defb COLOR.BRIGHT + COLOR.SKYBLUE	; 5 hidden bricks
  defb COLOR.BRIGHT + COLOR.GREEN	; 6 hidden ladders
  defb COLOR.BRIGHT + COLOR.YELLOW	; 7 box
  defb COLOR.BRIGHT + COLOR.MAGENTA	; 8 enemy
  defb COLOR.WHITE					; 9 player
 

before_show:
	display "show: ", /A, $
	display "len: ", /A, after_show-before_show
	IFNDEF FASTDRAW
		include "code/8DE9-8E7F__show_room.asm"
	ELSE
		include "code/8DE9-8E7F__show_room_fast2.asm"
	ENDIF
after_show:

	display "encode: ", /A, $
	display "len: ", /A, after_encode-before_encode

before_encode:
	IFNDEF FASTDRAW
		include "code/8E80-8EC0__encode_level.asm"
	ELSE
		include "code/8E80-8EC0__encode_level_fast.asm"
	ENDIF
after_encode:

	display "after encode:"
	display $
	
	include "code/8EC1-8F36__store_edited_men.asm"
	include "code/8F37-8F55__object_by_coords.asm"
	include "code/8F56-8FA0__show_cell.asm"
	include "code/8FA1-8FE0__play_room.asm"
	include "code/8FE1-8FFF__check_hiscore.asm"


aCongratulation:
  defm "CONGRATULATIONS"
  defm "YOU HAVE SCORED ONE OF TODAY(S"
  defm "TOP HIGH SCORES"
  defm "PLEASE ENTER YOUR NAME"
  defm "<<        >>"

CONGRATS_ATTRIB:   		 ; col row length
	CONGRATS COLOR.WHITE,  $08,$05,$0f
	CONGRATS COLOR.WHITE,  $01,$07,$1e
	CONGRATS COLOR.WHITE,  $08,$09,$0f
	CONGRATS COLOR.YELLOW, $05,$0d,$16
	CONGRATS COLOR.SKYBLUE,$0a,$0f,$0c

	include "code/9072-90E9__new_hiscore.asm"


aLodeRunner_2:
  defm "LODE RUNNER"
  defm "HALL OF FAME"


	include "code/9101-9158__hall_of_fame.asm"
	include "code/9159-9185__change_score.asm"

  
LIVES:
  defb $00
  

SCORE:
	SCOREPAIR 0,0

SCORE_TXT:
  defm "0000000"

NAME_BUFFER:
  defm "        "

CHEATED:
  defb $00
CURRENT_ROOM:
  defb $00
ENEMY_COUNT:
  defb $00
PLAYER_COL:		; coord
  defb $00
PLAYER_ROW:		; coord
  defb $00

; 1) used 10 bytes for 5 enemies col/row pairs
; 2) used 24 bytes for starfield
ENEMIES:  
  defb $05,$05,$08,$04,$09,$10,$03,$0b,$06,$02
  defb $09,$02,$01,$09,$1e,$ff,$0f,$05,$ff,$ff
  defb $ff,$ff,$ff,$ff
  
TOTAL_BOXES:	; ???
  defb $00
  
BOXES_LEFT:
  defb $00

HALL_OF_FAME:
  HISCORE ,,, {"H.F.C.  "}
  HISCORE ,,, {"IAN     "}
  HISCORE ,,, {"DAVID   "}

HISCORE_PREV:
  HISCORE ,,, {"NEIL    "}

HISCORE_LAST:
  HISCORE ,,, {"ALAN    "}
HALL_OF_FAME_END:


jp_to_prepare_for_play:
	jr	prepare_for_play


jump_redefine:
	jp do_redefine


	include "code/9211-9259__prepare_for_play.asm"
	include "code/925A-92A0__check_speckeys.asm"
	include "code/92A1-92BA___UNKNOWN.asm"
	include "code/92BB-92E6__check_catchers.asm"
	include "code/92E7-9315__get_player_move.asm"
	include "code/9316-9347__collect_box.asm"	
	include "code/9348-9366__transform_ladders.asm"
	include "code/9367-93A1__victory_beeper.asm"
	include "code/93A2-93E2___UNKNOWN.asm"
	include "code/93E3-945A___UNKNOWN.asm"
	include "code/945B-94D2__process_traps.asm"
	include "code/94D3-957F___UNKNOWN.asm"


loc_9580:
	jr      loc_958F
; ---------------------------------------

	include "code/9582-95D2___UNKNOWN.asm"
	include "code/95D3-95F2__set_enemy_vars.asm"
	include "code/95F3-96A8___UNKNOWN.asm"


; -------------------
	ld      (ix+$0F), 0
; -------------------


	include "code/96AD-9711___UNKNOWN.asm"
	include "code/9712-977A___UNKNOWN.asm"
	include "code/977B-97F1__prepare_men.asm"
	include "code/97F2-9803__object_by_pixels.asm"
	include "code/9804-981C__get_obj_horz.asm"
	include "code/981D-983D__put_object.asm"
	include "code/983E-9875__xor_put_coords.asm"
	include "code/9876-9891__count_level_boxes.asm"
	include "code/9892-98AC__level_exit.asm"
	include "code/98AD-98C7__calc_and_run.asm"
	include "code/98C8-98D4__restore_man_data.asm"

	
PROC_ADDRESSES:
  defw L98EE
  defw loc_9A76
  defw loc_9ADC
  defw loc_9BD9

  ;----------------
COPY_MAN_DATA:
  defb $00
  
COPY_MAN_COORDS:
  defb $00,$00
  
  defb $00

byte_98E1:  
  defb $00

byte_98E2:
  defb $00
  
word_98E3:
  defb $00,$00
  
tmp_coords_enemy:
  defb $00,$00

byte_98E7:  
  defb $00

byte_98E8:  
  defb $00

byte_98E9:
  defb $00
  
tmp_XXX_enemy:
  defb $00,$00
  
byte_98EC:
  defb $00
  
  defb $00
  ;----------------


	include "code/98EE-9A75___UNKNOWN.asm"
	include "code/9A76-9ADB___UNKNOWN.asm"
	include "code/9ADC-9BD8___UNKNOWN.asm"
	include "code/9BD9-9CD1___UNKNOWN.asm"
	include "code/9CD2-9CE7__sound_catched.asm"
	include "code/9CE8-9D04__paint_empty_cells.asm"
	include "code/9D05-9D83___UNKNOWN.asm"
	include "code/9D84-9E1E___UNKNOWN.asm"
	include "code/9E1F-9E91___UNKNOWN.asm"
	include "code/9E92-9EDE__recolor_man.asm"
	include "code/9EDF-9F8B___UNKNOWN.asm"
	include "code/9F8C-9FFB___UNKNOWN.asm"
	include "code/9FFC-A089___UNKNOWN.asm"
	include "code/A08A-A0F6___UNKNOWN.asm"
	include "code/A0F7-A12E___UNKNOWN.asm"



KEEP_COLOR:
  defb $fb
  
word_A130:
  defb $00,$00
  
FIRE_FRAME:
  defb $00
XXX_COORDS:
  defb $ed,$b0

LA135:
  defb $fb

HOLES_DATA:
	DUP HOLES_COUNT
		HOLE
	EDUP
HOLES_DATA_END:


byte_A172:
  defb $00
  
GAME_TIMER:
  defb $00		; cycle through 0 to 3

	;----------------------------------
	display "PLAYER_DATA: ", /A, $
PLAYER_DATA:
  defb $00		; procedure
  ; if 1 then player_move
  
PLAYER_PIXELS:
  ;defb $00		; ypixels
  ;defb $00		; xpixels
  PIXELS
  
byte_A177:
  defb $00
  
byte_A178:
  defb $00

byte_A179:
  defb $00		; sprite

  defb $00
  defb $00
  
PLAYER_DIRECT:
  DIRECT
  
  defb $00,$00,$00,$00,$00
	;----------------------------------

	display "ENEMIES_DATA: ", /A, $
ENEMIES_DATA:
	DUP 5
		MAN
	EDUP
 
LA1D8:
	db 0


	include "code/A1D9-A2DC__do_redefine.asm"


La2dd:
  defm "cCPS"
  defm "pSPA"
  defm "sSYM"
  defm "eENT"

INKEYS:
  defw KEYMAP_1-1
  defw KEYMAP_2-1
  defw KEYMAP_3-1
  defw KEYMAP_4-1
  defw KEYMAP_5-1


aPleaseSelectKe:
  defm "PLEASE SELECT KEYS FOR"
  defm "LEFT "
  defm "RIGHT"
  defm "UP   "
  defm "DOWN "
  defm "FIRE "


La326:
  defs $05


aOkYesOrNo:
  defm "OK ? -  YES OR NO"


	include "data/A33C-A9FF___UNUSED.asm"


	display "int table start: ", /A, $
INTERRUPT_TABLE:
  defs 257, $60
	display "int table end: ", /A, $

  
  defb $00,$00,$00,$00,$00,$00,$00,$00
  defb $00,$00,$00,$00,$00,$00,$00,$00
  defb $00,$00,$00,$00,$00,$00,$11,$85
  defb $ec,$50,$01,$0d,$00,$00,$3e,$48
  defb $ab,$91,$1f,$00,$ae,$91,$0f,$05
  defb $ff,$80,$b2,$91,$b2,$80,$3f,$80
  
STACK:
  defb $00


	display "unpacked room start: ", /A, $
	include "data/AB32-ADF1__unpacked_room.asm"
	display "unpacked room end: ", /A, $


  defb $00,$00,$00,$00,$00,$00

TEMP_ROOM:  
  defs 264

LAF00:
  defs 24

	display "--------------"
	display "men: ", /A, $
	include "data/Lode_runner_norm_men.asm"
	display "levels: ", /A, $
	include "data/Lode_runner_norm_levels.asm"
LEVELS_END:
