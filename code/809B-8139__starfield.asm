starfield:
	ld      hl, ENEMIES
	ld      de, ENEMIES+1
	ld      (hl), $FF
	ld      bc, $17
	ldir

	xor     a
	ld      (STARS_LOOPS), a

loop_starfield:
	xor     a
	ld      (byte_813B), a
	halt
	halt
	halt
	halt
	ld      hl, ENEMIES
	ld      b, 8

loc_80B9:
	push    bc
	push    hl
	ld      a, (hl)

	cp      $FF
	jr      nz, loc_80F3

	ld      a, (byte_813B)
	and     a
	jr      nz, loc_8115

	inc     a
	ld      (byte_813B), a
	ld      (hl), 0
	inc     hl

	call    get_fake_rnd

	and     $1F
	ld      b, a

loc_80D3:
	call    get_fake_rnd

	and     $1F

	cp      $18
	jr      nc, loc_80D3

	ld      c, a
	call    get_sprite_colr

	and     a
	jr      nz, loc_80D3

	ld      (hl), c
	inc     hl
	ld      (hl), b

	call    get_fake_rnd

	and     3
	add     a, COLOR.BRIGHT + COLOR.GREEN

	call    sprite_color

	dec     hl
	dec     hl
	xor     a

loc_80F3:
	inc     hl
	ld      c, (hl)
	inc     hl
	ld      b, (hl)

	cp      5
	jr      nz, loc_8105

	xor     a

	call    sprite_color

	dec     hl
	dec     hl
	ld      (hl), $FF

	jr      loc_8115
; ---------------------------------------

loc_8105:
	cp      3
	jr      c, loc_810F

	sub     3
	xor     3
	sub     2

loc_810F:
	call    print_symbol

	dec     hl
	dec     hl
	inc     (hl)

loc_8115:
	pop     hl
	inc     hl
	inc     hl
	inc     hl
	pop     bc
	djnz    loc_80B9

	ld      hl, STARS_LOOPS
	dec     (hl)
	ret     z

	call    wait_for_key

	cp      $FF
	jr      z, loc_812C

	pop     bc

loc_8129:
	jp      print_menu		; !!! SMC
; ---------------------------------------

loc_812C:
	call    inkey_fire

	ld      a, d
	and     a
	jr      z, loc_8137

	pop     bc

	jp      print_menu
; ---------------------------------------

loc_8137:
	jp      loop_starfield
