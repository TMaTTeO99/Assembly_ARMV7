#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int convstring(char *);

int check(char * s) {
	int i, n, ret;
	ret = (1==1);
	n = strlen(s);
		for(i=0; i<n; i++)
			if(!(s[i]>='0' && s[i]<='9') && !(s[i]>='a' && s[i]<='f'))
			ret = (1==0);
		return ret;
}

//int convstring(char *stringa);
//int convdigit(char x);


int main(int argc, char ** argv) {
	int i;
	
	if(argc == 1){
		char * x[4] = {"00d","ff", "ff00", "1000"};
		for(int i=0; i<4; i++)
			printf("Stringa %s converte in %d\n",x[i], convstring(x[i]));
	}
 	else {
		for(int i=1; i<argc; i++)
			if(check(argv[i]))
				printf("Stringa %s converte in %d\n",argv[i], convstring(argv[i]));
			else
				printf("La stringa %s non è stringa esadecimale valida\n", argv[i]);
	}
		return(0);
}/*
int convstring(char *stringa){
		
	int par = 0;
	int i = 0;
	while(stringa[i] != '\0'){
		par *= 16;
		par += convdigit(stringa[i]);  	
		i++;
	}	
	return par;
}
int convdigit(char x){

	return x;

}*/
