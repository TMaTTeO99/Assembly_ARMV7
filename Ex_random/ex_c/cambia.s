		.globl cambia
		.type cambia,%function

cambia: push {r0, LR}
	 	bl strlen
	 	mov r3, r0
	 	pop {r0, LR}	 	
	 	mov r4, #0
	 	mov r1, #0
	 	sub r5, r3, #1 
	 	
for_a:	cmp r1, r5
		bge end_a	
		add r2, r1, #1
for_b:	cmp r2, r3
		bge	end_b
		push {r0 ,r1, r2, r3, LR}
		bl cambiav
		add r4, r4, r0
		pop {r0 ,r1, r2, r3, LR}
		add r2, r2, #1
		b for_b
				
end_b:	add r1, r1, #1
		b for_a	
		
end_a:	mov r0, r4
		mov PC, LR
		
cambiav: push {r4, r5}
		
		mov r3, #0
		ldrb r4, [r0, r1]
		ldrb r5, [r0, r2]
		cmp	r4, r5
		ble else
		mov r3, r4
		strb r5, [r0, r1]
		strb r3, [r0, r2]
		pop {r4, r5}
		mov r0, #1
		mov PC, LR
		 
else:	pop {r4, r5}
		mov r0, #0
		mov PC, LR



