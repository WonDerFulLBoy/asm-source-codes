page 100,115
.8086
writech	macro	x,y,ch,fc
	push 	dx
	push  	cx
	push 	ax
	
	mov	dl,x
	mov	dh,y
	mov	ah,02h
	int	10h									
	mov	ah,0eh
	mov	al,ch									
	mov	bl,fc									
	mov	cx,1									
	int	10h									
	pop	ax
	pop 	cx
	pop 	dx
endm
writechi macro	x,y,ch,fc,i
	push 	dx
	push  	cx
	push 	a
	mov	dl,x
	mov	dh,y
	add 	dl,i		
	mov	ah,02h
	int	10h									
	mov	ah,0eh
	mov	al,ch									
	mov	bl,fc									
	mov	cx,1									
	int	10h									
	pop	ax
	pop 	cx
	pop 	dx
endm
writechij macro	x,y,ch,fc,i,j
	push 	dx
	push  	cx
	push 	a
	mov	dl,x
	mov	dh,y
	add 	dl,i
	add	dl,j		
	mov	ah,02h
	int	10h									
	mov	ah,0eh
	mov	al,ch									
	mov	bl,fc									
	mov	cx,1									
	int	10h									
	pop	ax
	pop 	cx
	pop 	dx
endm
.model large
.386
.stack 128
.data
	num dw ?
	n1	db '1',"$"
	n2	db '2',"$"
	n3	db '3',"$"
	n4	db '4',"$"
	n5	db '5',"$"
	n6	db '6',"$"
	n7	db '7',"$"
	n8	db '8',"$"
	n9	db '9',"$"
	n0	db '0',"$"
	of	db 'overflow',"$"
	i	db	?
	j	db	?
	hlp	db	?
	num1	dw	?
	num2	dw	?
	num3	db 	6 dup(0)
	opr	db	?
	flgnum	db	?;------------ flag for getting first or last digit
	flg	db	?;------------ flag for prevent of typing more than 10 character
	flgo	db	?;------------ flag for prevent of typing more than 2 digit
	flgop	db	?;------------ flag for prevent of decrising more
	flgopr	db	?;------------ flag for prevent typing more than 1 ops
	cdf 	db  0

;-----------------------
.code
disp proc far
	mov cx,74
	mov dx,39
	mov bh,00h
back19:	mov ah,0ch
	mov al,0h
	int 10h
	inc cx
	;inc dx
	cmp cx,391
	jne back19
	mov cx,74
	inc dx
	cmp dx,381
	jne back19
;-----------------------
	mov cx,90
	mov dx,40
	mov bh,00h
back18:	mov ah,0ch
	mov al,7h
	int 10h
	inc cx
	cmp cx,372
	jne back18
	mov cx,90
	inc dx
	cmp dx,380
	jne back18
;-----------------------
	mov cx,99
	mov dx,99
	mov bh,00h
back100:mov ah,0ch
	mov al,0h
	int 10h
	inc cx
	cmp cx,151
	jne back100
	mov cx,99
	inc dx
	cmp dx,151
	jne back100
;----------------------------------
	mov cx,100
	mov dx,100
	mov bh,00h
back1:	mov ah,0ch
	mov al,1h
	int 10h
	inc cx
	cmp cx,150
	jne back1
	mov cx,100
	inc dx
	cmp dx,150
	jne back1
;----------------------------------
	mov cx,169
	mov dx,99
	mov bh,00h
back200:mov ah,0ch
	mov al,0h
	int 10h
	inc cx
	cmp cx,221
	jne back200
	mov cx,169
	inc dx
	cmp dx,151
	jne back200
;-----------------------------------
	mov cx,170
	mov dx,100
	mov bh,00h
back2:	mov ah,0ch
	mov al,1h
	int 10h
	inc cx
	cmp cx,220
	jne back2
	mov cx,170
	inc dx
	cmp dx,150
	jne back2
;-----------------------------------
	mov cx,239
	mov dx,99
	mov bh,00h
back300:mov ah,0ch
	mov al,0h
	int 10h
	inc cx
	cmp cx,291
	jne back300
	mov cx,239
	inc dx
	cmp dx,151
	jne back300
;-------------------------------
	mov cx,240
	mov dx,100
	mov bh,00h
back3:	mov ah,0ch
	mov al,1h
	int 10h
	inc cx
	cmp cx,290
	jne back3
	mov cx,240
	inc dx
	cmp dx,150
	jne back3
;-------------------------------
	mov cx,309
	mov dx,99
	mov bh,00h
back400:mov ah,0ch
	mov al,0h
	int 10h
	inc cx
	cmp cx,361
	jne back400
	mov cx,309
	inc dx
	cmp dx,151
	jne back400
;-------------------------------
	mov cx,310
	mov dx,100
	mov bh,00h
back4:	mov ah,0ch
	mov al,6h
	int 10h
	inc cx
	cmp cx,360
	jne back4
	mov cx,310
	inc dx
	cmp dx,150
	jne back4
;-------------------------------
	mov cx,99
	mov dx,169
	mov bh,00h
back500:mov ah,0ch
	mov al,0h
	int 10h
	inc cx
	cmp cx,151
	jne back500
	mov cx,99
	inc dx
	cmp dx,221
	jne back500
;----------------------------------
	mov cx,100
	mov dx,170
	mov bh,00h
back5:	mov ah,0ch
	mov al,1h
	int 10h
	inc cx
	cmp cx,150
	jne back5
	mov cx,100
	inc dx
	cmp dx,220
	jne back5
;----------------------------------
	mov cx,169
	mov dx,169
	mov bh,00h
back600:mov ah,0ch
	mov al,0h
	int 10h
	inc cx
	cmp cx,221
	jne back600
	mov cx,169
	inc dx
	cmp dx,221
	jne back600
;----------------------------------
	mov cx,170
	mov dx,170
	mov bh,00h
back6:	mov ah,0ch
	mov al,1h
	int 10h
	inc cx
	cmp cx,220
	jne back6
	mov cx,170
	inc dx
	cmp dx,220
	jne back6
;----------------------------------
	mov cx,239
	mov dx,169
	mov bh,00h
back700:mov ah,0ch
	mov al,0h
	int 10h
	inc cx
	cmp cx,291
	jne back700
	mov cx,239
	inc dx
	cmp dx,221
	jne back700
;----------------------------------
	mov cx,240
	mov dx,170
	mov bh,00h
back7:	mov ah,0ch
	mov al,1h
	int 10h
	inc cx
	cmp cx,290
	jne back7
	mov cx,240
	inc dx
	cmp dx,220
	jne back7
;----------------------------------
	mov cx,309
	mov dx,169
	mov bh,00h
back800:mov ah,0ch
	mov al,0h
	int 10h
	inc cx
	cmp cx,361
	jne back800
	mov cx,309
	inc dx
	cmp dx,221
	jne back800
;----------------------------------
	mov cx,310
	mov dx,170
	mov bh,00h
back8:	mov ah,0ch
	mov al,6h
	int 10h
	inc cx
	cmp cx,360
	jne back8
	mov cx,310
	inc dx
	cmp dx,220
	jne back8
;----------------------------------
	mov cx,99
	mov dx,239
	mov bh,00h
back900:mov ah,0ch
	mov al,0h
	int 10h
	inc cx
	cmp cx,151
	jne back900
	mov cx,99
	inc dx
	cmp dx,291
	jne back900
;----------------------------------
	mov cx,100
	mov dx,240
	mov bh,00h
back9:	mov ah,0ch
	mov al,1h
	int 10h
	inc cx
	cmp cx,150
	jne back9
	mov cx,100
	inc dx
	cmp dx,290
	jne back9
;----------------------------------
	mov cx,169
	mov dx,239
	mov bh,00h
back1000:mov ah,0ch
	mov al,0h
	int 10h
	inc cx
	cmp cx,221
	jne back1000
	mov cx,169
	inc dx
	cmp dx,291
	jne back1000
;----------------------------------
	mov cx,170
	mov dx,240
	mov bh,00h
back10:	mov ah,0ch
	mov al,1h
	int 10h
	inc cx
	cmp cx,220
	jne back10
	mov cx,170
	inc dx
	cmp dx,290
	jne back10
;----------------------------------
	mov cx,239
	mov dx,239
	mov bh,00h
back110:mov ah,0ch
	mov al,0h
	int 10h
	inc cx
	cmp cx,291
	jne back11
	mov cx,239
	inc dx
	cmp dx,291
	jne back11
;----------------------------------
	mov cx,240
	mov dx,240
	mov bh,00h
back11:	mov ah,0ch
	mov al,1h
	int 10h
	inc cx
	cmp cx,290
	jne back11
	mov cx,240
	inc dx
	cmp dx,290
	jne back11
;----------------------------------
	mov cx,309
	mov dx,239
	mov bh,00h
back120:mov ah,0ch
	mov al,0h
	int 10h
	inc cx
	cmp cx,361
	jne back120
	mov cx,309
	inc dx
	cmp dx,291
	jne back120
;----------------------------------
	mov cx,310
	mov dx,240
	mov bh,00h
back12:	mov ah,0ch
	mov al,6h
	int 10h
	inc cx
	cmp cx,360
	jne back12
	mov cx,310
	inc dx
	cmp dx,290
	jne back12
;----------------------------------
	mov cx,99
	mov dx,309
	mov bh,00h
back130:mov ah,0ch
	mov al,0h
	int 10h
	inc cx
	cmp cx,151
	jne back130
	mov cx,99
	inc dx
	cmp dx,361
	jne back130
;----------------------------------
	mov cx,100
	mov dx,310
	mov bh,00h
back13:	mov ah,0ch
	mov al,4h
	int 10h
	inc cx
	cmp cx,150
	jne back13
	mov cx,100
	inc dx
	cmp dx,360
	jne back13
;----------------------------------
	mov cx,169
	mov dx,309
	mov bh,00h
back140:mov ah,0ch
	mov al,0h
	int 10h
	inc cx
	cmp cx,221
	jne back140
	mov cx,169
	inc dx
	cmp dx,361
	jne back140
;----------------------------------
	mov cx,170
	mov dx,310
	mov bh,00h
back14:	mov ah,0ch
	mov al,1h
	int 10h
	inc cx
	cmp cx,220
	jne back14
	mov cx,170
	inc dx
	cmp dx,360
	jne back14
;----------------------------------
	mov cx,239
	mov dx,309
	mov bh,00h
back150:mov ah,0ch
	mov al,0h
	int 10h
	inc cx
	cmp cx,291
	jne back150
	mov cx,239
	inc dx
	cmp dx,361
	jne back150
;----------------------------------
	mov cx,240
	mov dx,310
	mov bh,00h
back15:	mov ah,0ch
	mov al,6h
	int 10h
	inc cx
	cmp cx,290
	jne back15
	mov cx,240
	inc dx
	cmp dx,360
	jne back15
;----------------------------------
	mov cx,309
	mov dx,309
	mov bh,00h
back160:mov ah,0ch
	mov al,0h
	int 10h
	inc cx
	cmp cx,361
	jne back160
	mov cx,309
	inc dx
	cmp dx,361
	jne back160
;----------------------------------
	mov cx,310
	mov dx,310
	mov bh,00h
back16:	mov ah,0ch
	mov al,6h
	int 10h
	inc cx
	cmp cx,360
	jne back16
	mov cx,310
	inc dx
	cmp dx,360
	jne back16
;----------------------------------
	mov cx,99
	mov dx,59
	mov bh,00h
back170:mov ah,0ch
	mov al,1fh
	int 10h
	inc cx
	cmp cx,361
	jne back170
	mov cx,99
	inc dx
	cmp dx,81
	jne back170
;-----------------------------------
	mov cx,100
	mov dx,60
	mov bh,00h
back17:	mov ah,0ch
	mov al,0h
	int 10h
	inc cx
	cmp cx,360
	jne back17
	mov cx,100
	inc dx
	cmp dx,80
	jne back17
;-----------------------------------
	mov cx,454
	mov dx,39
	mov bh,00h
back1700:mov ah,0ch
	mov al,0h
	int 10h
	inc cx
	cmp cx,554
	jne back1700
	mov cx,454
	inc dx
	cmp dx,71
	jne back1700
;-----------------------------------
	mov cx,455
	mov dx,40
	mov bh,00h
back1800:mov ah,0ch
	mov al,07h
	int 10h
	inc cx
	cmp cx,553
	jne back1800
	mov cx,455
	inc dx
	cmp dx,70
	jne back1800
;-----------------------------------
	writech	15,16,'1',0afh
	writech	24,16,'2',0afh
	writech	32,16,'3',0afh
	writech	15,12,'4',0afh
	writech	24,12,'5',0afh
	writech	32,12,'6',0afh
	writech	15,7,'7',0afh
	writech	24,7,'8',0afh
	writech	32,7,'9',0afh
	writech	24,20,'0',0afh
	writech	41,20,'+',0a1h
	writech	41,12,'*',0a1h
	writech	41,7,'/',0a1h
	writech	41,16,'-',0a1h
	writech	32,20,'=',0a1h
	writech	15,20,'C',0a3h
	writech	61,3,'E',0a3h
	writech	62,3,'X',0a3h
	writech	63,3,'I',0a3h
	writech	64,3,'T',0a3h
	ret
disp endp
;---------------------------------
convert	proc far
	push	ax
	push 	bx
	push	cx
	push	dx
	lea	bx,num3
	add	bx,5
	mov	cx,6
lop3:	mov	[bx],0
	dec	bx
	loop	lop3
	lea	bx,num3
	add	bx,5
	inc 	bx
	mov	[bx],'$'
	dec	bx
	mov	cx,10
divloop3:mov	dx,0
	div	cx
	add	dl,30h
	mov	[bx],dl
	dec	bx
	cmp	ax,0
	jne	divloop3
	pop	dx
	pop	cx
	pop	bx
	pop	ax
	ret
convert	endp
;---------------------------------
convert2	proc far
	push	ax
	push 	bx
	push	cx
	push	dx
	lea	bx,num3
	add	bx,6
	mov	cx,5
lop2:	mov	[bx],0
	dec	bx
	loop	lop2
	lea	bx,num3
	add	bx,5
	inc 	bx
	mov	[bx],'$'
	dec	bx
	mov	cx,10
divloop:mov	dx,0
	div	cx
	add	dl,30h
	mov	[bx],dl
	dec	bx
	cmp	al,0
	jne	divloop	
	pop	dx
	pop	cx
	pop	bx
	pop	ax
	ret
convert2	endp
;---------------------------------
main proc far
	mov 	ax,@data
	mov	ds,ax
	mov	ah,0fh
	int	10h									
	push	ax
	mov	ah,00h
	mov	al,12h									
	int 	10h
	mov	i,0
	mov	j,0
	mov	hlp,0
	mov	flg,0
	mov	flgo,2
	mov	flgop,0
	mov	flgopr,0
	mov	flgnum,0
	mov	opr,0
	mov	num1,0
	mov	num2,0
;----------------------------------
	mov ax,0600h
	mov cx,0000h
	mov bh,08h
	mov dh,30
	mov dl,79
	int 10h
	call disp
;----------------------------------
	mov	ax,0
	int	33h
	mov 	ax,1
	int	33h
;----------------------------------
a:
	mov ax,05h
	int 33h
	cmp bx,00000001b
	jne a
;----------------------------------
exit1:	cmp cx,454
	jbe 	seven
	cmp cx,554
	jae 	a
	cmp dx,40
	jbe	a
	cmp dx,71
	jae	seven
	jmp exit
;----------------------------------
seven:	cmp cx,100
	jbe 	a
	cmp cx,150
	jae 	eight
	cmp dx,100
	jbe	a
	cmp dx,150
	jae	fore
	cmp	flgo,0
	je	a
	cmp	flg,1
	je	a
	writechij 14,4,'7',1fh,i,j
	cmp 	flgnum,1
	je	second7
	mov	ax,num1
	mov	bl,10
	mul	bl
	add	ax,7
	mov	num1,ax
	jmp 	next7
second7:
	mov	ax,num2
	mov	bl,10
	mul	bl
	add	ax,7
	mov	num2,ax
next7:
	inc	i
	cmp	i,10
	jb	a
	mov	i,0
	mov	flg,1
	cmp	flgop,1
	je	a
	dec	flgo
	mov	flgop,1	
	jmp  	a
;----------------------------------
eight:	cmp cx,170
	jbe 	a
	cmp cx,220
	jae 	nine
	cmp dx,100
	jbe	a
	cmp dx,150
	jae	five
	cmp	flgo,0
	jbe	a
	cmp	flg,1
	je	a
	writechij 14,4,'8',1fh,i,j
	cmp 	flgnum,1
	je	second8
	mov	ax,num1
	mov	bl,10
	mul	bl
	add	ax,8
	mov	num1,ax
	jmp 	next8
second8:
	mov	ax,num2
	mov	bl,10
	mul	bl
	add	ax,8
	mov	num2,ax
next8:
	inc	i
	cmp	i,10
	jb	a
	mov	i,0
	mov	flg,1	
	cmp	flgop,1
	je	a
	dec	flgo
	mov	flgop,1	
	jmp  	a
;----------------------------------
nine:	cmp cx,240
	jbe 	a
	cmp cx,290
	jae 	sb
	cmp dx,100
	jbe	a
	cmp dx,150
	jae	six
	cmp	flgo,0
	jbe	a
	cmp	flg,1
	je	a
	writechij 14,4,'9',1fh,i,j
	cmp 	flgnum,1
	je	second9
	mov	ax,num1
	mov	bl,10
	mul	bl
	add	ax,9
	mov	num1,ax
	jmp 	next9
second9:
	mov	ax,num2
	mov	bl,10
	mul	bl
	add	ax,9
	mov	num2,ax
next9:
	inc	i
	cmp	i,10
	jb	a
	mov	i,0
	mov	flg,1
	cmp	flgop,1
	je	a
	dec	flgo
	mov	flgop,1	
	jmp  	a
;----------------------------------
sb:	cmp cx,310
	jbe 	a
	cmp cx,360
	jae 	a
	cmp dx,100
	jbe	a
	cmp dx,150
	jae	mult
	cmp	flgopr,1
	je	a
	writech 25,4,'/',1fh
	mov	opr,1
	mov	flgopr,1
	mov	j,13
	
	mov	i,8
	mov	flg,0
	cmp	flgop,1
	je	a
	dec	flgo
	mov	flgop,1	
	mov	flgnum,1
	jmp  	a
;----------------------------------
	cmp cx,100
fore:	jbe 	a
	cmp cx,150
	jae 	five
	cmp dx,170
	jbe	a
	cmp dx,220
	jae	one
	cmp	flgo,0
	jbe	a
	cmp	flg,1
	je	a
	writechij 14,4,'4',1fh,i,j
	cmp 	flgnum,1
	je	second4
	mov	ax,num1
	mov	bl,10
	mul	bl
	add	ax,4
	mov	num1,ax
	jmp 	next4
second4:
	mov	ax,num2
	mov	bl,10
	mul	bl
	add	ax,4
	mov	num2,ax
next4:
	inc	i
	cmp	i,10
	jb	a
	mov	i,0
	mov	flg,1
	cmp	flgop,1
	je	a
	dec	flgo
	mov	flgop,1	
	jmp  	a
;----------------------------------
five:	cmp cx,170
	jbe 	a
	cmp cx,220
	jae 	six
	cmp dx,170
	jbe	a
	cmp dx,220
	jae	tow
	cmp	flgo,0
	jbe	a
	cmp	flg,1
	je	a
	writechij 14,4,'5',1fh,i,j
	cmp 	flgnum,1
	je	second5
	mov	ax,num1
	mov	bl,10
	mul	bl
	add	ax,5
	mov	num1,ax
	jmp 	next5
second5:
	mov	ax,num2
	mov	bl,10
	mul	bl
	add	ax,5
	mov	num2,ax
next5:
	inc	i
	cmp	i,10
	jb	a
	mov	i,0
	mov	flg,1	
	cmp	flgop,1
	je	a
	dec	flgo
	mov	flgop,1	
	jmp  	a
;----------------------------------
six:	cmp cx,240
	jbe 	a
	cmp cx,290
	jae 	mult
	cmp dx,170
	jbe	a
	cmp dx,220
	jae	three
	cmp	flgo,0
	jbe	a
	cmp	flg,1
	je	a
	writechij 14,4,'6',1fh,i,j
	cmp 	flgnum,1
	je	second6
	mov	ax,num1
	mov	bl,10
	mul	bl
	add	ax,6
	mov	num1,ax
	jmp 	next6
second6:
	mov	ax,num2
	mov	bl,10
	mul	bl
	add	ax,6
	mov	num2,ax
next6:
	inc	i
	cmp	i,10
	jb	a
	mov	i,0
	mov	flg,1	
	cmp	flgop,1
	je	a
	dec	flgo
	mov	flgop,1	
	jmp  	a
;----------------------------------
mult:	cmp cx,310
	jbe 	a
	cmp cx,360
	jae 	a
	cmp dx,170
	jbe	a
	cmp dx,220
	jae	subb
	cmp	flgopr,1
	je	a	
	writech 25,4,'*',1fh
	mov	opr,2
	mov	flgopr,1
	mov	j,13
	cmp	i,10
	je	dss1
	jmp	fdss1
dss1:
	mov	i,9
fdss1:
	mov	flg,0
	cmp	flgop,1
	je	a
	dec	flgo
	mov	flgop,1	
	mov	flgnum,1

	jmp  	a
;----------------------------------
one:	cmp cx,100
	jbe 	a
	cmp cx,150
	jae 	tow
	cmp dx,240
	jbe	a
	cmp dx,290
	jae	cw
	cmp	flgo,0
	jbe	a
	cmp	flg,1
	je	a
	writechij 14,4,'1',1fh,i,j
	cmp 	flgnum,1
	je	second1
	mov	ax,num1
	mov	bl,10
	mul	bl
	add	ax,1
	mov	num1,ax
	jmp 	next1
second1:
	mov	ax,num2
	mov	bl,10
	mul	bl
	add	ax,1
	mov	num2,ax
next1:
	inc	i
	cmp	i,10
	jb	a
	mov	i,0
	mov	flg,1
	cmp	flgop,1
	je	a
	dec	flgo
	mov	flgop,1	
	jmp  	a
;----------------------------------
tow:	cmp cx,170
	jbe 	a
	cmp cx,220
	jae 	three
	cmp dx,240
	jbe	a
	cmp dx,290
	jae	zero
	cmp	flgo,0
	jbe	a
	cmp	flg,1
	je	a
	writechij 14,4,'2',1fh,i,j
	cmp 	flgnum,1
	je	second2
	mov	ax,num1
	mov	bl,10
	mul	bl
	add	ax,2
	mov	num1,ax
	jmp 	next2
second2:
	mov	ax,num2
	mov	bl,10
	mul	bl
	add	ax,2
	mov	num2,ax
next2:
	inc	i
	cmp	i,10
	jb	a
	mov	i,0
	mov	flg,1
	cmp	flgop,1
	je	a
	dec	flgo
	mov	flgop,1	
	jmp  	a
;----------------------------------
three:	cmp cx,240
	jbe 	a
	cmp cx,290
	jae 	subb
	cmp dx,240
	jbe	a
	cmp dx,290
	jae	equal
	cmp	flgo,0
	jbe	a
	cmp	flg,1
	je	a
	writechij 14,4,'3',1fh,i,j
	cmp 	flgnum,1
	je	second3
	mov	ax,num1
	mov	bl,10
	mul	bl
	add	ax,3
	mov	num1,ax
	jmp 	next3
second3:
	mov	ax,num2
	mov	bl,10
	mul	bl
	add	ax,3
	mov	num2,ax
next3:
	inc	i
	cmp	i,10
	jb	a
	mov	i,0
	mov	flg,1
	cmp	flgop,1
	je	a
	dec	flgo
	mov	flgop,1	
	jmp  	a
;----------------------------------
subb:	cmp cx,310
	jbe 	a
	cmp cx,360
	jae 	a
	cmp dx,240
	jbe	a
	cmp dx,290
	jae	plus
	cmp	flgopr,1
	je	a
	writech 25,4,'-',1fh
	mov	opr,3
	mov	flgopr,1
	mov	j,13
	mov	i,0
	mov	flg,0
	cmp	flgop,1
	je	a
	dec	flgo
	mov	flgop,1	
	mov	flgnum,1

	jmp  	a
;----------------------------------
zero:	cmp cx,170
	jbe 	a
	cmp cx,220
	jae 	equal
	cmp dx,310
	jbe	a
	cmp dx,360
	jae	exit1
	cmp	flgo,0
	jbe	a
	cmp	flg,1
	je	a
	writechij 14,4,'0',1fh,i,j
	cmp 	flgnum,1
	je	second0
	mov	ax,num1
	mov	bl,10
	mul	bl
	add	ax,0
	mov	num1,ax
	jmp 	next0
second0:
	mov	ax,num2
	mov	bl,10
	mul	bl
	add	ax,0
	mov	num2,ax
next0:
	inc	i
	cmp	i,10
	jb	a
	mov	i,0
	mov	flg,1	
	cmp	flgop,1
	je	a
	dec	flgo
	mov	flgop,1	
	jmp  	a
;----------------------------------
equal:	cmp cx,240
	jbe 	a
	cmp cx,290
	jae 	plus
	cmp dx,310
	jbe	a
	cmp dx,360
	jae	exit1
	mov	flg,0	
	mov 	i,0
aa1:	writechi 14,4,' ',1fh,i
	inc	i
	cmp	i,27
	jne	aa1
	mov	i,0
	mov	al,opr
	cmp	al,4
	je	plusopr
	cmp	al,3
	je	subopr
	cmp	al,2
	je	multopr
	cmp	al,1
	je	divopr
	jmp	a
plusopr:
	mov	ax,num1
	mov	bx,num2
	add 	ax,bx
	call	convert
	mov	ah,02h
	mov	dh,4
	mov	dl,14
	mov	bh,0
	int	10h
	lea	dx,num3
	mov	ah,09h
	int	21h
	jmp	endpl
subopr:
	mov	ax,num1
	mov	bx,num2
	sub 	ax,bx
	call	convert
	mov	ah,02h
	mov	dh,4
	mov	dl,14
	mov	bh,0
	int	10h
	lea	dx,num3
	mov	ah,09h
	int	21h
	jmp	endpl
multopr:
	mov	ax,num1
	mov	bx,num2
	mul 	bx
	call    convert
	mov	ah,02h
	mov	dh,4
	mov	dl,14
	mov	bh,0
	int	10h
	lea	dx,num3
	mov	ah,09h
	int	21h
	jmp	endpl
divopr:
	mov	ax,num1
	mov	bx,num2
	div 	bl
	mov	ah,0
	call	convert2
	mov	ah,02h
	mov	dh,4
	mov	dl,14
	mov	bh,0
	int	10h
	lea	dx,num3
	mov	ah,09h
	int	21h
	
endpl:	
	mov	j,0
	mov	i,0
	mov	flg,0
	mov	flgo,2
	mov	flgop,0
	mov	flgopr,0
	mov	flgnum,0
	mov	num1,0
	mov	num2,0
	jmp  	a
;----------------------------------
plus:	cmp cx,310
	jbe 	a
	cmp cx,360
	jae 	a
	cmp dx,310
	jbe	a
	cmp dx,360
	jae	exit1
	cmp	flgopr,1
	je	a
	writech 25,4,'+',1fh
	mov	opr,4
	mov	flgopr,1
	mov	j,13
	mov	i,0
	mov	flg,0	
	cmp	flgop,1
	je	a
	dec	flgo
	mov	flgop,1	
	mov	flgnum,1
	jmp  	a
;----------------------------------
cw:	cmp cx,100
	jbe 	a
	cmp cx,150
	jae 	zero
	cmp dx,310
	jbe	a
	cmp dx,360
	jae	a
	mov 	i,0
aa:	writechi 14,4,' ',1fh,i
	inc	i
	cmp	i,27
	jne	aa
	mov	i,0
	writechi 14,4,'0',1fh,i
	mov	j,0
	mov	i,0
	mov	flg,0
	mov	flgo,2
	mov	flgop,0
	mov	flgopr,0
	mov	flgnum,0
	mov	num1,0
	mov	num2,0
	jmp	a
;----------------------------------
	jmp a
;----------------------------------
exit:	pop	ax
	mov	ah,00h									
	int	10h
	mov ax,4c00h
	int 21h
main endp
	end main