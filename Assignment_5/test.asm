;		AUTHOR	:	VISHAL ANAND
;		ROLL NO	:	B16040
;		CO ASSIGNMENT - 5 Q1
;----------------------------------------

%include "io.mac"

.DATA
	msg_ask	db "Enter the string: ",0
	msg_ans	db "Final string is: ",0
	msg_y_n db "Enter another string? (Y/y to continue)",0
	convert db "4695031872"

.UDATA
	inp_str resb 100
	inp_y_n resb 1

.CODE
	.STARTUP
	mov CX,5
		L1	PutStr inp_str
			nwln
			GetInt AX
			add AX,25645233
			dec CX
			jnz L1
	
done:
	.EXIT