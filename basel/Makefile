CFILE = c.c
LIBS  = -lm
BUILD = build

MYOPTS=-funroll-loops -fpeel-loops -faggressive-loop-optimizations -ftree-vectorize -fvect-cost-model=unlimited -fsimd-cost-model=unlimited

all: $(BUILD)/c0 $(BUILD)/c1 $(BUILD)/c2 $(BUILD)/c3 $(BUILD)/cfast $(BUILD)/cmy $(BUILD)/java.class $(BUILD)/asm64 $(BUILD)/python.py $(BUILD)/numpy_p.py $(BUILD)/julia.jl $(BUILD)/zig

$(BUILD)/c0: $(CFILE)
	gcc -DOPTIMIZATION=\"0\" -o $(BUILD)/c0 $(CFILE) $(LIBS)

$(BUILD)/c1: $(CFILE)
	gcc -DOPTIMIZATION=\"1\" -O1 -o $(BUILD)/c1 $(CFILE) $(LIBS)

$(BUILD)/c2: $(CFILE)
	gcc -DOPTIMIZATION=\"2\" -O2 -o $(BUILD)/c2 $(CFILE) $(LIBS)

$(BUILD)/c3: $(CFILE)
	gcc -DOPTIMIZATION=\"3\" -O3 -o $(BUILD)/c3 $(CFILE) $(LIBS)

$(BUILD)/cfast: $(CFILE)
	gcc -DOPTIMIZATION=\"fast\" -Ofast -o $(BUILD)/cfast $(CFILE) $(LIBS)

$(BUILD)/cmy: $(CFILE)
	gcc -DOPTIMIZATION=\"my\" -O3 $(MYOPTS) -o $(BUILD)/cmy $(CFILE) $(LIBS)

$(BUILD)/java.class: java.java
	javac -d $(BUILD)/ java.java

asm/fast_pi.o: asm/fast_pi.asm
	nasm -f elf64 -o asm/fast_pi.o asm/fast_pi.asm

$(BUILD)/asm64: asm/fast_pi.o asm/main.c
	gcc -Ofast -o $(BUILD)/asm64 asm/fast_pi.o asm/main.c

$(BUILD)/python.py: python.py
	cp python.py $(BUILD)/python.py

$(BUILD)/numpy_p.py: numpy_p.py
	cp numpy_p.py $(BUILD)/numpy_p.py

$(BUILD)/julia.jl: julia.jl
	cp julia.jl $(BUILD)/julia.jl

$(BUILD)/zig: zig.zig
	zig build-exe -femit-bin=$(BUILD)/zig -O ReleaseFast zig.zig
