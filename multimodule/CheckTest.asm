;
;       Objective: find the sum of two numbers using function written in another files 
;       Input: Requests two  integers  from the user.
;       Output: Outputs the input number.
%include "io.mac"

.DATA
prompt_msg1  db   "Please input the first number : ",0
prompt_msg2  db   "Please input the second  number : ",0
output_msg  db   "The sum is :",0

.CODE
      .STARTUP
   extern sumexternF
      PutStr  prompt_msg1   ; request first number 
      GetInt CX             ; CX= first number  
      
      PutStr  prompt_msg2   ; request second number 
      GetInt DX             ; DX= second number  
 
   
      push CX
      push DX 

    call sumexternF
      PutStr  output_msg  
      PutInt AX  
  nwln 
done:
      .EXIT







