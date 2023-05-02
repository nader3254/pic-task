
volatile int state=0;

void main()
{
TMR3IF_bit=0;
TMR3IE_bit=1;
PEIE_bit=1;
GIE_bit=1;
TMR3H=0xFF;
TMR3L=0x6A;
T1OSCEN_bit=1;
T3CON=0x87;
TRISB.b0=0;
PORTB.b0=0;
while(1)
{
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
     Delay_Ms(100);
 }
}
void interrupt()
{
if(TMR3IF_bit==1)
{
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
TMR3H=0xFF;
TMR3L=0x6A;
TMR3IF_bit=0;
} }