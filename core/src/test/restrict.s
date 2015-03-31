	.file	"restrict.c"
	.text
	.p2align 4,,15
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$36, %esp
	call	x
	movl	src, %ecx
	movl	dst, %edx
	movl	%eax, %ebx
	subl	$1, %ebx
	movl	%ebx, 12(%esp)
	js	.L7
	cmpl	$3, %eax
	jle	.L3
	movzbl	1(%ecx), %esi
	movzbl	(%ecx), %edi
	movzbl	2(%ecx), %eax
	movl	%ecx, 8(%esp)
	movl	%esi, %ebx
	movl	12(%esp), %esi
	movb	%bl, 28(%esp)
	.p2align 4,,7
	.p2align 3
.L4:
	movl	%edi, %ecx
	subl	$3, %esi
	movb	%bl, 1(%edx)
	movb	%al, 2(%edx)
	movb	%cl, (%edx)
	movl	8(%esp), %ecx
	movzbl	3(%ecx), %edi
	movl	%edi, %ebx
	movl	%edi, %eax
	movb	%bl, 3(%edx)
	movzbl	4(%ecx), %ebx
	movb	%bl, 4(%edx)
	movl	8(%esp), %ecx
	addl	$3, %edx
	addl	$3, %ecx
	movl	%ecx, 8(%esp)
	movb	%al, (%edx)
	movb	%bl, 1(%edx)
	movzbl	2(%ecx), %eax
	leal	-1(%esi), %ecx
	cmpl	$1, %ecx
	movb	%al, 2(%edx)
	jg	.L4
	movl	8(%esp), %ecx
	movl	%esi, 12(%esp)
.L3:
	movl	12(%esp), %esi
	xorl	%eax, %eax
	.p2align 4,,7
	.p2align 3
.L5:
	movzbl	(%ecx,%eax), %ebx
	movb	%bl, (%edx,%eax)
	movzbl	1(%ecx,%eax), %ebx
	movb	%bl, 1(%edx,%eax)
	movzbl	2(%ecx,%eax), %ebx
	movb	%bl, 2(%edx,%eax)
	movzbl	3(%ecx,%eax), %ebx
	movb	%bl, 3(%edx,%eax)
	addl	$1, %eax
	cmpl	%eax, %esi
	jns	.L5
.L7:
	addl	$36, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	movl	%ebp, %esp
	popl	%ebp
	ret
	.size	main, .-main
	.comm	src,4,4
	.comm	dst,4,4
	.ident	"GCC: (Ubuntu 4.4.1-4ubuntu8) 4.4.1"
	.section	.note.GNU-stack,"",@progbits
