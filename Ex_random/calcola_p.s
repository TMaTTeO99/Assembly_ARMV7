@programma che calcola un polinomio:
@funziona ma da un errore nel loop del main e non so perche 
@devo vedere come fare, secondo me pow sporca il cpsw e il loop
@interno mi da problemi oppure puo essere un problema sul PC
@forse è quello da sistemare (pero funziona, si blocca solo il 
@debbugger)


@ES: x + 2x^2 + 3x^3 + ... + nx^n

									.data
pr:						.string "Il polinomio vale: %d\n"
									.text
									.global main
									
main:
			mov r0, #4 			@r0 sarà la mia x
			mov r1, #3			@r1 sarà il mio n
			mov r2, #1
			mov r3, #0
			mov r4, #0
			
loop:	cmp r2, #3
			bgt fine
			push {r0}
			bl pow	
			mul r3, r0, r2
			add r4, r4, r3
			pop {r0}
			add r2, r2, #1
			b loop			

fine: ldr r0, =pr
			mov r1, r4
			bl printf
			mov r7, #1
			mov r0, #0
			svc 0

pow: 	push {r3, r4, LR}
			mov r3, #1
			mov r4, r0
			
loop_p: cmp r3, r2
				beq end 
				mul r0, r0, r4
				add r3, r3, #1
				b loop_p
end: 
				pop {r3, r4, PC}
			

