#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, char ** argv) {
    if (argc != 2) {
        fprintf(stderr, "Needs one argument: iterations.\n");
        return 1;
    }

    long count = atol(argv[1]);
    double pi = 0;

    for (long i = 1; i <= count; i++) {
        pi += 1 / (double)(i * i);
    }

    pi = sqrt(pi * 6);
    printf("C " OPTIMIZATION ": %.14lf\n", pi);

    return 0;
}
