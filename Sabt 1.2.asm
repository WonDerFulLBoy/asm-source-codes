PUTC    MACRO   char
        PUSH    AX
        MOV     AL, char
        MOV     AH, 0Eh
        INT     10h     
        POP     AX
ENDM


; ---------- M A C R O  //Entegal Makannama ----------

CURSOR MACRO ROW,COLUMN
   Mov dx,0000h 
   MOV DH,ROW
   MOV DL,COLUMN
   MOV AH,02h
   MOV BH,0h
   INT 10H
ENDM


; ---------- M A C R O ----------

CIN MACRO STRING
    Mov dx,0000h 
    LEA DX, STRING
    MOV AH,0Ah
    INT 21H
ENDM

; ---------- M A C R O ----------

Cin_C  MACRO char
    MOV AH,01h
    INT 21H
ENDM
; ---------- M A C R O ----------

Cout_c  MACRO char 
    Mov DL, char
    MOV AH,02h
    INT 21H
ENDM

; ---------- M A C R O ----------

COUT MACRO STRING
     LEA DX,STRING
     MOV AH,09h
     INT 21H
ENDM


; ---------- M A C R O ----------
CLRSCR MACRO TEDAD_CX,CHAR , ba
   ;Be Tedade CX CHAR ra Dar Safhe Chaap Mikonad.
   MOV AL,CHAR
   MOV BH,00
   MOV CX,TEDAD_CX

   MOV BL,ba

   MOV AH,09H
   INT 10H 
endm     

; ---------- M A C R O ----------

 
    
   
    
         

; ---------- M A C R O ----------
; ---------- M A C R O ----------
; ---------- M A C R O ----------

org 100h

.Stack 2048

; ================= data segment =================

.Data

nam  label ptr 
max db  25
len db  ?
buffer  db 25 dup (' ')
doller  db , '$'

id  label ptr 
max_id     db  9
len_id     db  ?
buffer_id  db  9 dup (' ')
doller_id  db , '$'

dars label ptr
max_d db 12
len_d db ?
buffer_d  db 12 dup(' ')
doller_d  db '$'  

;mark label ptr
;max_m db 3
;len_m db ?
;buffer_m  db  3 dup(' ')
;doller_m  db '$'
                  
sum_vahed  dw ?

sum_m label ptr
max_sm db 3
len_sm db ?
buffer_sm  db  3 dup(' ')
doller_sm  db '$'                  
ms db ' ...........' , '$'

; ---------- motagayer ha page 1
title1       db ' Ghaem Industrial University' , '$'   
name_l       db 'first name : '  , '$'
id_l         db 'student id : '  , '$' 
term_l       db 'term: '         , '$' 

Next0        db 'ษอออออออออป','$'
Next1        db 'บ   NEXT  บ','$'
Next2        db 'ศอออออออออผ','$'

; ---------- motagayer ha page 2
sal_l        db 'sal tahsili 88-89'            , '$'
karnameh     db 'Karnameh Term'                , '$'
dars_l        db 'Nam Dars'                     , '$'
t_vahed      db 'Tedad vahed'                  , '$'
model        db 'Moadel Kol:'                  , '$'
vaziat_l     db 'Vaziat:'                      , '$' 

Entekhab0    db 'ษออออออออออออออออป ' , '$'
Entekhab1    db 'บ Entekhab Vahed บ ' , '$'
Entekhab2    db 'ศออออออออออออออออผ ' , '$' 

 F2_0        DB 'ษอออออออออออออออออออออออออออออออออออออออออป ', '$'
 F2_1        DB 'บNo ณ   Name Dars    ณTedad Vahed ณNomreh บ ', '$'
 F2_2        DB 'ว---ล----------------ล------------ล-------ถ ', '$'
 F2_3        DB 'บ 1 ณ                ณ            ณ       บ ', '$'
 F2_4        DB 'ว---ล----------------ณ------------ล-------ถ ', '$'
 F2_5        DB 'บ 2 ณ                ณ            ณ       บ ', '$'
 F2_6        DB 'ว---ล----------------ล------------ล-------ถ ', '$'
 F2_7        DB 'บ 3 ณ                ณ            ณ       บ ', '$'
 F2_8        DB 'ว---ล----------------ล------------ล-------ถ ', '$'
 F2_9        DB 'บ 4 ณ                ณ            ณ       บ ', '$'
 F2_10       DB 'บ---ล----------------ล------------ล-------ถ ', '$'
 F2_11       DB 'บ 5 ณ                ณ            ณ       บ ', '$'
 F2_12       DB 'บ---ล----------------ล------------ล-------ถ ', '$'
 F2_13       DB 'บ 6 ณ                ณ            ณ       บ ', '$'
 F2_14       DB 'บ---ล----------------ล------------ล-------บ ', '$'
 F2_15       DB 'บ 7 ณ                ณ            ณ       บ ', '$'
 F2_16       DB 'บ---ล----------------ล------------ล-------บ ', '$'
 F2_17       DB 'บ 8 ณ                ณ            ณ       บ ', '$'
 F2_18       DB 'บ---ล----------------ล------------ล-------ถ ', '$'
 F2_19       DB 'บ 9 ณ                ณ            ณ       บ ', '$'
 ;F2_20       DB 'บ---ล----------------ล------------ล-------ถ ', '$'
; F2_21       DB 'บ10 ณ                ณ            ณ       บ ', '$'
 F2_22       DB 'ศออออออออษออออออออออออออออออออออออออออออออบ ', '$'
 F2_23       DB '         บ    SUM    ณ            ณ       บ ', '$'
 F2_24       DB '         ศออออออออออออออออออออออออออออออออผ ', '$'

; ---------- motagayer ha page 3
f_vahed      db 'Form Entekhab Vahed'          , '$'
m_term       db 'Moadel Terme Gozashteh:'      , '$'
koll_vahed   db 'Tedad Kol Vahedhaye Entekhab Shodeh:', '$'                               
                               
Exit0        db 'ษออออออออออป' , '$'
Exit1        db 'บ          บ' , '$'
Exit2        db 'บ   EXIT   บ' , '$'
Exit3        db 'บ          บ' , '$'
Exit4        db 'ศออออออออออผ' , '$'
 

 F3_0        DB 'ษออออออออออออออออออออออออออออออออออออออออออออออป ', '$'
 F3_1        DB 'บ      Name Dars     ณ Tedad Vahed ณ           บ ', '$'
 F3_2        DB 'บ                    ณ             ณ           บ ', '$'
 F3_3        DB 'ว--------------------ล-------------ล-----------ถ ', '$'
 F3_4        DB 'บ                    ณ             ณ    SABT   บ ', '$'
 F3_5        DB 'บ                    ณ             ณ           บ ', '$'
 F3_6        DB 'ศออออออออออออออออออออออออออออออออออออออออออออออผ ', '$'  
 
 ;  --------------------- Variables -----------------------

 Term        DB  ?
 Moadel      Dw  ?
 Vaziat      DB  ?
 sign        db  ?
 count       db  ?
 mark dw 0
 marks dw 0
 vahed_m dw ?
 s_mark dw  0
 s_vahed dw 0
 step db 4
 temp   dw ? 
 temp1   dw ? 
 sum dw 0 
 N_VAHED DB 0  
 strint dw ?  
 tedad dw ?
 
 	 
;====================== Code ============================= 
.Code

Main Proc Far        
   mov ax, @data
   mov ds, ax
   mov es, ax
               ;----------- Farakhani Form1                   
   call form1
               ;----------- Pak Kardan va Farakhani Form2               
   cursor 0,0 
   clrscr 2100,000,00011111B
   call form2
               ;----------- Pak Kardan va Farakhani Form2 
   cursor 0,0
   clrscr 830h,000,00011111B
   call form3 
   

Main endp   
   jmp payan
;========================= Form1 =========================
FORM1 proc 
                     ;---------- Print " Ghaem Industrial University  "
     Cursor 2,25
     Cout title1
                     ;---------- Print   "first name : "
     Cursor 10,10
     Cout Name_l
                     ;---------- Print    " student id : "
     Cursor 12,10
     Cout  id_l
                     ;---------- print    " term: "
     Cursor 14,10
     Cout  term_l
                     ;---------- Print    " sal tahsili 88-89 "   
     Cursor 16,18
     Cout sal_l 
                     ; --------- Input  name 
     Cursor 10 , 25
     Cin Nam
                     ; --------- Input  Id
     Cursor 12 , 25
     Cin id
                     ; --------- Input Term
     Cursor 14 , 25
     Cin_c term 
     Mov term ,al      ;  store character in term
                   ; --------- Print Boutton Next
     Cursor 20 , 50
     Cout next0  
     Cursor 21 , 50
     Cout next1
     Cursor 22 , 50
     Cout next2  
     
  e: Cursor 21 , 54  ; loop until entering "enter" key 
     Mov ah , 8h     ;
     Int 21h         ; for going next page
     Cmp al,13       ;
     jne e           ;
                  
     ret
      
  Form1 ENDP 
  
 ;===================== Form 2 ================================== 
  Form2 PROC Near
              
    Cursor 0 , 10
    Cout title1
    
    Cursor 1 , 3
    Cout f2_0
    
    Cursor 2 , 3
    Cout f2_1
           
    Cursor 3 , 3
    Cout f2_2
   
    Cursor 4 , 3
    Cout f2_3
                     ;---------- Print  name 
    Cursor 5 , 59
    Cout nam
                     ;---------- Print Label name 
    Cursor 5 , 49
    Cout name_l  
                     ;---------------------------
    Cursor 5 , 3
    Cout f2_4      
    
    Cursor 6 , 3
    Cout f2_5
   
    Cursor 7 , 3
    Cout f2_6   
                     ;----------- print id
    Cursor 8 , 58
    Cout id       
                     ;------------- Print Label id
    Cursor 8 , 49
    Cout id_l 
   
    Cursor 8 , 3
    Cout f2_7
   
    Cursor 9 , 3
    Cout f2_8
                  
    Cursor 10, 3
    Cout f2_9
                      ;--------- Print Term
    Cursor 11 , 59
    Cout_c term
    
                      ;---------- Print LAbel Term
    cursor 11 , 49
    cout term_l  
    
    cursor 11, 3
    cout f2_10  
            
    cursor 12, 3
    cout f2_11
 
    cursor 13, 3
    cout f2_12
   
    cursor 14, 3
    cout f2_13
                    
    cursor 15, 3
    cout f2_14
    
    cursor 16, 3
    cout f2_15   
          
    cursor 17, 3
    cout f2_16 
   
    cursor 18, 3
    cout f2_17
  
    cursor 19, 3
    cout f2_18
   
    cursor 20, 3
    cout f2_19        
   
    cursor 21, 3
    cout f2_22      
               
    cursor 22, 3
    cout f2_23         
     
    cursor 23, 3
    cout f2_24  
    
 d:   ;------------------------ dryafteh Nameh Dars
      
     mov cx , 9
    
                        ; -------------------------------- input Name  Dars 
 f:   
      mov temp1 , cx
      cursor step , 10
      cin dars  
                        ;--------------------------------- input vahed
      cursor step , 25             
      call scan_num
      mov vahed_m , cx 
      
      add   s_vahed , cx
      mov temp , cx
     ; mov dl , s_vahed     ; 
   
                         ;---------- input mark
      cursor step , 40             
      call scan_num
      mov mark,cx
      
      mov ax,mark      ; setting paranetr for mul
      mul temp         ; temp(vahed_m)*mark & store in ax
      
      add s_mark , ax
       
      add step,2
      mov cx, temp1    
      loop f  
     
      cursor 15 , 55
      
         
             
      
      
      cout model 
                         ;--------------------------------- Print Label Moael Kol-----------------------              
      cursor 15 , 68   
      mov dx,0
      mov ax,s_mark     ;{ majmooeh nomarat dar ax zakhireh
      idiv s_vahed       ;{ majmooeh nomarat tagsim bar tedad vahed
      Mov Moadel , ax
    
      
      call  PRINT_NUM
      
                        ;---------------------------------- Print Label Vaziat--------------------------
       
    
      Cursor 22, 40 ;
       mov ax,s_mark
       call print_num  ; 
       
       Cursor 22, 30 ;
       mov ax,s_vahed
       call print_num  ;
                    ; -------- Print Button Entekhab
    
             
      
     
      cursor 22,20
      
      
      cout sum_vahed
  
      
      
      mov ax, moadel
      cmp ax ,17    
      jae blue  
      
      cmp ax , 15
      jae green
      
      cmp ax , 12
      jae yellow
      
      cmp ax , 10
      ja g
      
                    ;--------- Print Vaziat Red Color
      cursor 17, 65
    clrscr 1,'E',14h
       
      
      MOV AL , 12
      MOV N_VAHED, AL
      jmp end_:
                     ;--------- Print Vaziat Blue Color
 blue:            
      cursor 17, 65
      clrscr 1,'A' , 71h
      jmp  end_:    
                   ;--------- Print Vaziat Gren Color
green:         
      cursor 17, 65
      clrscr 1 , 'B', 12h
      jmp end_:
                     ;--------- Print Vaziat Yellow Color
 yellow:                
      cursor 17, 65
      clrscr 1, 'C', 1dh
      jmp end_:
                      ;--------- Print Vaziat
 g:                    
      cursor 17, 65
      clrscr 1 , 'D' , 16h
      jmp  end_:
              
          
   end_:
      Cursor 17, 56
      Cout vaziat_l 
   
      Cursor 20, 50
      Cout Entekhab0
      Cursor 21, 50
      Cout  Entekhab1
      Cursor 22, 50
      Cout  Entekhab2      
       
    
      
      
  e2:  Cursor 21,52
      Mov ah , 8h
      Int 21h
     
      Cmp al,13 
      jne e2        
             
     ret              ;---------------- End Key---------
; end:       
      ;mov ah,7h
      ;int 21h
      ;cmp al,e0
      ;jne end 
      
                   ;------------- print sum-----------
       cursor 22 , 40
     
      mov dx,s_mark
      mov ah , 09h
      int 21h
             
  ret
     FORM2 endp
  ;================ Form 3 ===========================   
     
     FORM3 proc near
                        ;---------- Print 
           cursor 2 , 25
           cout title1
                      ;----------- Print
           cursor 4,31
           cout f_vahed
           
                      ;-------- Print Label Name           
           cursor 6,34
           cout name_l
                       ;---------Print Name
            cursor 6,47
            cout nam
                      ;-----------Print Label Sal Tahsile
           cursor   6,59
           cout  sal_l  
           
           cursor 6,15
            cout id
                      ;----------- Print Tabel Form 3 
           cursor 6,1
           cout id_l 
           cursor   8,18
           cout  f3_0
           cursor   9,18
           cout  f3_1
           cursor   10,18
           cout  f3_2
           cursor   11,18
           cout  f3_3
           cursor   12,18
           cout  f3_4
           cursor   13,18
           cout  f3_5
           cursor   14,18
           cout  f3_6
           
                        ;----------- Print Label m_term    
           cursor 16 , 3
           cout m_term
           cursor 16 , 28
           mov ax, moadel
           call PRINT_NUM
           
           ;==============[ Taeneh Tedad Vahdehai keh Meshavad Gereft]=========
           
            mov ax , moadel
            cmp ax ,17    
            jae b  
      
            cmp ax , 12
            jae y
      
           
            MOV tedad ,12
            jmp end1:
                     ;--------- Print Vaziat Blue Color
 b:            
            MOV tedad ,24
            jmp  end1:    
    
                     ;--------- Print Vaziat Yellow Color
 y:                
           MOV tedad ,20
            jmp end1:
                      ;--------- Print Vaziat
 
        end1:      
            ;================[End taeneh Tedad Vahed ha]===
            
          cursor 16 , 37     
          cout koll_vahed
          
          mov vahed_m ,0
          Mov s_vahed,0
          Mov temp , 0
 while_in:
         
          
           cursor 12,42
           clrscr 9,000,00011111B
           cursor 12,20 
           clrscr 12,000,00011111B
          
          cursor 12,20
          cin dars
          
          cursor 12,42
          call scan_num
          mov vahed_m , cx 
          
          add   s_vahed , cx
          mov temp , cx 
          
           
          
          mov ax , tedad
          cmp s_vahed,ax
          jg End_in 
          
     e3:  Cursor 12,60
          Mov ah , 8h
          Int 21h
     
          Cmp al,13 
          jne e3
          cursor 16 , 75
          Mov Ax,S_vahed
          call Print_num
             
          jmp While_in
          
         
         
         End_in:              
      eee:      
                      
                   
           
           
           
          
                        ;------------ Print Boutton Exit
           cursor   18,55
           cout  exit0
           cursor   19,55
           cout  exit1
           cursor   20,55 
           cout  exit2
           cursor   21,55
           cout  exit3
           cursor   22,55
           cout  exit4
           
           
        form3 endp
     
 ;================= String to Integer ===========================    
     
     strtoint proc 
                   
      
    
   s1:    
      cmp  byte ptr [bx] , ' '
      jne  end_blank
      inc  bx
      jmp  s1
    
 end_blank:
      mov  sign ,1
      cmp  byte ptr [bx] , '+'
      je  sk_sign
      cmp  byte ptr [bx], '-'
      jne  save_sign
      mov sign,-1
        
 sk_sign:
      inc  bx
      
 save_sign:
      mov ax , 0
      mov count,0
      
 digit:
      cmp byte ptr [bx] , '0'
      mov cx,[bx] ;
      jl   end_while
      cmp  byte ptr [bx], '9'
      jg  end_while
      mov cx,10
      mul cx
      mov cl,[bx]
      and cx,000fh    
      add ax , cx
      inc  count
      inc  bx
      jmp digit
      
 end_while:
      imul  sign 
      mov cx , ax ;
       ret
        
    strtoint endp
     
             
;===========================================================


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; these functions are copied from emu8086.inc ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ten             DW      10   

; gets the multi-digit SIGNED number from the keyboard,
; and stores the result in  register:
SCAN_NUM        PROC    NEAR
PUSH    DX
PUSH    AX
PUSH    SI

MOV     CX, 0

; reset flag:
MOV     CS:make_minus, 0

next_digit:

; get char from keyboard
; into AL:
MOV     AH, 00h
INT     16h
; and print it:
MOV     AH, 0Eh
INT     10h

; check for MINUS:
CMP     AL, '-'
JE      set_minus

; check for ENTER key:
CMP     AL, 0Dh  ; carriage return?
JNE     not_cr
JMP     stop_input
not_cr:


CMP     AL, 8                   ; 'BACKSPACE' pressed?
JNE     backspace_checked
MOV     DX, 0                   ; remove last digit by
MOV     AX, CX                  ; division:
DIV     CS:ten                  ; AX = DX:AX / 10 (DX-rem).
MOV     CX, AX
PUTC    ' '                     ; clear position.
PUTC    8                       ; backspace again.
JMP     next_digit
backspace_checked:


; allow only digits:
CMP     AL, '0'
JAE     ok_AE_0
JMP     remove_not_digit
ok_AE_0:
CMP     AL, '9'
JBE     ok_digit
remove_not_digit:
PUTC    8       ; backspace.
PUTC    ' '     ; clear last entered not digit.
PUTC    8       ; backspace again.
JMP     next_digit ; wait for next input.
ok_digit:


; multiply CX by 10 (first time the result is zero)
PUSH    AX
MOV     AX, CX
MUL     CS:ten                  ; DX:AX = AX*10
MOV     CX, AX
POP     AX

; check if the number is too big
; (result should be 16 bits)
CMP     DX, 0
JNE     too_big

; convert from ASCII code:
SUB     AL, 30h

; add AL to CX:
MOV     AH, 0
MOV     DX, CX      ; backup, in case the result will be too big.
ADD     CX, AX
JC      too_big2    ; jump if the number is too big.

JMP     next_digit

set_minus:
MOV     CS:make_minus, 1
JMP     next_digit

too_big2:
MOV     CX, DX      ; restore the backuped value before add.
MOV     DX, 0       ; DX was zero before backup!
too_big:
MOV     AX, CX
DIV     CS:ten  ; reverse last DX:AX = AX*10, make AX = DX:AX / 10
MOV     CX, AX
PUTC    8       ; backspace.
PUTC    ' '     ; clear last entered digit.
PUTC    8       ; backspace again.
JMP     next_digit ; wait for Enter/Backspace.


stop_input:
; check flag:
CMP     CS:make_minus, 0
JE      not_minus
NEG     CX
not_minus:

POP     SI
POP     AX
POP     DX
RET
make_minus      DB      ?       ; used as a flag.
SCAN_NUM        ENDP



    ;============

; this procedure prints number in AX,
; used with PRINT_NUM_UNS to print signed numbers:
PRINT_NUM       PROC    NEAR
PUSH    DX
PUSH    AX

CMP     AX, 0
JNZ     not_zero

PUTC    '0'
JMP     printed

not_zero:
; the check SIGN of AX,
; make absolute if it's negative:
CMP     AX, 0
JNS     positive
NEG     AX

PUTC    '-'

positive:
CALL    PRINT_NUM_UNS
printed:
POP     AX
POP     DX
RET
PRINT_NUM       ENDP



; this procedure prints out an unsigned
; number in AX (not just a single digit)
; allowed values are from 0 to 65535 (FFFF)
PRINT_NUM_UNS   PROC    NEAR
PUSH    AX
PUSH    BX
PUSH    CX
PUSH    DX

; flag to prevent printing zeros before number:
MOV     CX, 1

; (result of "/ 10000" is always less or equal to 9).
MOV     BX, 10000       ; 2710h - divider.

; AX is zero?
CMP     AX, 0
JZ      print_zero

begin_print:

; check divider (if zero go to end_print):
CMP     BX,0
JZ      end_print

; avoid printing zeros before number:
CMP     CX, 0
JE      calc
; if AX<BX then result of DIV will be zero:
CMP     AX, BX
JB      skip
calc:
MOV     CX, 0   ; set flag.

MOV     DX, 0
DIV     BX      ; AX = DX:AX / BX   (DX=remainder).

; print last digit
; AH is always ZERO, so it's ignored
ADD     AL, 30h    ; convert to ASCII code.
PUTC    AL


MOV     AX, DX  ; get remainder from last div.

skip:
; calculate BX=BX/10
PUSH    AX
MOV     DX, 0
MOV     AX, BX
DIV     CS:ten  ; AX = DX:AX / 10   (DX=remainder).
MOV     BX, AX
POP     AX

JMP     begin_print

print_zero:
PUTC    '0'

end_print:

POP     DX
POP     CX
POP     BX
POP     AX
RET
PRINT_NUM_UNS   ENDP

;;;;;;;;;;;;;;;;;www.samavi.info;;;;;;;;;;;;;;;;;;;;;;;;;             
      payan:
    end Main