#include <stdlib.h>
#include <stdio.h>
#include <math.h>

unsigned int powerLoop(unsigned int n) {
    
    unsigned int i;
    unsigned int sum = 0;

    for(i=0; i<n; i++) {
        sum+= pow( n, n);
    }

    printf("%d: %d\n",n,sum);
    
    return sum;
}

int main() {
    powerLoop(1);
    powerLoop(2);
    powerLoop(3);
    powerLoop(9);
    powerLoop(10);
    return 0;
}
