			.data
			.text
			.global main

main:
			mov r0, #4
			mov r1, #0
			mov r2, #1
			mov r3, #0
			
loop:	cmp r2, #3
			bgt fine 
			push {r0, r1, r2}
			bl pow
			mov r5, r0
			pop {r0, r1, r2}
			mul r5, r5, r2
			add r3, r3, r5
			add r2, r2, #1
			b loop
			
fine: mov r7, #1
			mov r0, #0
			svc 0


pow:	
			mov r1, r0
			cmp r2, #1
			moveq PC, LR
			push {LR}
			sub r2, r2, #1
			bl pow
			mul r0, r0, r1
			pop {PC} 
