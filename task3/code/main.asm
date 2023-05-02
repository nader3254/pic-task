
_main:

;main.c,3 :: 		void main()
;main.c,5 :: 		TRISC=0;
	CLRF        TRISC+0 
;main.c,6 :: 		PORTC=0;
	CLRF        PORTC+0 
;main.c,7 :: 		TMR0IF_bit=0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;main.c,8 :: 		TMR0IE_bit=1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;main.c,9 :: 		GIE_bit=1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;main.c,10 :: 		TMR0H=0xB1;
	MOVLW       177
	MOVWF       TMR0H+0 
;main.c,11 :: 		TMR0L=0xE0;
	MOVLW       224
	MOVWF       TMR0L+0 
;main.c,12 :: 		T0CON=0x80;//PSA 1:2
	MOVLW       128
	MOVWF       T0CON+0 
;main.c,13 :: 		while(1)
L_main0:
;main.c,15 :: 		portC.b0=~portc.b0;
	BTG         PORTC+0, 0 
;main.c,16 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
	NOP
;main.c,17 :: 		} }
	GOTO        L_main0
L_end_main:
	GOTO        $+0
; end of _main

_interrupt:

;main.c,18 :: 		void interrupt()
;main.c,20 :: 		if(TMR0IF_bit==1)
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt3
;main.c,22 :: 		portC.b1=~portc.b1;
	BTG         PORTC+0, 1 
;main.c,23 :: 		TMR0H=0xB1;
	MOVLW       177
	MOVWF       TMR0H+0 
;main.c,24 :: 		TMR0L=0xE0;
	MOVLW       224
	MOVWF       TMR0L+0 
;main.c,25 :: 		TMR0IF_bit=0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;main.c,26 :: 		} }
L_interrupt3:
L_end_interrupt:
L__interrupt6:
	RETFIE      1
; end of _interrupt
