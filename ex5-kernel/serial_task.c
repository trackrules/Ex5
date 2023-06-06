#include "wramp.h"

int counter;
int pressed = '1';

void putch(int c)
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
                putch('\r');
                putch(((counter/100000)%10)+0x30);
                putch(((counter/10000)%10)+0x30);
                putch(((counter/1000)%10)+0x30);
                putch(((counter/100)%10)+0x30);
                putch('.');
                putch(((counter/10)%10)+0x30);
                putch(((counter/1)%10)+0x30);
            }
            else if (pressed == '2')
            {
                int minutes = counter/100/60;
                int seconds = counter/100;
                putch('\r');
                putch(((minutes/10)%10)+0x30);
                putch(((minutes)%10)+0x30);
                putch(':');
                putch(((seconds/10)%6)+0x30);
                putch((seconds%10)+0x30);
                putch(0x20);
                putch(0x20);
            }
            else if (pressed == '3')
            {
                putch('\r');
                putch(((counter/100000)%10)+0x30);
                putch(((counter/10000)%10)+0x30);
                putch(((counter/1000)%10)+0x30);
                putch(((counter/100)%10)+0x30);
                putch(((counter/10)%10)+0x30);
                putch(((counter/1)%10)+0x30);
                
            }
            else if (pressed == 'q')
            {
                return;
            }
            
            
        }
        pressed = WrampSp2->Rx;
    }
}
