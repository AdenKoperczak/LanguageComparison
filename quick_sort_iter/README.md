# Quick Sort Iterative
This test quick sorts a list of numbers. The numbers are generated using a basic
random number generator (which is also implemented in each file). The numbers
all end up being in [0, 256). The custom RNG is used to ensure each language
gets the same list to sort. This uses a self implemented stack to allow it to
run iteratively.

## What it Tests
The RNG is just math in a loop. Then it does an in-place quick sort. It helps to
test some memory copying. The stack is also grown dynamically, so memory allocation
is done.
