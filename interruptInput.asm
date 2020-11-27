
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here
;Experiment 7
;Accessing I/O Devices using software Interrupts
;Programme for inputting information from keyboard
;Memory Allocation 

;DATA SIZE                         - 0x8000:1000
;STRING DATA(Stored as ASCII code) - From 0X8000:1001

        MOV AX,0X8000
        MOV DS,AX
        MOV SI,0X1000
        MOV CL,0X10       ;Read 10 characters

AGAIN:  MOV AH,0X1
        INT 0X21
        MOV [SI],AL
        INC SI
        LOOP AGAIN

ret




