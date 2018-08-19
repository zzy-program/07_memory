#include <stdlib.h>

int main()
{
	char *buf = malloc(10);

	char a = buf[15];

	free(buf);
	return 0;
}
