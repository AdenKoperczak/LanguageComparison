#!/usr/bin/env python3

import subprocess
import time
import sys
import os

commands = [
    (["./c0"],                   "C0"    ),
    (["./c1"],                   "C1"    ),
    (["./c2"],                   "C2"    ),
    (["./c3"],                   "C3"    ),
    (["./cfast"],                "Cfast" ),
    (["java", "java"],           "Java"  ),
#     (["./asm64"],                "Asm"   ),
    (["pypy.exe",  "python.py"], "PyPy"  ),
    (["python3",   "python.py"], "Python"),
    (["py.exe",    "python.py"], "Py"    ),
#     (["julia.exe", "julia.jl" ], "Julia" ),
]

if len(sys.argv) != 2:
    sys.stderr.write("Needs one argument: numberOfPrime.\n")
    exit(1)

count = int(sys.argv[1])

def time_command(command, name):
    print(f"Starting {name}")

    start = time.time()
    subprocess.Popen(command).wait()
    end   = time.time()

    print(f"Finishing {name}")

    return end - start

subprocess.Popen("make").wait()
os.chdir("build")

times = []

for command, name in commands:
    times.append((name, time_command(command + [str(count)], name)))

print("\n\n")

for name, time in times:
    print(f"{name}: {time}")
