CFILE = c.c
LIBS  = -lm
BUILD = build

MYOPTS=-funroll-loops -faggressive-loop-optimizations

all: $(BUILD)/c0 $(BUILD)/c1 $(BUILD)/c2 $(BUILD)/c3 $(BUILD)/cfast $(BUILD)/zig $(BUILD)/zig_buff $(BUILD)/python.py $(BUILD)/julia.jl # $(BUILD)/cmy $(BUILD)/java.class $(BUILD)/asm64 

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
	gcc -o $(BUILD)/asm64 asm/fast_pi.o asm/main.c

$(BUILD)/python.py: python.py
	cp python.py $(BUILD)/python.py

$(BUILD)/julia.jl: julia.jl
	cp julia.jl $(BUILD)/julia.jl

$(BUILD)/zig: zig.zig
	zig build-exe -femit-bin=$(BUILD)/zig -O ReleaseFast zig.zig

$(BUILD)/zig_buff: zig_buff.zig
	zig build-exe -femit-bin=$(BUILD)/zig_buff -O ReleaseFast zig_buff.zig
