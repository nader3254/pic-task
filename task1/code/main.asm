
_main:

;main.c,14 :: 		void main()
;main.c,16 :: 		LCD_init();
	CALL        _Lcd_Init+0, 0
;main.c,17 :: 		TRISD=0x07;
	MOVLW       7
	MOVWF       TRISD+0 
;main.c,18 :: 		PORTD=0;
	CLRF        PORTD+0 
;main.c,19 :: 		LCD_CMD(_lcd_cursor_off);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,20 :: 		LCD_CMD(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,21 :: 		LCD_Out(1,6,"Waiting");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,22 :: 		LCD_Out(2,4,"to press SW");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,23 :: 		while(1)
L_main0:
;main.c,25 :: 		if(portd.B0==1)
	BTFSS       PORTD+0, 0 
	GOTO        L_main2
;main.c,26 :: 		{ while(portd.B0==1);
L_main3:
	BTFSS       PORTD+0, 0 
	GOTO        L_main4
	GOTO        L_main3
L_main4:
;main.c,27 :: 		portd.b4=1;
	BSF         PORTD+0, 4 
;main.c,28 :: 		portd.b3=0;
	BCF         PORTD+0, 3 
;main.c,29 :: 		LCD_CMD(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,30 :: 		LCD_Out(1,1,"Motor state: ON");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,31 :: 		LCD_Out(2,1,"Direction: CCW");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,32 :: 		}
	GOTO        L_main5
L_main2:
;main.c,33 :: 		else if(portd.B1)
	BTFSS       PORTD+0, 1 
	GOTO        L_main6
;main.c,34 :: 		{ while(portd.B1);
L_main7:
	BTFSS       PORTD+0, 1 
	GOTO        L_main8
	GOTO        L_main7
L_main8:
;main.c,35 :: 		portd.b3=1;
	BSF         PORTD+0, 3 
;main.c,36 :: 		portd.b4=0;
	BCF         PORTD+0, 4 
;main.c,37 :: 		LCD_CMD(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,38 :: 		LCD_Out(1,1,"Motor state: ON");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,39 :: 		LCD_Out(2,1,"Direction: CW");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,40 :: 		}
L_main6:
L_main5:
;main.c,41 :: 		if(portd.B2)
	BTFSS       PORTD+0, 2 
	GOTO        L_main9
;main.c,42 :: 		{ while(portd.B2);
L_main10:
	BTFSS       PORTD+0, 2 
	GOTO        L_main11
	GOTO        L_main10
L_main11:
;main.c,43 :: 		portd.b4=0;
	BCF         PORTD+0, 4 
;main.c,44 :: 		portd.b3=0;
	BCF         PORTD+0, 3 
;main.c,45 :: 		LCD_CMD(_LCD_Clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,46 :: 		LCD_Out(1,1,"Motor state: OFF");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,47 :: 		} } }
L_main9:
	GOTO        L_main0
L_end_main:
	GOTO        $+0
; end of _main
