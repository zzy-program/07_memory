#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

extern char _init, _start,  __executable_start, _my_start, _my_init, 
	_text, _etext, _erodata;

extern char _data, _edata, __bss_start, _ebss;

const int a_global_const = 8;
int a_bss;
int a_data = 5;

unsigned long long a_stack_probably = 0;
#define get_rbp(value) asm ("mov %%rbp, %0" : "=r" (value))

__attribute__((constructor))
static void before_main(void) {
	get_rbp(a_stack_probably);
	printf("\nbefore main\n");
}

int main() {

	int a_stack[10] = {0};	
	int b_stack[10] = {0};
	int *a_heap = malloc(100);

	pid_t pid;

	printf("\n***Native memory layout begin***\n");
	printf("_init=%p, _start=%p, __executable_start=%p\n", &_init, &_start, &__executable_start);
	printf("_my_start=%p, _my_init=%p, _text=%p, _etext=%p, _erodata=%p\n", &_my_start, &_my_init, &_text, &_etext, &_erodata);
	printf("_data=%p, _edata=%p, __bss_start=%p, _ebss=%p\n", &_data, &_edata, &__bss_start, &_ebss);
	printf("stack_probably=%p\n", (void *)a_stack_probably);
	printf("***Native memory layout end***\n\n");

	printf("[init] before_main=%p\n", before_main);
	printf("[rodata] &a_global_const=%p\n", &a_global_const);
	printf("[text] main=%p\n", main);
	printf("[bss] &a_bss=%p\n", &a_bss);
	printf("[data] &a_data=%p\n", &a_data);

	printf("[stack] a_stack=%p\n", a_stack);
	printf("[stack] b_stack=%p\n", b_stack);
	printf("[stack] &a_heap=%p\n", &a_heap);
	
	printf("[heap] a_heap=%p\n", a_heap);

	pid = getpid();
	printf("pid=%d\n", pid);

	free(a_heap);
	printf("\n");

	while(1);

	return 0;
}
