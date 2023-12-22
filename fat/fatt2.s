	.data
	
	
	.text
	.global main
	
main:	
	mov r0, #3
	bl fat	
	
	
fat:	PUSH {r0,lr}	
	cmp r0, #1
	bgt fine 
	mov r0, #1
	add sp, sp, #8
	mov pc, lr
	
	
fine:	sub r0, r0, #1	
	bl fat
	POP {r1,lr}
	mul r0, r1, r0
	mov pc, lr
		

	

	
