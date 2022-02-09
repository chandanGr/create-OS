[org 0x7e00]

mov bx, extendedTestString
call printString

jmp $

%include "print.asm"

extendedTestString:
	db "hurray!!!, We are in the extended space", 0

times 2048-($-$$) db 0
