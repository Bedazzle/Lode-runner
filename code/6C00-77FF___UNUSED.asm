	include "code/6C9E-6CE0___UNKNOWN.asm"
	include "code/6CE1-6D18___UNKNOWN.asm"


L6d19:
  defm "BNMsp"
  defm "HJKLe"
  defm "YUIOP"
  defm "67890"
  defm "54321"
  defm "TREWQ"
  defm "GFDSA"
  defm "VCXZc"

	include "code/6D41-6EEB___UNKNOWN.asm"


L6EEC:
  defb $00,$00,$00,$00

L6ef0:
  defm "          "


	include "code/6EFA-6F42__menu_editor.asm"


L6f43:
  defm "LODE RUNNER -  GAME GENERATOR"
  defm "1 EDIT  "
  defm "2 TEST  "
  defm "3 MOVE  "
  defm "4 RETURN"


	include "code/6F80-6FF2__enter_level_number.asm"
	include "code/6FF3-7017__prepare_edit.asm"
	include "code/7018-702D__score_to_zero.asm"
	include "code/702E-7117__print_game_over.asm"
	include "code/7118-712E__print_big_gameover.asm"


L712f:
  defm "MADE IT.."
  defm " PITY YOU HAD TO CHEAT ISN(T IT "
  defm "     BETTER LUCK NEXT TIME      "
  defm "BONUS :  500 PER LIFE REMAINING"
  defm "FINAL SCORE."
  defm " WELL DONE"
  defm "PRESS ANY KEY"
  defm "PRESS ANY KEY"
  defm "GAME OVER"


	include "code/71D0-722D__copy_room.asm"

L722e:
  defm " TO "


L7232:
  defb $00,$00


	include "code/7234-7248__find_room_addr.asm"
	include "code/7249-7256__find_man_address.asm"
	include "code/7257-73A4___UNKNOWN.asm"


L73a5:
  defm "0=  1=! 2=\" 3=# 4=$ 5=% 6=& 7='"
  defm " 8="
  defb $1e
  defm " 9="
  defb $1e

  defm "    NO 00 (SPACE( TO EXIT"


L73e5:
  defs $02


L73e7:
  defm "GBBGGEDFC"


L73f0:
  defb $07
  
	include "code/73F1-7487___UNKNOWN.asm"
	include "code/7488-74C8___UNKNOWN.asm"
	include "code/74C9-753E___UNKNOWN.asm"
	include "code/753F-755D__object_by_coords_(copy).asm"
	include "code/755E-7599___UNKNOWN.asm"
	include "code/759A-75A8___UNKNOWN.asm"
	include "code/75A9-75E8___UNKNOWN.asm"
	include "code/75E9-7607__check_score.asm"


L7608:
  defm "CONGRATULATIONS"
  defm "YOU HAVE SCORED ONE OF TODAY(S"
  defm "TOP HIGH SCORES"
  defm "PLEASE ENTER YOUR NAME"
  defm "<<        >>"


L7666:
  defb $07,$08,$05,$0f,$07,$01,$07,$1e
  defb $07,$08,$09,$0f,$06,$05,$0d,$16
  defb $05,$0a,$0f,$0c

	include "code/767A-76F1__add_hiscore.asm"


L76f2:
  defm "LODE RUNNER"
  defm "HALL OF FAME"

	include "code/7709-7760__show_hall_of_fame.asm"
	include "code/7761-778D__print_score.asm"
  
L778E:
  defb $00,$00,$00


L7791:
  defm "0000000"
  defm "        "


L77a0:
	defs 31
  
  defb $c8,$00
  defm "0001000"
  defm "H.F.C.  "

  defb $c8,$00
  defm "0001000"
  defm "IAN     "

  defb $c8,$00
  defm "0001000"
  defm "DAVID   "

  defb $c8,$00
  defm "0001000"
  defm "NEIL "
