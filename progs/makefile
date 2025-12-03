BUILD_DIR = ../build/progs
OUT_DIR = ../build

PLATAFORMA = riscv64-unknown-elf-
AS = $(PLATAFORMA)as
LD = $(PLATAFORMA)gcc
CC = $(PLATAFORMA)gcc
OBJCOPY = $(PLATAFORMA)objcopy

ARCH = -march=rv32i -mabi=ilp32
CCFLAGS = $(ARCH) -Wall -Wextra -Werror
ASFLAGS = $(ARCH)
LDFLAGS = $(ARCH) -T link_script.ld -nostartfiles -nodefaultlibs

all : $(OUT_DIR)/cpu_tb_prog.txt

$(OUT_DIR)/cpu_tb_prog.txt : $(BUILD_DIR)/cpu_tb_prog.elf
	$(OBJCOPY) -O binary $(BUILD_DIR)/cpu_tb_prog.elf $(BUILD_DIR)/cpu_tb_prog.bin
	xxd -c 4 -g 4 -R never $(BUILD_DIR)/cpu_tb_prog.bin | sed -nE '{s/^\S+\s+(\S+).*/\1/ ; p}'	>$(OUT_DIR)/cpu_tb_prog.txt

$(BUILD_DIR)/cpu_tb_prog.elf : $(BUILD_DIR)/cpu_tb_prog.o
	$(LD) $(LDFLAGS) -o $(BUILD_DIR)/cpu_tb_prog.elf $(BUILD_DIR)/cpu_tb_prog.o

$(BUILD_DIR)/cpu_tb_prog.o : cpu_tb_prog.S | $(BUILD_DIR)
	$(AS) $(ASFLAGS) -o $(BUILD_DIR)/cpu_tb_prog.o cpu_tb_prog.S

$(BUILD_DIR) :
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)
# xxd -c 4 -g 4 -R never cpu_tb_prog.bin  | sed -nE '{s/^\S+\s+(\S+).*/\1/ ; p}'
