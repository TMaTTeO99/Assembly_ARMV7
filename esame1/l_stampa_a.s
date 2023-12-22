	.global l_stampa_a
	.type l_stampa_a,% function
	.data 
fr:	.string "Lista generata:\n"
fr2: .string "%d -> "
fr3: .string "Fine lista\n"

l_stampa_a:	push {r0, LR}
			ldr r0, =fr
			bl printf
			pop	{r0, LR}
		
while:  cmp r0, #0
		beq endw
		ldr r1, [r0],#4
		push {r0, LR}
		ldr r0, =fr2
		bl printf
		pop {r0, LR}
		ldr r0, [r0]
		b while
endw:	
		push {r0, LR}
		ldr r0, =fr3
		bl printf	
		pop {r0, LR}	
		mov PC, LR	

