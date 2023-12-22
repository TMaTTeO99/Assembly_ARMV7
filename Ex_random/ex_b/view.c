int mystrstr(char * stringa, char *p2){

	int n = strlen(stringa);
	for(int i = 0; i<n; i++){
		if(match(stringa, p2, i)){
			return i;
		}	
	}
	return -1;
}
int match(char * stringa, char * pt2, int pos){
	
	int len = strlen(pt2);
	if(stringa[pos] != pt2[0])return 0;
	int pos2 = 0;
	
	while(stringa[pos] == pt2[pos2] && (pt2[pos2] != '\0' && stringa[pos] != '\0')){
		pos++;
		pos2++;
	}	
	
	if(pos2 == len)return 1;	
	return 0;	

}
