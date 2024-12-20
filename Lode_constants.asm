	;DEFINE		CHEAT_INVISIBLE
INITIAL_ROOM 	EQU 1
INITIAL_LIVES	EQU 5
HOLE_LIFECYCLE	EQU 40
HOLES_COUNT		EQU 20


SCORE_BONUS	EQU 10
SCORE_KILL	EQU 15	; 15*5=75
SCORE_TRAP	EQU 15
SCORE_BOX	EQU 50	; 50*5=250
SCORE_LIVES	EQU 50	; added twice


OBJECT
.EMPTY		EQU $00
.BRICKS		EQU $01
.SOLID		EQU $02
.LADDER		EQU $03
.ROPE		EQU $04
.HIDBRICKS	EQU $05
.HIDLADDER	EQU $06
.BOX		EQU $07


SPRITE
;------------------
.RIGHT1		EQU $10
.RIGHT2		EQU $11
.RIGHT3		EQU $12
;------------------
.LEFT1		EQU $13
.LEFT2		EQU $14
.LEFT3		EQU $15
;------------------
.CLIMBER1	EQU $16
.CLIMBER2	EQU $17
;------------------
.ROPELEFT1	EQU $18
.ROPELEFT2	EQU $19
.ROPELEFT3	EQU $1A
;------------------
.ROPERIGHT1	EQU $1B
.ROPERIGHT2	EQU $1C
.ROPERIGHT3	EQU $1D
;------------------
.MAN		EQU $1E
;------------------
.XXX		EQU $1F
;------------------
.EMPTY		EQU $20 + OBJECT.EMPTY
.BRICKS		EQU $20 + OBJECT.BRICKS
.SOLID		EQU $20 + OBJECT.SOLID
.LADDER		EQU $20 + OBJECT.LADDER
.ROPE		EQU $20 + OBJECT.ROPE
.HIDBRICKS	EQU $20 + OBJECT.HIDBRICKS
.HIDLADDER	EQU $20 + OBJECT.HIDLADDER
.BOX		EQU $20 + OBJECT.BOX
;------------------
.TRAPPED	EQU $28	; no real sprite


STATUS
.WALKING	EQU $00
.FALLING	EQU $01
.LADDER		EQU $02
.ROPE		EQU $03
.ALLOW_4	EQU $04
.ALLOW_5	EQU $05

VECTOR
.TORIGHT	EQU 1
.TOLEFT		EQU -1
.TOUP		EQU -1
.TODOWN		EQU 1
.NONE		EQU 0


	STRUCT COORDS
ROW		BYTE
COL		BYTE
	ENDS

	STRUCT PIXELS
Y		BYTE
X		BYTE
	ENDS

	STRUCT DIRECT
VERT	BYTE 0	; -1=up, 1=down
HOR		BYTE 0	; -1=left, 1=right
	ENDS

	STRUCT HOLE
LIFECYCLE	BYTE 0	; FF=closed
PIX			PIXELS
	ENDS

	STRUCT MAN
ALLOW		BYTE 0	; A183		; status
CURR_POS	PIXELS	; A184/A185	; current y/x coord
CURR_DIR	DIRECT	; A186/A187
SPRITE		BYTE 0	; A188		; sprite index
COORDS		PIXELS	; A189/A18A	; new y/x coord ???
DIR			DIRECT	; A18B/A18C	; new vector
VAR_0A		BYTE 0	; A18D		; sprite copy ???
SPR_FRAME	BYTE 0	; A18E		; sprite frame
IS_ENEMY	BYTE 0	; A18F		; 0=player, enemy otherwise
HAVE_BOX	BYTE 0	; A190		; 0=empty, 1=holding
GOUPDOWN	BYTE 0	; A191		; 0=up, 1=down
GORIGHTLEFT	BYTE 0	; A192		; 0=right, 1=left
VAR_10		BYTE 0	; A193	 
	ENDS


	STRUCT CONGRATS
COLOR	BYTE 0
COLUMN	BYTE 0
ROW		BYTE 0
LENGTH	BYTE 0
	ENDS

	STRUCT HISCORE
SCORE1	BYTE $C8
SCORE2	BYTE 0
SCORE	TEXT 7, {"0001000"}
NAME	TEXT 8, {" "}
	ENDS

	STRUCT SCOREPAIR
LO		BYTE 0
HI		BYTE 0
	ENDS