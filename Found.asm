	.model	small
	.386
	.data
msg1	db	13, 10, 'Enter the string: $'
msg2	db	13, 10, 'Enter the character: $'
msg3	db	13, 10, 'The character not found.$'
msg4	db	13, 10, 'The character found$'
msg5	db	' times.$'

max	db	20
len	db	?
buf	db	80 dup (?)
d	db	'$'
a	db	'     $'
	.code
main	proc
	mov	ax, @data
	mov	ds, ax

	mov	ah, 9
	lea	dx, msg1
	int	21h

	mov	ah, 10
	lea	dx, max
	int	21h

	mov	ah, 9
	lea	dx, msg2
	int	21h

	mov	ah, 1
	int	21h

	mov	bl, len
	mov	bh, 0
	
	mov	cx, 0
	mov	si, 0
up:	cmp	buf[si], al
	jne	down
	inc	cx
down:	inc	si
	cmp	si, bx
	jnz	up

	jcxz	nf
	mov	ah, 9
	lea	dx, msg4
	int	21h
	mov	ax, cx
	call	print
	mov	ah, 9
	lea	dx, msg5
	int	21h

	jmp	exit

nf:	mov	ah, 9
	lea	dx, msg3
	int	21h
	
exit:	mov	ax, 4c00h	
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

	mov	ah, 9
	lea	dx, a
	int	21h
	
	ret
print	endp	

	end	main