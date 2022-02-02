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
	mov esi, [ebp + 8] ;placing string in eax
	

_loop:
	cmp edi, 0xB8000 + 4000
	je _done

	cmp BYTE [esi], 0
	je _done
	
	cld
	movsb 	
	mov BYTE [edi], 58
	
	inc edi
	dec ebx

	jg _loop

_done:
	pop ebp

	ret