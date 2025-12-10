.SUFFIXES:

.SECONDARY:

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

CPROGS = $(basename $(wildcard *.c))
CINIT = $(BUILD_DIR)/c_init.o

-include $(BUILD_DIR)/*.d

all : $(OUT_DIR)/cpu_tb_prog.txt

% : $(OUT_DIR)/%.txt ;

$(OUT_DIR)/%.txt : $(BUILD_DIR)/%.elf
	$(OBJCOPY) -O binary $^ $(BUILD_DIR)/$(*F).bin
	xxd -c 4 -e -g 4 -R never $(BUILD_DIR)/$(*F).bin | sed -nE '{s/^\S+\s+(\S+).*/\1/ ; p}'	>$@

$(BUILD_DIR)/%.elf : $(BUILD_DIR)/%.o
	$(LD) $(LDFLAGS) -o $@ $^ $(if $(findstring $(*F),$(CPROGS)),$(CINIT))

$(BUILD_DIR)/%.o : %.S | $(BUILD_DIR)
	$(AS) $(ASFLAGS) -o $@ $<

$(BUILD_DIR)/%.o : %.c | $(BUILD_DIR) $(CINIT)
	$(CC) $(CCFLAGS) -c -MMD -o $@ $<

$(BUILD_DIR) :
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)
