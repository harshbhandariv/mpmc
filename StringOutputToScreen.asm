; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here 
;Memory Allocation
;0x8000:1000 - Location for my name
;0x8000:1000 - Location for my father's name
;0x8000:1000 - Location for my mother's name

;Name storing format - (size of name) + (name)
;Example:
;For the name "HARSH"
;Stored as 5HARSH



;My register number is 19D032
;Type - 2
;Result Storage Memory Allocation
;0x9000:1050 - Father's name
;0x9050:1000 - Mother's name
;0x9060:1050 - My name


MOV AX,0X8000
MOV DS,AX            ;Setting source memory location
MOV SI,0X1000        ;Source Address for my name
MOV AX,0             ;Clearing AX register
MOV AL,[SI]
ADD AX,0x1000        ;Adding 0x1000 to get the Source index of the name
MOV SI,AX
MOV CL,[SI]          ;Size of my name
MOV DL,CL
A:INC SI               ;Incrementing SI to point to last of name
LOOP A
MOV CL,DL

AGAIN:  MOV AL,[SI]  
        DEC SI
        MOV AH,0X0E
        MOV BX,0
        INT 0X10
        LOOP AGAIN
MOV AH,0X0E
MOV AL,0X20
INT 0x10 

MOV SI,0X1001        ;Source Address for father name
MOV AX,0             ;Clearing AX register
MOV AL,[SI]
ADD AX,0x1000        ;Adding 0x1000 to get the Source index of the name
MOV SI,AX
MOV CL,[SI]          ;Size of my name
MOV DL,CL
B: INC SI               ;Incrementing SI to point to last of name
LOOP B
MOV CL,DL

AGAIN1:  MOV AL,[SI]  
        DEC SI
        MOV AH,0X0E
        MOV BX,0
        INT 0X10
        LOOP AGAIN1 

MOV AH,0X0E
MOV AL,0X20
INT 0x10 

MOV SI,0X1002        ;Source Address for father name
MOV AX,0             ;Clearing AX register
MOV AL,[SI]
ADD AX,0x1000        ;Adding 0x1000 to get the Source index of the name
MOV SI,AX
MOV CL,[SI]          ;Size of my name
MOV DL,CL
C: INC SI               ;Incrementing SI to point to last of name
LOOP C
MOV CL,DL

AGAIN2:  MOV AL,[SI]  
        DEC SI
        MOV AH,0X0E
        MOV BX,0
        INT 0X10
        LOOP AGAIN2

ret
