#include "wramp.h"

int counter;
int pressed = '1';

void putc(int c)
{
	while(!(WrampSp2->Stat & 2));
	WrampSp2->Tx = c;
}

void main(){
    while (1)
    {
        while (!(WrampSp2->Stat & 1))
        {
            if (pressed == '1')
            {
                putc('\r');
                putc(((counter/1000000)%10)+0x30);
                putc(((counter/100000)%10)+0x30);
                putc(((counter/10000)%10)+0x30);
                putc(((counter/1000)%10)+0x30);
                putc('.');
                putc(((counter/100)%10)+0x30);
                putc(((counter/10)%10)+0x30);
            }
            else if (pressed == '2')
            {
                int minutes = counter/100/60;
                int seconds = counter/100;
                putc('\r');
                putc(((minutes/10)%10)+0x30);
                putc(((minutes)%10)+0x30);
                putc(':');
                putc(((seconds/10)%6)+0x30);
                putc((seconds%10)+0x30);
                putc(0x20);
                putc(0x20);
            }
            else if (pressed == '3')
            {
                putc('\r');
                putc(((counter/100000)%10)+0x30);
                putc(((counter/10000)%10)+0x30);
                putc(((counter/1000)%10)+0x30);
                putc(((counter/100)%10)+0x30);
                putc(((counter/10)%10)+0x30);
                putc(((counter/1)%10)+0x30);
                
            }
            else if (pressed == 'q')
            {
                return;
            }
            
            
        }
        pressed = WrampSp2->Rx;
    }
}
