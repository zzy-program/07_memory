#include <stdio.h>
#include <stdlib.h>

void __stack_chk_fail(void) {
	printf("[stack check fail] my own callback\n");
	fflush(stdout);

	while(1);
}

int main() {
	int a[5];

	a[5] = 0;
	a[6] = 0;

	return 0;
}
