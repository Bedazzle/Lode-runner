	device zxspectrum48

STARTBLOCK	EQU $4000
	;DEFINE	LEVELADDR	; show level addresses when compiling
	;DEFINE FASTDRAW
	;DEFINE CHAMPIONSHIP


	org $5B00
	include "Lode_runner_main.asm"
	
	IFDEF CHAMPIONSHIP
		org $AF24
		incbin "recompile\lode_champ_01-51.sna_levels.bin"
LEVELS_COUNT EQU 51
CHECK_LVL_DIGIT EQU '6'
	ELSE
LEVELS_COUNT EQU 75
CHECK_LVL_DIGIT EQU '8'	; invalid level number keypress
	ENDIF
		
	savebin "recompile/lode.bin", STARTBLOCK,$FFFF-STARTBLOCK+1
	savesna "recompile/lode.sna", GAME_START
	
	;labelslist "Lode_runner.labels"
