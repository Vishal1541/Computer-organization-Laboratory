;		AUTHOR	:	VISHAL ANAND
;		ROLL NO	:	B16040
;		CO ASSIGNMENT - 7 Q1
;----------------------------------------

%include "io.mac"

.DATA
	msg_askstr	db	"Enter the string: ",0
	ispalin	db	"String is palindrome. ",0
	notpalin	db	"String is not palindrome. ",0

.UDATA
	str1 resb 100

.CODE
	.STARTUP	
	extern findLength
	extern checkPalin
	PutStr msg_askstr
	GetStr str1

	mov EAX,str1
	push EAX
	call findLength		;length in EDX

	push EDX
	push EAX

	call checkPalin		;ECX = 1 palin, ECX = 0 not palin
	cmp ECX,1
	je printyes
	PutStr notpalin
	jmp done

	printyes:
		PutStr ispalin
	
done:
	.EXIT