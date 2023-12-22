					.data

pr:			.string "fat di n: %d\n"				




					.text


fat:	push {r0, lr}
			cmp r0, #1
			bgt fine
			mov r0, #1
			add sp, sp, #8
			mov pc, lr
			
fine:	sub r0, r0, #1
			bl fat
			pop {r1, lr}
			mul r0, r1, r0
			mov pc, lr
			
.global main


main:	
		mov r7, lr
		mov r0, #4
		bl fat
		mov r1, r0
		ldr r0, =pr
		bl printf
		mov pc, r7
			
