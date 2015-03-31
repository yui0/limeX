	.file	"mul4.c"
	.text
	.p2align 4,,15
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	-4(%ebp), %eax
	sall	$2, %eax
	movl	%eax, g
	leave
	ret
	.size	main, .-main
	.comm	g,4,4
	.ident	"GCC: (Ubuntu 4.4.1-4ubuntu8) 4.4.1"
	.section	.note.GNU-stack,"",@progbits
