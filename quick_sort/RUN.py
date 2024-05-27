#!/usr/bin/env python3

import subprocess
import time
import sys
import os
import random

commands = [
    (["./c0"],                   "C0"    ),
    (["./c1"],                   "C1"    ),
    (["./c2"],                   "C2"    ),
    (["./c3"],                   "C3"    ),
    (["./cfast"],                "Cfast" ),
#     (["java", "java"],           "Java"  ),
#     (["./asm64"],                "Asm"   ),
    (["pypy.exe",  "python.py"], "PyPy"  ),
    (["python3",   "python.py"], "Python"),
    (["py.exe",    "python.py"], "Py"    ),
#     (["julia.exe", "julia.jl" ], "Julia" ),
]

length  = 10
mult    = random.random() * 10
add     = random.random() * 10
init    = random.random() * 100

if len(sys.argv) > 1:
    length = int(sys.argv[1])

if len(sys.argv) == 5:
    mult = float(sys.argv[2])
    add  = float(sys.argv[3])
    init = float(sys.argv[4])
    print(f"length: {length}, mult: {mult}, add: {add}, init: {init}")
else:
    print(f"length: {length} | random mult: {mult}, add: {add}, init: {init}")

args = [str(length), str(mult), str(add), str(init)]

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
    times.append((name, time_command(command + args, name)))

print("\n\n")

for name, time in times:
    print(f"{name}: {time}")
