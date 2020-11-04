
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

;Memory Allocation
;data 1        - 0x8000:1000
;data 2        - 0x8000:1008
;result sum    - 0x8000:1010
;carry bit     - 0x8000:1018
; add your code here

MOV AX,0X8000
MOV DS,AX
MOV SI,0X1000
MOV AX,[SI]  
MOV BX,[SI+8]
ADD AX,BX                         ;ADD first 16 bits of two number
MOV [SI+0x10],AX
MOV AX,[SI+2]
MOV BX,[SI+0xA]
ADC AX,BX                         ;Add second 16 bits of two numbers including carry
MOV [SI+0x12],AX
MOV AX,[SI+4]
MOV BX,[SI+0xC]
ADC AX,BX                         ;Add third 16 bits of two numbers including carry
MOV [SI+0x14],AX
MOV AX,[SI+6]
MOV BX,[SI+0xE]
ADC AX,BX                         ;Add fourth 16 bits of two numbers including carry
MOV [SI+0x16],AX
MOV AL,0X0
JNC SKIP_INCREMENT                
INC AL                            ;Increment on carry
SKIP_INCREMENT: MOV [SI+0X18],AL
END


ret




