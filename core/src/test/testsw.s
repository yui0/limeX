	.file	"testsw.c"
	.text
	.p2align 4,,15
.globl main
	.type	main, @function
main:
	cmpl	$11, c
	pushl	%ebp
	movl	%esp, %ebp
	ja	.L12
	movl	c, %eax
	jmp	*.L10(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L10:
	.long	.L3
	.long	.L12
	.long	.L4
	.long	.L12
	.long	.L5
	.long	.L6
	.long	.L7
	.long	.L8
	.long	.L5
	.long	.L12
	.long	.L12
	.long	.L6
	.text
	.p2align 4,,7
	.p2align 3
.L3:
	movl	$7, a
	.p2align 4,,7
	.p2align 3
.L12:
	popl	%ebp
	ret
	.p2align 4,,7
	.p2align 3
.L6:
	movl	$3, a
	popl	%ebp
	ret
	.p2align 4,,7
	.p2align 3
.L5:
	movl	$1, a
	popl	%ebp
	ret
	.p2align 4,,7
	.p2align 3
.L7:
	movl	$4, a
	popl	%ebp
	ret
	.p2align 4,,7
	.p2align 3
.L8:
	movl	$5, a
	popl	%ebp
	ret
	.p2align 4,,7
	.p2align 3
.L4:
	movl	$6, a
	popl	%ebp
	ret
	.size	main, .-main
	.comm	a,4,4
	.comm	c,4,4
	.ident	"GCC: (Ubuntu 4.4.1-4ubuntu8) 4.4.1"
	.section	.note.GNU-stack,"",@progbits
