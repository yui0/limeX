	.file	"inline.c"
	.text
	.p2align 4,,15
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	call	func0
	movb	$1, d
	movb	$1, d+1
	movb	$1, d+2
	movl	%ebp, %esp
	popl	%ebp
	ret
	.size	main, .-main
	.comm	d,255,32
	.ident	"GCC: (Ubuntu 4.4.1-4ubuntu8) 4.4.1"
	.section	.note.GNU-stack,"",@progbits
