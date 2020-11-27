
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here 
;Experiment 5
;Memory Alllocation
;Size of bytes to be transferred - 0x8000:1000 
;Source Address                  - 0x8000:1001
;Destination Address             - 0x9000:2000

MOV AX,0X8000
MOV DS,AX  
MOV AX,0X9000
MOV ES,AX
MOV SI,0X1000
MOV DI,0X2000
MOV CL,[SI]     ;Size of bytes to be transferred max size - 0XFF
INC SI  
CLD             ;Make sure SI&DI gets incremented
REP MOVSB

RET



