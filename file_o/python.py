import sys

if len(sys.argv) != 2:
    sys.stderr.write("Needs one argument: iterations.\n")
    exit(1)

count = int(sys.argv[1])

with open("test.txt", "w") as file:
    for i in range(count):
        file.write(f"{count}\n")

print(f"{sys.implementation.name}{sys.implementation.version.major}.{sys.implementation.version.minor}")
