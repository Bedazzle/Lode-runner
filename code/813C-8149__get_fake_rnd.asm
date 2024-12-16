; roll through 8000 to 9FFF addresses

get_fake_rnd:
	push    hl

	ld      hl, (FAKE_RND)
	inc     hl
	inc     h
	res     5, h
	ld      a, (hl)
	ld      (FAKE_RND), hl

	pop     hl

	ret
