#include <stdio.h>
extern int showFlags();
int main(){
	int flag = showFlags();
	printf("%d\n\t",flag);
	for(int i=0; i<32; i++){
		printf("%d ",flag%2);
		flag >>= 1;
		if(i>=10)	printf(" ");
	}
	printf("\n");
	printf("Index:\t");
	for(int i=0; i<32; i++)	printf("%d ",i);
	printf("\n");
	return 0;
}