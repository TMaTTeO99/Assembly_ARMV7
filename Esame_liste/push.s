	.global push
	.type push,%function

push:	push {r4, r5, LR}
	mov r4, r0
	mov r5, r1
	mov r0, #8
	bl malloc
	mov r6, r0
	str r4, [r6]
	ldr r3, [r5]
	str r3, [r6, #4]
	str r6, [r5]
	pop {r4, r5, LR}
	mov PC, LR


