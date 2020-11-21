
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h             

;Memory Allocation                

;Array size - 0x8000:1000
;Array Elements - from 0x8000:1001

; add your code here

MOV AX,0X8000                      ;Moving the data to A register
MOV DS,AX                          ;Moving the content to DS
MOV SI,0X1000
MOV DL,[SI]                        ;Array Size
DEC DL                             ;Array size - 1
NEXT_ITERATION: MOV CL,DL          ;CL for no of iteration
                MOV SI,0X1001      ;Moving the offset to SI

NEXT_COMPARE:   MOV AL,[SI]        ;Moving the first value to AL
                CMP AL,[SI+1]      ;Comparing first byte and second byte

                JC SKIP_EXCHANGE   ;Exchange if first byte > second byte
                XCHG [SI+1],AL
                MOV [SI],AL

SKIP_EXCHANGE:  INC SI             ;Increment SI
                DEC CL             ;Decrement compare count

JNZ NEXT_COMPARE                   ;Go to next compare
DEC DL                             ;Decrement iteration count
JNZ NEXT_ITERATION                 ;Go to next iteration
HLT




ret




