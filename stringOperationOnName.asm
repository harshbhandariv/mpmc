
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here 
;Memory Allocation
;0x8000:1000 - Location for my name
;0x8000:1000 - Location for my father's name
;0x8000:1000 - Location for my mother's name

;Name sorting format - (size of name) + (name)
;Example:
;For the name "HARSH"
;Stored as 5HSRAH      (Stored in Little Endian Format)



;My register number is 19D032
;Type - 2
;Result Storage Memory Allocation
;0x9000:1050 - Father's name
;0x9050:1000 - Mother's name
;0x9060:1050 - My name


MOV AX,0X8000
MOV DS,AX            ;Setting source memory location
MOV SI,0X1001        ;Source Address for Father's name
MOV AX,0             ;Clearing AX register
MOV AL,[SI]
ADD AX,0x1000        ;Adding 0x1000 to get the Source index of the name
MOV SI,AX
MOV CL,[SI]          ;Size of Father's name
INC SI               ;Incrementing SI to point name
CLD
MOV AX,0x9000
MOV ES,AX            ;Destination Segment for Father's name
MOV DI,0x1050        ;Destination index for Father's name
REP MOVSB

MOV SI,0X1002        ;Source Address for Mother's name
MOV AX,0
MOV AL,[SI]
ADD AX,0x1000        ;Adding 0x1000 to get the Source index of the name
MOV SI,AX
MOV CL,[SI]          ;Size of Mother's name
INC SI               ;Incrementing SI to point name
CLD
MOV AX,0x9050        
MOV ES,AX            ;Destination Segment for Mother's name
MOV DI,0x1000        ;Destination index for Mother's name
REP MOVSB   

MOV SI,0X1000        ;Source  Address for my name
MOV AX,0
MOV AL,[SI]          
ADD AX,0x1000        ;Adding 0x1000 to get the Source index of the name
MOV SI,AX
MOV CL,[SI]          ;Size of my name
INC SI               ;Incrementing SI to point name
CLD
MOV AX,0x9060
MOV ES,AX            ;Destination Segment for my name
MOV DI,0x1050        ;Destination Index for my name
REP MOVSB


ret




