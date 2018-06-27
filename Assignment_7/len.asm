segment .text
	global findLength
findLength:
	enter 0,0
	mov EAX,[ESP+8]
	mov EDX,0
	L1:
		inc EDX
		cmp byte[EAX+EDX],0
		jne L1
	leave
	ret