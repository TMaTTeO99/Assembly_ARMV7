	.global subst
	.type subst,%function

subst:	mov r2, #0	@r2 e r3 mi servono per confrontare i val
		mov r3, #0	@li ho inizializzati solo per vedere
					@chi sono
		push {r4}		
		mov r1, r0  @passo il ptr a r1
		add r1, r1, #4	@faccio puntare a r1 il next
		ldr r1, [r1] @prendo il secondo val
		@ r1 sara il secondo elem della lista quando scorro
		@ sara lui che mi fara finire il while
		
while_ext:	cmp r1, #0
			beq end_w_ext
while_int:	cmp r1, #0
			beq end_w_int				
			ldr r2, [r0]
			ldr r3, [r1]
			cmp r3, r2
			movlt r4, r3
			strlt r2, [r1]
			strlt r4, [r0]
			add r1, r1, #4
			ldr r1, [r1]
			b while_int
end_w_int:	
			@devo inizializzare sempre r1
			add r0, r0, #4
			ldr r0, [r0]
			mov r1, r0  @passo il ptr a r1
			add r1, r1, #4	@faccio puntare a r1 il next
			ldr r1, [r1] @prendo il secondo val
			
			b while_ext

end_w_ext:	pop {r4}

			mov PC, LR
	   



			
		
