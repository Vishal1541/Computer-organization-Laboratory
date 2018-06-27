#include <stdio.h>
extern int testl(int, int, int);
int main()
{
int x, y,z;
int value;

printf("Give the first value:	");
scanf("%d", &x);

printf("Give the second  value:	");
scanf("%d", &y);
 
printf("Give the third   value:	");
scanf("%d", &z);

 value = testl(x, y, z);
 printf("Result = %d\n", value);

return 0 ;

}


