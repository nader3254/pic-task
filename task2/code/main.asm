
_T1_callBack:

;main.c,40 :: 		void T1_callBack()
;main.c,42 :: 		if (PIR1.TMR1IF) {    // Check if Timer1 overflowed
	BTFSS       PIR1+0, 0 
	GOTO        L_T1_callBack0
;main.c,43 :: 		if(enable_led4==1)
	MOVLW       0
	XORWF       _enable_led4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__T1_callBack22
	MOVLW       1
	XORWF       _enable_led4+0, 0 
L__T1_callBack22:
	BTFSS       STATUS+0, 2 
	GOTO        L_T1_callBack1
;main.c,45 :: 		if(state==0)
	MOVLW       0
	XORWF       _state+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__T1_callBack23
	MOVLW       0
	XORWF       _state+0, 0 
L__T1_callBack23:
	BTFSS       STATUS+0, 2 
	GOTO        L_T1_callBack2
;main.c,47 :: 		LED=1; state=1;
	BSF         PORTC+0, 3 
	MOVLW       1
	MOVWF       _state+0 
	MOVLW       0
	MOVWF       _state+1 
;main.c,48 :: 		LED3=0;
	BCF         PORTC+0, 2 
;main.c,49 :: 		}
	GOTO        L_T1_callBack3
L_T1_callBack2:
;main.c,52 :: 		LED=0;  state=0;
	BCF         PORTC+0, 3 
	CLRF        _state+0 
	CLRF        _state+1 
;main.c,53 :: 		}
L_T1_callBack3:
;main.c,54 :: 		}
	GOTO        L_T1_callBack4
L_T1_callBack1:
;main.c,57 :: 		LED=0;  state=0;
	BCF         PORTC+0, 3 
	CLRF        _state+0 
	CLRF        _state+1 
;main.c,58 :: 		}
L_T1_callBack4:
;main.c,59 :: 		PIR1.TMR1IF = 0;    // Clear Timer1 overflow flag
	BCF         PIR1+0, 0 
;main.c,60 :: 		TMR1H = TIMER_PERIOD >> 8;  // Reload Timer1 value
	MOVLW       9
	MOVWF       TMR1H+0 
;main.c,61 :: 		TMR1L = TIMER_PERIOD & 0xFF;
	MOVLW       246
	MOVWF       TMR1L+0 
;main.c,62 :: 		}
L_T1_callBack0:
;main.c,63 :: 		}
L_end_T1_callBack:
	RETURN      0
; end of _T1_callBack

_T0_callback:

;main.c,64 :: 		void T0_callback()
;main.c,66 :: 		if (INTCON.TMR0IF) {
	BTFSS       INTCON+0, 2 
	GOTO        L_T0_callback5
;main.c,67 :: 		if(enable_led2==1 && ctr<5)
	MOVLW       0
	XORWF       _enable_led2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__T0_callback25
	MOVLW       1
	XORWF       _enable_led2+0, 0 
L__T0_callback25:
	BTFSS       STATUS+0, 2 
	GOTO        L_T0_callback8
	MOVLW       128
	XORWF       _ctr+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__T0_callback26
	MOVLW       5
	SUBWF       _ctr+0, 0 
L__T0_callback26:
	BTFSC       STATUS+0, 0 
	GOTO        L_T0_callback8
L__T0_callback20:
;main.c,70 :: 		if (state2 == 0) {
	MOVLW       0
	XORWF       _state2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__T0_callback27
	MOVLW       0
	XORWF       _state2+0, 0 
L__T0_callback27:
	BTFSS       STATUS+0, 2 
	GOTO        L_T0_callback9
;main.c,71 :: 		LED2 = 1;
	BSF         PORTC+0, 1 
;main.c,72 :: 		state2 = 1;
	MOVLW       1
	MOVWF       _state2+0 
	MOVLW       0
	MOVWF       _state2+1 
;main.c,73 :: 		} else {
	GOTO        L_T0_callback10
L_T0_callback9:
;main.c,74 :: 		LED2 = 0;
	BCF         PORTC+0, 1 
;main.c,75 :: 		state2 = 0;
	CLRF        _state2+0 
	CLRF        _state2+1 
;main.c,76 :: 		}
L_T0_callback10:
;main.c,78 :: 		ctr++;
	MOVLW       1
	ADDWF       _ctr+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      _ctr+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _ctr+0 
	MOVF        R1, 0 
	MOVWF       _ctr+1 
;main.c,79 :: 		}
	GOTO        L_T0_callback11
L_T0_callback8:
;main.c,82 :: 		ctr=0;
	CLRF        _ctr+0 
	CLRF        _ctr+1 
;main.c,83 :: 		LED2 = 0;
	BCF         PORTC+0, 1 
;main.c,84 :: 		enable_led2=0;
	CLRF        _enable_led2+0 
	CLRF        _enable_led2+1 
;main.c,85 :: 		}
L_T0_callback11:
;main.c,86 :: 		INTCON.TMR0IF = 0; // Clear Timer0 overflow flag
	BCF         INTCON+0, 2 
;main.c,87 :: 		TMR0H = 0xFC; // Set Timer0 initial value for 500 us delay
	MOVLW       252
	MOVWF       TMR0H+0 
;main.c,88 :: 		TMR0L = 0x18;
	MOVLW       24
	MOVWF       TMR0L+0 
;main.c,89 :: 		}
L_T0_callback5:
;main.c,91 :: 		}
L_end_T0_callback:
	RETURN      0
; end of _T0_callback

_interrupt:

;main.c,94 :: 		void interrupt()
;main.c,96 :: 		T1_callBack();
	CALL        _T1_callBack+0, 0
;main.c,97 :: 		T0_callback();
	CALL        _T0_callback+0, 0
;main.c,98 :: 		}
L_end_interrupt:
L__interrupt29:
	RETFIE      1
; end of _interrupt

_init_T1:

;main.c,99 :: 		void init_T1()
;main.c,101 :: 		TRISC.RC3 = 0;   // Configure PORTB.0 as output
	BCF         TRISC+0, 3 
;main.c,103 :: 		T1CON = 0x30;   // Timer1 enabled, 1:8 prescaler, internal clock source
	MOVLW       48
	MOVWF       T1CON+0 
;main.c,105 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;main.c,106 :: 		PIE1.TMR1IE = 1;
	BSF         PIE1+0, 0 
;main.c,107 :: 		INTCON.PEIE = 1;
	BSF         INTCON+0, 6 
;main.c,108 :: 		T1CON.TMR1ON=1;
	BSF         T1CON+0, 0 
;main.c,109 :: 		}
L_end_init_T1:
	RETURN      0
; end of _init_T1

_init_T0:

;main.c,110 :: 		void init_T0()
;main.c,112 :: 		TRISC.RC1 = 0; // Configure RC1 as output
	BCF         TRISC+0, 1 
;main.c,113 :: 		T0CON = 0x07; // Enable Timer0 with 1:4 prescaler and 16-bit mode
	MOVLW       7
	MOVWF       T0CON+0 
;main.c,114 :: 		TMR0H = 0xFC; // Set Timer0 initial value for 500 us delay
	MOVLW       252
	MOVWF       TMR0H+0 
;main.c,115 :: 		TMR0L = 0x18;
	MOVLW       24
	MOVWF       TMR0L+0 
;main.c,116 :: 		INTCON.TMR0IE = 1; // Enable Timer0 interrupt
	BSF         INTCON+0, 5 
;main.c,117 :: 		INTCON.GIE = 1; // Enable global interrupts
	BSF         INTCON+0, 7 
;main.c,118 :: 		T0CON.TMR0ON=1;
	BSF         T0CON+0, 7 
;main.c,119 :: 		}
L_end_init_T0:
	RETURN      0
; end of _init_T0

_init_btns:

;main.c,120 :: 		void init_btns()
;main.c,122 :: 		ADCON1 = 0x00; // Disable analog input on all pins
	CLRF        ADCON1+0 
;main.c,123 :: 		TRISA.RA4 = 1; // Configure btn1
	BSF         TRISA+0, 4 
;main.c,124 :: 		TRISB.RB5 = 1; // Configure btn2
	BSF         TRISB+0, 5 
;main.c,125 :: 		TRISB.RB6 = 1; // Configure btn3
	BSF         TRISB+0, 6 
;main.c,126 :: 		TRISB.RB7 = 1; // Configure btn4
	BSF         TRISB+0, 7 
;main.c,127 :: 		}
L_end_init_btns:
	RETURN      0
; end of _init_btns

_init_leds:

;main.c,128 :: 		void init_leds()
;main.c,130 :: 		TRISC.RC3 = 0; // Configure led 3
	BCF         TRISC+0, 3 
;main.c,131 :: 		TRISC.RC0 = 0;
	BCF         TRISC+0, 0 
;main.c,133 :: 		}
L_end_init_leds:
	RETURN      0
; end of _init_leds

_main:

;main.c,134 :: 		void main()
;main.c,136 :: 		init_btns();
	CALL        _init_btns+0, 0
;main.c,137 :: 		init_leds();
	CALL        _init_leds+0, 0
;main.c,138 :: 		init_T1();
	CALL        _init_T1+0, 0
;main.c,139 :: 		init_T0();
	CALL        _init_T0+0, 0
;main.c,141 :: 		LCD_init();
	CALL        _Lcd_Init+0, 0
;main.c,142 :: 		LCD_CMD(_lcd_cursor_off);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,143 :: 		LCD_CMD(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,144 :: 		LCD_Out(1,6,"Waiting");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,145 :: 		LCD_Out(2,4,"to press SW");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,147 :: 		while(1)
L_main12:
;main.c,150 :: 		if (SWITCH3 == 1)
	BTFSS       PORTB+0, 6 
	GOTO        L_main14
;main.c,152 :: 		enable_led2=1;
	MOVLW       1
	MOVWF       _enable_led2+0 
	MOVLW       0
	MOVWF       _enable_led2+1 
;main.c,153 :: 		LCD_CMD(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,154 :: 		LCD_Out(1,1,"Flashing led 2");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,155 :: 		}
L_main14:
;main.c,157 :: 		if (SWITCH1 == 1)
	BTFSS       PORTA+0, 4 
	GOTO        L_main15
;main.c,159 :: 		enable_led4=1;
	MOVLW       1
	MOVWF       _enable_led4+0 
	MOVLW       0
	MOVWF       _enable_led4+1 
;main.c,160 :: 		LCD_CMD(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,161 :: 		LCD_Out(1,1,"Flashing led 4");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,162 :: 		}
L_main15:
;main.c,164 :: 		if (SWITCH4 == 1) {
	BTFSS       PORTB+0, 7 
	GOTO        L_main16
;main.c,165 :: 		if(l1ST==0)
	MOVLW       0
	XORWF       _l1ST+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main35
	MOVLW       0
	XORWF       _l1ST+0, 0 
L__main35:
	BTFSS       STATUS+0, 2 
	GOTO        L_main17
;main.c,167 :: 		LED1 = 1;l1ST=1;
	BSF         PORTC+0, 0 
	MOVLW       1
	MOVWF       _l1ST+0 
	MOVLW       0
	MOVWF       _l1ST+1 
;main.c,168 :: 		LCD_CMD(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,169 :: 		LCD_Out(1,1,"led 1 ON");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,170 :: 		}else{
	GOTO        L_main18
L_main17:
;main.c,171 :: 		LED1 = 0;l1ST=0;
	BCF         PORTC+0, 0 
	CLRF        _l1ST+0 
	CLRF        _l1ST+1 
;main.c,172 :: 		LCD_CMD(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,173 :: 		LCD_Out(1,1,"led 1 OFF");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,174 :: 		}
L_main18:
;main.c,176 :: 		}
L_main16:
;main.c,178 :: 		if (SWITCH2 == 1) {
	BTFSS       PORTB+0, 5 
	GOTO        L_main19
;main.c,179 :: 		LED3=1;
	BSF         PORTC+0, 2 
;main.c,180 :: 		LCD_CMD(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,181 :: 		LCD_Out(1,1,"led 3 ON");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,182 :: 		}
L_main19:
;main.c,183 :: 		}
	GOTO        L_main12
;main.c,185 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
