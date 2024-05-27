# Programming Language Comparison
This is a few tests to see how a few programming languages and implementations of
languages compare time performance
wise on a few problems. These are not at all exhaustive, but provide a baseline
for a few cases.

## Running a Test
To run a test simply run `RUN.py {test_dir}`. The results will be placed into
the `RESULTS` folder. `RESULTS/{test_name}.csv` contains the raw times taken for
each sub-test. `RESULTS/{test_name}-regs.csv` contains coefficients from a regression
done on the data of each test. The exact regression is determined on a per-test
bases because the big-O of each test may differ.

## Testing Methodology
The goal of this is to test how well different languages compare when running
similar code. Therefor, the code for each language is kept as similar to the
others as possible. Sometimes a language does not have a feature built in, so
it must be implemented, but otherwise, the code should be as similar as possible.
This likely precludes purely functional languages from testing. The time is
measured using Pythons `time.time` function. This is not the most accurate way
to do it, but it works. Timing includes the full time it takes for the command
to run.

## Basic Setup
Each folder contains a test. Each test contains two meta-files (`Makefile` and
`SETTINGS.py`), a `build` directory, and code files. Each test is defined by
a set of arguments passed by `RUN.py` into the given program.

## `Makefile`
The make file should build each language, putting the results in the `build`
directory. For languages with an interpreter, the files should simply be copied
to the `build` directory.

## `SETTTINGS.PY`
This file tells `RUN.py` what tests to run, how to run each program, the name of
the output file, and the regression method.

### `commands` dict
This dict defines the commands for running each program. The key is the name
given to the program, and the value is a list of arguments (similar to `Popens`
first argument). The first item will be the file to execute. This will be
executed from the build directory, so a `./` will be needed for raw executables.

### `groups` list
This list consists of dicts which describe several tests. This is done to allow
for faster programs to be run with more intensive tests, without slower programs
taking forever to complete. Each dict has a `commands` key, which is a list of
the names (keys of the `commands` dict) of the commands to run. It also includes
a `runs` element. Each element of the runs list is a test to be run, in the form
of a list or tuple of 2 items. The first item is a list of arguments to be appended
to the command arguments. The second is the name of the run. These are often generated
in the python code.

### `csvFile` str
The `csvFile` str is used to determine how to name the output files. It includes
a "{}" to indicate where to insert the "-regs".

### `reg` function
This is the function that will do the regression on the data. It should take two
`np.array`'s one derived from the run name in the groups, and one that is the times
for those runs.


## Requirements
This is a basic list of what is needed to run these tests. It may not be complete.

- `python3.8` or newer
    - `numpy`
    - `pandas`
    - `scipy` (only for some regressions)
- `gcc` (make it somewhat modern)
- `zig 0.11.0` or newer (may work with older)
- `java` (IDK what version)
- `julia`
- `pypy3.8` or newer
- `nasm`
