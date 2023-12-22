	.data

big:	.word 1, 18, 5, 9, 10, 45, 2, 21
small:	.word 3, 18, 5, 9, 10, 2, 2, 31
	
	@k == 5		
	@m == 7
	@n == 12
	
	.text
	.global main	

main:	push {r4, r5, r6, r7, r9}	
		
		mov r0, #0	@la mia i		
		mov r1, #0	@il mio found
		mov r2, #0	@la mia j
		
		ldr r3, =big	@prendo ind di big
		ldr r4, =small	@prendo ind di small
		
while:	cmp r1, #0
		bne	end_w
		cmp r0, #12
		bge	end_w 	  	
		mov r5, #0	@la mia x
for:	cmp r2, #7
		bge end_f	
		add r6, r0, r2
		ldr r7, [r3, r6, lsl #2]
		ldr r9, [r4, r2, lsl #2]
		cmp r7, r9
		addeq r5, r5, #1
		add r2, r2, #1
		b for
end_f:	mov r2, #0
		cmp r5, #5
		movge r1, #1
		addlt r0, r0, #1
		b while
end_w:
		pop {r4, r5, r6, r7, r9}
		mov PC, LR
