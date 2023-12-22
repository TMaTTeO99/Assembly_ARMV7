int cambia(char *s){

	int n = strlen(s);
	int x = 0;
	for(int i = 0; i<n-1; i++){
		for(int j = i+1; j<n; j++){
			x += cambiaV(s, i, j);
		}	
	}
	return x; 
}
int cambiaV(char *s , int i, int j){
		
		char t = 0;
		if(s[i] > s[j]){
			t = s[i];
			s[i] = s[j];
			s[j] = t;
			return 1;			 
		}
		return 0;
}
