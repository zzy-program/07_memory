#include <stdio.h>
#include <stdlib.h>

#define get_canary(value) asm volatile("mov %%fs:(0x28), %0" : "=r" (value));
int main() {
	unsigned long long canary;
	unsigned long long a[5];

	get_canary(canary);
	printf("canary=0x%llx\n", canary);

	a[5] = canary;

	return 0;
}
