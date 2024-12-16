; -----------------
; UNUSED START
LA33C:
  defm " "

La33d:
  defb $01,$77,$16,$00,$be,$28,$01,$14

La345:
  defm "z2n"

La348:
  defb $9b
  
LA349:
  defb $a7,$3a,$9c,$a3,$28,$02,$ed
  defb $44,$a7,$20,$07,$3a,$e3,$a3,$a7
  defb $20,$01

La35a:
  defm "=2i"

La35d:
  defb $9b,$af,$32,$6a,$9b,$c9,$79,$e6
  defb $07

La366:
  defm " *:"

La369:
  defb $9d,$a3,$57,$1e,$00,$cd,$4b,$a1
  defb $20,$0b,$ed,$53,$69,$9b,$21,$01
  defb $00,$22,$6e,$9b,$c9

LA37E:
	LD A,D
	NEG
	LD D,A
	CALL #A14B

	JR NZ,LA392

	LD (L9B69),DE		; !!! SMC
	LD HL,$0100
	LD (L9B6D+1),HL		; !!! SMC
	RET

LA392:
	LD HL,L9B6D+1		; !!! SMC
	LD A,(HL)
	XOR $01
	LD (HL),A
	JR LA349

  
LA39B:
  defb $fb,$00,$00,$00,$ed,$b0
  defb $fb

  defs 1630
; UNUSED END
; -----------------
