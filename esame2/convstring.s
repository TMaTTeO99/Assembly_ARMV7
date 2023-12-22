	.global convstring
	.type convstring,%function

convstring:	@in r0 c'è la mia stringa
			push {r4}
			mov r1, #0	@risultato parziale
			mov r3, #0
			ldrb r2, [r0, r3]
			
			
while:	cmp r2, #0
		beq end_w			
		push {r0, r1, r2, r3, LR}
		mov r0, r2
		bl convdigit
		mov r4, r0
		pop {r0, r1, r2, r3, LR}
		lsl r1, r1, #4
		add r1, r1, r4
		add r3, r3, #1
		ldrb r2, [r0, r3]
		b while
		
end_w:	pop {r4}
		mov r0, r1
		mov PC, LR


convdigit:	cmp r0, #57
			bgt let
			sub r0, r0, #48
			mov PC, LR

let:		sub	r0, r0, #97
			add r0, r0, #10
			mov PC, LR
