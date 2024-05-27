#include <stdio.h>
#include <stdlib.h>

#define MOD_VALUE 2147483647

void swap(int * A, int i, int j) {
    int temp = A[i];
    A[i] = A[j];
    A[j] = temp;
}

int partition(int * A, int lo, int hi) {
    int pivot = A[hi];
    int i = lo - 1;

    for (int j = lo; j < hi; j++) {
        if (A[j] <= pivot) {
            i++;
            swap(A, i, j);
        }
    }

    i++;
    swap(A, i, hi);
    return i;
}

void quick_sort(int * A, int lo, int hi) {
    if (lo >= hi || lo < 0) {
        return;
    }

    int p = partition(A, lo, hi);

    quick_sort(A, lo, p - 1);
    quick_sort(A, p + 1, hi);
}

int main(int argc, char ** argv) {
    if (argc != 5) {
        fprintf(stderr, "Needs 4 arguments: length, mult, add, init.\n");
        return 1;
    }

    int length   = atol(argv[1]);
    int * toSort = calloc(sizeof(int), length);
    if (toSort == NULL) {
        return 1;
    }

    double mult    = atof(argv[2]);
    double add     = atof(argv[3]);
    double current = atof(argv[4]);

    for (int i = 0; i < length; i++) {
        current = current * mult + add;
        while (current > MOD_VALUE) {
            current -= MOD_VALUE;
        }
        toSort[i] = (int)((current - (int)current) * 256);
    }

    quick_sort(toSort, 0, length - 1);
    printf("C " OPTIMIZATION);

    if (length < 11) {
        printf(":");
        for (int i = 0; i < length; i++) {
            printf(" %d", toSort[i]);
        }
    }
    printf("\n");
    return 0;
}
