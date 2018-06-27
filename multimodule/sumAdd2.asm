segment .text
	global sumexternF 
sumexternF:
	enter 0,0
	mov AX, [EBP+8]
	add  AX, [EBP+10]	
	leave
ret