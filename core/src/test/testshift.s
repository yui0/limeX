	.file	"testshift.c"
	.text
	.p2align 4,,15
.globl main
	.type	main, @function
main:
	movl	c, %eax
	movl	x, %edx
	pushl	%ebp
	movl	%esp, %ebp
	andl	$1, %edx
	cmpl	$1, %edx
	movl	addr, %edx
	sbbl	%ecx, %ecx
	andl	$4, %ecx
	sall	%cl, %eax
	movb	%al, (%edx)
	popl	%ebp
	ret
	.size	main, .-main
	.comm	x,4,4
	.comm	c,4,4
	.comm	addr,4,4
	.ident	"GCC: (Ubuntu 4.4.1-4ubuntu8) 4.4.1"
	.section	.note.GNU-stack,"",@progbits
