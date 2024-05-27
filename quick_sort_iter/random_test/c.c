#include <stdio.h>
#include <stdlib.h>

#define MOD_VALUE 2147483647

int main(int argc, char ** argv) {
    if (argc != 5) {
        fprintf(stderr, "Needs 4 arguments: length, mult, add, init.\n");
        return 1;
    }

    int length     = atol(argv[1]);
    double mult    = atof(argv[2]);
    double add     = atof(argv[3]);
    double current = atof(argv[4]);

    for (int i = 0; i < length; i++) {
        current = current * mult + add;
        while (current > MOD_VALUE) {
            current -= MOD_VALUE;
        }
        printf("%d ", (int)((current - (int)current) * 256));
    }
    printf("\n");

    return 0;

}
