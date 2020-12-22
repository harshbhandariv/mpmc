
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
;HEXADECIMAL TO UNPACKED DECIMAL
;MEMORY ALLOCATION
;16 bits input data - 0x8000:1000
;Decimal Data(Output in Little Endian) - 0x8000:1002
; add your code here
MOV AX,0X8000
MOV DS,AX
MOV SI,0X1000
MOV AX,[SI]
MOV BX,10000
DIV BX
MOV [SI+6],AL
MOV AX,DX
MOV BX,1000
MOV DX,0
DIV BX
MOV [SI+5],AL
MOV AX,DX
MOV BX,100
MOV DX,0
DIV BX
MOV [SI+4],AL
MOV AX,DX
MOV BX,10
MOV DX,0
DIV BX
MOV [SI+3],AL
MOV [SI+2],DL
RET




