#include "wramp.h"

int counter = 26;
char r = '\r';

void poll(){
    while (WrampSp2->Stat!=2){}
}
void main(){

    while (1)
    {
        poll();
        WrampSp2 -> Tx = counter;

        counter = counter +1;
    }
}
