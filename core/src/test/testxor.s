	.file	"testxor.c"
	.text
	.p2align 4,,15
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	call	g
	movl	%eax, src
	call	f

	movl	rop, %edx
	cmpl	$26, %edx
	movl	%eax, dst
	ja	.L24
	jmp	*.L20(,%edx,4)

	.section	.rodata
	.align 4
	.align 4
.L20:
	.long	.L3
	.long	.L4
	.long	.L5
	.long	.L6
	.long	.L7
	.long	.L8
	.long	.L9
	.long	.L10
	.long	.L11
	.long	.L12
	.long	.L13
	.long	.L14
	.long	.L15
	.long	.L16
	.long	.L17
	.long	.L24
	.long	.L18
	.long	.L3
	.long	.L24
	.long	.L3
	.long	.L24
	.long	.L7
	.long	.L7
	.long	.L3
	.long	.L24
	.long	.L18
	.long	.L19
	.text
	.p2align 4,,7
	.p2align 3
.L19:
	movl	(%eax), %edx
	testl	%edx, %edx
	jne	.L26
	movl	src, %ecx
	movl	(%ecx), %edx
.L22:
	movl	%edx, (%eax)
	movl	%eax, dst
	movl	%ecx, src
	.p2align 4,,7
	.p2align 3
.L24:
	movl	%ebp, %esp
	popl	%ebp
	ret
	.p2align 4,,7
	.p2align 3
.L3:
	movl	src, %edx
	movl	%eax, dst
	movl	(%edx), %ecx
	movl	%ecx, (%eax)
	jmp	.L24
	.p2align 4,,7
	.p2align 3
.L4:
	movl	src, %edx
	movl	%eax, dst
	movl	(%edx), %ecx
	xorl	%ecx, (%eax)
	jmp	.L24
	.p2align 4,,7
	.p2align 3
.L5:
	movl	src, %edx
	movl	%eax, dst
	movl	(%edx), %ecx
	orl	%ecx, (%eax)
	jmp	.L24
	.p2align 4,,7
	.p2align 3
.L6:
	movl	src, %edx
	movl	%eax, dst
	movl	(%edx), %ecx
	andl	%ecx, (%eax)
	jmp	.L24
	.p2align 4,,7
	.p2align 3
.L7:
	movl	$0, (%eax)
	movl	%eax, dst
	jmp	.L24
	.p2align 4,,7
	.p2align 3
.L8:
	movl	$-1, (%eax)
	movl	%eax, dst
	jmp	.L24
	.p2align 4,,7
	.p2align 3
.L9:
	movl	src, %ecx
	movl	(%eax), %edx
	movl	%eax, dst
	xorl	(%ecx), %edx
	notl	%edx
	movl	%edx, (%eax)
	jmp	.L24
	.p2align 4,,7
	.p2align 3
.L10:
	movl	src, %ecx
	movl	(%eax), %edx
	movl	%eax, dst
	orl	(%ecx), %edx
	notl	%edx
	movl	%edx, (%eax)
	jmp	.L24
	.p2align 4,,7
	.p2align 3
.L11:
	movl	src, %ecx
	movl	(%eax), %edx
	movl	%eax, dst
	andl	(%ecx), %edx
	notl	%edx
	movl	%edx, (%eax)
	jmp	.L24
	.p2align 4,,7
	.p2align 3
.L12:
	notl	(%eax)
	movl	%eax, dst
	jmp	.L24
	.p2align 4,,7
	.p2align 3
.L13:
	movl	src, %ecx
	movl	%eax, dst
	movl	(%ecx), %edx
	notl	%edx
	movl	%edx, (%eax)
	jmp	.L24
	.p2align 4,,7
	.p2align 3
.L14:
	movl	src, %ecx
	movl	%eax, dst
	movl	(%ecx), %edx
	notl	%edx
	orl	%edx, (%eax)
	jmp	.L24
	.p2align 4,,7
	.p2align 3
.L15:
	movl	src, %ecx
	movl	%eax, dst
	movl	(%ecx), %edx
	notl	%edx
	andl	%edx, (%eax)
	jmp	.L24
	.p2align 4,,7
	.p2align 3
.L16:
	movl	(%eax), %edx
	movl	src, %ecx
	movl	%eax, dst
	notl	%edx
	orl	(%ecx), %edx
	movl	%edx, (%eax)
	jmp	.L24
	.p2align 4,,7
	.p2align 3
.L17:
	movl	(%eax), %edx
	movl	src, %ecx
	movl	%eax, dst
	notl	%edx
	andl	(%ecx), %edx
	movl	%edx, (%eax)
	jmp	.L24
	.p2align 4,,7
	.p2align 3
.L18:
	movl	src, %ecx
	movl	%eax, dst
	movl	(%ecx), %edx
	xorl	gr_background, %edx
	xorl	%edx, (%eax)
	jmp	.L24
	.p2align 4,,7
	.p2align 3
.L26:
	movl	src, %ecx
	jmp	.L22
	.size	main, .-main
	.comm	ca1,4,4
	.comm	cx1,4,4
	.comm	ca2,4,4
	.comm	cx2,4,4
	.comm	src,4,4
	.comm	dst,4,4
	.comm	rop,4,4
	.ident	"GCC: (Ubuntu 4.4.1-4ubuntu8) 4.4.1"
	.section	.note.GNU-stack,"",@progbits
