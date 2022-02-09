[org 0x7c00]

mov [BOOT_DISK], dl

mov bp, 0x7c00
mov sp, bp

call readDisk

jmp PROGRAM_SPACE

%include "diskRead.asm"

times 510-($-$$) db 0
db 0x55
db 0xaa
