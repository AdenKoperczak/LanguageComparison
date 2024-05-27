#!/usr/bin/env python3

import subprocess
import time
import sys
import os
import pandas as pd
import numpy as np

if len(sys.argv) != 2:
    sys.stderr.write("Needs one argument: path.\n")
    exit(1)


basePath = os.getcwd()

path = sys.argv[1]
os.chdir(path)
sys.path += ["."]

from SETTINGS import commands, groups, csvFile, reg

def time_command(command, name):
    start = time.time()
    subprocess.Popen(command).wait()
    end   = time.time()

    return end - start

subprocess.Popen("make").wait()
os.chdir("build")

times = {"runs": []}

for name in commands.keys():
    times[name] = []

for group in groups:
    for run, runName in group["runs"]:
        print(runName)
        times["runs"].append(runName)
        for name, command in commands.items():
            if name in group["commands"]:
                times[name].append(time_command(command + run, name))
            else:
                times[name].append(None)

times = pd.DataFrame(times, dtype = float)

os.chdir(basePath)
os.chdir("RESULTS")

times.to_csv(csvFile.format(""))

regs = {}
for name in commands.keys():
    when = np.invert(np.isnan(times[name]))
    x = np.compress(when, np.array(times["runs"]))
    y = np.compress(when, np.array(times[name]))

    if (len(x) > 0):
        regs[name] = reg(x, y)
regs = pd.DataFrame(regs)

regs.to_csv(csvFile.format("-regs"))
