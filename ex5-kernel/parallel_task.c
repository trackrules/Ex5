#include "wramp.h"

void main()  
{
    int switches = 0;

    while (1)
    {
        switches = WrampParallel->Switches;
        WrampParallel->LowerRightSSD = switches;
    }
    
}
