STKPTR ?= 0x8000
all: $(TARGET).bin

init.o: init.S
	@echo "Building object file $@ for $<"
	/opt/riscv32im/bin/riscv32-unknown-elf-gcc -c -Qn -DSTKPTR=$(STKPTR) -march=rv32im \
		-o $@ -O3 --std=c99 $< 

%.elf: init.o %.o 
	@echo "Combining object files $< to produce $@"
	/opt/riscv32im/bin/riscv32-unknown-elf-gcc -O3 -ffreestanding -nostdlib -o $@ \
		-Wl,-Bstatic,-T,picorv32.ld \
		$^ -lgcc -march=rv32im 

%.o: %.c 
	@echo "Building object file $@ for $<"
	/opt/riscv32im/bin/riscv32-unknown-elf-gcc -c -Qn -march=rv32im -o $@ -O3 --std=c99 $< 

%.o: %.cpp
	@echo "Building object file $@ for $<"
	/opt/riscv32im/bin/riscv32-unknown-elf-g++ -c -Qn -march=rv32im -o $@ -O3 $< 

%.o: %.S
	@echo "Building object file $@ for $<"
	/opt/riscv32im/bin/riscv32-unknown-elf-gcc -c -Qn -DSTKPTR=$(STKPTR) -march=rv32im \
		-o $@ -O3 --std=c99 $< 

%.bin: %.elf
	@echo "Converting .elf file $< into $@"
	/opt/riscv32im/bin/riscv32-unknown-elf-objcopy -O binary $< $@

# Use .PRECIOUS to keep elf files so that objdump can be run (for debugging)
.PRECIOUS: %.elf %.o

clean:
	rm -rf *.hex *.bin *.elf *.o
