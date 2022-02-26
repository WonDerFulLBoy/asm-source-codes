	.model	small
	.386
	.data
max	db	40
len	db	?
text	db	40 (?)
;d	db	'$'
;a	db	'     $'
msg1	db	13, 10, 'Number of alphabets: $'
msg2	db	13, 10, 'Number of digits: $'
msg3	db	13, 10, 'Number of other characters: $'
	.code
main	proc
	mov	ax, @data
	mov	ds, ax

	mov	si, 0
	mov	di, 0
	mov	bp, 0

	lea	dx,max
	mov	ah,10
	int	21h

up:	mov	ah, 1
	int	21h
	
	cmp	al, 'A'
	jl	td	
	cmp	al, 'Z'
	jg	tl	
	inc	si
	jmp	up
	
tl:	cmp	al, 'a'
	jl	to
	cmp	al, 'z'
	jg	to
	inc	si
	jmp	up
	
td:	cmp	al, '0'
	jl	to
	cmp	al, '9'
	jg	to
	inc	di
	jmp	up

to:	inc	bp
	cmp	al, '.'
	jne	up
	
exit:	mov	ah, 9
	lea	dx, msg1
	int	21h
	mov	ax, si
	call	print

	mov	ah, 9
	lea	dx, msg2
	int	21h	
	mov	ax, di
	call	print

	mov	ah, 9
	lea	dx, msg3
	int	21h
	mov	ax, bp
	call	print

	mov	ax, 4c00h
	int	21h
main	endp

print	proc

	pusha
	
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

	mov	ah, 