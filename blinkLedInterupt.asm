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
	MOV A,#0XFF			
	MOV IE,#0X9F 			;Enables timer0, timer1, int0, int1 and serial port interrupts
	MOV TCON,#0X55    ;Enables timer 1 and 0. Enables interrupts to be triggered by falling edge
AGAIN:	
	MOV P0,A			;LEDs of Port0 blink like - 11111111 and its complement
	LCALL DELAY
	CPL A
	MOV P0,A
	LCALL DELAY
	SJMP AGAIN

DELAY:					;Delay of 1 second is produced by this subroutine.
		MOV R2,#0X0A
WAIT_LOOP3:	MOV R0,#0XD0
WAIT_LOOP2:	MOV R1,#0XEE
WAIT_LOOP1:    DJNZ R1,WAIT_LOOP1
		DJNZ R0,WAIT_LOOP2
		DJNZ R2,WAIT_LOOP3
		RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;INTERRUPT SUBROUTINES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
INT0_ISR:				;Interrupt 0 subroutine
	MOV A,#0X81			;LEDs of Port0 blink like - 10000001 and its complement
	RETI
INT1_ISR:				;Interrupt 1 subroutine
	MOV A,#0X42			;LEDs of Port0 blink like - 01000010 and its complement
	RETI
TIMER0_ISR:				;Timer0 interrupt subroutine
	MOV P1,R0			;Copies the value of Register R0 and outputs it to Port1		
	RETI				;Can be verified using breakpoints
TIMER1_ISR:				;Timer1 interrupt subroutine
	MOV P2,R1			;Copies the value of Register R1 and outputs it to Port2
	RETI				;Can be verified using breakpoints
SERIAL_ISR:				;UART subroutine
	MOV A,#0X24			;LEDs of Port0 blink like - 00100100 and its complement
	RETI
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
END
