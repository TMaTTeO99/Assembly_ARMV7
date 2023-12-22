	@11:12 start stop: 13:26 (devo migliorare ma ok bene o male le cose si sanno devo esercitarmi)
		.globl mystrstr
		.type mystrstr,%function
		
mystrstr: push {r0, r1, LR}
		  bl strlen
		  mov r3, r0		@il mio n
		  pop {r0, r1, LR}
		  
		mov r2, #0		@ls mia i

for:	cmp r2, r3
		moveq r0, #-1
		moveq PC, LR
		movgt r0, #-1
		movgt PC, LR
		push {r0, r1, r2, r3, LR}
		bl match  
		mov r4, r0
		pop {r0, r1, r2, r3, LR}
		cmp r4, #1
		moveq r0, r2
		moveq PC, LR
		add r2, r2, #1
		b for

match:	@push {r0, r1, r2, LR}
		push {r4, r5, r6, r7, r8, r9, LR}
		mov r4, r0   @r4 diventa stringa
		mov r5, r1	 @r5 diventa pt2
		mov r6, r2	 @r6 diventa pos
		mov r0, r5	 @sposto pt2 in r0 per la strlen
		bl strlen	
		mov r3, r0	 @salvo la len in r3

		 			
		ldrb r7, [r4, r6]
		ldrb r8, [r5, #0]
		cmp r7, r8
		beq else
		pop {r4, r5, r6, r7, r8, r9, LR}
		movne r0, #0
		movne PC, LR
		
else:
		mov r9, #0			@il mio p0s2

while:	cmp r7, r8
		bne endw 
		cmp r7, #0
		beq endw 	
		cmp r8, #0
		beq endw 
		add r6, r6, #1		
		add r9, r9, #1
		ldrb r7, [r4, r6]
		ldrb r8, [r5, r9]
		b while
		
endw:	cmp r9, r3
		bne else2
		pop {r4, r5, r6, r7, r8, r9, LR}
		mov r0, #1
		mov PC, LR
		
else2:  pop {r4, r5, r6, r7, r8, r9, LR}
		mov r0, #0
		mov PC, LR

