#include <stdio.h>
#include <stdlib.h>

int main()
{
	int *p1 = malloc(4);
	int *p2 = malloc(4*1024*1024);

	printf("p1=%p, p2=%p\n", p1, p2);

	free(p1);
	free(p2);

	return 0;
}
