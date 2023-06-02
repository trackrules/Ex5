#include "wramp.h"

void base10(int value, int base)
{   
    WrampParallel-> UpperLeftSSD    = (value/base^3)%base;
	WrampParallel-> UpperRightSSD   = (value/base^2)%base;
	WrampParallel-> LowerLeftSSD    = (value/base^1)%base;
	WrampParallel-> LowerRightSSD   = (value/base^0)%base;
}

void base16(int value)
{
     WrampParallel-> UpperLeftSSD    = (value/0x1000)%0x10;
	WrampParallel-> UpperRightSSD   = (value/0x100)%0x10;
	WrampParallel-> LowerLeftSSD    = (value/0x10)%0x10;
	WrampParallel-> LowerRightSSD   = value%0x10;
}

void main()  
{
    int switches = 0;
    int buttons = 0;
    int base = 0;

    while (1)
    {
        switches = WrampParallel->Switches;
        // WrampParallel->LowerRightSSD = switches;

        buttons = WrampParallel->Buttons;
        // WrampParallel->LowerRightSSD = buttons;
        if (buttons == 1)
        {
            base = 10;
            base10(switches,base);
        }
        if (buttons == 2)
        {
            base = 0x10;
            base10(switches,base);
        }
        if (buttons == 4)
        {
            return;
        }
        
    }
    
}
