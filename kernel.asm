GLOBAL k_print

k_print:
	push ebp
	mov ebp, esp
	pushfd
	push eax
	push ebx
	push esi
	push edi

	mov ebx, [ebp + 16]	;Move column into ebx
	mov eax, [ebp + 12]	;Move row into eax
	mov esi, [ebp + 8]	;Move address of string into esi

	;Calculate offset using equation
	;offset = 0xB8000 + 2(row*80 + column)

	imul eax, 80		;row*80
	add eax, ebx		;row*80 + column
	imul eax, 2			;2(row*80 + column)
	add eax, 0xB8000	;0xB8000 + 2(row*80 + column)
	mov edi, eax		;Move offset into edi

loop:
	cmpb [esi], 0
	je done
	movsb 	
	movb es:[edi], 10
	inc edi
	jmp loop

done:
	pop edi
	pop esi
	pop ebx
	pop eax
	popfd
	pop ebp
	ret