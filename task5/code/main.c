/*volatile int state=0;
     if(state==0)
   {
     PORTB.b0=1;
     state=1;
     }
     else
     {
     state=0;
     PORTB.b0=0;
     }
     Delay_Ms(100);*/
     
     
     
void main()
{
CCP2IF_bit=0;
TMR1H=0;
TMR1L=0;
T3CON=0;
TRISC.b1=0;
PORTC.b0=0;
CCP2Con=0x02;
T1CON=0x81;
while(1)
{
while(! CCP2IF_bit);
CCP2IF_bit=0;
TMR1H=0;
TMR1L=0;
} }