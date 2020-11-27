
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here
;Experiment 6
;Accessing I/O Devices using software Interrupts
;Programme for outputting information from Data segment
;Memory Allocation 

;DATA SIZE                         - 0x8000:1000
;STRING DATA(Stored as ASCII code) - From 0X8000:1001  


        
        MOV AX,0X8000
        MOV DS,AX
        MOV SI,0X1000
        MOV CL,[SI]       ; Size of data for showing output, max - 0XFF bytes
        INC SI

AGAIN:  MOV AL,[SI]  
        INC SI
        MOV AH,0X0E
        MOV BX,0
        INT 0X10
        LOOP AGAIN

RET




