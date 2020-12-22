
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

;Unpacked decimal to hexadecimal
;Memory Allocation
;unpacked decimal(Little Endian) - 0x8000:1000
;16 bits output data - 0x8000:10005
org 100h

; add your code here
MOV AX,0X8000
MOV DS,AX
MOV SI,0X1000
MOV BX,[SI]
MOV BH,0
MOV AX,0
MOV AL,[SI+1]
MOV CX,10
MUL CX
ADD BX,AX
MOV AL,[SI+2]
MOV AH,0 
MOV CX,100
MUL CX
ADD BX,AX
MOV AL,[SI+3]
MOV AH,0
MOV CX,1000
MUL CX
ADD BX,AX
MOV AL,[SI+4]
MOV AH,0
MOV CX,10000
MUL CX
ADD BX,AX
MOV [SI+5],BX
RET




