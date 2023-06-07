#include "wramp.h"

//y=0 return 1
//y=1 return x
//y=2 return x^2
int xpowy(int x, int y)
{
    int i;
    int newx = 1;
    for (i = 1; i <= y; i++)
    {
        newx = x*newx;
    }
    
    return newx;
}

void sendSSD(int value, int base)
{
    WrampParallel-> UpperLeftSSD    = (value/xpowy(base,3))%base;
	WrampParallel-> UpperRightSSD   = (value/xpowy(base,2))%base;
	WrampParallel-> LowerLeftSSD    = (value/xpowy(base,1))%base;
	WrampParallel-> LowerRightSSD   = (value/xpowy(base,0))%base;
}

void main()  
{
    int switches = 0;
    int buttons = 0;
    int base = 10;

    while (1)
    {
        switches = WrampParallel->Switches;
        // WrampParallel->LowerRightSSD = switches;

        buttons = WrampParallel->Buttons;
        // WrampParallel->LowerRightSSD = buttons;
        if (buttons == 1)
        {
            base = 10;
        }
        if (buttons == 2)
        {
            base = 0x10;
        }
        if (buttons == 4)
        {
            return;
        }
        sendSSD(switches,base);
    }
    
}
