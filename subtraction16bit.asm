
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h   


;Memory Allocation
;Data 1 - 0x8000:1000
;Data 2 - 0x8000:1002
;Result - 0x8000:2000
;Borrow Bit - 0x8000:2002

; add your code here
MOV AX,0x8000
MOV DS,AX
MOV SI,0x1000
MOV DI,0x2000
MOV AX,[SI]
MOV BX,[SI+2]
SUB AX,BX ;Subtracting two 16 bit numbers
MOV [DI],AX
MOV AL,0
JNB SKIP_INCREMENT
INC AL ;Incrementing AL if borrow used
SKIP_INCREMENT: MOV [DI+2],AL
HLT

ret




