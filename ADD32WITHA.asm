
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
;Memory Allocation
;Data 1 - 0x8000:1000
;Data 2 - 0x8000:1004
;Result 1 - 0x8000:2000
;Result 2 - 0x8000:2004
;Result carry - 0x8000:2005

; add your code here  
MOV AX,0X8000
MOV DS,AX
MOV SI,0X1000
MOV AX,[SI]
ADD AX,[SI+4];Add first set of 16 bit number
MOV [DI],AX
MOV AX,[SI+2]
ADC AX,[SI+6];Add second set of 16 bit numbers with the carry
MOV [DI+2],AX
MOV AX,0X0000
JNC SKIP
INC AL
SKIP: MOV [DI+4],AL 
HLT
ret