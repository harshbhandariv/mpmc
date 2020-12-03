ORG 0x0000
	SJMP MAIN
ORG 0x0003
	SJMP INT0_ISR
ORG 0x000B
	SJMP TIMER0_ISR
ORG 0X0013
	SJMP INT1_ISR
ORG 0X001B
	SJMP TIMER1_ISR
ORG 0X0023
	SJMP SERIAL_ISR
MAIN: 
	MOV A,#0XFF						;LEDs of Port0 blink like - 11111111 and its complement
	MOV IE,#0X9F
	MOV TCON,#0X01
AGAIN:
	MOV P0,A
	LCALL DELAY
	CPL A
	MOV P0,A
	LCALL DELAY
	SJMP AGAIN
DELAY:
			MOV R2,#0X0A
WAIT_LOOP3:	MOV R0,#0XD0
WAIT_LOOP2:	MOV R1,#0XEE
WAIT_LOOP1: DJNZ R1,WAIT_LOOP1
			DJNZ R0,WAIT_LOOP1
			DJNZ R2,WAIT_LOOP3
			RET
INT0_ISR:
	MOV A,#0X81						;LEDs of Port0 blink like - 10000001 and its complement
	RETI
INT1_ISR:
	MOV A,#0X42						;LEDs of Port0 blink like - 01000010 and its complement
	RETI
TIMER0_ISR:
	MOV A,#0XC3						;LEDs of Port0 blink like - 11000011 and its complement
	RETI
TIMER1_ISR:
	MOV A,#0X77						;LEDs of Port0 blink like - 1110111 and its complement
	RETI
SERIAL_ISR:
	MOV A,#0X24						;LEDs of Port0 blink like - 00100100 and its complement
	RETI
END
