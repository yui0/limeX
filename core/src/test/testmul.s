	.file	"testmul.c"
	.text
	.p2align 4,,15
.globl main
	.type	main, @function
main:
	movl	x, %eax
	movl	x, %ecx
	movl	x, %edx
	pushl	%ebp
	movl	%esp, %ebp
	leal	(%ecx,%eax), %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	base, %eax
	popl	%ebp
	movl	%eax, addr
	ret
	.size	main, .-main
	.comm	x,4,4
	.comm	y,4,4
	.comm	pitch,4,4
	.comm	addr,4,4
	.comm	base,4,4
	.ident	"GCC: (Ubuntu 4.4.1-4ubuntu8) 4.4.1"
	.section	.note.GNU-stack,"",@progbits
