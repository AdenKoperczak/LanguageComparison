import math
import sys

if len(sys.argv) != 2:
    sys.stderr.write("Needs one argument: iterations.\n")
    exit(1)

count = int(sys.argv[1])
pi = 0

for i in range(1, count + 1):
    i = float(i)
    pi += 1 / (i * i)

pi = math.sqrt(pi * 6)
print(f"{sys.implementation.name}{sys.implementation.version.major}.{sys.implementation.version.minor}: {pi}")
