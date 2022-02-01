GLOBAL k_print

k_print:
	push ebp
	mov ebp, esp
	
	push eax
	push ebx
	push esi
	push edi

	mov ebx, [ebp + 20]	
	mov eax, [ebp + 16]
	mov esi, [ebp + 8]	

	;Calculate offset using equation
	;offset = 0xB8000 + 2(row*80 + column)

	imul eax, 80		
	add eax, ebx		
	imul eax, 2			
	add eax, 0xB8000	
	mov edi, eax		
    mov esi, [ebp + 8]
    
    loop:
        cmp esi, 0
        je done
        movsb 	
        inc edi
        jmp loop

    done:
        pop edi
        pop esi
        pop ebx
        pop eax
        pop ebp
        ret