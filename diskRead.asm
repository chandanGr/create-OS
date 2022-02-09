PROGRAM_SPACE equ 0x7e00

readDisk:
	mov ah, 0x02
	mov bx, PROGRAM_SPACE
	mov al, 2
	mov dl, [BOOT_DISK]
	mov ch, 0x00
	mov dh, 0x00
	mov cl, 0x02

	int 0x13
	
	jc diskReadFailed

	ret

BOOT_DISK:
	db 0

diskReadFailed: 
	mov bx, diskReadErrorString
	call printString
	jmp $

diskReadErrorString: 
	db "Error while reading the disk", 0


%include "print.asm"
