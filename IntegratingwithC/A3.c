#include <stdio.h>
extern int testl(int, int, int);
int main()
{
int x, y, z;
int value;

printf("Give the first value:	");
scanf("%d", &x);

printf("Give the second  value:	");
scanf("%d", &y);

printf("Give the third   value: ");
scanf("%d", &z);

asm ("add %1,%2;"
     "sub %3,%2;"
     "mov %2,%0;"	
     :"=r" (value)   /*output */
     :"r"(x), "r"(y), "r" (z)   /* inputs   */
     :"%eax");

 printf("Result = %d\n", value);

return 0 ;

}


