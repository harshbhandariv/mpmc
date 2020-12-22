
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h


; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

;Memory Allocation
;data 1    - 0x8000:1000
;data 2    - 0x8000:1004
;result    - 0x8000:1008
;carry bit - 0x8000:100C
org 100h

MOV AX,0X8000
MOV DS,AX
MOV SI,0X1000
MOV AX,[SI]
MOV BX,[SI+4]
SUB AX,BX
MOV [SI+8],AX
MOV AX,[SI+2]
MOV BX,[SI+6]
SBB AX,BX
MOV [SI+0XA],AX
MOV AL,0
JNC SKIP_INCREMENT
INC AL
SKIP_INCREMENT: MOV [SI+0XC],AL
ret



