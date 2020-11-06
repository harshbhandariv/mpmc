
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
;Memory Allocation
; data 1 - 0x8000:1000
; data 1 - 0x8000:1008
; RESULT - 0X8000:1010
; add your code here    
    MOV AX,0X8000
    MOV DS,AX
    MOV SI,0X1000 
    MOV CX,0X6
    ADD SI,CX
    MOV CX,0X4
LOOP1:
    MOV AX,[SI]
    MOV BX,[SI+8]
    DEC SI
    DEC SI
    CMP AX,BX
    JZ CONTINUE
    JNC ANSWER1
    JC ANSWER2
CONTINUE:
    LOOP LOOP1
    MOV SI,0X1010
    MOV [SI],0X12
    RET
ANSWER1:
    MOV SI,0X1010
    MOV [SI],0X1
    RET
ANSWER2:
    MOV SI,0X1010
    MOV [SI],0X2
    RET
ret




