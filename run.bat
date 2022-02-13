nasm -f bin bootloader.asm -o bootloader.bin
nasm -f elf64 extendedProgram.asm -o extendedProgram.o
/usr/local/x86_64elfgcc/bin/x86_64-elf-gcc -ffreestanding -mno-red-zone -m64 -c "kernel.cpp" -o "kernel.o"  
/usr/local/x86_64elfgcc/bin/x86_64-elf-ld -o kernel.tmp -Ttext 0x7e00 extendedProgram.o kernel.o
objcopy -O binary kernel.tmp kernel.bin
cat bootloader.bin kernel.bin > hardDisk.bin 
qemu-system-x86_64  hardDisk.bin
