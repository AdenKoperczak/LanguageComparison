import sys

if len(sys.argv) != 2:
    sys.stderr.write("Needs one argument: numberOfPrime.\n")
    exit(1)

numberOfPrime = int(sys.argv[1])

primes = [2, 3]

current = 4
while len(primes) < numberOfPrime:
    prime = True
    for i in primes:
        if current % i == 0:
            prime = False
            break

    if prime:
        primes.append(current)

    current += 1

print(f"{sys.implementation.name}{sys.implementation.version.major}.{sys.implementation.version.minor}: {primes[numberOfPrime - 1]}")
