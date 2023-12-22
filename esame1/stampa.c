#include <stdio.h>
#include <stdlib.h>

typedef struct __node { 
	int info; 
	struct __node * next;
}node_t;

void l_stampa(node_t * p) {
	printf("Lista generata:\n");
	while(p != NULL) {
		printf("%d -> ",p->info);
		p = p->next;
	}
	printf("Fine lista\n");
	return;
}
