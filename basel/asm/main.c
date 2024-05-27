#include <stdio.h>
#include <stdlib.h>
#include "fast_pi.h"

int main(int argc, char ** argv) {
    if (argc != 2) {
        fprintf(stderr, "Needs one argument: iterations.\n");
        return 1;
    }

    long count = atol(argv[1]);
    
    double pi = asm_pi(count); 

    printf("Asm: %.14lf\n", pi);

    return 0;
}
