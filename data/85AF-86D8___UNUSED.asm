L85AF:
  defb $00,$00
  defb $00,$00,$00,$00,$00,$00,$00,$00
  defb $00,$00,$00,$00,$00,$00,$00,$00
  defb $00,$00,$00,$00,$00,$00,$00,$00
  defb $00,$00,$00,$00,$00,$00,$00
  
  defb $eb
  defb $78,$e6,$07,$20,$04,$21,$6b,$86
  defb $35,$32,$43,$86,$cb,$38,$cb,$38
  defb $cb,$38,$79,$e6,$07,$c6,$40,$cb
  defb $71,$28,$02,$c6,$08,$cb,$79,$28
  defb $02,$c6,$10,$67,$79,$e6,$38,$87
  defb $87,$80,$6f,$3a,$43,$86,$d6,$08
  defb $ed,$44,$47,$3e,$08,$90,$fe,$09
  defb $f5,$3e,$0b,$38,$01,$af,$32,$69
  defb $86,$3e,$ff,$87,$10,$fd,$32,$5a
  defb $86,$f1,$38,$06,$d6,$08,$fe,$09
  defb $30,$fa,$47,$3e,$ff,$cb,$3f,$10
  defb $fc,$32,$76,$86,$06,$00,$c5,$e5
  defb $e5,$0e,$01,$06,$00,$21,$af,$85
  defb $eb,$ed,$b0,$eb,$36,$00,$23,$36
  defb $00,$3e
  
L8643:
  defb $00,$a7,$28,$12,$47,$08
  defb $78,$06,$01,$21,$af,$85,$08,$cb
  defb $1e,$08,$23,$10,$f9,$3d,$20,$f1
  defb $3e
  
L865A:
  defb $00,$e1,$dd,$21,$af,$85,$a6
  defb $dd,$b6,$00,$77,$23,$dd,$23,$18

L8669:
  defb $00,$06
  
L866B:
  defb $00,$dd,$7e,$00,$77,$dd
  defb $23,$23,$10,$f7

;	ORG #85D0
;	EX DE,HL
;	LD A,B
;	AND #07
;	JR NZ,#85DA
;	LD HL,L866B
;	DEC (HL)
;	LD (L8643),A
;	SRL B
;	SRL B
;	SRL B
;	LD A,C
;	AND #07
;	ADD A,#40
;	BIT 6,C
;	JR Z,#85EE
;	ADD A,#08
;	BIT 7,C
;	JR Z,#85F4
;	ADD A,#10
;	LD H,A
;	LD A,C
;	AND #38
;	ADD A,A
;	ADD A,A
;	ADD A,B
;	LD L,A
;	LD A,(L8643)
;	SUB #08
;	NEG
;	LD B,A
;	LD A,#08
;	SUB B
;	CP #09
;	PUSH AF
;	LD A,#0B
;	JR C,#860F
;	XOR A
;	LD (L8669),A
;	LD A,#FF
;	ADD A,A
;	DJNZ #8614
;	LD (L865A),A
;	POP AF
;	JR C,#8623
;	SUB #08
;	CP #09
;	JR NC,#861D
;	LD B,A
;	LD A,#FF
;	SRL A
;	DJNZ #8626
;	LD (L8675 + 1),A
;	LD B,#00
;	PUSH BC
;	PUSH HL
;	PUSH HL
;	LD C,#01
;	LD B,#00
;	LD HL,L85AF
;	EX DE,HL
;	LDIR
;	EX DE,HL
;	LD (HL),#00
;	INC HL
;	LD (HL),#00
;	LD A,#00
;L8643:
;	AND A
;	JR Z,#8659
;	LD B,A
;	EX AF,AF'
;	LD A,B
;	LD B,#01
;	LD HL,L85AF
;	EX AF,AF'
;	RR (HL)
;	EX AF,AF'
;	INC HL
;	DJNZ #864F
;	DEC A
;	JR NZ,#864A
;	LD A,#00
;L865A:
;	POP HL
;	LD IX,L85AF
;	AND (HL)
;	OR (IX+#00)
;	LD (HL),A
;	INC HL
;	INC IX
;	JR #866A
;L8669:
;	LD B,#00
;L866B:
;	LD A,(IX+#00)
;	LD (HL),A
;	INC IX
;	INC HL
;	DJNZ #866C

  
L8675:
	LD A,#00
	AND (HL)
	OR (IX+#00)
	LD (HL),A
	POP HL
	INC H
	LD A,H
	AND #07
	JR NZ,#8692
	LD A,L
	CP #E0
	JR NC,#868E
	LD BC,#F820
	ADD HL,BC
	JR #8692
	LD A,L
	ADD A,#20
	LD L,A
	POP BC
	DJNZ #862F
	RET
  

L8696:
	PUSH BC
	PUSH AF
	LD H,#58
	LD DE,#0202
	LD A,B
	AND #F8
	CP B
	JR Z,#86A4
	INC D
	SRL B
	SRL B
	SRL B
	LD L,B
	LD A,C
	AND #F8
	CP C
	JR Z,#86B2
	INC E
	LD A,C
	AND #F8
	LD B,#00
	ADD A,A
	JR NC,#86BC
	LD B,#02
	ADD A,A
	JR NC,#86C0
	INC B
	LD C,A
	ADD HL,BC
	LD BC,#001E
	LD A,D
	CP #03
	JR NZ,#86CB
	DEC C
	POP AF
	PUSH DE
	LD (HL),A
	INC HL
	DEC D
	JR NZ,#86CD
	POP DE
	ADD HL,BC
	DEC E
	JR NZ,#86CC
	POP BC
	RET
