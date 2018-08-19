	.file	"test.c"
	.globl	a_global_const
	.section	.rodata
	.align 4
	.type	a_global_const, @object
	.size	a_global_const, 4
a_global_const:
	.long	8
	.comm	a_bss,4,4
	.globl	a_data
	.data
	.align 4
	.type	a_data, @object
	.size	a_data, 4
a_data:
	.long	5
	.text
	.type	before_main, @function
before_main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	before_main, .-before_main
	.section	.init_array,"aw"
	.align 8
	.quad	before_main
	.section	.rodata
	.align 8
.LC0:
	.string	"\n***Native memory layout begin***"
.LC1:
	.string	"__executable_start=%p\n"
	.align 8
.LC2:
	.string	"_my_start=%p, _init=%p, _text=%p, _etext=%p, _erodata=%p\n"
	.align 8
.LC3:
	.string	"_data=%p, _edata=%p, __bss_start=%p, _ebss=%p\n"
	.align 8
.LC4:
	.string	"***Native memory layout end***\n"
.LC5:
	.string	"[init] before_main=%p\n"
.LC6:
	.string	"[rodata] &a_global_const=%p\n"
.LC7:
	.string	"[text] main=%p\n"
.LC8:
	.string	"[bss] &a_bss=%p\n"
.LC9:
	.string	"[data] &a_data=%p\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$.LC0, %edi
	call	puts
	movl	$__executable_start, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	$_erodata, %r9d
	movl	$_etext, %r8d
	movl	$_text, %ecx
	movl	$_init, %edx
	movl	$_my_start, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movl	$_ebss, %r8d
	movl	$__bss_start, %ecx
	movl	$_edata, %edx
	movl	$_data, %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movl	$.LC4, %edi
	call	puts
	movl	$before_main, %esi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	movl	$a_global_const, %esi
	movl	$.LC6, %edi
	movl	$0, %eax
	call	printf
	movl	$main, %esi
	movl	$.LC7, %edi
	movl	$0, %eax
	call	printf
	movl	$a_bss, %esi
	movl	$.LC8, %edi
	movl	$0, %eax
	call	printf
	movl	$a_data, %esi
	movl	$.LC9, %edi
	movl	$0, %eax
	call	printf
	movl	$10, %edi
	call	putchar
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
