#include <stdio.h>
#include <stdlib.h>

int main(int argc, char ** argv) {
    if (argc != 2) {
        fprintf(stderr, "Needs one argument: iterations.\n");
        return 1;
    }

    long count = atol(argv[1]);
    FILE * file = fopen("test.txt", "w");

    if (file == NULL) {
        return 1;
    }

    for (long i = 0; i < count; i++) {
        fprintf(file, "%ld\n", i);
    }

    fclose(file);

    printf("C " OPTIMIZATION "\n");
    return 0;
}
