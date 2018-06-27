segment .text
	global showFlags
showFlags:
	enter 0,0
	mov EAX,20
	mov EBX,200000
	;cmp EAX,EBX
	sub EAX,EBX
	pushf
	pop EAX
	leave
ret