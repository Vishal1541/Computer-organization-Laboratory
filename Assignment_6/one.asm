;		AUTHOR	:	VISHAL ANAND
;		ROLL NO	:	B16040
;		CO ASSIGNMENT - 6
;----------------------------------------

%include "io.mac"

.DATA
	askN db "Enter the number of rows (N): ",0
	askM db "Enter the number of cols (M): ",0
	askMatrix db "Enter matrix:",0
	space db " ",0

.UDATA
	N resw 1
	M resw 1
	i resw 1
	j resw 1
	offset resd 1
	arr1 resd 100
	arr2 resd 100
	arr3 resd 100

.CODE
	.STARTUP

	PutStr askN
	GetInt [N]
	PutStr askM
	GetInt [M]

	mov EAX,arr1
	call read_matrix	;	pointer to the matrix in EAX
	mov EAX,arr2
	call read_matrix


	push arr3
	push arr2
	push arr1
	call matrix_add		;	arr1[index] + arr2[index] = arr3[index]

	mov EAX,arr3
	call display_matrix	;	pointer to the matrix in EAX

	done:
		.EXIT

;********************** Functions ***************************
	read_matrix:
		PutStr askMatrix
		nwln
		mov CX,0
		mov [i],CX	;	i -> N
		mov [j],CX	; 	j -> M
		mov ECX,0
		mov [offset],ECX
		L1:
			L2:
				GetLInt EDX
				mov ECX,[offset]
				mov [EAX+ECX],EDX
				add ECX,4
				mov [offset],ECX
				mov CX,[j]
				inc CX
				mov [j],CX
				cmp CX,[M]
				jne L2
			mov CX,0
			mov [j],CX
			mov BX,[i]
			inc BX
			mov [i],BX
			cmp BX,[N]
			jne L1
		ret

	matrix_add:
		mov DX,0
		mov [i],DX
		mov [j],DX
		mov EDX,0
		mov [offset],EDX
		L3:
			L4:
				mov ECX,0
				mov EDX,[offset]
				mov EAX,[ESP+4]
				mov EBX,[EAX+EDX]
				mov ECX,EBX
				mov EAX,[ESP+8]
				mov EBX,[EAX+EDX]
				add ECX,EBX
				mov EAX,[ESP+12]
				mov [EAX+EDX],ECX
				add EDX,4
				mov [offset],EDX
				mov DX,[j]
				inc DX
				mov [j],DX
				cmp DX,[M]
				jne L4
			mov DX,0
			mov [j],DX
			mov DX,[i]
			inc DX
			mov [i],DX
			cmp DX,[N]
			jne L3
		ret

	display_matrix:
		nwln
		mov CX,0
		mov [i],CX	;	i -> N
		mov [j],CX	; 	j -> M
		mov ECX,0
		mov [offset],ECX
		L5:
			L6:
				mov ECX,[offset]
				mov EDX,[EAX+ECX]

				PutLInt EDX
				PutStr space

				add ECX,4
				mov [offset],ECX
				mov CX,[j]
				inc CX
				mov [j],CX
				cmp CX,[M]
				jne L6
			nwln
			mov CX,0
			mov [j],CX
			mov BX,[i]
			inc BX
			mov [i],BX
			cmp BX,[N]
			jne L5
		ret