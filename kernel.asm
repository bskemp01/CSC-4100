GLOBAL k_print

k_print:
	push ebp
	mov ebp, esp

	mov eax, [ebp + 16] ;row
	mov ebx, [ebp + 12]	;string length
	mov ecx, [ebp + 20] ;column

	;Calculate offset using equation
	;offset = 0xB8000 + 2(row*80 + column)

	imul eax, 80 ;multiply row by 80
	add eax, ecx ;adding column to total rows
	imul eax, 2 ;multiply total by 2

	mov edx, 0xB8000
	add edx, eax  ;adding eax total to 0xB8000

	mov edi, edx ;moving address to edi
	mov eax, [ebp + 8] ;placing string in eax
	mov ecx, [eax] 
	mov [esi], ecx

_loop:
	cmp edi, 0xBF9E
	je _done

	cmp BYTE [esi], 0
	je _done
	
	movsb 	
	mov BYTE [edi], 27
	
	inc edi
	dec ebx

	cmp BYTE ebx, 0
	jg _loop

_done:
	pop ebp

	ret