;------------------
; IN:	C=row, B=col
; OUT:	A=object
;------------------
object_by_pixels:
	push    bc

	srl     c
	srl     c
	srl     c	; c=y pixel

	srl     b
	srl     b
	srl     b	; b=x pixel

	call    object_by_coords

	pop     bc

	ret
