#include "wramp.h"

void base10(int value)
{
    WrampParallel-> UpperLeftSSD    = (value/1000)%10;
	WrampParallel-> UpperRightSSD   = (value/100)%10;
	WrampParallel-> LowerLeftSSD    = (value/10)%10;
	WrampParallel-> LowerRightSSD   = value%10;
}

void main()  
{
    int switches = 0;
    int buttons = 0;
    while (1)
    {
        switches = WrampParallel->Switches;
        // WrampParallel->LowerRightSSD = switches;

        buttons = WrampParallel->Buttons;
        // WrampParallel->LowerRightSSD = buttons;
        if (buttons == 1)
        {
            base10(switches);
        }
        
    }
    
}
