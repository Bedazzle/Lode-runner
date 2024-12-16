do_redefine:
  call random_scr_fade

  xor a
  ld (INPUT_METHOD),a
  
  ld hl,aPleaseSelectKe
  ld d,$16
  ld a,COLOR.WHITE
  ld bc,$0507
  call print_string

  ld c,$0a
  ld e,$05
  ld a,COLOR.BRIGHT + COLOR.SKYBLUE

loop_redefine:
  ld b,$0c
  ld d,$05
  call print_string

  inc c
  inc c
  dec e
  jr nz,loop_redefine

  ld b,$05
clear_redefine:
  ld (hl),$ff
  inc hl
  djnz clear_redefine

  ld a,$00
La1d9_2:
  push af
  and a
  jr z,La1d9_4

  dec a
  add a,a
  add a,$0a
  ld c,a
  ld b,$0b
  ld d,$0b
  ld a,COLOR.BRIGHT + COLOR.SKYBLUE

La1d9_3:
  call sprite_color

  inc b
  dec d
  jr nz,La1d9_3

La1d9_4:
  pop af
  push af
  add a,a
  add a,$0a
  ld c,a
  ld b,$0b
  ld d,$0b
  ld a,COLOR.BRIGHT + COLOR.FLASH + COLOR.RED

La1d9_5:
  call sprite_color		; active cursor position

  inc b
  dec d
  jr nz,La1d9_5

La1d9_6:
  call wait_for_key

  cp $ff
  jr nz,La1d9_6

La1d9_7:
  call wait_for_key

  cp $ff
  jr z,La1d9_7

  ld hl,La326
  ld b,$05
  ld (LA1D8),a
  ld e,a

La1d9_8:
  ld a,(hl)

  cp $ff
  jr nz,La1d9_9

  ld (hl),e
  jr clear_redefine0

La1d9_9:
  cp e
  jr z,La1d9_6

  inc hl
  djnz La1d9_8

clear_redefine0:
  ld hl,INKEYS
  pop af
  push af
  add a,a
  add a,l
  ld l,a
  jr nc,clear_redefine1

  inc h

clear_redefine1:
  ld a,(hl)
  inc hl
  ld h,(hl)
  ld l,a
  ld (hl),c
  ld a,$6f

clear_redefine2:
  sub $08
  dec d
  jr nz,clear_redefine2

  ld de,$0004
  add hl,de
  ld (hl),a
  pop af
  push af
  add a,a
  add a,$0a
  ld c,a
  ld a,(LA1D8)

  cp $5b
  jr nc,clear_redefine3

  ld b,$13

  call print_symbol

  jr clear_redefine6

clear_redefine3:
  ld hl,La2dd

clear_redefine4:
  cp (hl)
  jr z,clear_redefine5

  inc hl
  inc hl
  inc hl
  inc hl
  jr clear_redefine4

clear_redefine5:
  inc hl
  ld b,$12
  ld a,COLOR.FLASH + COLOR.BRIGHT + COLOR.RED
  ld d,$03

  call print_string

clear_redefine6:
  ld hl,$03e8
  ld de,$0032
  call BEEPER

  pop af
  inc a

  cp $05
  jp nz,La1d9_2

  ld hl,aOkYesOrNo
  ld a,COLOR.YELLOW
  ld bc,$0815
  ld d,$11
  call print_string

  ld bc,$0a12
  ld a,COLOR.BRIGHT + COLOR.SKYBLUE
  ld d,$0c

clear_redefine7:
  call sprite_color

  inc b
  dec d
  jr nz,clear_redefine7

clear_redefine8:
  call wait_for_key

  cp $ff
  jr nz,clear_redefine8

wait_for_Y_N:
  call wait_for_key

  cp 'N'
  jp z,do_redefine

  cp 'Y'
  jp z,print_menu

  jr wait_for_Y_N
