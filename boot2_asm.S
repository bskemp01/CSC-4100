.intel_syntax noprefix
.global k_print

k_print:
	push ebp
	mov ebp, esp
	pushfd
	push eax
	push ebx
	push ecx
	push edx

	mov ebx, [ebp + 16]	//Move column into ebx
	mov eax, [ebp + 12]	//Move row into eax
	mov ecx, [ebp + 8]	//Move address of string into ecx

	//Calculate offset using equation
	//offset = 0xB8000 + 2(row*80 + column)

	imul eax, 80		//row*80
	add eax, ebx		//row*80 + column
	imul eax, 2		//2(row*80 + column)
	add eax, 0xB8000	//0xB8000 + 2(row*80 + column)
	mov edx, eax		//Move offset into edx