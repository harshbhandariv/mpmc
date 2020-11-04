
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h   


;Memory Allocation
;Data 1 - 0x8000:1000
;Data 2 - 0x8000:1002
;ResultData 1 - 0x8000:2000
;ResultData 2 - 0x8000:2002

; add your code here
MOV AX,0x8000
MOV DS,AX
MOV SI,0x1000
MOV DI,0x2000
MOV AX,[SI]
MOV BX,[SI+2]
MUL BX ;Multiplying AX and BX
MOV [DI],AX
MOV [DI+2],DX
HLT

ret




