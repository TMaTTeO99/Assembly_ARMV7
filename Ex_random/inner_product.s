	.data 				@definisco sezione dati
x: 	.word 3, 2, 6, 1		@@definisco due vettori
y:	.word 5, 2, 9, 10
n:	.word 4   			@<----non serve
@frase:  .string "&d\n" 		@<------non serve

	.text				@definisco programma
	.global main
	
main:	ldr r0, =x
	ldr r1, =y
	mov r2, #0
	mov r3, #0
	mov r4, #0
	mov r7, #0
	mov r8, #4
	
loop:	cmp r2, #4
	beq exit
	mul r7, r2, r8 
	ldr r5, [r0, r7]
	ldr r6, [r1, r7]
	mul r3, r5, r6
	add r4, r4, r3
	add r2, r2, #1
	b loop
exit:

@Inner product funzionanate
	
