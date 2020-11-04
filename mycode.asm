
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

;memory allocation
;0X8000:1000 == data1
;0x8000:1001 == data2
;0x8000:1002 == result
;0x8000:1003 == carry 



org 100h
; add your code here

;initializ the pointer
MOV AX,0X8000
MOV DS,AX
MOV SI,0X1000
MOV AX,[SI]
MOV BX,[SI+2]
ADD AX,BX
MOV [SI+4],Ax
MOV AX,0
JNC skip
INC AL
skip: MOV [SI+6],AL
HLT


ret
end