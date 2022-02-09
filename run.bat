nasm -f bin bootloader.asm -o bootloader.bin
nasm -f elf64 extendedProgram.asm -o extendedProgram.o
gcc -ffreestanding -mno-red-zone -m64 -c "kernel.cpp" -o "kernel.o"  
ld --oformat binary kernel.bin -Ttext 0x7e00 extendedProgram.o kernel.o
cat bootloader.bin kernel.bin > hardDisk.bin 
qemu-system-x86_64  hardDisk.bin
