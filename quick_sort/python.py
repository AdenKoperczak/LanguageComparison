import sys

# your holy jankness
sys.setrecursionlimit(5000)

MOD_VALUE = 2147483647

if len(sys.argv) != 5:
    sys.stderr.write("Needs 4 arguments: length, mult, add, init.\n")
    exit(1)


length = int(sys.argv[1])
toSort = [0] * length

mult    = float(sys.argv[2])
add     = float(sys.argv[3])
current = float(sys.argv[4])

for i in range(length):
    current = current * mult + add
    while current > MOD_VALUE:
        current -=  MOD_VALUE
    toSort[i] = int((current - int(current)) * 256)

def swap(A, i, j):
    temp = A[i]
    A[i] = A[j]
    A[j] = temp

def partition(A, lo, hi):
    pivot = A[hi]

    i = lo - 1

    for j in range(lo, hi):
        if A[j] <= pivot:
            i += 1
            swap(A, i, j)

    i += 1
    swap(A, i, hi)
    return i

def quick_sort(A, lo, hi):
    if lo >= hi or lo < 0:
        return

    p = partition(A, lo, hi)

    quick_sort(A, lo, p - 1)
    quick_sort(A, p + 1, hi)

quick_sort(toSort, 0, length - 1)

print(f"{sys.implementation.name}{sys.implementation.version.major}.{sys.implementation.version.minor}", end = "")

if length < 11:
    print(":", end = "")
    for item in toSort:
        print(f" {item}", end = "")
print()
