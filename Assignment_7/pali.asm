segment .text
	global checkPalin
checkPalin:
	enter 0,0
	mov EAX,[ESP+8]
	mov EBX,-1
	mov EDX,[ESP+12]
	mov ECX,0
	L1:
		inc EBX
		dec EDX
		cmp EBX,[ESP+12]
		je ans
		mov CL,byte[EAX+EBX]
		cmp CL,byte[EAX+EDX]
		je L1
		leave
		ret
	ans:
		mov ECX,1
		leave
		ret