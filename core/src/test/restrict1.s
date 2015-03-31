	.file	"restrict.c"
	.text
	.p2align 4,,15
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	pushl	%esi
	pushl	%ebx
	subl	$8, %esp
	call	x
	movl	src, %ebx
	movl	dst, %ecx
	testl	%eax, %eax
	movl	%eax, %esi
	jle	.L5
	xorl	%edx, %edx
	.p2align 4,,7
	.p2align 3
.L3:
	movzbl	(%ebx,%edx), %eax
	movb	%al, (%ecx,%edx)
	movzbl	1(%ebx,%edx), %eax
	movb	%al, 1(%ecx,%edx)
	movzbl	2(%ebx,%edx), %eax
	movb	%al, 2(%ecx,%edx)
	movzbl	3(%ebx,%edx), %eax
	movb	%al, 3(%ecx,%edx)
	addl	$1, %edx
	cmpl	%esi, %edx
	jne	.L3
.L5:
	addl	$8, %esp
	popl	%ebx
	popl	%esi
	movl	%ebp, %esp
	popl	%ebp
	ret
	.size	main, .-main
	.comm	src,4,4
	.comm	dst,4,4
	.ident	"GCC: (Ubuntu 4.4.1-4ubuntu8) 4.4.1"
	.section	.note.GNU-stack,"",@progbits
