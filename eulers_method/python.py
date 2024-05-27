import math
import sys

if len(sys.argv) != 2:
    sys.stderr.write("Needs one argument: delta_x.\n")
    exit(1)

x_start, x_end, y_start = 0, 2, 0

delta_x = float(sys.argv[1])
if delta_x <= 0:
    sys.stderr.write("Argument delta_x should be greater than 0.\n")
    exit(1)

def deriv(x, y):
    return x ** 2 + 3 * y ** 2 - 5

def improved_eulers_method(deriv, delta_x, x_start, x_end, y_start):
    y = y_start
    x = x_start

    while x < x_end:
        k1 = deriv(x, y)
        u  = y + delta_x * k1
        k2 = deriv(x + delta_x, u)
        y = y + delta_x * (k1 + k2) / 2
        x = x + delta_x

    return y


approx = improved_eulers_method(deriv, delta_x, x_start, x_end, y_start)

print(f"{sys.implementation.name}{sys.implementation.version.major}.{sys.implementation.version.minor}: {approx}")
