# Quick Sort
This test quick sorts a list of numbers. The numbers are generated using a basic
random number generator (which is also implemented in each file). The numbers
all end up being in [0, 256). The custom RNG is used to ensure each language
gets the same list to sort. This uses recursion for quick sort.

## What it Tests
The RNG is just math in a loop. Then it does an in-place quick sort. It helps to
test some memory copying.
