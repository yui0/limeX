	.file	"testsw2.c"
	.text
	.p2align 4,,15
.globl main
	.type	main, @function
main:
	movl	s, %edx
	movl	d, %eax
	pushl	%ebp
	movl	%esp, %ebp
	movl	(%edx), %ecx
	xorl	%ecx, (%eax)
	movl	8(%edx), %ecx
	xorl	%ecx, 8(%eax)
	movl	16(%edx), %ecx
	xorl	%ecx, 16(%eax)
	movl	24(%edx), %ecx
	xorl	%ecx, 24(%eax)
	movl	32(%edx), %ecx
	xorl	%ecx, 32(%eax)
	movl	40(%edx), %ecx
	addl	$48, %edx
	xorl	%ecx, 40(%eax)
	addl	$48, %eax
	popl	%ebp
	movl	%eax, d
	movl	%edx, s
	ret
	.size	main, .-main
	.comm	gr_background,4,4
	.comm	s,4,4
	.comm	d,4,4
	.ident	"GCC: (Ubuntu 4.4.1-4ubuntu8) 4.4.1"
	.section	.note.GNU-stack,"",@progbits
