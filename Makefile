# ==========================================
# JANIX OS Makefile (100% NASM Assembly)
# ==========================================

NASM = nasm
LD   = ld
QEMU = qemu-system-i386

BOOT_SRC   = boot/boot.asm
KERNEL_SRC = kernel/kernel.asm \
             kernel/gdt.asm \
             kernel/idt.asm \
             kernel/isr.asm \
             kernel/irq.asm \
             kernel/vga.asm

BOOT_BIN   = boot.bin
KERNEL_BIN = kernel.bin
IMAGE      = janix.img
OBJS       = $(KERNEL_SRC:.asm=.o)

# ===========================
# Default target
# ===========================
all: $(IMAGE)

# Bootloader
$(BOOT_BIN): $(BOOT_SRC)
	$(NASM) -f bin $< -o $@

# Kernel objects
%.o: %.asm
	$(NASM) -f elf32 $< -o $@

# Link kernel
$(KERNEL_BIN): $(OBJS)
	$(LD) -Ttext 0x1000 -m elf_i386 --oformat binary $^ -o $@

# Create OS image
$(IMAGE): $(BOOT_BIN) $(KERNEL_BIN)
	cat $(BOOT_BIN) $(KERNEL_BIN) > $(IMAGE)

# Run in QEMU
run: $(IMAGE)
	$(QEMU) -fda $(IMAGE)

# Clean build files
clean:
	rm -f $(BOOT_BIN) $(KERNEL_BIN) $(IMAGE) $(OBJS)

.PHONY: all clean run
