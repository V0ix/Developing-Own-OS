
# Top-level Makefile

BUILD_DIR = build
BOOTLOADER = bootloader/boot.asm
KERNEL_SRC = kernel/kernel.c
KERNEL_LD = kernel/kernel.ld

all: $(BUILD_DIR)/os.iso

# Assemble the bootloader
$(BUILD_DIR)/boot.o: $(BOOTLOADER)
	nasm -f bin $(BOOTLOADER) -o $(BUILD_DIR)/boot.o

# Compile the kernel
$(BUILD_DIR)/kernel.o: $(KERNEL_SRC)
	i386-elf-gcc -ffreestanding -c $(KERNEL_SRC) -o $(BUILD_DIR)/kernel.o

# Link the kernel
$(BUILD_DIR)/kernel.bin: $(BUILD_DIR)/kernel.o
	i386-elf-ld -T $(KERNEL_LD) -o $(BUILD_DIR)/kernel.bin $(BUILD_DIR)/kernel.o

# Combine bootloader + kernel into a floppy image
$(BUILD_DIR)/os-image.bin: $(BUILD_DIR)/boot.o $(BUILD_DIR)/kernel.bin
	cat $(BUILD_DIR)/boot.o $(BUILD_DIR)/kernel.bin > $(BUILD_DIR)/os-image.bin

# Convert binary to ISO (bootable)
$(BUILD_DIR)/os.iso: $(BUILD_DIR)/os-image.bin
	mkdir -p isodir/boot
	cp $(BUILD_DIR)/os-image.bin isodir/boot/os-image.bin
	grub-mkrescue -o $(BUILD_DIR)/os.iso isodir

# Clean build files
clean:
	rm -rf $(BUILD_DIR)/*
	rm -rf isodir
