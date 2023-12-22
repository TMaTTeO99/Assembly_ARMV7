	.global pop
	.type pop,%function

pop:	push {r4, r5, LR}	
	mov r1, r0
	ldr r2, [r0]
	cmp r2, #0
	beq fine
	ldr r3, [r2, #4]
	ldr r4, [r2]
	str r3, [r0]
	mov r0, r2
	bl free
	mov r0, r4
	pop {r4, r5, LR}
	mov PC, LR
	
fine:	pop {r4, r5, LR}
	
	mov r0, #0
	mov PC, LR	
