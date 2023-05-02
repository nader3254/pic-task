
_main:

;main.c,4 :: 		void main()
;main.c,6 :: 		TMR3IF_bit=0;
	BCF         TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
;main.c,7 :: 		TMR3IE_bit=1;
	BSF         TMR3IE_bit+0, BitPos(TMR3IE_bit+0) 
;main.c,8 :: 		PEIE_bit=1;
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;main.c,9 :: 		GIE_bit=1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;main.c,10 :: 		TMR3H=0xFF;
	MOVLW       255
	MOVWF       TMR3H+0 
;main.c,11 :: 		TMR3L=0x6A;
	MOVLW       106
	MOVWF       TMR3L+0 
;main.c,12 :: 		T1OSCEN_bit=1;
	BSF         T1OSCEN_bit+0, BitPos(T1OSCEN_bit+0) 
;main.c,13 :: 		T3CON=0x87;
	MOVLW       135
	MOVWF       T3CON+0 
;main.c,14 :: 		TRISB.b0=0;
	BCF         TRISB+0, 0 
;main.c,15 :: 		PORTB.b0=0;
	BCF         PORTB+0, 0 
;main.c,16 :: 		while(1)
L_main0:
;main.c,18 :: 		if(state==0)
	MOVLW       0
	XORWF       _state+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main9
	MOVLW       0
	XORWF       _state+0, 0 
L__main9:
	BTFSS       STATUS+0, 2 
	GOTO        L_main2
;main.c,20 :: 		PORTB.b0=1;
	BSF         PORTB+0, 0 
;main.c,21 :: 		state=1;
	MOVLW       1
	MOVWF       _state+0 
	MOVLW       0
	MOVWF       _state+1 
;main.c,22 :: 		}
	GOTO        L_main3
L_main2:
;main.c,25 :: 		state=0;
	CLRF        _state+0 
	CLRF        _state+1 
;main.c,26 :: 		PORTB.b0=0;
	BCF         PORTB+0, 0 
;main.c,27 :: 		}
L_main3:
;main.c,28 :: 		Delay_Ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
;main.c,29 :: 		}
	GOTO        L_main0
;main.c,30 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_interrupt:

;main.c,31 :: 		void interrupt()
;main.c,33 :: 		if(TMR3IF_bit==1)
	BTFSS       TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
	GOTO        L_interrupt5
;main.c,35 :: 		if(state==0)
	MOVLW       0
	XORWF       _state+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt12
	MOVLW       0
	XORWF       _state+0, 0 
L__interrupt12:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt6
;main.c,37 :: 		PORTB.b0=1;
	BSF         PORTB+0, 0 
;main.c,38 :: 		state=1;
	MOVLW       1
	MOVWF       _state+0 
	MOVLW       0
	MOVWF       _state+1 
;main.c,39 :: 		}
	GOTO        L_interrupt7
L_interrupt6:
;main.c,42 :: 		state=0;
	CLRF        _state+0 
	CLRF        _state+1 
;main.c,43 :: 		PORTB.b0=0;
	BCF         PORTB+0, 0 
;main.c,44 :: 		}
L_interrupt7:
;main.c,45 :: 		TMR3H=0xFF;
	MOVLW       255
	MOVWF       TMR3H+0 
;main.c,46 :: 		TMR3L=0x6A;
	MOVLW       106
	MOVWF       TMR3L+0 
;main.c,47 :: 		TMR3IF_bit=0;
	BCF         TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
;main.c,48 :: 		} }
L_interrupt5:
L_end_interrupt:
L__interrupt11:
	RETFIE      1
; end of _interrupt
