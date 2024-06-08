.intel_syntax noprefix

.data
	hashcounter:
		.asciz "hash: %d\n"
	smallcounter:
		.asciz "small: %d\n"
	result:
		.asciz "result: %d\n"
		
	hash: .4byte 0
	small: .4byte 0
		
	
.text
.global _start
_start:				#ebx hash ecx small

read:
	call getchar
	cmp eax, -1
	je fin
	jmp check_char
	
check_char:
    cmp eax, '.'
	je fin
	cmp eax, '#'
	je hasheeee
	cmp eax, 'a'
	jb read
	cmp eax, 'z'
	ja read
	add dword ptr small, 1
	jmp read

hasheeee:
	add dword ptr hash, 1
	jmp read
	
fin:
	xor edx, edx
	mov ebx, hash
	mov eax, small
	push ebx
	push offset hashcounter
	call printf
	add esp, 8
	
	push dword ptr small
	push offset smallcounter
	call printf
	add esp, 8
	
	cmp ebx, 0
	je finfin
	cmp dword ptr small, 0
	je finfin
	jmp division
	
division:
	cmp dword ptr small, 0
	jle div_suc
	sub dword ptr small, ebx
	add ecx, 1
	jmp division
	
div_suc:
	push ecx
	push offset result
	call printf
	add esp, 8
	jmp finfin
	
finfin:
	
	call exit
	
	
	
	
	
	
