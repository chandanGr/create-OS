nasm -f elf64 enterProtectedMode.asm -o enterProtectedMode.o 
x86_64-elf-gcc -ffreestanding -mno-red-zone -m64 -c "kernel.cpp" -o "kernel.o"  
x86_64-elf-ld --oformat binary kernel.bin -Ttext 0x7c00 enterProtectedMode.o kernel.o 
qemu-system-x86_64 kernel.bin  
