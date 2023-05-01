sbit LCD_RS_Direction at TRISC.b4;
sbit LCD_EN_Direction at TRISC5_bit;
sbit LCD_D4_Direction at TRISC0_bit;
sbit LCD_D5_Direction at TRISC1_bit;
sbit LCD_D6_Direction at TRISC2_bit;
sbit LCD_D7_Direction at TRISC3_bit;
sbit LCD_RS at PORTC.b4;
sbit LCD_EN at RC5_bit;
sbit LCD_D4 at RC0_bit;
sbit LCD_D5 at RC1_bit;
sbit LCD_D6 at RC2_bit;
sbit LCD_D7 at RC3_bit;
// End LCD module connections
void main()
{
LCD_init();
TRISD=0x07;
PORTD=0;
LCD_CMD(_lcd_cursor_off);
LCD_CMD(_LCD_Clear);
LCD_Out(1,6,"Waiting");
LCD_Out(2,4,"to press SW");
while(1)
{
if(portd.B0==1)
{ while(portd.B0==1);
portd.b4=1;
portd.b3=0;
LCD_CMD(_LCD_Clear);
LCD_Out(1,1,"Motor state: ON");
LCD_Out(2,1,"Direction: CCW");
}
else if(portd.B1)
{ while(portd.B1);
portd.b3=1;
portd.b4=0;
LCD_CMD(_LCD_Clear);
LCD_Out(1,1,"Motor state: ON");
LCD_Out(2,1,"Direction: CW");
}
if(portd.B2)
{ while(portd.B2);
portd.b4=0;
portd.b3=0;
LCD_CMD(_LCD_Clear);
LCD_Out(1,1,"Motor state: OFF");
} } }