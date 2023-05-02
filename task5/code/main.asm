
_main:

;main.c,16 :: 		void main()
;main.c,18 :: 		CCP2IF_bit=0;
	BCF         CCP2IF_bit+0, BitPos(CCP2IF_bit+0) 
;main.c,19 :: 		TMR1H=0;
	CLRF        TMR1H+0 
;main.c,20 :: 		TMR1L=0;
	CLRF        TMR1L+0 
;main.c,21 :: 		T3CON=0;
	CLRF        T3CON+0 
;main.c,22 :: 		TRISC.b1=0;
	BCF         TRISC+0, 1 
;main.c,23 :: 		PORTC.b0=0;
	BCF         PORTC+0, 0 
;main.c,24 :: 		CCP2Con=0x02;
	MOVLW       2
	MOVWF       CCP2CON+0 
;main.c,25 :: 		T1CON=0x81;
	MOVLW       129
	MOVWF       T1CON+0 
;main.c,26 :: 		while(1)
L_main0:
;main.c,28 :: 		while(! CCP2IF_bit);
L_main2:
	BTFSC       CCP2IF_bit+0, BitPos(CCP2IF_bit+0) 
	GOTO        L_main3
	GOTO        L_main2
L_main3:
;main.c,29 :: 		CCP2IF_bit=0;
	BCF         CCP2IF_bit+0, BitPos(CCP2IF_bit+0) 
;main.c,30 :: 		TMR1H=0;
	CLRF        TMR1H+0 
;main.c,31 :: 		TMR1L=0;
	CLRF        TMR1L+0 
;main.c,32 :: 		} }
	GOTO        L_main0
L_end_main:
	GOTO        $+0
; end of _main
