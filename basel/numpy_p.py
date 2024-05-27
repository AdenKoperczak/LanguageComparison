import sys
import numpy as np

if len(sys.argv) != 2:
    sys.stderr.write("Needs one argument: iterations.\n")
    exit(1)

count = int(sys.argv[1])
nums = np.arange(1, count + 1)
pi = np.sqrt((1 / (nums * nums)).sum() * 6)

print(f"numpy{np.version.full_version}: {pi}")
