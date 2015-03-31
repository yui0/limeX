	.file	"testmul.c"
	.text
	.p2align 4,,15
.globl main
	.type	main, @function
main:
	movl	y, %ecx
	movl	pitch, %eax
	movl	x, %edx
	pushl	%ebp
	movl	%esp, %ebp
	imull	%ecx, %eax
	popl	%ebp
	addl	%edx, %eax
	sall	$2, %eax
	addl	base, %eax
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
