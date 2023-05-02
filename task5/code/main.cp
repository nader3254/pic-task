#line 1 "C:/Users/Maher/Downloads/pic-tasks/task5/code/main.c"
#line 16 "C:/Users/Maher/Downloads/pic-tasks/task5/code/main.c"
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
