detectCPUId:
    	pushfd
    	pop eax
    	mov ecx, eax
    	xor eax, 1 << 21
    	push eax
    	popfd
    	pushfd
    	pop eax
    	push ecx
	popfd
   	xor eax, ecx
	jz .noCPUId
	ret

	.noCPUId:
		hlt

detectLongMode:
    	mov eax, 0x80000001    ; Set the A-register to 0x80000001.
    	cpuid                  ; CPU identification.
    	test edx, 1 << 29      ; Test if the LM-bit, which is bit 29, is set in the D-register.
    	jz .noLongMode         ; They aren't, there is no long mode.

	.noLongMode:
		hlt
