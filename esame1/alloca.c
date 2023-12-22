#include <stdio.h>
#include <stdlib.h>

typedef struct __node { 
	int info; 
	struct __node * next;
}node_t;

void * l_alloca(int n, int max) {
		
		node_t * start = NULL;
		srand(123);
		
		for(int i=0; i<n; i++) {
			node_t * ptr = (node_t *) malloc(sizeof(node_t));
			ptr->info = rand() % max;
			ptr->next = start;
			start = ptr;
		}
		
		return ((void *) start);

}
