

void main()
{
TRISC=0;
PORTC=0;
TMR0IF_bit=0;
TMR0IE_bit=1;
GIE_bit=1;
TMR0H=0xB1;
TMR0L=0xE0;
T0CON=0x80;//PSA 1:2
while(1)
{
portC.b0=~portc.b0;
delay_ms(1000);
} }
void interrupt()
{
if(TMR0IF_bit==1)
{
portC.b1=~portc.b1;
TMR0H=0xB1;
TMR0L=0xE0;
TMR0IF_bit=0;
} }