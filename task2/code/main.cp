#line 1 "C:/Users/Maher/Downloads/pic-tasks/task2/code/main.c"

sbit LCD_RS_Direction at TRISB.b4;
sbit LCD_EN_Direction at TRISA1_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_RS at PORTB.b4;
sbit LCD_EN at RA1_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;
#pragma config FOSC = INTIO67
#pragma config PLLCFG = OFF
#pragma config PRICLKEN = OFF
#pragma config WDTEN = OFF
#pragma config MCLRE = ON
#line 34 "C:/Users/Maher/Downloads/pic-tasks/task2/code/main.c"
volatile int state=0;
volatile int enable_led4=0;
volatile int enable_led2=0;
volatile unsigned int state2 = 0;
volatile int ctr=0;
volatile int l1ST=0;
void T1_callBack()
{
 if (PIR1.TMR1IF) {
 if(enable_led4==1)
 {
 if(state==0)
 {
  PORTC.RC3 =1; state=1;
  PORTC.RC2 =0;
 }
 else
 {
  PORTC.RC3 =0; state=0;
 }
 }
 else
 {
  PORTC.RC3 =0; state=0;
 }
 PIR1.TMR1IF = 0;
 TMR1H =  2550  >> 8;
 TMR1L =  2550  & 0xFF;
 }
}
void T0_callback()
{
 if (INTCON.TMR0IF) {
 if(enable_led2==1 && ctr<5)
 {

 if (state2 == 0) {
  PORTC.RC1  = 1;
 state2 = 1;
 } else {
  PORTC.RC1  = 0;
 state2 = 0;
 }

 ctr++;
 }
 else
 {
 ctr=0;
  PORTC.RC1  = 0;
 enable_led2=0;
 }
 INTCON.TMR0IF = 0;
 TMR0H = 0xFC;
 TMR0L = 0x18;
 }

}


void interrupt()
{
 T1_callBack();
 T0_callback();
}
void init_T1()
{
 TRISC.RC3 = 0;

 T1CON = 0x30;

 INTCON.GIE = 1;
 PIE1.TMR1IE = 1;
 INTCON.PEIE = 1;
 T1CON.TMR1ON=1;
}
void init_T0()
{
 TRISC.RC1 = 0;
 T0CON = 0x07;
 TMR0H = 0xFC;
 TMR0L = 0x18;
 INTCON.TMR0IE = 1;
 INTCON.GIE = 1;
 T0CON.TMR0ON=1;
}
void init_btns()
{
 ADCON1 = 0x00;
 TRISA.RA4 = 1;
 TRISB.RB5 = 1;
 TRISB.RB6 = 1;
 TRISB.RB7 = 1;
}
void init_leds()
{
 TRISC.RC3 = 0;
 TRISC.RC0 = 0;

}
void main()
{
 init_btns();
 init_leds();
 init_T1();
 init_T0();

 LCD_init();
 LCD_CMD(_lcd_cursor_off);
 LCD_CMD(_LCD_Clear);
 LCD_Out(1,6,"Waiting");
 LCD_Out(2,4,"to press SW");

 while(1)
{

 if ( PORTB.RB6  == 1)
 {
 enable_led2=1;
 LCD_CMD(_LCD_Clear);
 LCD_Out(1,1,"Flashing led 2");
 }

 if ( PORTA.RA4  == 1)
 {
 enable_led4=1;
 LCD_CMD(_LCD_Clear);
 LCD_Out(1,1,"Flashing led 4");
 }

 if ( PORTB.RB7  == 1) {
 if(l1ST==0)
 {
  PORTC.RC0  = 1;l1ST=1;
 LCD_CMD(_LCD_Clear);
 LCD_Out(1,1,"led 1 ON");
 }else{
  PORTC.RC0  = 0;l1ST=0;
 LCD_CMD(_LCD_Clear);
 LCD_Out(1,1,"led 1 OFF");
 }

 }

 if ( PORTB.RB5  == 1) {
  PORTC.RC2 =1;
 LCD_CMD(_LCD_Clear);
 LCD_Out(1,1,"led 3 ON");
 }
}

}
