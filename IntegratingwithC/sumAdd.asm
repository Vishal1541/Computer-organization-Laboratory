segment .text
	global testl
testl:
	enter 0,0
	mov EAX, [EBP+8]
	add  EAX, [EBP+12]	
	sub  EAX, [EBP+16]
	leave
ret





