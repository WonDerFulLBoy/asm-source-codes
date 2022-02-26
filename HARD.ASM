chap	macro	msg
	pusha
	mov	ah, 9
	lea	dx, msg	
	int	21h
	popa
	endm

zero	macro	m
	pusha
	mov	cx, 5
	mov	si, 0
m:	mov	a[si], 0
	inc	si
	loop	m
	popa	
	endm

print	macro	y, x

	pusha

	mov	ax, y
	
	mov	di, 4
	mov	cx, 10
x:	mov	dx, 0
	div	cx
	add	dl, '0'
	mov	a[ di ], dl 
	dec	di
	cmp	ax, 0 
	jnz	x
	mov	ax, 0
	
	popa
	chap	a
	
	endm	

	.model	small
	.386
	.data
a	db	'     $'
msg1	db	13, 10, 'AX : $'
msg2	db	13, 10, 'BX : $'
msg3	db	13, 10, 'CX : $'
msg4	db	13, 10, 'DX : $'
	.code
main	proc
	mov	ax, @data
	mov	ds, ax

	mov	ah, 36h
	mov	dl, 3
	int	21h

	chap	msg1
	print	ax, aa
	zero	m1
	chap	msg2
	print	bx, bb
	zero	m2
	chap	msg3
	print	cx, cc
	zero	m3
	chap	msg4
	print	dx, dd

	mov	ax, 4c00h
	int	21h
main	endp
	end	main

	
	