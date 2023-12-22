	.globl cambia
	.type cambia,%function
	
cambia:	push {r0, r1, LR}
		bl strlen
		mov r2, r0
		pop {r0, r1, LR}
		mov r3, #0

for:	cmp r3, r2
		beq end_f
		bgt end_f
		push {r0, r1, r2, r3, LR}		
		ldrb r4, [r0, r3]
		mov r0, r4
		bl cifra 
		mov r5, r0
		pop	{r0, r1, r2, r3, LR}
		strb r5, [r0, r3]
		add r3, r3, #1
		b for		
end_f:	mov r0, r2
		mov PC, LR

cifra:	add r2, r0, r1
		sub r2, r2, #122
		cmp r2, #0
		beq else
		blt else		
		add r0, r2, #96
		mov PC, LR
		
else:	add r0, r0, r1
		mov PC, LR


