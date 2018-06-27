;		AUTHOR	:	VISHAL ANAND
;		ROLL NO	:	B16040
;		CO ASSIGNMENT - 5 Q2
;----------------------------------------

%include "io.mac"

.DATA
	ask_N db "Enter the number of students (N): ",0
	ask_M db "Enter the number of subjects (M): ",0
	ask_marks db "Enter marks of Student ",0
	subj db "Subject ",0
	temp db " : ",0
	dot db ".",0

.UDATA
	arr resw 500
	N resw 4
	M resw 4

.CODE
	.STARTUP
	PutStr ask_N
	GetLInt EAX		; N
	mov [N],EAX
	PutStr ask_M
	GetLInt EAX		; M
	mov [M],EAX

	;mov EDX,arr

	mov EAX,0
	mov BX,0
	init:
		mov [arr+4*EAX],BX
		inc EAX
		cmp EAX,[M]
		jne init
	mov EBX,0
	L1:
		PutStr ask_marks
		PutLInt EBX
		PutStr temp
		mov EAX,0
		L2:
			GetLInt ECX
			add [arr+4*EAX],ECX
			inc EAX
			cmp EAX,[M]
			jne L2
		inc EBX
		cmp EBX,[N]
		jne L1

	mov EDX,0
	mov EBX,0
	;	EAX -> DIVIDEND and QUOTITENT
	;	EDX -> REMAINDER
	L3:
		mov EDX,0
		mov EAX,[arr+4*EBX]
		PutStr subj
		PutLInt EBX
		PutStr temp

		mov ECX,[N]
		div ECX
		PutLInt EAX
		PutStr dot
		mov EAX,EDX
		mov ECX,10
		mul ECX
		mov ECX,[N]
		div ECX
		PutLInt EAX

		nwln
		inc EBX
		cmp EBX,[M]
		jne L3

done:
	.EXIT