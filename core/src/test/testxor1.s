	.file	"testxor.c"
	.text
	.p2align 4,,15
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp

	movl	%ebx, -12(%ebp)
	movl	src, %ebx
	movl	ca1, %edx
	movl	cx1, %ecx
	movl	dst, %eax
	movl	%edi, -4(%ebp)
	movl	src, %edi
	movl	%esi, -8(%ebp)
	andl	%ebx, %edx
	movl	-12(%ebp), %ebx
	xorl	%ecx, %edx
	movl	%eax, -16(%ebp)
	movl	ca2, %eax
	movl	cx2, %esi
	andl	-16(%ebp), %edx
	andl	%edi, %eax
	movl	-4(%ebp), %edi
	xorl	%esi, %eax
	movl	-8(%ebp), %esi
	xorl	%edx, %eax
	movl	%eax, dst

	movl	%ebp, %esp
	popl	%ebp
	ret
	.size	main, .-main
	.comm	ca1,4,4
	.comm	cx1,4,4
	.comm	ca2,4,4
	.comm	cx2,4,4
	.comm	src,4,4
	.comm	dst,4,4
	.ident	"GCC: (Ubuntu 4.4.1-4ubuntu8) 4.4.1"
	.section	.note.GNU-stack,"",@progbits
