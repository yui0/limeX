	.file	"convblit_8888.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"convblit_8888\n"
	.text
	.p2align 4,,15
.globl convblit_copy_rgb888_16bpp_right
	.type	convblit_copy_rgb888_16bpp_right, @function
convblit_copy_rgb888_16bpp_right:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$92, %esp
	movl	12(%ebp), %edx
	movl	12(%ebp), %eax
	movl	8(%ebp), %ebx
	movl	56(%edx), %edi
	movl	32(%eax), %eax
	movl	16(%edx), %ecx
	movl	64(%edx), %esi
	movl	%edi, -32(%ebp)
	movl	%edx, %edi
	movl	60(%edi), %edi
	movl	%eax, -40(%ebp)
	movl	12(%ebx), %eax
	movl	28(%edx), %ebx
	movl	%edi, -28(%ebp)
	movl	12(%ebp), %edi
	subl	$1, %eax
	subl	20(%edx), %eax
	movl	%ecx, 20(%edx)
	movl	12(%edi), %edi
	movl	%eax, 16(%edx)
	movl	24(%edx), %edx
	testl	%edi, %edi
	movl	%edi, -48(%ebp)
	jle	.L2
	leal	(%edx,%edx,2), %edi
	movl	-40(%ebp), %edx
	imull	%ebx, %edx
	leal	(%edi,%edx), %edx
	addl	-32(%ebp), %edx
	movl	%edx, -32(%ebp)
	movl	%esi, %edx
	imull	%ecx, %edx
	leal	(%edx,%eax,2), %eax
	addl	-28(%ebp), %eax
	movl	$0, -28(%ebp)
	movl	%eax, -36(%ebp)
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	leal	(%eax,%eax,2), %ebx
	addl	-32(%ebp), %ebx
	movl	%eax, -44(%ebp)
	.p2align 4,,7
	.p2align 3
.L5:
	movl	-44(%ebp), %eax
	testl	%eax, %eax
	jle	.L3
	movl	-36(%ebp), %ecx
	movl	-32(%ebp), %eax
	movl	%ebx, -60(%ebp)
	.p2align 4,,7
	.p2align 3
.L4:
	movzbl	(%eax), %edx
	movzbl	1(%eax), %edi
	andl	$248, %edx
	andl	$252, %edi
	sall	$3, %edi
	sall	$8, %edx
	orl	%edi, %edx
	movzbl	2(%eax), %edi
	addl	$3, %eax
	movl	%edi, %ebx
	shrb	$3, %bl
	movl	%ebx, %edi
	andw	$255, %di
	orl	%edi, %edx
	movw	%dx, (%ecx)
	addl	%esi, %ecx
	cmpl	%eax, -60(%ebp)
	jne	.L4
	movl	-60(%ebp), %ebx
.L3:
	addl	$1, -28(%ebp)
	movl	-48(%ebp), %edi
	addl	-40(%ebp), %ebx
	cmpl	%edi, -28(%ebp)
	je	.L2
	movl	-40(%ebp), %eax
	addl	%eax, -32(%ebp)
	subl	$2, -36(%ebp)
	jmp	.L5
.L2:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ebx
	movl	140(%ebx), %edx
	testl	%edx, %edx
	je	.L7
	movl	12(%ebp), %edi
	movl	12(%edi), %ecx
	movl	8(%edi), %eax
	movl	%ecx, 12(%esp)
	movl	%eax, 16(%esp)
	movl	20(%edi), %eax
	movl	%eax, 8(%esp)
	movl	16(%edi), %eax
	movl	%ebx, (%esp)
	addl	$1, %eax
	subl	%ecx, %eax
	movl	%eax, 4(%esp)
	call	*%edx
.L7:
	addl	$92, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_rgb888_16bpp_right, .-convblit_copy_rgb888_16bpp_right
	.p2align 4,,15
.globl convblit_copy_rgb888_16bpp_down
	.type	convblit_copy_rgb888_16bpp_down, @function
convblit_copy_rgb888_16bpp_down:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$92, %esp
	movl	12(%ebp), %ecx
	movl	12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	56(%ecx), %edi
	movl	32(%eax), %eax
	movl	64(%ecx), %esi
	movl	28(%ecx), %ebx
	movl	%edi, -32(%ebp)
	movl	%ecx, %edi
	movl	%eax, -36(%ebp)
	movl	8(%edx), %eax
	movl	60(%edi), %edi
	subl	$1, %eax
	subl	16(%ecx), %eax
	movl	%edi, -28(%ebp)
	movl	12(%ebp), %edi
	movl	%eax, 16(%ecx)
	movl	12(%edx), %edx
	movl	12(%edi), %edi
	subl	$1, %edx
	subl	20(%ecx), %edx
	testl	%edi, %edi
	movl	%edi, -44(%ebp)
	movl	%edx, 20(%ecx)
	movl	24(%ecx), %ecx
	jle	.L11
	imull	%esi, %edx
	negl	%esi
	imull	-36(%ebp), %ebx
	leal	(%ecx,%ecx,2), %ecx
	movl	%esi, -48(%ebp)
	xorl	%esi, %esi
	leal	(%edx,%eax,2), %eax
	addl	-28(%ebp), %eax
	leal	(%ecx,%ebx), %ebx
	addl	-32(%ebp), %ebx
	movl	%eax, -28(%ebp)
	movl	12(%ebp), %eax
	movl	%ebx, -32(%ebp)
	movl	8(%eax), %eax
	leal	(%eax,%eax,2), %ebx
	addl	-32(%ebp), %ebx
	movl	%eax, -40(%ebp)
	.p2align 4,,7
	.p2align 3
.L14:
	movl	-40(%ebp), %edx
	testl	%edx, %edx
	jle	.L12
	movl	-28(%ebp), %ecx
	movl	-32(%ebp), %eax
	movl	%ebx, -60(%ebp)
	.p2align 4,,7
	.p2align 3
.L13:
	movzbl	(%eax), %edx
	movzbl	1(%eax), %edi
	andl	$248, %edx
	andl	$252, %edi
	sall	$3, %edi
	sall	$8, %edx
	orl	%edi, %edx
	movzbl	2(%eax), %edi
	addl	$3, %eax
	movl	%edi, %ebx
	shrb	$3, %bl
	movl	%ebx, %edi
	andw	$255, %di
	orl	%edi, %edx
	movw	%dx, (%ecx)
	subl	$2, %ecx
	cmpl	%eax, -60(%ebp)
	jne	.L13
	movl	-60(%ebp), %ebx
.L12:
	addl	$1, %esi
	addl	-36(%ebp), %ebx
	cmpl	-44(%ebp), %esi
	je	.L11
	movl	-36(%ebp), %edi
	movl	-48(%ebp), %eax
	addl	%edi, -32(%ebp)
	addl	%eax, -28(%ebp)
	jmp	.L14
.L11:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ecx
	movl	140(%ecx), %edx
	testl	%edx, %edx
	je	.L16
	movl	12(%ebp), %esi
	movl	8(%ebp), %edi
	movl	12(%esi), %ebx
	movl	8(%esi), %ecx
	movl	%ebx, 16(%esp)
	movl	%ecx, 12(%esp)
	movl	20(%esi), %eax
	addl	$1, %eax
	subl	%ebx, %eax
	movl	%eax, 8(%esp)
	movl	16(%esi), %eax
	movl	%edi, (%esp)
	addl	$1, %eax
	subl	%ecx, %eax
	movl	%eax, 4(%esp)
	call	*%edx
.L16:
	addl	$92, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_rgb888_16bpp_down, .-convblit_copy_rgb888_16bpp_down
	.p2align 4,,15
.globl convblit_srcover_rgba8888_bgra8888
	.type	convblit_srcover_rgba8888_bgra8888, @function
convblit_srcover_rgba8888_bgra8888:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$92, %esp
	movl	12(%ebp), %ecx
	movl	12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	60(%ecx), %ebx
	movl	32(%eax), %eax
	movl	64(%edx), %edx
	movl	56(%ecx), %esi
	movl	%ebx, -28(%ebp)
	movl	16(%ecx), %edi
	movl	%eax, -44(%ebp)
	movl	20(%ecx), %ebx
	movl	%edx, -48(%ebp)
	movl	28(%ecx), %eax
	movl	24(%ecx), %edx
	movl	12(%ecx), %ecx
	testl	%ecx, %ecx
	movl	%ecx, -40(%ebp)
	jle	.L19
	imull	-44(%ebp), %eax
	imull	-48(%ebp), %ebx
	movl	$0, -32(%ebp)
	leal	(%eax,%edx,4), %ecx
	leal	(%ebx,%edi,4), %eax
	addl	-28(%ebp), %eax
	leal	(%esi,%ecx), %ecx
	movl	%eax, -36(%ebp)
	.p2align 4,,7
	.p2align 3
.L24:
	movl	12(%ebp), %ebx
	movl	8(%ebx), %ebx
	testl	%ebx, %ebx
	movl	%ebx, -28(%ebp)
	jle	.L20
	movl	-36(%ebp), %edx
	xorl	%eax, %eax
	jmp	.L23
	.p2align 4,,7
	.p2align 3
.L21:
	testl	%esi, %esi
	je	.L22
	movzbl	3(%edx), %edi
	movl	$255, %ebx
	addl	$1, %esi
	subl	%edi, %ebx
	movzbl	2(%edx), %edi
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	3(%edx), %bl
	movb	%bl, 3(%edx)
	movzbl	(%ecx,%eax,4), %ebx
	subl	%edi, %ebx
	movzbl	1(%edx), %edi
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	2(%edx), %bl
	movb	%bl, 2(%edx)
	movzbl	1(%ecx,%eax,4), %ebx
	subl	%edi, %ebx
	movzbl	(%edx), %edi
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	1(%edx), %bl
	movb	%bl, 1(%edx)
	movzbl	2(%ecx,%eax,4), %ebx
	subl	%edi, %ebx
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	(%edx), %bl
	movb	%bl, (%edx)
.L22:
	addl	$1, %eax
	cmpl	-28(%ebp), %eax
	je	.L20
.L28:
	addl	$4, %edx
.L23:
	movzbl	3(%ecx,%eax,4), %ebx
	movzbl	%bl, %esi
	cmpl	$255, %esi
	jne	.L21
	movb	%bl, 3(%edx)
	movzbl	(%ecx,%eax,4), %ebx
	movb	%bl, 2(%edx)
	movzbl	1(%ecx,%eax,4), %ebx
	movb	%bl, 1(%edx)
	movzbl	2(%ecx,%eax,4), %ebx
	addl	$1, %eax
	movb	%bl, (%edx)
	cmpl	-28(%ebp), %eax
	jne	.L28
.L20:
	addl	$1, -32(%ebp)
	movl	-40(%ebp), %eax
	cmpl	%eax, -32(%ebp)
	je	.L19
	movl	-48(%ebp), %edx
	addl	-44(%ebp), %ecx
	addl	%edx, -36(%ebp)
	jmp	.L24
.L19:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ecx
	movl	140(%ecx), %eax
	testl	%eax, %eax
	je	.L26
	movl	12(%ebp), %ebx
	movl	12(%ebx), %edx
	movl	%edx, 16(%esp)
	movl	8(%ebx), %edx
	movl	%edx, 12(%esp)
	movl	20(%ebx), %edx
	movl	%edx, 8(%esp)
	movl	16(%ebx), %edx
	movl	%ecx, (%esp)
	movl	%edx, 4(%esp)
	call	*%eax
.L26:
	addl	$92, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_srcover_rgba8888_bgra8888, .-convblit_srcover_rgba8888_bgra8888
	.p2align 4,,15
.globl convblit_srcover_rgba8888_bgra8888_left
	.type	convblit_srcover_rgba8888_bgra8888_left, @function
convblit_srcover_rgba8888_bgra8888_left:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$92, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	8(%ebp), %ebx
	movl	32(%eax), %eax
	movl	56(%ecx), %edi
	movl	20(%ecx), %edx
	movl	%eax, -48(%ebp)
	movl	8(%ebx), %eax
	movl	64(%ecx), %ebx
	movl	%edi, -36(%ebp)
	subl	$1, %eax
	movl	%ebx, %esi
	negl	%esi
	movl	%esi, -32(%ebp)
	movl	%ecx, %esi
	movl	%esi, %edi
	movl	24(%esi), %esi
	movl	60(%edi), %edi
	subl	16(%ecx), %eax
	movl	%edx, 16(%ecx)
	movl	%edi, -28(%ebp)
	movl	12(%ebp), %edi
	movl	%eax, 20(%ecx)
	movl	28(%ecx), %ecx
	movl	12(%edi), %edi
	testl	%edi, %edi
	movl	%edi, -44(%ebp)
	jle	.L30
	imull	%ebx, %eax
	imull	-48(%ebp), %ecx
	leal	(%eax,%edx,4), %eax
	addl	-28(%ebp), %eax
	leal	(%ecx,%esi,4), %ecx
	addl	-36(%ebp), %ecx
	movl	%eax, -40(%ebp)
	movl	$0, -36(%ebp)
	.p2align 4,,7
	.p2align 3
.L35:
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	movl	%eax, -28(%ebp)
	jle	.L31
	movl	-40(%ebp), %edx
	xorl	%eax, %eax
	jmp	.L34
	.p2align 4,,7
	.p2align 3
.L32:
	testl	%esi, %esi
	je	.L33
	movzbl	3(%edx), %ebx
	addl	$1, %esi
	movl	%ebx, -60(%ebp)
	movl	$255, %ebx
	movzbl	2(%edx), %edi
	subl	-60(%ebp), %ebx
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	3(%edx), %bl
	movb	%bl, 3(%edx)
	movzbl	(%ecx,%eax,4), %ebx
	subl	%edi, %ebx
	movzbl	1(%edx), %edi
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	2(%edx), %bl
	movb	%bl, 2(%edx)
	movzbl	1(%ecx,%eax,4), %ebx
	subl	%edi, %ebx
	movzbl	(%edx), %edi
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	1(%edx), %bl
	movb	%bl, 1(%edx)
	movzbl	2(%ecx,%eax,4), %ebx
	subl	%edi, %ebx
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	(%edx), %bl
	movb	%bl, (%edx)
.L33:
	addl	$1, %eax
	cmpl	-28(%ebp), %eax
	je	.L31
.L39:
	addl	-32(%ebp), %edx
.L34:
	movzbl	3(%ecx,%eax,4), %ebx
	movzbl	%bl, %esi
	cmpl	$255, %esi
	jne	.L32
	movb	%bl, 3(%edx)
	movzbl	(%ecx,%eax,4), %ebx
	movb	%bl, 2(%edx)
	movzbl	1(%ecx,%eax,4), %ebx
	movb	%bl, 1(%edx)
	movzbl	2(%ecx,%eax,4), %ebx
	addl	$1, %eax
	movb	%bl, (%edx)
	cmpl	-28(%ebp), %eax
	jne	.L39
.L31:
	addl	$1, -36(%ebp)
	movl	-44(%ebp), %esi
	cmpl	%esi, -36(%ebp)
	je	.L30
	addl	-48(%ebp), %ecx
	addl	$4, -40(%ebp)
	jmp	.L35
.L30:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %edi
	movl	140(%edi), %edx
	testl	%edx, %edx
	je	.L37
	movl	12(%ebp), %eax
	movl	8(%eax), %ecx
	movl	%eax, %ebx
	movl	%ecx, 16(%esp)
	movl	12(%eax), %eax
	movl	%eax, 12(%esp)
	movl	20(%ebx), %eax
	addl	$1, %eax
	subl	%ecx, %eax
	movl	%eax, 8(%esp)
	movl	16(%ebx), %eax
	movl	%edi, (%esp)
	movl	%eax, 4(%esp)
	call	*%edx
.L37:
	addl	$92, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_srcover_rgba8888_bgra8888_left, .-convblit_srcover_rgba8888_bgra8888_left
	.p2align 4,,15
.globl convblit_srcover_rgba8888_bgra8888_right
	.type	convblit_srcover_rgba8888_bgra8888_right, @function
convblit_srcover_rgba8888_bgra8888_right:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$92, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	8(%ebp), %ebx
	movl	32(%eax), %eax
	movl	64(%ecx), %esi
	movl	56(%ecx), %edi
	movl	16(%ecx), %edx
	movl	%eax, -48(%ebp)
	movl	12(%ebx), %eax
	movl	%ecx, %ebx
	movl	%esi, -32(%ebp)
	movl	%ebx, %esi
	movl	24(%ebx), %ebx
	movl	%edi, -28(%ebp)
	movl	60(%esi), %edi
	movl	12(%esi), %esi
	subl	$1, %eax
	subl	20(%ecx), %eax
	movl	%edx, 20(%ecx)
	testl	%esi, %esi
	movl	%eax, 16(%ecx)
	movl	28(%ecx), %ecx
	movl	%esi, -44(%ebp)
	jle	.L41
	imull	-48(%ebp), %ecx
	imull	-32(%ebp), %edx
	movl	$0, -36(%ebp)
	leal	(%ecx,%ebx,4), %ecx
	leal	(%edx,%eax,4), %eax
	addl	-28(%ebp), %ecx
	leal	(%edi,%eax), %eax
	movl	%eax, -40(%ebp)
	.p2align 4,,7
	.p2align 3
.L46:
	movl	12(%ebp), %edi
	movl	8(%edi), %edi
	testl	%edi, %edi
	movl	%edi, -28(%ebp)
	jle	.L42
	movl	-40(%ebp), %edx
	xorl	%eax, %eax
	jmp	.L45
	.p2align 4,,7
	.p2align 3
.L43:
	testl	%esi, %esi
	je	.L44
	movzbl	3(%edx), %ebx
	addl	$1, %esi
	movl	%ebx, -60(%ebp)
	movl	$255, %ebx
	movzbl	2(%edx), %edi
	subl	-60(%ebp), %ebx
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	3(%edx), %bl
	movb	%bl, 3(%edx)
	movzbl	(%ecx,%eax,4), %ebx
	subl	%edi, %ebx
	movzbl	1(%edx), %edi
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	2(%edx), %bl
	movb	%bl, 2(%edx)
	movzbl	1(%ecx,%eax,4), %ebx
	subl	%edi, %ebx
	movzbl	(%edx), %edi
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	1(%edx), %bl
	movb	%bl, 1(%edx)
	movzbl	2(%ecx,%eax,4), %ebx
	subl	%edi, %ebx
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	(%edx), %bl
	movb	%bl, (%edx)
.L44:
	addl	$1, %eax
	cmpl	-28(%ebp), %eax
	je	.L42
.L50:
	addl	-32(%ebp), %edx
.L45:
	movzbl	3(%ecx,%eax,4), %ebx
	movzbl	%bl, %esi
	cmpl	$255, %esi
	jne	.L43
	movb	%bl, 3(%edx)
	movzbl	(%ecx,%eax,4), %ebx
	movb	%bl, 2(%edx)
	movzbl	1(%ecx,%eax,4), %ebx
	movb	%bl, 1(%edx)
	movzbl	2(%ecx,%eax,4), %ebx
	addl	$1, %eax
	movb	%bl, (%edx)
	cmpl	-28(%ebp), %eax
	jne	.L50
.L42:
	addl	$1, -36(%ebp)
	movl	-44(%ebp), %esi
	cmpl	%esi, -36(%ebp)
	je	.L41
	addl	-48(%ebp), %ecx
	subl	$4, -40(%ebp)
	jmp	.L46
.L41:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %edi
	movl	140(%edi), %edx
	testl	%edx, %edx
	je	.L48
	movl	12(%ebp), %eax
	movl	12(%eax), %ecx
	movl	%eax, %ebx
	movl	8(%eax), %eax
	movl	%ecx, 12(%esp)
	movl	%eax, 16(%esp)
	movl	20(%ebx), %eax
	movl	%eax, 8(%esp)
	movl	16(%ebx), %eax
	movl	%edi, (%esp)
	addl	$1, %eax
	subl	%ecx, %eax
	movl	%eax, 4(%esp)
	call	*%edx
.L48:
	addl	$92, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_srcover_rgba8888_bgra8888_right, .-convblit_srcover_rgba8888_bgra8888_right
	.p2align 4,,15
.globl convblit_srcover_rgba8888_bgra8888_down
	.type	convblit_srcover_rgba8888_bgra8888_down, @function
convblit_srcover_rgba8888_bgra8888_down:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$92, %esp
	movl	12(%ebp), %ecx
	movl	12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	56(%ecx), %edi
	movl	%ecx, %ebx
	movl	32(%eax), %eax
	movl	64(%ecx), %esi
	movl	%edi, -32(%ebp)
	movl	%ebx, %edi
	movl	24(%ebx), %ebx
	movl	%eax, -44(%ebp)
	movl	8(%edx), %eax
	movl	60(%edi), %edi
	subl	$1, %eax
	subl	16(%ecx), %eax
	movl	%edi, -28(%ebp)
	movl	12(%ebp), %edi
	movl	%eax, 16(%ecx)
	movl	12(%edx), %edx
	movl	12(%edi), %edi
	subl	$1, %edx
	subl	20(%ecx), %edx
	testl	%edi, %edi
	movl	%edi, -40(%ebp)
	movl	%edx, 20(%ecx)
	movl	28(%ecx), %ecx
	jle	.L52
	imull	%esi, %edx
	negl	%esi
	imull	-44(%ebp), %ecx
	movl	%esi, -48(%ebp)
	leal	(%edx,%eax,4), %eax
	addl	-28(%ebp), %eax
	leal	(%ecx,%ebx,4), %ecx
	addl	-32(%ebp), %ecx
	movl	%eax, -36(%ebp)
	movl	$0, -32(%ebp)
	.p2align 4,,7
	.p2align 3
.L57:
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	movl	%eax, -28(%ebp)
	jle	.L53
	movl	-36(%ebp), %edx
	xorl	%eax, %eax
	jmp	.L56
	.p2align 4,,7
	.p2align 3
.L54:
	testl	%esi, %esi
	je	.L55
	movzbl	3(%edx), %ebx
	addl	$1, %esi
	movl	%ebx, -60(%ebp)
	movl	$255, %ebx
	movzbl	2(%edx), %edi
	subl	-60(%ebp), %ebx
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	3(%edx), %bl
	movb	%bl, 3(%edx)
	movzbl	(%ecx,%eax,4), %ebx
	subl	%edi, %ebx
	movzbl	1(%edx), %edi
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	2(%edx), %bl
	movb	%bl, 2(%edx)
	movzbl	1(%ecx,%eax,4), %ebx
	subl	%edi, %ebx
	movzbl	(%edx), %edi
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	1(%edx), %bl
	movb	%bl, 1(%edx)
	movzbl	2(%ecx,%eax,4), %ebx
	subl	%edi, %ebx
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	(%edx), %bl
	movb	%bl, (%edx)
.L55:
	addl	$1, %eax
	cmpl	-28(%ebp), %eax
	je	.L53
.L61:
	subl	$4, %edx
.L56:
	movzbl	3(%ecx,%eax,4), %ebx
	movzbl	%bl, %esi
	cmpl	$255, %esi
	jne	.L54
	movb	%bl, 3(%edx)
	movzbl	(%ecx,%eax,4), %ebx
	movb	%bl, 2(%edx)
	movzbl	1(%ecx,%eax,4), %ebx
	movb	%bl, 1(%edx)
	movzbl	2(%ecx,%eax,4), %ebx
	addl	$1, %eax
	movb	%bl, (%edx)
	cmpl	-28(%ebp), %eax
	jne	.L61
.L53:
	addl	$1, -32(%ebp)
	movl	-40(%ebp), %esi
	cmpl	%esi, -32(%ebp)
	je	.L52
	movl	-48(%ebp), %edi
	addl	-44(%ebp), %ecx
	addl	%edi, -36(%ebp)
	jmp	.L57
.L52:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %eax
	movl	140(%eax), %edx
	testl	%edx, %edx
	je	.L59
	movl	12(%ebp), %ecx
	movl	8(%ebp), %edi
	movl	12(%ecx), %ebx
	movl	%ecx, %esi
	movl	8(%ecx), %ecx
	movl	%ebx, 16(%esp)
	movl	%ecx, 12(%esp)
	movl	20(%esi), %eax
	addl	$1, %eax
	subl	%ebx, %eax
	movl	%eax, 8(%esp)
	movl	16(%esi), %eax
	movl	%edi, (%esp)
	addl	$1, %eax
	subl	%ecx, %eax
	movl	%eax, 4(%esp)
	call	*%edx
.L59:
	addl	$92, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_srcover_rgba8888_bgra8888_down, .-convblit_srcover_rgba8888_bgra8888_down
	.p2align 4,,15
.globl convblit_copy_rgb888_bgra8888
	.type	convblit_copy_rgb888_bgra8888, @function
convblit_copy_rgb888_bgra8888:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	movl	12(%ebp), %ecx
	movl	12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	60(%ecx), %ebx
	movl	%ecx, %edi
	movl	32(%eax), %eax
	movl	64(%edx), %edx
	movl	56(%ecx), %esi
	movl	%ebx, -28(%ebp)
	movl	16(%edi), %ebx
	movl	12(%edi), %edi
	movl	%eax, -36(%ebp)
	movl	24(%ecx), %eax
	movl	%edx, -40(%ebp)
	movl	28(%ecx), %edx
	movl	20(%ecx), %ecx
	testl	%edi, %edi
	movl	%edi, -32(%ebp)
	jle	.L63
	imull	-36(%ebp), %edx
	xorl	%edi, %edi
	imull	-40(%ebp), %ecx
	leal	(%eax,%eax,2), %eax
	addl	%edx, %eax
	addl	%eax, %esi
	leal	(%ecx,%ebx,4), %eax
	addl	-28(%ebp), %eax
	movl	%eax, -28(%ebp)
	.p2align 4,,7
	.p2align 3
.L66:
	movl	12(%ebp), %edx
	movl	8(%edx), %eax
	testl	%eax, %eax
	jle	.L64
	movl	-28(%ebp), %edx
	leal	(%eax,%eax,2), %ebx
	movl	%esi, %eax
	leal	(%esi,%ebx), %ebx
	.p2align 4,,7
	.p2align 3
.L65:
	movb	$-1, 3(%edx)
	movzbl	(%eax), %ecx
	movb	%cl, 2(%edx)
	movzbl	1(%eax), %ecx
	movb	%cl, 1(%edx)
	movzbl	2(%eax), %ecx
	addl	$3, %eax
	movb	%cl, (%edx)
	addl	$4, %edx
	cmpl	%ebx, %eax
	jne	.L65
.L64:
	addl	$1, %edi
	cmpl	-32(%ebp), %edi
	je	.L63
	movl	-40(%ebp), %ecx
	addl	-36(%ebp), %esi
	addl	%ecx, -28(%ebp)
	jmp	.L66
.L63:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ebx
	movl	140(%ebx), %eax
	testl	%eax, %eax
	je	.L68
	movl	12(%ebp), %edi
	movl	12(%edi), %edx
	movl	%edx, 16(%esp)
	movl	8(%edi), %edx
	movl	%edx, 12(%esp)
	movl	20(%edi), %edx
	movl	%edx, 8(%esp)
	movl	16(%edi), %edx
	movl	%ebx, (%esp)
	movl	%edx, 4(%esp)
	call	*%eax
.L68:
	addl	$60, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_rgb888_bgra8888, .-convblit_copy_rgb888_bgra8888
	.p2align 4,,15
.globl convblit_copy_rgb888_bgra8888_left
	.type	convblit_copy_rgb888_bgra8888_left, @function
convblit_copy_rgb888_bgra8888_left:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$92, %esp
	movl	12(%ebp), %eax
	movl	8(%ebp), %ebx
	movl	12(%ebp), %edx
	movl	32(%eax), %eax
	movl	20(%edx), %ecx
	movl	%eax, -40(%ebp)
	movl	8(%ebx), %eax
	movl	64(%edx), %ebx
	subl	$1, %eax
	subl	16(%edx), %eax
	movl	%ebx, %esi
	negl	%esi
	movl	%ecx, 16(%edx)
	movl	%eax, 20(%edx)
	movl	56(%edx), %edx
	movl	%esi, -60(%ebp)
	movl	12(%ebp), %esi
	movl	%edx, -32(%ebp)
	movl	28(%esi), %edi
	movl	24(%esi), %edx
	movl	60(%esi), %esi
	movl	%esi, -28(%ebp)
	movl	12(%ebp), %esi
	movl	12(%esi), %esi
	testl	%esi, %esi
	movl	%esi, -36(%ebp)
	jle	.L71
	leal	(%edx,%edx,2), %esi
	movl	-40(%ebp), %edx
	imull	%ebx, %eax
	imull	%edi, %edx
	movl	-32(%ebp), %edi
	leal	(%eax,%ecx,4), %eax
	addl	-28(%ebp), %eax
	movl	$0, -28(%ebp)
	addl	%esi, %edx
	movl	-60(%ebp), %esi
	addl	%edx, %edi
	movl	%eax, -32(%ebp)
	.p2align 4,,7
	.p2align 3
.L74:
	movl	12(%ebp), %edx
	movl	8(%edx), %eax
	testl	%eax, %eax
	jle	.L72
	movl	-32(%ebp), %edx
	leal	(%eax,%eax,2), %ebx
	movl	%edi, %eax
	leal	(%edi,%ebx), %ebx
	.p2align 4,,7
	.p2align 3
.L73:
	movb	$-1, 3(%edx)
	movzbl	(%eax), %ecx
	movb	%cl, 2(%edx)
	movzbl	1(%eax), %ecx
	movb	%cl, 1(%edx)
	movzbl	2(%eax), %ecx
	addl	$3, %eax
	movb	%cl, (%edx)
	addl	%esi, %edx
	cmpl	%ebx, %eax
	jne	.L73
.L72:
	addl	$1, -28(%ebp)
	movl	-36(%ebp), %ecx
	cmpl	%ecx, -28(%ebp)
	je	.L71
	addl	-40(%ebp), %edi
	addl	$4, -32(%ebp)
	jmp	.L74
.L71:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ebx
	movl	140(%ebx), %edx
	testl	%edx, %edx
	je	.L76
	movl	12(%ebp), %esi
	movl	8(%esi), %ecx
	movl	%ecx, 16(%esp)
	movl	12(%esi), %eax
	movl	%eax, 12(%esp)
	movl	20(%esi), %eax
	addl	$1, %eax
	subl	%ecx, %eax
	movl	%eax, 8(%esp)
	movl	16(%esi), %eax
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	*%edx
.L76:
	addl	$92, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_rgb888_bgra8888_left, .-convblit_copy_rgb888_bgra8888_left
	.p2align 4,,15
.globl convblit_copy_rgb888_bgra8888_right
	.type	convblit_copy_rgb888_bgra8888_right, @function
convblit_copy_rgb888_bgra8888_right:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	movl	12(%ebp), %edx
	movl	12(%ebp), %eax
	movl	8(%ebp), %ebx
	movl	56(%edx), %edi
	movl	32(%eax), %eax
	movl	16(%edx), %ecx
	movl	64(%edx), %esi
	movl	%edi, -32(%ebp)
	movl	%edx, %edi
	movl	60(%edi), %edi
	movl	%eax, -40(%ebp)
	movl	12(%ebx), %eax
	movl	28(%edx), %ebx
	movl	%edi, -28(%ebp)
	movl	12(%ebp), %edi
	subl	$1, %eax
	subl	20(%edx), %eax
	movl	%ecx, 20(%edx)
	movl	12(%edi), %edi
	movl	%eax, 16(%edx)
	movl	24(%edx), %edx
	testl	%edi, %edi
	movl	%edi, -36(%ebp)
	jle	.L79
	leal	(%edx,%edx,2), %edi
	movl	-40(%ebp), %edx
	imull	%ebx, %edx
	addl	%edx, %edi
	movl	%esi, %edx
	imull	%ecx, %edx
	addl	-32(%ebp), %edi
	leal	(%edx,%eax,4), %eax
	addl	-28(%ebp), %eax
	movl	$0, -28(%ebp)
	movl	%eax, -32(%ebp)
	.p2align 4,,7
	.p2align 3
.L82:
	movl	12(%ebp), %edx
	movl	8(%edx), %eax
	testl	%eax, %eax
	jle	.L80
	movl	-32(%ebp), %edx
	leal	(%eax,%eax,2), %ebx
	movl	%edi, %eax
	leal	(%edi,%ebx), %ebx
	.p2align 4,,7
	.p2align 3
.L81:
	movb	$-1, 3(%edx)
	movzbl	(%eax), %ecx
	movb	%cl, 2(%edx)
	movzbl	1(%eax), %ecx
	movb	%cl, 1(%edx)
	movzbl	2(%eax), %ecx
	addl	$3, %eax
	movb	%cl, (%edx)
	addl	%esi, %edx
	cmpl	%ebx, %eax
	jne	.L81
.L80:
	addl	$1, -28(%ebp)
	movl	-36(%ebp), %ebx
	cmpl	%ebx, -28(%ebp)
	je	.L79
	addl	-40(%ebp), %edi
	subl	$4, -32(%ebp)
	jmp	.L82
.L79:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %edi
	movl	140(%edi), %edx
	testl	%edx, %edx
	je	.L84
	movl	12(%ebp), %eax
	movl	12(%eax), %ecx
	movl	%eax, %ebx
	movl	8(%eax), %eax
	movl	%ecx, 12(%esp)
	movl	%eax, 16(%esp)
	movl	20(%ebx), %eax
	movl	%eax, 8(%esp)
	movl	16(%ebx), %eax
	movl	%edi, (%esp)
	addl	$1, %eax
	subl	%ecx, %eax
	movl	%eax, 4(%esp)
	call	*%edx
.L84:
	addl	$60, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_rgb888_bgra8888_right, .-convblit_copy_rgb888_bgra8888_right
	.p2align 4,,15
.globl convblit_copy_rgb888_bgra8888_down
	.type	convblit_copy_rgb888_bgra8888_down, @function
convblit_copy_rgb888_bgra8888_down:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	movl	12(%ebp), %ecx
	movl	12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	56(%ecx), %esi
	movl	32(%eax), %eax
	movl	64(%ecx), %edi
	movl	28(%ecx), %ebx
	movl	%esi, -36(%ebp)
	movl	%ecx, %esi
	movl	%eax, -40(%ebp)
	movl	8(%edx), %eax
	movl	60(%esi), %esi
	subl	$1, %eax
	subl	16(%ecx), %eax
	movl	%esi, -28(%ebp)
	movl	12(%ebp), %esi
	movl	%eax, 16(%ecx)
	movl	12(%edx), %edx
	movl	12(%esi), %esi
	subl	$1, %edx
	subl	20(%ecx), %edx
	testl	%esi, %esi
	movl	%esi, -32(%ebp)
	movl	%edx, 20(%ecx)
	movl	24(%ecx), %ecx
	jle	.L87
	leal	(%ecx,%ecx,2), %esi
	movl	-40(%ebp), %ecx
	imull	%edi, %edx
	negl	%edi
	imull	%ebx, %ecx
	leal	(%edx,%eax,4), %eax
	addl	-28(%ebp), %eax
	leal	(%esi,%ecx), %ecx
	movl	-36(%ebp), %esi
	movl	%eax, -28(%ebp)
	movl	%edi, -36(%ebp)
	xorl	%edi, %edi
	addl	%ecx, %esi
	.p2align 4,,7
	.p2align 3
.L90:
	movl	12(%ebp), %edx
	movl	8(%edx), %eax
	testl	%eax, %eax
	jle	.L88
	movl	-28(%ebp), %edx
	leal	(%eax,%eax,2), %ebx
	movl	%esi, %eax
	leal	(%esi,%ebx), %ebx
	.p2align 4,,7
	.p2align 3
.L89:
	movb	$-1, 3(%edx)
	movzbl	(%eax), %ecx
	movb	%cl, 2(%edx)
	movzbl	1(%eax), %ecx
	movb	%cl, 1(%edx)
	movzbl	2(%eax), %ecx
	addl	$3, %eax
	movb	%cl, (%edx)
	subl	$4, %edx
	cmpl	%ebx, %eax
	jne	.L89
.L88:
	addl	$1, %edi
	cmpl	-32(%ebp), %edi
	je	.L87
	movl	-36(%ebp), %ecx
	addl	-40(%ebp), %esi
	addl	%ecx, -28(%ebp)
	jmp	.L90
.L87:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ebx
	movl	140(%ebx), %edx
	testl	%edx, %edx
	je	.L92
	movl	12(%ebp), %esi
	movl	12(%esi), %ebx
	movl	8(%esi), %ecx
	movl	%ebx, 16(%esp)
	movl	%ecx, 12(%esp)
	movl	20(%esi), %eax
	addl	$1, %eax
	subl	%ebx, %eax
	movl	%eax, 8(%esp)
	movl	16(%esi), %eax
	addl	$1, %eax
	subl	%ecx, %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	*%edx
.L92:
	addl	$60, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_rgb888_bgra8888_down, .-convblit_copy_rgb888_bgra8888_down
	.p2align 4,,15
.globl convblit_srcover_rgba8888_bgr888
	.type	convblit_srcover_rgba8888_bgr888, @function
convblit_srcover_rgba8888_bgr888:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$76, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	32(%eax), %eax
	movl	%ecx, %edi
	movl	56(%ecx), %ebx
	movl	20(%edi), %esi
	movl	64(%edx), %edx
	movl	%eax, -44(%ebp)
	movl	60(%edi), %eax
	movl	%edx, -48(%ebp)
	movl	28(%ecx), %edx
	movl	%eax, -28(%ebp)
	movl	16(%edi), %eax
	movl	12(%edi), %edi
	movl	24(%ecx), %ecx
	testl	%edi, %edi
	movl	%edi, -40(%ebp)
	jle	.L95
	imull	-44(%ebp), %edx
	movl	$0, -32(%ebp)
	leal	(%edx,%ecx,4), %ecx
	leal	(%eax,%eax,2), %edx
	movl	-48(%ebp), %eax
	leal	(%ebx,%ecx), %ecx
	imull	%esi, %eax
	leal	(%edx,%eax), %eax
	addl	-28(%ebp), %eax
	movl	%eax, -36(%ebp)
	.p2align 4,,7
	.p2align 3
.L100:
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	movl	%eax, -28(%ebp)
	jle	.L96
	movl	-36(%ebp), %edx
	xorl	%eax, %eax
	jmp	.L99
	.p2align 4,,7
	.p2align 3
.L97:
	testl	%esi, %esi
	je	.L98
	movzbl	(%ecx,%eax,4), %ebx
	addl	$1, %esi
	movzbl	2(%edx), %edi
	subl	%edi, %ebx
	movzbl	1(%edx), %edi
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	2(%edx), %bl
	movb	%bl, 2(%edx)
	movzbl	1(%ecx,%eax,4), %ebx
	subl	%edi, %ebx
	movzbl	(%edx), %edi
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	1(%edx), %bl
	movb	%bl, 1(%edx)
	movzbl	2(%ecx,%eax,4), %ebx
	subl	%edi, %ebx
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	(%edx), %bl
	movb	%bl, (%edx)
.L98:
	addl	$1, %eax
	cmpl	-28(%ebp), %eax
	je	.L96
.L104:
	addl	$3, %edx
.L99:
	movzbl	3(%ecx,%eax,4), %esi
	cmpl	$255, %esi
	jne	.L97
	movzbl	(%ecx,%eax,4), %ebx
	movb	%bl, 2(%edx)
	movzbl	1(%ecx,%eax,4), %ebx
	movb	%bl, 1(%edx)
	movzbl	2(%ecx,%eax,4), %ebx
	addl	$1, %eax
	movb	%bl, (%edx)
	cmpl	-28(%ebp), %eax
	jne	.L104
.L96:
	addl	$1, -32(%ebp)
	movl	-40(%ebp), %edx
	cmpl	%edx, -32(%ebp)
	je	.L95
	movl	-48(%ebp), %ebx
	addl	-44(%ebp), %ecx
	addl	%ebx, -36(%ebp)
	jmp	.L100
.L95:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %edi
	movl	140(%edi), %eax
	testl	%eax, %eax
	je	.L102
	movl	12(%ebp), %ecx
	movl	12(%ecx), %edx
	movl	%edx, 16(%esp)
	movl	8(%ecx), %edx
	movl	%edx, 12(%esp)
	movl	20(%ecx), %edx
	movl	%edx, 8(%esp)
	movl	16(%ecx), %edx
	movl	%edi, (%esp)
	movl	%edx, 4(%esp)
	call	*%eax
.L102:
	addl	$76, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_srcover_rgba8888_bgr888, .-convblit_srcover_rgba8888_bgr888
	.p2align 4,,15
.globl convblit_srcover_rgba8888_bgr888_left
	.type	convblit_srcover_rgba8888_bgr888_left, @function
convblit_srcover_rgba8888_bgr888_left:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$76, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	8(%ebp), %ebx
	movl	32(%eax), %eax
	movl	56(%ecx), %edi
	movl	20(%ecx), %edx
	movl	%eax, -48(%ebp)
	movl	8(%ebx), %eax
	movl	64(%ecx), %ebx
	movl	%edi, -36(%ebp)
	subl	$1, %eax
	movl	%ebx, %esi
	negl	%esi
	movl	%esi, -32(%ebp)
	movl	%ecx, %esi
	movl	%esi, %edi
	movl	24(%esi), %esi
	movl	60(%edi), %edi
	subl	16(%ecx), %eax
	movl	%edx, 16(%ecx)
	movl	%edi, -28(%ebp)
	movl	12(%ebp), %edi
	movl	%eax, 20(%ecx)
	movl	28(%ecx), %ecx
	movl	12(%edi), %edi
	testl	%edi, %edi
	movl	%edi, -44(%ebp)
	jle	.L106
	imull	%eax, %ebx
	imull	-48(%ebp), %ecx
	leal	(%edx,%edx,2), %eax
	leal	(%ebx,%eax), %eax
	addl	-28(%ebp), %eax
	leal	(%ecx,%esi,4), %ecx
	addl	-36(%ebp), %ecx
	movl	%eax, -40(%ebp)
	movl	$0, -36(%ebp)
	.p2align 4,,7
	.p2align 3
.L111:
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	movl	%eax, -28(%ebp)
	jle	.L107
	movl	-40(%ebp), %edx
	xorl	%eax, %eax
	jmp	.L110
	.p2align 4,,7
	.p2align 3
.L108:
	testl	%esi, %esi
	je	.L109
	movzbl	(%ecx,%eax,4), %ebx
	addl	$1, %esi
	movzbl	2(%edx), %edi
	subl	%edi, %ebx
	movzbl	1(%edx), %edi
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	2(%edx), %bl
	movb	%bl, 2(%edx)
	movzbl	1(%ecx,%eax,4), %ebx
	subl	%edi, %ebx
	movzbl	(%edx), %edi
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	1(%edx), %bl
	movb	%bl, 1(%edx)
	movzbl	2(%ecx,%eax,4), %ebx
	subl	%edi, %ebx
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	(%edx), %bl
	movb	%bl, (%edx)
.L109:
	addl	$1, %eax
	cmpl	-28(%ebp), %eax
	je	.L107
.L115:
	addl	-32(%ebp), %edx
.L110:
	movzbl	3(%ecx,%eax,4), %esi
	cmpl	$255, %esi
	jne	.L108
	movzbl	(%ecx,%eax,4), %ebx
	movb	%bl, 2(%edx)
	movzbl	1(%ecx,%eax,4), %ebx
	movb	%bl, 1(%edx)
	movzbl	2(%ecx,%eax,4), %ebx
	addl	$1, %eax
	movb	%bl, (%edx)
	cmpl	-28(%ebp), %eax
	jne	.L115
.L107:
	addl	$1, -36(%ebp)
	movl	-44(%ebp), %ebx
	cmpl	%ebx, -36(%ebp)
	je	.L106
	addl	-48(%ebp), %ecx
	addl	$3, -40(%ebp)
	jmp	.L111
.L106:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %esi
	movl	140(%esi), %edx
	testl	%edx, %edx
	je	.L113
	movl	12(%ebp), %edi
	movl	8(%edi), %ecx
	movl	%ecx, 16(%esp)
	movl	12(%edi), %eax
	movl	%eax, 12(%esp)
	movl	20(%edi), %eax
	addl	$1, %eax
	subl	%ecx, %eax
	movl	%eax, 8(%esp)
	movl	16(%edi), %eax
	movl	%esi, (%esp)
	movl	%eax, 4(%esp)
	call	*%edx
.L113:
	addl	$76, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_srcover_rgba8888_bgr888_left, .-convblit_srcover_rgba8888_bgr888_left
	.p2align 4,,15
.globl convblit_srcover_rgba8888_bgr888_right
	.type	convblit_srcover_rgba8888_bgr888_right, @function
convblit_srcover_rgba8888_bgr888_right:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$76, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	8(%ebp), %ebx
	movl	32(%eax), %eax
	movl	64(%ecx), %edi
	movl	16(%ecx), %edx
	movl	56(%ecx), %esi
	movl	%eax, -48(%ebp)
	movl	12(%ebx), %eax
	movl	%ecx, %ebx
	movl	%edi, -32(%ebp)
	movl	%ebx, %edi
	movl	24(%ebx), %ebx
	movl	60(%edi), %edi
	subl	$1, %eax
	subl	20(%ecx), %eax
	movl	%edi, -28(%ebp)
	movl	12(%ebp), %edi
	movl	%edx, 20(%ecx)
	movl	%eax, 16(%ecx)
	movl	28(%ecx), %ecx
	movl	12(%edi), %edi
	testl	%edi, %edi
	movl	%edi, -44(%ebp)
	jle	.L117
	imull	-32(%ebp), %edx
	imull	-48(%ebp), %ecx
	leal	(%eax,%eax,2), %eax
	movl	$0, -36(%ebp)
	addl	%edx, %eax
	addl	-28(%ebp), %eax
	leal	(%ecx,%ebx,4), %ecx
	leal	(%esi,%ecx), %ecx
	movl	%eax, -40(%ebp)
	.p2align 4,,7
	.p2align 3
.L122:
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	movl	%eax, -28(%ebp)
	jle	.L118
	movl	-40(%ebp), %edx
	xorl	%eax, %eax
	jmp	.L121
	.p2align 4,,7
	.p2align 3
.L119:
	testl	%esi, %esi
	je	.L120
	movzbl	(%ecx,%eax,4), %ebx
	addl	$1, %esi
	movzbl	2(%edx), %edi
	subl	%edi, %ebx
	movzbl	1(%edx), %edi
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	2(%edx), %bl
	movb	%bl, 2(%edx)
	movzbl	1(%ecx,%eax,4), %ebx
	subl	%edi, %ebx
	movzbl	(%edx), %edi
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	1(%edx), %bl
	movb	%bl, 1(%edx)
	movzbl	2(%ecx,%eax,4), %ebx
	subl	%edi, %ebx
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	(%edx), %bl
	movb	%bl, (%edx)
.L120:
	addl	$1, %eax
	cmpl	-28(%ebp), %eax
	je	.L118
.L126:
	addl	-32(%ebp), %edx
.L121:
	movzbl	3(%ecx,%eax,4), %esi
	cmpl	$255, %esi
	jne	.L119
	movzbl	(%ecx,%eax,4), %ebx
	movb	%bl, 2(%edx)
	movzbl	1(%ecx,%eax,4), %ebx
	movb	%bl, 1(%edx)
	movzbl	2(%ecx,%eax,4), %ebx
	addl	$1, %eax
	movb	%bl, (%edx)
	cmpl	-28(%ebp), %eax
	jne	.L126
.L118:
	addl	$1, -36(%ebp)
	movl	-44(%ebp), %ebx
	cmpl	%ebx, -36(%ebp)
	je	.L117
	addl	-48(%ebp), %ecx
	subl	$3, -40(%ebp)
	jmp	.L122
.L117:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %edi
	movl	140(%edi), %edx
	testl	%edx, %edx
	je	.L124
	movl	12(%ebp), %eax
	movl	12(%eax), %ecx
	movl	%eax, %ebx
	movl	8(%eax), %eax
	movl	%ecx, 12(%esp)
	movl	%eax, 16(%esp)
	movl	20(%ebx), %eax
	movl	%eax, 8(%esp)
	movl	16(%ebx), %eax
	movl	%edi, (%esp)
	addl	$1, %eax
	subl	%ecx, %eax
	movl	%eax, 4(%esp)
	call	*%edx
.L124:
	addl	$76, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_srcover_rgba8888_bgr888_right, .-convblit_srcover_rgba8888_bgr888_right
	.p2align 4,,15
.globl convblit_srcover_rgba8888_bgr888_down
	.type	convblit_srcover_rgba8888_bgr888_down, @function
convblit_srcover_rgba8888_bgr888_down:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$76, %esp
	movl	12(%ebp), %ecx
	movl	12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	56(%ecx), %edi
	movl	%ecx, %ebx
	movl	32(%eax), %eax
	movl	64(%ecx), %esi
	movl	%edi, -32(%ebp)
	movl	%ebx, %edi
	movl	24(%ebx), %ebx
	movl	%eax, -44(%ebp)
	movl	8(%edx), %eax
	movl	60(%edi), %edi
	subl	$1, %eax
	subl	16(%ecx), %eax
	movl	%edi, -28(%ebp)
	movl	12(%ebp), %edi
	movl	%eax, 16(%ecx)
	movl	12(%edx), %edx
	movl	12(%edi), %edi
	subl	$1, %edx
	subl	20(%ecx), %edx
	testl	%edi, %edi
	movl	%edi, -40(%ebp)
	movl	%edx, 20(%ecx)
	movl	28(%ecx), %ecx
	jle	.L128
	imull	%esi, %edx
	negl	%esi
	imull	-44(%ebp), %ecx
	leal	(%eax,%eax,2), %eax
	movl	%esi, -48(%ebp)
	addl	%edx, %eax
	addl	-28(%ebp), %eax
	leal	(%ecx,%ebx,4), %ecx
	addl	-32(%ebp), %ecx
	movl	%eax, -36(%ebp)
	movl	$0, -32(%ebp)
	.p2align 4,,7
	.p2align 3
.L133:
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	movl	%eax, -28(%ebp)
	jle	.L129
	movl	-36(%ebp), %edx
	xorl	%eax, %eax
	jmp	.L132
	.p2align 4,,7
	.p2align 3
.L130:
	testl	%esi, %esi
	je	.L131
	movzbl	(%ecx,%eax,4), %ebx
	addl	$1, %esi
	movzbl	2(%edx), %edi
	subl	%edi, %ebx
	movzbl	1(%edx), %edi
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	2(%edx), %bl
	movb	%bl, 2(%edx)
	movzbl	1(%ecx,%eax,4), %ebx
	subl	%edi, %ebx
	movzbl	(%edx), %edi
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	1(%edx), %bl
	movb	%bl, 1(%edx)
	movzbl	2(%ecx,%eax,4), %ebx
	subl	%edi, %ebx
	imull	%esi, %ebx
	shrl	$8, %ebx
	addb	(%edx), %bl
	movb	%bl, (%edx)
.L131:
	addl	$1, %eax
	cmpl	-28(%ebp), %eax
	je	.L129
.L137:
	subl	$3, %edx
.L132:
	movzbl	3(%ecx,%eax,4), %esi
	cmpl	$255, %esi
	jne	.L130
	movzbl	(%ecx,%eax,4), %ebx
	movb	%bl, 2(%edx)
	movzbl	1(%ecx,%eax,4), %ebx
	movb	%bl, 1(%edx)
	movzbl	2(%ecx,%eax,4), %ebx
	addl	$1, %eax
	movb	%bl, (%edx)
	cmpl	-28(%ebp), %eax
	jne	.L137
.L129:
	addl	$1, -32(%ebp)
	movl	-40(%ebp), %edx
	cmpl	%edx, -32(%ebp)
	je	.L128
	movl	-48(%ebp), %ebx
	addl	-44(%ebp), %ecx
	addl	%ebx, -36(%ebp)
	jmp	.L133
.L128:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %esi
	movl	140(%esi), %edx
	testl	%edx, %edx
	je	.L135
	movl	12(%ebp), %edi
	movl	12(%edi), %ebx
	movl	8(%edi), %ecx
	movl	%ebx, 16(%esp)
	movl	%ecx, 12(%esp)
	movl	20(%edi), %eax
	addl	$1, %eax
	subl	%ebx, %eax
	movl	%eax, 8(%esp)
	movl	16(%edi), %eax
	movl	%esi, (%esp)
	addl	$1, %eax
	subl	%ecx, %eax
	movl	%eax, 4(%esp)
	call	*%edx
.L135:
	addl	$76, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_srcover_rgba8888_bgr888_down, .-convblit_srcover_rgba8888_bgr888_down
	.p2align 4,,15
.globl convblit_copy_rgb888_bgr888
	.type	convblit_copy_rgb888_bgr888, @function
convblit_copy_rgb888_bgr888:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$76, %esp
	movl	12(%ebp), %ecx
	movl	12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%ecx, %ebx
	movl	56(%ecx), %esi
	movl	32(%eax), %eax
	movl	60(%ebx), %edi
	movl	64(%edx), %edx
	movl	28(%ecx), %ecx
	movl	%eax, -32(%ebp)
	movl	%ebx, %eax
	movl	%edi, -44(%ebp)
	movl	%eax, %edi
	movl	16(%eax), %eax
	movl	12(%edi), %edi
	movl	%edx, -36(%ebp)
	movl	24(%ebx), %edx
	movl	20(%ebx), %ebx
	testl	%edi, %edi
	movl	%edi, -28(%ebp)
	jle	.L139
	imull	-32(%ebp), %ecx
	xorl	%edi, %edi
	leal	(%edx,%edx,2), %edx
	leal	(%edx,%ecx), %ecx
	leal	(%eax,%eax,2), %edx
	movl	-36(%ebp), %eax
	leal	(%esi,%ecx), %ecx
	imull	%ebx, %eax
	addl	%eax, %edx
	addl	-44(%ebp), %edx
	.p2align 4,,7
	.p2align 3
.L142:
	movl	12(%ebp), %ebx
	movl	8(%ebx), %eax
	testl	%eax, %eax
	jle	.L140
	leal	(%eax,%eax,2), %esi
	xorl	%eax, %eax
	.p2align 4,,7
	.p2align 3
.L141:
	movzbl	(%ecx,%eax), %ebx
	movb	%bl, 2(%edx,%eax)
	movzbl	1(%ecx,%eax), %ebx
	movb	%bl, 1(%edx,%eax)
	movzbl	2(%ecx,%eax), %ebx
	movb	%bl, (%edx,%eax)
	addl	$3, %eax
	cmpl	%esi, %eax
	jne	.L141
.L140:
	addl	$1, %edi
	cmpl	-28(%ebp), %edi
	je	.L139
	addl	-32(%ebp), %ecx
	addl	-36(%ebp), %edx
	jmp	.L142
.L139:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %edi
	movl	140(%edi), %eax
	testl	%eax, %eax
	je	.L144
	movl	12(%ebp), %ecx
	movl	12(%ecx), %edx
	movl	%edx, 16(%esp)
	movl	8(%ecx), %edx
	movl	%edx, 12(%esp)
	movl	20(%ecx), %edx
	movl	%edx, 8(%esp)
	movl	16(%ecx), %edx
	movl	%edi, (%esp)
	movl	%edx, 4(%esp)
	call	*%eax
.L144:
	addl	$76, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_rgb888_bgr888, .-convblit_copy_rgb888_bgr888
	.p2align 4,,15
.globl convblit_copy_rgb888_bgr888_left
	.type	convblit_copy_rgb888_bgr888_left, @function
convblit_copy_rgb888_bgr888_left:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$92, %esp
	movl	12(%ebp), %eax
	movl	8(%ebp), %ebx
	movl	12(%ebp), %edx
	movl	32(%eax), %eax
	movl	20(%edx), %ecx
	movl	%eax, -40(%ebp)
	movl	8(%ebx), %eax
	movl	64(%edx), %ebx
	subl	$1, %eax
	subl	16(%edx), %eax
	movl	%ebx, %esi
	negl	%esi
	movl	%ecx, 16(%edx)
	movl	%eax, 20(%edx)
	movl	56(%edx), %edx
	movl	%esi, -60(%ebp)
	movl	12(%ebp), %esi
	movl	%edx, -32(%ebp)
	movl	28(%esi), %edi
	movl	24(%esi), %edx
	movl	60(%esi), %esi
	movl	%esi, -28(%ebp)
	movl	12(%ebp), %esi
	movl	12(%esi), %esi
	testl	%esi, %esi
	movl	%esi, -36(%ebp)
	jle	.L147
	leal	(%edx,%edx,2), %esi
	movl	-40(%ebp), %edx
	imull	%eax, %ebx
	leal	(%ecx,%ecx,2), %eax
	imull	%edi, %edx
	movl	-32(%ebp), %edi
	leal	(%ebx,%eax), %eax
	addl	-28(%ebp), %eax
	movl	$0, -28(%ebp)
	addl	%esi, %edx
	movl	-60(%ebp), %esi
	addl	%edx, %edi
	movl	%eax, -32(%ebp)
	.p2align 4,,7
	.p2align 3
.L150:
	movl	12(%ebp), %edx
	movl	8(%edx), %eax
	testl	%eax, %eax
	jle	.L148
	movl	-32(%ebp), %edx
	leal	(%eax,%eax,2), %ebx
	movl	%edi, %eax
	leal	(%edi,%ebx), %ebx
	.p2align 4,,7
	.p2align 3
.L149:
	movzbl	(%eax), %ecx
	movb	%cl, 2(%edx)
	movzbl	1(%eax), %ecx
	movb	%cl, 1(%edx)
	movzbl	2(%eax), %ecx
	addl	$3, %eax
	movb	%cl, (%edx)
	addl	%esi, %edx
	cmpl	%ebx, %eax
	jne	.L149
.L148:
	addl	$1, -28(%ebp)
	movl	-36(%ebp), %ecx
	cmpl	%ecx, -28(%ebp)
	je	.L147
	addl	-40(%ebp), %edi
	addl	$3, -32(%ebp)
	jmp	.L150
.L147:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ebx
	movl	140(%ebx), %edx
	testl	%edx, %edx
	je	.L152
	movl	12(%ebp), %esi
	movl	8(%esi), %ecx
	movl	%ecx, 16(%esp)
	movl	12(%esi), %eax
	movl	%eax, 12(%esp)
	movl	20(%esi), %eax
	addl	$1, %eax
	subl	%ecx, %eax
	movl	%eax, 8(%esp)
	movl	16(%esi), %eax
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	*%edx
.L152:
	addl	$92, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_rgb888_bgr888_left, .-convblit_copy_rgb888_bgr888_left
	.p2align 4,,15
.globl convblit_copy_rgb888_bgr888_right
	.type	convblit_copy_rgb888_bgr888_right, @function
convblit_copy_rgb888_bgr888_right:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	movl	12(%ebp), %edx
	movl	12(%ebp), %eax
	movl	8(%ebp), %ebx
	movl	56(%edx), %edi
	movl	32(%eax), %eax
	movl	16(%edx), %ecx
	movl	64(%edx), %esi
	movl	%edi, -32(%ebp)
	movl	%edx, %edi
	movl	60(%edi), %edi
	movl	%eax, -40(%ebp)
	movl	12(%ebx), %eax
	movl	28(%edx), %ebx
	movl	%edi, -28(%ebp)
	movl	12(%ebp), %edi
	subl	$1, %eax
	subl	20(%edx), %eax
	movl	%ecx, 20(%edx)
	movl	12(%edi), %edi
	movl	%eax, 16(%edx)
	movl	24(%edx), %edx
	testl	%edi, %edi
	movl	%edi, -36(%ebp)
	jle	.L155
	leal	(%edx,%edx,2), %edi
	movl	-40(%ebp), %edx
	imull	%esi, %ecx
	leal	(%eax,%eax,2), %eax
	imull	%ebx, %edx
	addl	%ecx, %eax
	addl	-28(%ebp), %eax
	movl	$0, -28(%ebp)
	addl	%edx, %edi
	addl	-32(%ebp), %edi
	movl	%eax, -32(%ebp)
	.p2align 4,,7
	.p2align 3
.L158:
	movl	12(%ebp), %edx
	movl	8(%edx), %eax
	testl	%eax, %eax
	jle	.L156
	movl	-32(%ebp), %edx
	leal	(%eax,%eax,2), %ebx
	movl	%edi, %eax
	leal	(%edi,%ebx), %ebx
	.p2align 4,,7
	.p2align 3
.L157:
	movzbl	(%eax), %ecx
	movb	%cl, 2(%edx)
	movzbl	1(%eax), %ecx
	movb	%cl, 1(%edx)
	movzbl	2(%eax), %ecx
	addl	$3, %eax
	movb	%cl, (%edx)
	addl	%esi, %edx
	cmpl	%ebx, %eax
	jne	.L157
.L156:
	addl	$1, -28(%ebp)
	movl	-36(%ebp), %ebx
	cmpl	%ebx, -28(%ebp)
	je	.L155
	addl	-40(%ebp), %edi
	subl	$3, -32(%ebp)
	jmp	.L158
.L155:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %edi
	movl	140(%edi), %edx
	testl	%edx, %edx
	je	.L160
	movl	12(%ebp), %eax
	movl	12(%eax), %ecx
	movl	%eax, %ebx
	movl	8(%eax), %eax
	movl	%ecx, 12(%esp)
	movl	%eax, 16(%esp)
	movl	20(%ebx), %eax
	movl	%eax, 8(%esp)
	movl	16(%ebx), %eax
	movl	%edi, (%esp)
	addl	$1, %eax
	subl	%ecx, %eax
	movl	%eax, 4(%esp)
	call	*%edx
.L160:
	addl	$60, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_rgb888_bgr888_right, .-convblit_copy_rgb888_bgr888_right
	.p2align 4,,15
.globl convblit_copy_rgb888_bgr888_down
	.type	convblit_copy_rgb888_bgr888_down, @function
convblit_copy_rgb888_bgr888_down:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	movl	12(%ebp), %ecx
	movl	12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	56(%ecx), %esi
	movl	32(%eax), %eax
	movl	64(%ecx), %edi
	movl	28(%ecx), %ebx
	movl	%esi, -36(%ebp)
	movl	%ecx, %esi
	movl	%eax, -40(%ebp)
	movl	8(%edx), %eax
	movl	60(%esi), %esi
	subl	$1, %eax
	subl	16(%ecx), %eax
	movl	%esi, -28(%ebp)
	movl	12(%ebp), %esi
	movl	%eax, 16(%ecx)
	movl	12(%edx), %edx
	movl	12(%esi), %esi
	subl	$1, %edx
	subl	20(%ecx), %edx
	testl	%esi, %esi
	movl	%esi, -32(%ebp)
	movl	%edx, 20(%ecx)
	movl	24(%ecx), %ecx
	jle	.L163
	leal	(%ecx,%ecx,2), %esi
	movl	-40(%ebp), %ecx
	imull	%edi, %edx
	negl	%edi
	leal	(%eax,%eax,2), %eax
	imull	%ebx, %ecx
	addl	%edx, %eax
	addl	-28(%ebp), %eax
	addl	%ecx, %esi
	movl	%eax, -28(%ebp)
	addl	-36(%ebp), %esi
	movl	%edi, -36(%ebp)
	xorl	%edi, %edi
	.p2align 4,,7
	.p2align 3
.L166:
	movl	12(%ebp), %edx
	movl	8(%edx), %eax
	testl	%eax, %eax
	jle	.L164
	movl	-28(%ebp), %edx
	leal	(%eax,%eax,2), %ebx
	movl	%esi, %eax
	leal	(%esi,%ebx), %ebx
	.p2align 4,,7
	.p2align 3
.L165:
	movzbl	(%eax), %ecx
	movb	%cl, 2(%edx)
	movzbl	1(%eax), %ecx
	movb	%cl, 1(%edx)
	movzbl	2(%eax), %ecx
	addl	$3, %eax
	movb	%cl, (%edx)
	subl	$3, %edx
	cmpl	%ebx, %eax
	jne	.L165
.L164:
	addl	$1, %edi
	cmpl	-32(%ebp), %edi
	je	.L163
	movl	-36(%ebp), %ecx
	addl	-40(%ebp), %esi
	addl	%ecx, -28(%ebp)
	jmp	.L166
.L163:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ebx
	movl	140(%ebx), %edx
	testl	%edx, %edx
	je	.L168
	movl	12(%ebp), %esi
	movl	12(%esi), %ebx
	movl	8(%esi), %ecx
	movl	%ebx, 16(%esp)
	movl	%ecx, 12(%esp)
	movl	20(%esi), %eax
	addl	$1, %eax
	subl	%ebx, %eax
	movl	%eax, 8(%esp)
	movl	16(%esi), %eax
	addl	$1, %eax
	subl	%ecx, %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	*%edx
.L168:
	addl	$60, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_rgb888_bgr888_down, .-convblit_copy_rgb888_bgr888_down
	.p2align 4,,15
.globl convblit_srcover_rgba8888_16bpp
	.type	convblit_srcover_rgba8888_16bpp, @function
convblit_srcover_rgba8888_16bpp:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$92, %esp
	movl	12(%ebp), %ecx
	movl	12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	60(%ecx), %esi
	movl	%ecx, %edi
	movl	32(%eax), %eax
	movl	64(%edx), %edx
	movl	56(%ecx), %ebx
	movl	%esi, -28(%ebp)
	movl	16(%edi), %esi
	movl	12(%edi), %edi
	movl	%eax, -56(%ebp)
	movl	28(%ecx), %eax
	movl	%edx, -60(%ebp)
	movl	24(%ecx), %edx
	movl	20(%ecx), %ecx
	testl	%edi, %edi
	movl	%edi, -52(%ebp)
	jle	.L171
	imull	-56(%ebp), %eax
	imull	-60(%ebp), %ecx
	movl	$0, -44(%ebp)
	leal	(%eax,%edx,4), %eax
	leal	(%ebx,%eax), %eax
	movl	%eax, -48(%ebp)
	leal	(%ecx,%esi,2), %eax
	addl	-28(%ebp), %eax
	movl	%eax, -32(%ebp)
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -36(%ebp)
	.p2align 4,,7
	.p2align 3
.L176:
	movl	-36(%ebp), %ecx
	testl	%ecx, %ecx
	jle	.L172
	movl	-48(%ebp), %eax
	xorl	%edx, %edx
	jmp	.L175
	.p2align 4,,7
	.p2align 3
.L173:
	testl	%ecx, %ecx
	je	.L174
	movzbl	1(%eax), %ebx
	movl	$256, %esi
	subl	%ecx, %esi
	movl	-32(%ebp), %ecx
	movzbl	(%eax), %edi
	andw	$252, %bx
	sall	$3, %ebx
	movw	%bx, -40(%ebp)
	movzbl	2(%eax), %ebx
	andw	$248, %di
	movl	%esi, -28(%ebp)
	movzwl	(%ecx,%edx,2), %esi
	sall	$8, %edi
	shrb	$3, %bl
	movzbl	%bl, %ebx
	movl	%esi, %ecx
	movw	%bx, -38(%ebp)
	andl	$63488, %ecx
	movzwl	%di, %ebx
	subl	%ebx, %ecx
	movl	%esi, %ebx
	imull	-28(%ebp), %ecx
	andl	$2016, %ebx
	andl	$31, %esi
	shrl	$8, %ecx
	leal	(%edi,%ecx), %ecx
	movzwl	-40(%ebp), %edi
	andw	$-2048, %cx
	subl	%edi, %ebx
	imull	-28(%ebp), %ebx
	shrl	$8, %ebx
	addw	-40(%ebp), %bx
	andw	$2016, %bx
	orl	%ebx, %ecx
	movzwl	-38(%ebp), %ebx
	subl	%ebx, %esi
	movl	-32(%ebp), %ebx
	imull	-28(%ebp), %esi
	shrl	$8, %esi
	addw	-38(%ebp), %si
	andl	$31, %esi
	orl	%esi, %ecx
	movw	%cx, (%ebx,%edx,2)
.L174:
	addl	$1, %edx
	cmpl	-36(%ebp), %edx
	je	.L172
.L179:
	addl	$4, %eax
.L175:
	movzbl	3(%eax), %ecx
	cmpl	$255, %ecx
	jne	.L173
	movzbl	(%eax), %ecx
	movzbl	1(%eax), %ebx
	andl	$248, %ecx
	andl	$252, %ebx
	sall	$3, %ebx
	sall	$8, %ecx
	orl	%ebx, %ecx
	movzbl	2(%eax), %ebx
	shrb	$3, %bl
	movzbl	%bl, %ebx
	orl	%ebx, %ecx
	movl	-32(%ebp), %ebx
	movw	%cx, (%ebx,%edx,2)
	addl	$1, %edx
	cmpl	-36(%ebp), %edx
	jne	.L179
.L172:
	addl	$1, -44(%ebp)
	movl	-52(%ebp), %esi
	cmpl	%esi, -44(%ebp)
	je	.L171
	movl	-56(%ebp), %edi
	movl	-60(%ebp), %eax
	addl	%edi, -48(%ebp)
	addl	%eax, -32(%ebp)
	jmp	.L176
.L171:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %edx
	movl	140(%edx), %eax
	testl	%eax, %eax
	je	.L178
	movl	12(%ebp), %ecx
	movl	8(%ebp), %ebx
	movl	12(%ecx), %edx
	movl	%edx, 16(%esp)
	movl	8(%ecx), %edx
	movl	%edx, 12(%esp)
	movl	20(%ecx), %edx
	movl	%edx, 8(%esp)
	movl	16(%ecx), %edx
	movl	%ebx, (%esp)
	movl	%edx, 4(%esp)
	call	*%eax
.L178:
	addl	$92, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_srcover_rgba8888_16bpp, .-convblit_srcover_rgba8888_16bpp
	.p2align 4,,15
.globl convblit_srcover_rgba8888_16bpp_left
	.type	convblit_srcover_rgba8888_16bpp_left, @function
convblit_srcover_rgba8888_16bpp_left:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$108, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	8(%ebp), %ebx
	movl	32(%eax), %eax
	movl	56(%edx), %edi
	movl	20(%edx), %ecx
	movl	%eax, -60(%ebp)
	movl	8(%ebx), %eax
	movl	64(%edx), %ebx
	movl	%edi, -32(%ebp)
	subl	$1, %eax
	movl	%ebx, %esi
	negl	%esi
	movl	%esi, -44(%ebp)
	movl	%edx, %esi
	movl	%esi, %edi
	movl	24(%esi), %esi
	movl	60(%edi), %edi
	subl	16(%edx), %eax
	movl	%ecx, 16(%edx)
	movl	%edi, -28(%ebp)
	movl	12(%ebp), %edi
	movl	%eax, 20(%edx)
	movl	28(%edx), %edx
	movl	12(%edi), %edi
	testl	%edi, %edi
	movl	%edi, -56(%ebp)
	jle	.L181
	imull	%ebx, %eax
	imull	-60(%ebp), %edx
	movl	$0, -48(%ebp)
	leal	(%eax,%ecx,2), %eax
	addl	-28(%ebp), %eax
	leal	(%edx,%esi,4), %edx
	addl	-32(%ebp), %edx
	movl	%eax, -52(%ebp)
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -36(%ebp)
	.p2align 4,,7
	.p2align 3
.L186:
	movl	-36(%ebp), %ebx
	testl	%ebx, %ebx
	jle	.L182
	movl	-52(%ebp), %ecx
	xorl	%eax, %eax
	movl	%ecx, -76(%ebp)
	jmp	.L185
	.p2align 4,,7
	.p2align 3
.L183:
	testl	%ebx, %ebx
	je	.L184
	movzbl	1(%edx,%eax,4), %esi
	movzbl	(%edx,%eax,4), %edi
	andw	$252, %si
	sall	$3, %esi
	andw	$248, %di
	movw	%si, -40(%ebp)
	movzbl	2(%edx,%eax,4), %esi
	sall	$8, %edi
	movl	%esi, %ecx
	shrb	$3, %cl
	movzbl	%cl, %esi
	movl	-76(%ebp), %ecx
	movw	%si, -38(%ebp)
	movl	$256, %esi
	subl	%ebx, %esi
	movl	%esi, -28(%ebp)
	movzwl	%di, %esi
	movzwl	(%ecx), %ecx
	movl	%ecx, %ebx
	andl	$63488, %ebx
	subl	%esi, %ebx
	movl	%ecx, %esi
	imull	-28(%ebp), %ebx
	andl	$2016, %esi
	shrl	$8, %ebx
	leal	(%edi,%ebx), %ebx
	movzwl	-40(%ebp), %edi
	andw	$-2048, %bx
	subl	%edi, %esi
	movzwl	-38(%ebp), %edi
	imull	-28(%ebp), %esi
	shrl	$8, %esi
	addw	-40(%ebp), %si
	andw	$2016, %si
	orl	%esi, %ebx
	movl	%ecx, %esi
	andl	$31, %esi
	subl	%edi, %esi
	imull	-28(%ebp), %esi
	shrl	$8, %esi
	addw	-38(%ebp), %si
	andl	$31, %esi
	orl	%esi, %ebx
	movl	-76(%ebp), %esi
	movw	%bx, (%esi)
.L184:
	addl	$1, %eax
	cmpl	-36(%ebp), %eax
	je	.L182
.L190:
	movl	-44(%ebp), %edi
	addl	%edi, -76(%ebp)
.L185:
	movzbl	3(%edx,%eax,4), %ebx
	cmpl	$255, %ebx
	jne	.L183
	movzbl	(%edx,%eax,4), %ebx
	movzbl	1(%edx,%eax,4), %esi
	andl	$248, %ebx
	sall	$8, %ebx
	andl	$252, %esi
	sall	$3, %esi
	movl	%ebx, %ecx
	orl	%esi, %ecx
	movzbl	2(%edx,%eax,4), %esi
	addl	$1, %eax
	movl	%esi, %ebx
	shrb	$3, %bl
	movl	%ebx, %esi
	andw	$255, %si
	orl	%esi, %ecx
	movl	-76(%ebp), %esi
	cmpl	-36(%ebp), %eax
	movw	%cx, (%esi)
	jne	.L190
.L182:
	addl	$1, -48(%ebp)
	movl	-56(%ebp), %eax
	cmpl	%eax, -48(%ebp)
	je	.L181
	addl	-60(%ebp), %edx
	addl	$2, -52(%ebp)
	jmp	.L186
.L181:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ecx
	movl	140(%ecx), %edx
	testl	%edx, %edx
	je	.L188
	movl	12(%ebp), %ebx
	movl	8(%ebp), %esi
	movl	8(%ebx), %ecx
	movl	%ecx, 16(%esp)
	movl	12(%ebx), %eax
	movl	%eax, 12(%esp)
	movl	20(%ebx), %eax
	addl	$1, %eax
	subl	%ecx, %eax
	movl	%eax, 8(%esp)
	movl	16(%ebx), %eax
	movl	%esi, (%esp)
	movl	%eax, 4(%esp)
	call	*%edx
.L188:
	addl	$108, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_srcover_rgba8888_16bpp_left, .-convblit_srcover_rgba8888_16bpp_left
	.p2align 4,,15
.globl convblit_srcover_rgba8888_16bpp_right
	.type	convblit_srcover_rgba8888_16bpp_right, @function
convblit_srcover_rgba8888_16bpp_right:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$108, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	8(%ebp), %ebx
	movl	32(%eax), %eax
	movl	64(%edx), %esi
	movl	56(%edx), %edi
	movl	16(%edx), %ecx
	movl	%eax, -60(%ebp)
	movl	12(%ebx), %eax
	movl	%edx, %ebx
	movl	%esi, -44(%ebp)
	movl	%ebx, %esi
	movl	24(%ebx), %ebx
	movl	%edi, -28(%ebp)
	movl	60(%esi), %edi
	movl	12(%esi), %esi
	subl	$1, %eax
	subl	20(%edx), %eax
	movl	%ecx, 20(%edx)
	testl	%esi, %esi
	movl	%eax, 16(%edx)
	movl	28(%edx), %edx
	movl	%esi, -56(%ebp)
	jle	.L192
	imull	-44(%ebp), %ecx
	imull	-60(%ebp), %edx
	movl	$0, -48(%ebp)
	leal	(%ecx,%eax,2), %eax
	leal	(%edi,%eax), %eax
	movl	12(%ebp), %edi
	leal	(%edx,%ebx,4), %edx
	addl	-28(%ebp), %edx
	movl	%eax, -52(%ebp)
	movl	8(%edi), %edi
	movl	%edi, -36(%ebp)
	.p2align 4,,7
	.p2align 3
.L197:
	movl	-36(%ebp), %esi
	testl	%esi, %esi
	jle	.L193
	movl	-52(%ebp), %ecx
	xorl	%eax, %eax
	movl	%ecx, -76(%ebp)
	jmp	.L196
	.p2align 4,,7
	.p2align 3
.L194:
	testl	%ebx, %ebx
	je	.L195
	movzbl	1(%edx,%eax,4), %esi
	movzbl	(%edx,%eax,4), %edi
	andw	$252, %si
	sall	$3, %esi
	andw	$248, %di
	movw	%si, -40(%ebp)
	movzbl	2(%edx,%eax,4), %esi
	sall	$8, %edi
	movl	%esi, %ecx
	shrb	$3, %cl
	movzbl	%cl, %esi
	movl	-76(%ebp), %ecx
	movw	%si, -38(%ebp)
	movl	$256, %esi
	subl	%ebx, %esi
	movl	%esi, -28(%ebp)
	movzwl	%di, %esi
	movzwl	(%ecx), %ecx
	movl	%ecx, %ebx
	andl	$63488, %ebx
	subl	%esi, %ebx
	movl	%ecx, %esi
	imull	-28(%ebp), %ebx
	andl	$2016, %esi
	shrl	$8, %ebx
	leal	(%edi,%ebx), %ebx
	movzwl	-40(%ebp), %edi
	andw	$-2048, %bx
	subl	%edi, %esi
	movzwl	-38(%ebp), %edi
	imull	-28(%ebp), %esi
	shrl	$8, %esi
	addw	-40(%ebp), %si
	andw	$2016, %si
	orl	%esi, %ebx
	movl	%ecx, %esi
	andl	$31, %esi
	subl	%edi, %esi
	imull	-28(%ebp), %esi
	shrl	$8, %esi
	addw	-38(%ebp), %si
	andl	$31, %esi
	orl	%esi, %ebx
	movl	-76(%ebp), %esi
	movw	%bx, (%esi)
.L195:
	addl	$1, %eax
	cmpl	-36(%ebp), %eax
	je	.L193
.L201:
	movl	-44(%ebp), %edi
	addl	%edi, -76(%ebp)
.L196:
	movzbl	3(%edx,%eax,4), %ebx
	cmpl	$255, %ebx
	jne	.L194
	movzbl	(%edx,%eax,4), %ebx
	movzbl	1(%edx,%eax,4), %esi
	andl	$248, %ebx
	sall	$8, %ebx
	andl	$252, %esi
	sall	$3, %esi
	movl	%ebx, %ecx
	orl	%esi, %ecx
	movzbl	2(%edx,%eax,4), %esi
	addl	$1, %eax
	movl	%esi, %ebx
	shrb	$3, %bl
	movl	%ebx, %esi
	andw	$255, %si
	orl	%esi, %ecx
	movl	-76(%ebp), %esi
	cmpl	-36(%ebp), %eax
	movw	%cx, (%esi)
	jne	.L201
.L193:
	addl	$1, -48(%ebp)
	movl	-56(%ebp), %eax
	cmpl	%eax, -48(%ebp)
	je	.L192
	addl	-60(%ebp), %edx
	subl	$2, -52(%ebp)
	jmp	.L197
.L192:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ecx
	movl	140(%ecx), %edx
	testl	%edx, %edx
	je	.L199
	movl	12(%ebp), %ebx
	movl	8(%ebp), %esi
	movl	12(%ebx), %ecx
	movl	8(%ebx), %eax
	movl	%ecx, 12(%esp)
	movl	%eax, 16(%esp)
	movl	20(%ebx), %eax
	movl	%eax, 8(%esp)
	movl	16(%ebx), %eax
	movl	%esi, (%esp)
	addl	$1, %eax
	subl	%ecx, %eax
	movl	%eax, 4(%esp)
	call	*%edx
.L199:
	addl	$108, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_srcover_rgba8888_16bpp_right, .-convblit_srcover_rgba8888_16bpp_right
	.p2align 4,,15
.globl convblit_srcover_rgba8888_16bpp_down
	.type	convblit_srcover_rgba8888_16bpp_down, @function
convblit_srcover_rgba8888_16bpp_down:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$108, %esp
	movl	12(%ebp), %ebx
	movl	12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	12(%ebp), %ecx
	movl	56(%ebx), %edi
	movl	32(%eax), %eax
	movl	64(%ebx), %esi
	movl	%edi, -32(%ebp)
	movl	%ebx, %edi
	movl	%eax, -56(%ebp)
	movl	8(%edx), %eax
	movl	60(%edi), %edi
	subl	$1, %eax
	subl	16(%ecx), %eax
	movl	%edi, -28(%ebp)
	movl	12(%ebp), %edi
	movl	%eax, 16(%ecx)
	movl	12(%edx), %ecx
	movl	28(%ebx), %edx
	movl	12(%edi), %edi
	subl	$1, %ecx
	subl	20(%ebx), %ecx
	testl	%edi, %edi
	movl	%edi, -52(%ebp)
	movl	%ecx, 20(%ebx)
	movl	24(%ebx), %ebx
	jle	.L203
	imull	%esi, %ecx
	negl	%esi
	imull	-56(%ebp), %edx
	movl	%esi, -60(%ebp)
	movl	$0, -44(%ebp)
	leal	(%ecx,%eax,2), %eax
	addl	-28(%ebp), %eax
	leal	(%edx,%ebx,4), %edx
	addl	-32(%ebp), %edx
	movl	%eax, -48(%ebp)
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -36(%ebp)
	.p2align 4,,7
	.p2align 3
.L208:
	movl	-36(%ebp), %edi
	testl	%edi, %edi
	jle	.L204
	movl	-48(%ebp), %ecx
	xorl	%eax, %eax
	movl	%ecx, -76(%ebp)
	jmp	.L207
	.p2align 4,,7
	.p2align 3
.L205:
	testl	%ebx, %ebx
	je	.L206
	movzbl	1(%edx,%eax,4), %esi
	movzbl	(%edx,%eax,4), %edi
	andw	$252, %si
	sall	$3, %esi
	andw	$248, %di
	movw	%si, -40(%ebp)
	movzbl	2(%edx,%eax,4), %esi
	sall	$8, %edi
	movl	%esi, %ecx
	shrb	$3, %cl
	movzbl	%cl, %esi
	movl	-76(%ebp), %ecx
	movw	%si, -38(%ebp)
	movl	$256, %esi
	subl	%ebx, %esi
	movl	%esi, -28(%ebp)
	movzwl	%di, %esi
	movzwl	(%ecx), %ecx
	movl	%ecx, %ebx
	andl	$63488, %ebx
	subl	%esi, %ebx
	movl	%ecx, %esi
	imull	-28(%ebp), %ebx
	andl	$2016, %esi
	shrl	$8, %ebx
	leal	(%edi,%ebx), %ebx
	movzwl	-40(%ebp), %edi
	andw	$-2048, %bx
	subl	%edi, %esi
	movzwl	-38(%ebp), %edi
	imull	-28(%ebp), %esi
	shrl	$8, %esi
	addw	-40(%ebp), %si
	andw	$2016, %si
	orl	%esi, %ebx
	movl	%ecx, %esi
	andl	$31, %esi
	subl	%edi, %esi
	imull	-28(%ebp), %esi
	shrl	$8, %esi
	addw	-38(%ebp), %si
	andl	$31, %esi
	orl	%esi, %ebx
	movl	-76(%ebp), %esi
	movw	%bx, (%esi)
.L206:
	addl	$1, %eax
	cmpl	-36(%ebp), %eax
	je	.L204
.L212:
	subl	$2, -76(%ebp)
.L207:
	movzbl	3(%edx,%eax,4), %ebx
	cmpl	$255, %ebx
	jne	.L205
	movzbl	(%edx,%eax,4), %ebx
	movzbl	1(%edx,%eax,4), %esi
	andl	$248, %ebx
	sall	$8, %ebx
	andl	$252, %esi
	sall	$3, %esi
	movl	%ebx, %ecx
	orl	%esi, %ecx
	movzbl	2(%edx,%eax,4), %esi
	addl	$1, %eax
	movl	%esi, %ebx
	shrb	$3, %bl
	movl	%ebx, %esi
	andw	$255, %si
	orl	%esi, %ecx
	movl	-76(%ebp), %esi
	cmpl	-36(%ebp), %eax
	movw	%cx, (%esi)
	jne	.L212
.L204:
	addl	$1, -44(%ebp)
	movl	-52(%ebp), %edi
	cmpl	%edi, -44(%ebp)
	je	.L203
	movl	-60(%ebp), %eax
	addl	-56(%ebp), %edx
	addl	%eax, -48(%ebp)
	jmp	.L208
.L203:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ecx
	movl	140(%ecx), %edx
	testl	%edx, %edx
	je	.L210
	movl	12(%ebp), %esi
	movl	8(%ebp), %edi
	movl	12(%esi), %ebx
	movl	8(%esi), %ecx
	movl	%ebx, 16(%esp)
	movl	%ecx, 12(%esp)
	movl	20(%esi), %eax
	addl	$1, %eax
	subl	%ebx, %eax
	movl	%eax, 8(%esp)
	movl	16(%esi), %eax
	movl	%edi, (%esp)
	addl	$1, %eax
	subl	%ecx, %eax
	movl	%eax, 4(%esp)
	call	*%edx
.L210:
	addl	$108, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_srcover_rgba8888_16bpp_down, .-convblit_srcover_rgba8888_16bpp_down
	.p2align 4,,15
.globl convblit_copy_rgb888_16bpp
	.type	convblit_copy_rgb888_16bpp, @function
convblit_copy_rgb888_16bpp:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$92, %esp
	movl	12(%ebp), %ecx
	movl	12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	60(%ecx), %ebx
	movl	%ecx, %edi
	movl	32(%eax), %eax
	movl	64(%edx), %edx
	movl	56(%ecx), %esi
	movl	%ebx, -28(%ebp)
	movl	16(%edi), %ebx
	movl	12(%edi), %edi
	movl	%eax, -40(%ebp)
	movl	24(%ecx), %eax
	movl	%edx, -44(%ebp)
	movl	28(%ecx), %edx
	movl	20(%ecx), %ecx
	testl	%edi, %edi
	movl	%edi, -36(%ebp)
	jle	.L214
	imull	-40(%ebp), %edx
	leal	(%eax,%eax,2), %eax
	imull	-44(%ebp), %ecx
	addl	%edx, %eax
	leal	(%esi,%eax), %eax
	movl	%eax, -32(%ebp)
	movl	12(%ebp), %eax
	leal	(%ecx,%ebx,2), %ebx
	addl	-28(%ebp), %ebx
	movl	$0, -28(%ebp)
	movl	8(%eax), %esi
	.p2align 4,,7
	.p2align 3
.L217:
	testl	%esi, %esi
	jle	.L215
	movl	-32(%ebp), %edx
	xorl	%ecx, %ecx
	movl	%ebx, -60(%ebp)
	.p2align 4,,7
	.p2align 3
.L216:
	movzbl	(%edx), %eax
	movzbl	1(%edx), %edi
	andl	$248, %eax
	andl	$252, %edi
	sall	$3, %edi
	sall	$8, %eax
	orl	%edi, %eax
	movzbl	2(%edx), %edi
	addl	$3, %edx
	movl	%edi, %ebx
	shrb	$3, %bl
	movl	%ebx, %edi
	andw	$255, %di
	orl	%edi, %eax
	movl	-60(%ebp), %edi
	movw	%ax, (%edi,%ecx,2)
	addl	$1, %ecx
	cmpl	%esi, %ecx
	jne	.L216
	movl	%edi, %ebx
.L215:
	addl	$1, -28(%ebp)
	movl	-36(%ebp), %eax
	cmpl	%eax, -28(%ebp)
	je	.L214
	movl	-40(%ebp), %edx
	addl	%edx, -32(%ebp)
	addl	-44(%ebp), %ebx
	jmp	.L217
.L214:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ecx
	movl	140(%ecx), %eax
	testl	%eax, %eax
	je	.L219
	movl	12(%ebp), %ebx
	movl	12(%ebx), %edx
	movl	%edx, 16(%esp)
	movl	8(%ebx), %edx
	movl	%edx, 12(%esp)
	movl	20(%ebx), %edx
	movl	%edx, 8(%esp)
	movl	16(%ebx), %edx
	movl	%ecx, (%esp)
	movl	%edx, 4(%esp)
	call	*%eax
.L219:
	addl	$92, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_rgb888_16bpp, .-convblit_copy_rgb888_16bpp
	.p2align 4,,15
.globl convblit_copy_rgb888_16bpp_left
	.type	convblit_copy_rgb888_16bpp_left, @function
convblit_copy_rgb888_16bpp_left:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$92, %esp
	movl	12(%ebp), %eax
	movl	8(%ebp), %ebx
	movl	12(%ebp), %edx
	movl	32(%eax), %eax
	movl	20(%edx), %ecx
	movl	%eax, -40(%ebp)
	movl	8(%ebx), %eax
	movl	64(%edx), %ebx
	subl	$1, %eax
	subl	16(%edx), %eax
	movl	%ebx, %esi
	negl	%esi
	movl	%ecx, 16(%edx)
	movl	%eax, 20(%edx)
	movl	56(%edx), %edx
	movl	%esi, -60(%ebp)
	movl	12(%ebp), %esi
	movl	%edx, -32(%ebp)
	movl	28(%esi), %edi
	movl	24(%esi), %edx
	movl	60(%esi), %esi
	movl	%esi, -28(%ebp)
	movl	12(%ebp), %esi
	movl	12(%esi), %esi
	testl	%esi, %esi
	movl	%esi, -48(%ebp)
	jle	.L222
	imull	%ebx, %eax
	leal	(%edx,%edx,2), %esi
	movl	-40(%ebp), %edx
	leal	(%eax,%ecx,2), %eax
	addl	-28(%ebp), %eax
	imull	%edi, %edx
	movl	$0, -28(%ebp)
	movl	%eax, -36(%ebp)
	movl	12(%ebp), %eax
	addl	%esi, %edx
	movl	-60(%ebp), %esi
	addl	-32(%ebp), %edx
	movl	8(%eax), %eax
	movl	%edx, -32(%ebp)
	leal	(%eax,%eax,2), %ebx
	movl	%eax, -44(%ebp)
	addl	%edx, %ebx
	.p2align 4,,7
	.p2align 3
.L225:
	movl	-44(%ebp), %eax
	testl	%eax, %eax
	jle	.L223
	movl	-36(%ebp), %ecx
	movl	-32(%ebp), %eax
	movl	%ebx, -60(%ebp)
	.p2align 4,,7
	.p2align 3
.L224:
	movzbl	(%eax), %edx
	movzbl	1(%eax), %edi
	andl	$248, %edx
	andl	$252, %edi
	sall	$3, %edi
	sall	$8, %edx
	orl	%edi, %edx
	movzbl	2(%eax), %edi
	addl	$3, %eax
	movl	%edi, %ebx
	shrb	$3, %bl
	movl	%ebx, %edi
	andw	$255, %di
	orl	%edi, %edx
	movw	%dx, (%ecx)
	addl	%esi, %ecx
	cmpl	%eax, -60(%ebp)
	jne	.L224
	movl	-60(%ebp), %ebx
.L223:
	addl	$1, -28(%ebp)
	movl	-48(%ebp), %eax
	addl	-40(%ebp), %ebx
	cmpl	%eax, -28(%ebp)
	je	.L222
	movl	-40(%ebp), %edx
	addl	%edx, -32(%ebp)
	addl	$2, -36(%ebp)
	jmp	.L225
.L222:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ecx
	movl	140(%ecx), %edx
	testl	%edx, %edx
	je	.L227
	movl	12(%ebp), %ebx
	movl	8(%ebp), %esi
	movl	8(%ebx), %ecx
	movl	%ecx, 16(%esp)
	movl	12(%ebx), %eax
	movl	%eax, 12(%esp)
	movl	20(%ebx), %eax
	addl	$1, %eax
	subl	%ecx, %eax
	movl	%eax, 8(%esp)
	movl	16(%ebx), %eax
	movl	%esi, (%esp)
	movl	%eax, 4(%esp)
	call	*%edx
.L227:
	addl	$92, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_rgb888_16bpp_left, .-convblit_copy_rgb888_16bpp_left
	.ident	"GCC: (Ubuntu 4.4.1-4ubuntu8) 4.4.1"
	.section	.note.GNU-stack,"",@progbits
