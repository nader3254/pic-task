// LCD module connections
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

// Set configuration bits
#pragma config FOSC = INTIO67   // Internal oscillator block with 4 MHz (default)
#pragma config PLLCFG = OFF     // 4x PLL disabled
#pragma config PRICLKEN = OFF   // Primary clock can be disabled by software
#pragma config WDTEN = OFF      // Watchdog Timer disabled (enabled by SWDTEN bit)
#pragma config MCLRE = ON   // MCLR pin enabled; RE3 input pin disabled


#define LED  PORTC.RC3
#define LED2 PORTC.RC1
#define LED3 PORTC.RC2
#define LED1 PORTC.RC0

#define SWITCH1 PORTA.RA4
#define SWITCH2 PORTB.RB5
#define SWITCH3 PORTB.RB6
#define SWITCH4 PORTB.RB7
 
#define TIMER_PERIOD 2550    // Timer1 period for 1 second delay
volatile int state=0;
volatile int enable_led4=0;
volatile int enable_led2=0;
volatile unsigned int state2 = 0;
volatile int ctr=0;
volatile int l1ST=0;
void T1_callBack()
{
  if (PIR1.TMR1IF) {    // Check if Timer1 overflowed
   if(enable_led4==1)
   {
    if(state==0)
    {
     LED=1; state=1;
     LED3=0;
    }
    else
    {
     LED=0;  state=0;
    }
   }
   else
   {
      LED=0;  state=0;
   }
    PIR1.TMR1IF = 0;    // Clear Timer1 overflow flag
    TMR1H = TIMER_PERIOD >> 8;  // Reload Timer1 value
    TMR1L = TIMER_PERIOD & 0xFF;
  }
}
void T0_callback()
{
   if (INTCON.TMR0IF) {
     if(enable_led2==1 && ctr<5)
     {
        // Check if Timer0 overflowed
        if (state2 == 0) {
            LED2 = 1;
            state2 = 1;
        } else {
            LED2 = 0;
            state2 = 0;
        }

        ctr++;
        }
         else
         {
             ctr=0;
             LED2 = 0;
             enable_led2=0;
          }
        INTCON.TMR0IF = 0; // Clear Timer0 overflow flag
        TMR0H = 0xFC; // Set Timer0 initial value for 500 us delay
        TMR0L = 0x18;
    }

}

// Interrupt Service Routine for Timer1 overflow
void interrupt() 
{
    T1_callBack();
    T0_callback();
}
void init_T1()
{
   TRISC.RC3 = 0;   // Configure PORTB.0 as output
  // Configure Timer1 for 1 second delay
  T1CON = 0x30;   // Timer1 enabled, 1:8 prescaler, internal clock source
  // Enable global interrupts and Timer1 overflow interrupt
  INTCON.GIE = 1;
  PIE1.TMR1IE = 1;
  INTCON.PEIE = 1;
  T1CON.TMR1ON=1;
}
void init_T0()
{
    TRISC.RC1 = 0; // Configure RC1 as output
    T0CON = 0x07; // Enable Timer0 with 1:4 prescaler and 16-bit mode
    TMR0H = 0xFC; // Set Timer0 initial value for 500 us delay
    TMR0L = 0x18;
    INTCON.TMR0IE = 1; // Enable Timer0 interrupt
    INTCON.GIE = 1; // Enable global interrupts
    T0CON.TMR0ON=1;
}
void init_btns()
{
    ADCON1 = 0x00; // Disable analog input on all pins
    TRISA.RA4 = 1; // Configure btn1
    TRISB.RB5 = 1; // Configure btn2
    TRISB.RB6 = 1; // Configure btn3
    TRISB.RB7 = 1; // Configure btn4
}
void init_leds()
{
   TRISC.RC3 = 0; // Configure led 3
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

       if (SWITCH3 == 1)
       {
           enable_led2=1;
           LCD_CMD(_LCD_Clear);
           LCD_Out(1,1,"Flashing led 2");
       }
////////////////////////////////////////////////////////////////
        if (SWITCH1 == 1)
        { 
              enable_led4=1;
           LCD_CMD(_LCD_Clear);
           LCD_Out(1,1,"Flashing led 4");
        }
////////////////////////////////////////////////////////////////
        if (SWITCH4 == 1) {
           if(l1ST==0)
           {
            LED1 = 1;l1ST=1;
            LCD_CMD(_LCD_Clear);
           LCD_Out(1,1,"led 1 ON");
           }else{
            LED1 = 0;l1ST=0;
           LCD_CMD(_LCD_Clear);
           LCD_Out(1,1,"led 1 OFF");
           }

        }
//////////////////////////////////////////////////////////////////
        if (SWITCH2 == 1) {
           LED3=1;
            LCD_CMD(_LCD_Clear);
            LCD_Out(1,1,"led 3 ON");
          }
}

}