#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>

int main(int argc, char ** argv) {
    if (argc != 2) {
        fprintf(stderr, "Needs one argument: numberOfPrime.\n");
        return 1;
    }

    long numberOfPrime = atol(argv[1]);

    long numFound = 2;
    uint64_t * primes = calloc(2, sizeof(uint64_t));
    if (primes == NULL) {
        return 1;
    }
    primes[0] = 2;
    primes[1] = 3;

    uint64_t current = 4;
    while (numFound < numberOfPrime) {
        bool prime = true;
        for (int i = 0; i < numFound; i++) {
            if (current % primes[i] == 0) {
                prime = false;
                break;
            }
        }

        if (prime) {
            primes = reallocarray(primes, numFound + 1, sizeof(*primes));
            if (primes == NULL) {
                return 1;
            }

            primes[numFound] = current;
            numFound += 1;
        }

        current += 1;
    }

    printf("C " OPTIMIZATION ": %lu\n", primes[numberOfPrime - 1]);
    free(primes);

    return 0;
}
