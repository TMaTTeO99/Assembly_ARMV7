	.globl convstring
	.type convstring,%function

convstring:					@in r0 c'è la mia stringa
			 
		push {r4}
		mov r1, #0		@la mia i
		mov r3, #0		@il mio par	
		ldrb r2, [r0, #0] @"scarico" il mio primo char
			
while_cs:	cmp r2, #0
			beq end_wcs
			lsl r3, r3, #4
		   	push {r0, r1, r2, r3, LR}
		   	bl convdigit
		   	mov r4, r0
		   	pop {r0, r1, r2, r3, LR}
		   	add r3, r3, r4
		   	add r1, r1, #1
		   	ldrb r2, [r0, r1]
		   	b while_cs   	

end_wcs:	pop {r4}	
			mov r0, r3
			mov PC, LR	

convdigit:	cmp r0, #9
			bgt let
			sub r0, r0, #48			
			mov PC, LR	

let:		sub r0, r0, #97		
			add r0, r0, #10
			mov PC, LR
