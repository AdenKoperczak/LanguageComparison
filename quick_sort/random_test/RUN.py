#!/usr/bin/env python3

import subprocess
import time
import sys
import os
import random

commands = [
    (["./c"],                    "C0"    ),
    (["python3",   "python.py"], "Python"),
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

def run_command(command, name):
    print(f"Starting {name}")
    value = subprocess.Popen(command, stdout = subprocess.PIPE).communicate()
    print(f"Finishing {name}")

    return value

subprocess.Popen("make").wait()

values = {}

for command, name in commands:
    value = run_command(command + args, name)
    if value in values:
        values[value].append(name)
    else:
        values[value] = [name]

for value, names in values.items():
    print(", ".join(names))



