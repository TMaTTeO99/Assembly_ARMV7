#include <stdio.h>
#include <stdlib.h>

typedef struct __elemento {
int info;
struct __elemento * next;
} ELEM;

extern void push(int, ELEM**);
extern int isEmpty(ELEM**);
extern int pop(ELEM**);

void stampa(ELEM * p) {
	if(p == NULL) printf("NULL\n");
	else { printf("%d -> ", p->info); p = p->next; stampa(p); }
	return;
}
int main(int argc, char ** argv) {
	ELEM * coda = NULL;
	int i;
	stampa(coda);
	for(i=1; i<argc; i++) {
		push(atoi(argv[i]),&coda); 
		stampa(coda);
	}
	printf("!\n");
	while(!isEmpty(&coda)) {
	printf("pop -> %d\n", pop(&coda));
	stampa(coda);
	}
	return(0);
}
