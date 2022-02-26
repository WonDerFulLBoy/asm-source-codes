stksg    segment  stack
         db   32 dup("stack")
stksg    ends

datasg  segment para  'code'
msg1    db      'Enter the first number:',"$"
msg2    db      'Enter the second number:',"$"
msg3    db      'maximum is:',"$"
num1	db	?
num2	db	?
max	db	?
datasg   ends

codesg  segment  para  'code'
main    proc     far 
        assume   ds:datasg, cs:codesg
        mov      ax, datasg
        mov      ds, ax

	mov      ah, 6h  ;cleaer the screen 
        mov      al, 25   
        mov      ch, 0
        mov      cl, 0
        mov      dh, 24   
        mov      dl, 79   
        mov      bh, 7    
        int      10h

	mov      ah, 2h   ;cursor move
        mov      dh, 10   
        mov      dl, 30   
        mov      bh, 0    
        int      10h

	lea      dx, msg1
        mov      ah, 9h
        int      21h

	mov      ah, 1h
        int      21h
        mov      num1, al
	
	mov      ah, 2h   ;cursor move
        mov      dh, 12   
        mov      dl, 30   
        mov      bh, 0    
        int      10h

	lea      dx, msg2
        mov      ah, 9h
        int      21h

	mov      ah, 1h
        int      21h
        mov      num2, al

	mov	al,num1
	mov	bl,num2
	call	maxim
	mov	max,al
	
	mov      ah, 2h   ;cursor move
        mov      dh, 14   
        mov      dl, 30   
        mov      bh, 0    
        int      10h

	lea      dx, msg3
        mov      ah, 9h
        int      21h

	mov      dl, max  
        mov      ah, 2h           
        int      21h
	ret
	main    endp
	

	
maxim	proc	near
	cmp	al,bl
	jnbe	l1	
	mov	al,bl
l1:
	Ret
maxim	endp
codesg  ends
        end      main
	
