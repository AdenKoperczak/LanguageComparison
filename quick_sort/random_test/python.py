import sys

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
    value = int((current - int(current)) * 256)
    print(f"{value} ", end="")

print()


