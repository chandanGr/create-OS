;[org 0x7e00]

jmp enterProtectedMode

%include "gdt.asm"
enterProtectedMode:
	call enableA20
	cli
	lgdt [GDT_descriptor]
	mov eax, cr0
	or eax, 1
	mov cr0, eax
	jmp CODE_SEG:start_protected_mode

enableA20:
	in al, 0x92
	or al, 2
	out 0x92, al
	ret


[bits 32]

%include "detectCPUId.asm"
%include "simplePaging.asm"

start_protected_mode:
	mov ax, DATA_SEG
	mov ds, ax
	mov fs, ax
	mov ss, ax
	mov es, ax
	mov gs, ax
	call detectCPUId
;	call detectLongMode
	call setUpSimplePaging
	call editGdtToLongMode
	jmp CODE_SEG:start64Bit

[bits 64]
[extern _start]
start64Bit:
	mov edi, 0xb8000
	mov rax, 0x1f201f201f201f20
	mov ecx, 500
	rep stosq
	call _start
	jmp $
jmp$
times 2048-($-$$) db 0
