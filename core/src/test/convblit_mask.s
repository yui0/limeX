	.file	"convblit_mask.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"convblit_mask_alpha\n"
	.text
	.p2align 4,,15
.globl convblit_blend_mask_alpha_byte_16bpp_right
	.type	convblit_blend_mask_alpha_byte_16bpp_right, @function
convblit_blend_mask_alpha_byte_16bpp_right:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$188, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	8(%ebp), %esi
	movl	32(%eax), %eax
	movl	%edx, %ebx
	movl	52(%edx), %edi
	movl	%eax, -156(%ebp)
	movl	36(%edx), %eax
	movb	%al, -88(%ebp)
	movl	%eax, %ecx
	shrl	$16, %eax
	movb	%al, -120(%ebp)
	movl	40(%edx), %eax
	shrl	$8, %ecx
	movl	16(%edx), %edx
	movb	%cl, -28(%ebp)
	movl	64(%ebx), %ecx
	movb	%al, -104(%ebp)
	shrl	$8, %eax
	movb	%al, -56(%ebp)
	movl	12(%esi), %eax
	movl	12(%ebp), %esi
	movl	%ecx, -64(%ebp)
	subl	$1, %eax
	subl	20(%ebx), %eax
	movl	%edx, 20(%ebx)
	movl	28(%esi), %ecx
	movl	%eax, 16(%ebx)
	movl	56(%ebx), %ebx
	movl	%ebx, -128(%ebp)
	movl	24(%esi), %ebx
	movl	60(%esi), %esi
	movl	%esi, -60(%ebp)
	movl	12(%ebp), %esi
	movl	12(%esi), %esi
	testl	%esi, %esi
	movl	%esi, -152(%ebp)
	jle	.L2
	imull	-64(%ebp), %edx
	imull	-156(%ebp), %ecx
	movl	-128(%ebp), %esi
	leal	(%edx,%eax,2), %eax
	movzbl	-56(%ebp), %edx
	addl	-60(%ebp), %eax
	addl	%ebx, %ecx
	addl	%ecx, %esi
	movl	%eax, -144(%ebp)
	movl	12(%ebp), %eax
	shrb	$3, %dl
	movzbl	%dl, %edx
	movw	%dx, -138(%ebp)
	movzbl	-28(%ebp), %edx
	movl	8(%eax), %eax
	shrb	$3, %dl
	movzbl	%dl, %edx
	movl	%eax, -60(%ebp)
	movzbl	-104(%ebp), %eax
	movw	%dx, -146(%ebp)
	movzbl	-88(%ebp), %edx
	andl	$248, %eax
	sall	$8, %eax
	andw	$248, %dx
	orw	%ax, -138(%ebp)
	movzbl	-56(%ebp), %eax
	sall	$8, %edx
	movzwl	%dx, %ecx
	movl	%ecx, -132(%ebp)
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -138(%ebp)
	movzbl	-88(%ebp), %eax
	movw	%dx, -88(%ebp)
	andl	$248, %eax
	sall	$8, %eax
	orw	%ax, -146(%ebp)
	movzbl	-28(%ebp), %eax
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -146(%ebp)
	movzbl	-28(%ebp), %eax
	andw	$252, %ax
	sall	$3, %eax
	movw	%ax, -122(%ebp)
	movzbl	-120(%ebp), %eax
	movzwl	-122(%ebp), %ebx
	shrb	$3, %al
	movzbl	%al, %eax
	movw	%ax, -104(%ebp)
	movzwl	%ax, %eax
	movl	%ebx, -128(%ebp)
	movl	%eax, -120(%ebp)
	movl	$0, -136(%ebp)
	.p2align 4,,7
	.p2align 3
.L9:
	movl	-60(%ebp), %eax
	testl	%eax, %eax
	jle	.L3
	movl	-144(%ebp), %edx
	xorl	%eax, %eax
	jmp	.L8
	.p2align 4,,7
	.p2align 3
.L15:
	testl	%edi, %edi
	je	.L5
	movzwl	-138(%ebp), %ecx
	movw	%cx, (%edx)
.L5:
	addl	$1, %eax
	cmpl	-60(%ebp), %eax
	je	.L3
.L17:
	addl	-64(%ebp), %edx
.L8:
	movzbl	(%esi,%eax), %ecx
	testl	%ecx, %ecx
	je	.L15
	cmpl	$255, %ecx
	je	.L16
	testl	%edi, %edi
	je	.L7
	movl	$256, %ebx
	subl	%ecx, %ebx
	movl	12(%ebp), %ecx
	movl	%ebx, -28(%ebp)
	movl	48(%ecx), %ecx
	movl	%ecx, -160(%ebp)
	andl	$31, %ecx
	subl	-120(%ebp), %ecx
	imull	%ebx, %ecx
	movl	-160(%ebp), %ebx
	andl	$63488, %ebx
	subl	-132(%ebp), %ebx
	imull	-28(%ebp), %ebx
	shrl	$8, %ecx
	addw	-104(%ebp), %cx
	shrl	$8, %ebx
	addw	-88(%ebp), %bx
	andl	$31, %ecx
	andw	$-2048, %bx
	orl	%ebx, %ecx
	movl	-160(%ebp), %ebx
.L13:
	andl	$2016, %ebx
	addl	$1, %eax
	subl	-128(%ebp), %ebx
	imull	-28(%ebp), %ebx
	shrl	$8, %ebx
	addw	-122(%ebp), %bx
	andw	$2016, %bx
	orl	%ebx, %ecx
	cmpl	-60(%ebp), %eax
	movw	%cx, (%edx)
	jne	.L17
.L3:
	addl	$1, -136(%ebp)
	movl	-152(%ebp), %ebx
	cmpl	%ebx, -136(%ebp)
	je	.L2
	addl	-156(%ebp), %esi
	subl	$2, -144(%ebp)
	jmp	.L9
	.p2align 4,,7
	.p2align 3
.L7:
	movl	$256, %ebx
	subl	%ecx, %ebx
	movzwl	(%edx), %ecx
	movl	%ebx, -28(%ebp)
	movl	%ecx, -56(%ebp)
	andl	$31, %ecx
	subl	-120(%ebp), %ecx
	imull	%ebx, %ecx
	movl	-56(%ebp), %ebx
	andl	$63488, %ebx
	subl	-132(%ebp), %ebx
	imull	-28(%ebp), %ebx
	shrl	$8, %ecx
	addw	-104(%ebp), %cx
	shrl	$8, %ebx
	addw	-88(%ebp), %bx
	andl	$31, %ecx
	andw	$-2048, %bx
	orl	%ebx, %ecx
	movl	-56(%ebp), %ebx
	jmp	.L13
	.p2align 4,,7
	.p2align 3
.L16:
	movzwl	-146(%ebp), %ebx
	movw	%bx, (%edx)
	jmp	.L5
.L2:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %esi
	movl	140(%esi), %edx
	testl	%edx, %edx
	je	.L11
	movl	12(%ebp), %eax
	movl	12(%eax), %ecx
	movl	%eax, %ebx
	movl	8(%eax), %eax
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
.L11:
	addl	$188, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_blend_mask_alpha_byte_16bpp_right, .-convblit_blend_mask_alpha_byte_16bpp_right
	.section	.rodata.str1.1
.LC1:
	.string	"convblit_mask_mono\n"
	.text
	.p2align 4,,15
.globl convblit_copy_mask_mono_byte_lsb_16bpp_down
	.type	convblit_copy_mask_mono_byte_lsb_16bpp_down, @function
convblit_copy_mask_mono_byte_lsb_16bpp_down:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$204, %esp
	movl	12(%ebp), %ebx
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %esi
	movl	36(%ebx), %edx
	movl	32(%eax), %eax
	movl	52(%ecx), %ecx
	movl	24(%esi), %edi
	movb	%dl, -168(%ebp)
	movl	%eax, -108(%ebp)
	movl	%edx, %eax
	shrl	$16, %edx
	movb	%dl, -56(%ebp)
	movl	40(%ebx), %edx
	shrl	$8, %eax
	movl	8(%ebp), %ebx
	movl	%ecx, -60(%ebp)
	movl	%edi, -100(%ebp)
	movl	%edx, %ecx
	shrl	$8, %ecx
	movb	%cl, -136(%ebp)
	movl	8(%ebx), %ecx
	addl	8(%esi), %edi
	movb	%dl, -88(%ebp)
	shrl	$16, %edx
	movb	%dl, -64(%ebp)
	subl	$1, %ecx
	subl	16(%esi), %ecx
	movb	%al, -152(%ebp)
	movl	%esi, %eax
	movl	%edi, -28(%ebp)
	movl	%eax, %edi
	movl	28(%eax), %eax
	movl	%ecx, 16(%esi)
	movl	12(%ebx), %edx
	movl	60(%edi), %edi
	movl	64(%esi), %ebx
	subl	$1, %edx
	subl	20(%esi), %edx
	movl	%edx, 20(%esi)
	movl	56(%esi), %esi
	movl	%edi, -96(%ebp)
	movl	12(%ebp), %edi
	movl	12(%edi), %edi
	testl	%edi, %edi
	movl	%edi, -104(%ebp)
	jle	.L19
	movl	-100(%ebp), %edi
	imull	-108(%ebp), %eax
	sarl	$3, %edi
	addl	%edi, %eax
	movzbl	-169(%ebp), %edi
	leal	(%esi,%eax), %eax
	movl	%eax, -92(%ebp)
	movl	%edx, %eax
	movzbl	-56(%ebp), %edx
	imull	%ebx, %eax
	movl	-92(%ebp), %esi
	negl	%ebx
	movl	%ebx, -112(%ebp)
	shrb	$3, %dl
	leal	(%eax,%ecx,2), %eax
	movzbl	%dl, %edx
	addl	-96(%ebp), %eax
	movw	%dx, -56(%ebp)
	movzbl	-64(%ebp), %edx
	movl	$0, -64(%ebp)
	movl	%eax, -96(%ebp)
	movzbl	-168(%ebp), %eax
	shrb	$3, %dl
	movzbl	%dl, %edx
	andl	$248, %eax
	sall	$8, %eax
	orw	%ax, -56(%ebp)
	movzbl	-152(%ebp), %eax
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -56(%ebp)
	movzbl	-88(%ebp), %eax
	movw	%dx, -88(%ebp)
	movl	-96(%ebp), %edx
	andl	$248, %eax
	sall	$8, %eax
	orw	%ax, -88(%ebp)
	movzbl	-136(%ebp), %eax
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -88(%ebp)
	.p2align 4,,7
	.p2align 3
.L20:
	movl	-100(%ebp), %eax
	movl	-28(%ebp), %ecx
	cmpl	%ecx, %eax
	jl	.L26
	jmp	.L25
	.p2align 4,,7
	.p2align 3
.L30:
	movzwl	-56(%ebp), %ebx
	movw	%bx, (%edx)
.L23:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L25
.L24:
	subl	$2, %edx
.L26:
	testb	$7, %al
	jne	.L21
	movzbl	(%esi), %edi
	addl	$1, %esi
.L21:
	movl	%edi, %ecx
	movzbl	%cl, %ebx
	movl	%eax, %ecx
	andl	$7, %ecx
	btl	%ecx, %ebx
	jc	.L30
	movl	-60(%ebp), %ecx
	testl	%ecx, %ecx
	je	.L23
	movzwl	-88(%ebp), %ecx
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	movw	%cx, (%edx)
	jg	.L24
.L25:
	addl	$1, -64(%ebp)
	movl	-104(%ebp), %ebx
	cmpl	%ebx, -64(%ebp)
	je	.L19
	movl	-108(%ebp), %esi
	movl	-112(%ebp), %eax
	addl	%esi, -92(%ebp)
	addl	%eax, -96(%ebp)
	movl	-92(%ebp), %esi
	movl	-96(%ebp), %edx
	jmp	.L20
.L19:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ebx
	movl	140(%ebx), %edx
	testl	%edx, %edx
	je	.L28
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
.L28:
	addl	$204, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_byte_lsb_16bpp_down, .-convblit_copy_mask_mono_byte_lsb_16bpp_down
	.p2align 4,,15
.globl convblit_copy_mask_mono_word_msb_16bpp_down
	.type	convblit_copy_mask_mono_word_msb_16bpp_down, @function
convblit_copy_mask_mono_word_msb_16bpp_down:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$220, %esp
	movl	12(%ebp), %ebx
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %esi
	movl	36(%ebx), %edx
	movl	32(%eax), %eax
	movl	52(%ecx), %ecx
	movl	24(%esi), %edi
	movb	%dl, -168(%ebp)
	movl	%eax, -108(%ebp)
	movl	%edx, %eax
	shrl	$16, %edx
	movb	%dl, -56(%ebp)
	movl	40(%ebx), %edx
	shrl	$8, %eax
	movl	8(%ebp), %ebx
	movl	%ecx, -60(%ebp)
	movl	%edi, -100(%ebp)
	movl	%edx, %ecx
	shrl	$8, %ecx
	movb	%cl, -136(%ebp)
	movl	8(%ebx), %ecx
	addl	8(%esi), %edi
	movb	%dl, -88(%ebp)
	shrl	$16, %edx
	movb	%dl, -64(%ebp)
	subl	$1, %ecx
	subl	16(%esi), %ecx
	movb	%al, -152(%ebp)
	movl	%esi, %eax
	movl	%edi, -28(%ebp)
	movl	%eax, %edi
	movl	28(%eax), %eax
	movl	%ecx, 16(%esi)
	movl	12(%ebx), %edx
	movl	60(%edi), %edi
	movl	64(%esi), %ebx
	subl	$1, %edx
	subl	20(%esi), %edx
	movl	%edx, 20(%esi)
	movl	56(%esi), %esi
	movl	%edi, -92(%ebp)
	movl	12(%ebp), %edi
	movl	12(%edi), %edi
	testl	%edi, %edi
	movl	%edi, -104(%ebp)
	jle	.L32
	movl	-100(%ebp), %edi
	imull	-108(%ebp), %eax
	sarl	$3, %edi
	addl	%edi, %eax
	movzwl	-170(%ebp), %edi
	leal	(%esi,%eax), %eax
	movl	%eax, -96(%ebp)
	movl	%edx, %eax
	movzbl	-56(%ebp), %edx
	imull	%ebx, %eax
	negl	%ebx
	movl	%ebx, -112(%ebp)
	shrb	$3, %dl
	leal	(%eax,%ecx,2), %eax
	movzbl	%dl, %edx
	addl	-92(%ebp), %eax
	movw	%dx, -56(%ebp)
	movzbl	-64(%ebp), %edx
	movl	$0, -64(%ebp)
	movl	%eax, -92(%ebp)
	movzbl	-168(%ebp), %eax
	shrb	$3, %dl
	movzbl	%dl, %edx
	andl	$248, %eax
	sall	$8, %eax
	orw	%ax, -56(%ebp)
	movzbl	-152(%ebp), %eax
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -56(%ebp)
	movzbl	-88(%ebp), %eax
	movw	%dx, -88(%ebp)
	andl	$248, %eax
	sall	$8, %eax
	orw	%ax, -88(%ebp)
	movzbl	-136(%ebp), %eax
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -88(%ebp)
	.p2align 4,,7
	.p2align 3
.L38:
	movl	-28(%ebp), %eax
	cmpl	%eax, -100(%ebp)
	jge	.L33
	movl	-96(%ebp), %esi
	movl	-92(%ebp), %edx
	movl	-100(%ebp), %eax
	movl	%esi, -188(%ebp)
	jmp	.L37
	.p2align 4,,7
	.p2align 3
.L42:
	movzwl	-56(%ebp), %ecx
	movw	%cx, (%edx)
.L36:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L33
.L43:
	subl	$2, %edx
.L37:
	testb	$15, %al
	jne	.L34
	movl	-188(%ebp), %ecx
	movzwl	(%ecx), %edi
	addl	$2, %ecx
	movl	%ecx, -188(%ebp)
.L34:
	movl	%eax, %esi
	movzwl	%di, %ebx
	andl	$15, %esi
	movl	%esi, -176(%ebp)
	movzbl	-176(%ebp), %ecx
	movl	$32768, %esi
	sarl	%cl, %esi
	testl	%ebx, %esi
	jne	.L42
	movl	-60(%ebp), %ebx
	testl	%ebx, %ebx
	je	.L36
	movzwl	-88(%ebp), %ebx
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	movw	%bx, (%edx)
	jg	.L43
.L33:
	addl	$1, -64(%ebp)
	movl	-104(%ebp), %esi
	cmpl	%esi, -64(%ebp)
	je	.L32
	movl	-108(%ebp), %eax
	movl	-112(%ebp), %ecx
	addl	%eax, -96(%ebp)
	addl	%ecx, -92(%ebp)
	jmp	.L38
.L32:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ebx
	movl	140(%ebx), %edx
	testl	%edx, %edx
	je	.L40
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
.L40:
	addl	$220, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_word_msb_16bpp_down, .-convblit_copy_mask_mono_word_msb_16bpp_down
	.p2align 4,,15
.globl convblit_copy_mask_mono_byte_msb_16bpp_right
	.type	convblit_copy_mask_mono_byte_msb_16bpp_right, @function
convblit_copy_mask_mono_byte_msb_16bpp_right:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$220, %esp
	movl	12(%ebp), %ebx
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %esi
	movl	36(%ebx), %edx
	movl	32(%eax), %eax
	movl	52(%ecx), %ecx
	movl	64(%esi), %edi
	movb	%dl, -168(%ebp)
	movl	%eax, -108(%ebp)
	movl	%edx, %eax
	shrl	$16, %edx
	movb	%dl, -56(%ebp)
	movl	40(%ebx), %edx
	shrl	$8, %eax
	movl	%ecx, -60(%ebp)
	movb	%al, -152(%ebp)
	movl	24(%esi), %eax
	movl	%edi, -32(%ebp)
	movl	%esi, %edi
	movl	%edx, %ecx
	movl	12(%edi), %edi
	shrl	$8, %ecx
	movb	%cl, -136(%ebp)
	movl	16(%ebx), %ecx
	movl	8(%ebp), %ebx
	movb	%dl, -88(%ebp)
	shrl	$16, %edx
	movb	%dl, -64(%ebp)
	movl	%eax, -96(%ebp)
	movl	12(%ebx), %edx
	addl	8(%esi), %eax
	movl	56(%esi), %ebx
	subl	$1, %edx
	subl	20(%esi), %edx
	testl	%edi, %edi
	movl	%ecx, 20(%esi)
	movl	%eax, -28(%ebp)
	movl	28(%esi), %eax
	movl	%edx, 16(%esi)
	movl	60(%esi), %esi
	movl	%edi, -100(%ebp)
	jle	.L45
	movl	-96(%ebp), %edi
	imull	-108(%ebp), %eax
	sarl	$3, %edi
	addl	%edi, %eax
	movzbl	-169(%ebp), %edi
	leal	(%ebx,%eax), %eax
	movl	%eax, -92(%ebp)
	movl	-32(%ebp), %eax
	imull	%ecx, %eax
	leal	(%eax,%edx,2), %eax
	movzbl	-56(%ebp), %edx
	leal	(%esi,%eax), %eax
	movl	-92(%ebp), %esi
	movl	%eax, -104(%ebp)
	movzbl	-168(%ebp), %eax
	shrb	$3, %dl
	movzbl	%dl, %edx
	andl	$248, %eax
	movw	%dx, -56(%ebp)
	sall	$8, %eax
	movzbl	-64(%ebp), %edx
	orw	%ax, -56(%ebp)
	movzbl	-152(%ebp), %eax
	movl	$0, -64(%ebp)
	shrb	$3, %dl
	movzbl	%dl, %edx
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -56(%ebp)
	movzbl	-88(%ebp), %eax
	movw	%dx, -88(%ebp)
	movl	-104(%ebp), %edx
	andl	$248, %eax
	sall	$8, %eax
	orw	%ax, -88(%ebp)
	movzbl	-136(%ebp), %eax
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -88(%ebp)
	.p2align 4,,7
	.p2align 3
.L46:
	movl	-96(%ebp), %eax
	movl	-28(%ebp), %ebx
	cmpl	%ebx, %eax
	jge	.L51
	movl	%esi, -188(%ebp)
	jmp	.L52
	.p2align 4,,7
	.p2align 3
.L56:
	movzwl	-56(%ebp), %ecx
	movw	%cx, (%edx)
.L49:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L51
.L50:
	addl	-32(%ebp), %edx
.L52:
	testb	$7, %al
	jne	.L47
	movl	-188(%ebp), %ecx
	movzbl	(%ecx), %edi
	addl	$1, %ecx
	movl	%ecx, -188(%ebp)
.L47:
	movl	%eax, %esi
	movl	%edi, %ecx
	andl	$7, %esi
	movzbl	%cl, %ebx
	movl	%esi, -176(%ebp)
	movzbl	-176(%ebp), %ecx
	movl	$128, %esi
	sarl	%cl, %esi
	testl	%ebx, %esi
	jne	.L56
	movl	-60(%ebp), %esi
	testl	%esi, %esi
	je	.L49
	movzwl	-88(%ebp), %ebx
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	movw	%bx, (%edx)
	jg	.L50
.L51:
	addl	$1, -64(%ebp)
	movl	-100(%ebp), %esi
	cmpl	%esi, -64(%ebp)
	je	.L45
	movl	-64(%ebp), %edx
	movl	-104(%ebp), %ecx
	movl	-108(%ebp), %eax
	addl	%eax, -92(%ebp)
	addl	%edx, %edx
	movl	-92(%ebp), %esi
	subl	%edx, %ecx
	movl	%ecx, %edx
	jmp	.L46
.L45:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %esi
	movl	140(%esi), %edx
	testl	%edx, %edx
	je	.L54
	movl	12(%ebp), %edi
	movl	12(%edi), %ecx
	movl	8(%edi), %eax
	movl	%ecx, 12(%esp)
	movl	%eax, 16(%esp)
	movl	20(%edi), %eax
	movl	%eax, 8(%esp)
	movl	16(%edi), %eax
	movl	%esi, (%esp)
	addl	$1, %eax
	subl	%ecx, %eax
	movl	%eax, 4(%esp)
	call	*%edx
.L54:
	addl	$220, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_byte_msb_16bpp_right, .-convblit_copy_mask_mono_byte_msb_16bpp_right
	.p2align 4,,15
.globl convblit_copy_mask_mono_byte_msb_16bpp_down
	.type	convblit_copy_mask_mono_byte_msb_16bpp_down, @function
convblit_copy_mask_mono_byte_msb_16bpp_down:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$220, %esp
	movl	12(%ebp), %ebx
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %esi
	movl	36(%ebx), %edx
	movl	32(%eax), %eax
	movl	52(%ecx), %ecx
	movl	24(%esi), %edi
	movb	%dl, -168(%ebp)
	movl	%eax, -108(%ebp)
	movl	%edx, %eax
	shrl	$16, %edx
	movb	%dl, -56(%ebp)
	movl	40(%ebx), %edx
	shrl	$8, %eax
	movl	8(%ebp), %ebx
	movl	%ecx, -60(%ebp)
	movl	%edi, -100(%ebp)
	movl	%edx, %ecx
	shrl	$8, %ecx
	movb	%cl, -136(%ebp)
	movl	8(%ebx), %ecx
	addl	8(%esi), %edi
	movb	%dl, -88(%ebp)
	shrl	$16, %edx
	movb	%dl, -64(%ebp)
	subl	$1, %ecx
	subl	16(%esi), %ecx
	movb	%al, -152(%ebp)
	movl	%esi, %eax
	movl	%edi, -28(%ebp)
	movl	%eax, %edi
	movl	28(%eax), %eax
	movl	%ecx, 16(%esi)
	movl	12(%ebx), %edx
	movl	60(%edi), %edi
	movl	64(%esi), %ebx
	subl	$1, %edx
	subl	20(%esi), %edx
	movl	%edx, 20(%esi)
	movl	56(%esi), %esi
	movl	%edi, -96(%ebp)
	movl	12(%ebp), %edi
	movl	12(%edi), %edi
	testl	%edi, %edi
	movl	%edi, -104(%ebp)
	jle	.L58
	movl	-100(%ebp), %edi
	imull	-108(%ebp), %eax
	sarl	$3, %edi
	addl	%edi, %eax
	movzbl	-169(%ebp), %edi
	leal	(%esi,%eax), %eax
	movl	%eax, -92(%ebp)
	movl	%edx, %eax
	movzbl	-56(%ebp), %edx
	imull	%ebx, %eax
	movl	-92(%ebp), %esi
	negl	%ebx
	movl	%ebx, -112(%ebp)
	shrb	$3, %dl
	leal	(%eax,%ecx,2), %eax
	movzbl	%dl, %edx
	addl	-96(%ebp), %eax
	movw	%dx, -56(%ebp)
	movzbl	-64(%ebp), %edx
	movl	$0, -64(%ebp)
	movl	%eax, -96(%ebp)
	movzbl	-168(%ebp), %eax
	shrb	$3, %dl
	movzbl	%dl, %edx
	andl	$248, %eax
	sall	$8, %eax
	orw	%ax, -56(%ebp)
	movzbl	-152(%ebp), %eax
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -56(%ebp)
	movzbl	-88(%ebp), %eax
	movw	%dx, -88(%ebp)
	movl	-96(%ebp), %edx
	andl	$248, %eax
	sall	$8, %eax
	orw	%ax, -88(%ebp)
	movzbl	-136(%ebp), %eax
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -88(%ebp)
	.p2align 4,,7
	.p2align 3
.L59:
	movl	-100(%ebp), %eax
	movl	-28(%ebp), %ebx
	cmpl	%ebx, %eax
	jge	.L64
	movl	%esi, -188(%ebp)
	jmp	.L65
	.p2align 4,,7
	.p2align 3
.L69:
	movzwl	-56(%ebp), %ecx
	movw	%cx, (%edx)
.L62:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L64
.L63:
	subl	$2, %edx
.L65:
	testb	$7, %al
	jne	.L60
	movl	-188(%ebp), %ecx
	movzbl	(%ecx), %edi
	addl	$1, %ecx
	movl	%ecx, -188(%ebp)
.L60:
	movl	%eax, %esi
	movl	%edi, %ecx
	andl	$7, %esi
	movzbl	%cl, %ebx
	movl	%esi, -176(%ebp)
	movzbl	-176(%ebp), %ecx
	movl	$128, %esi
	sarl	%cl, %esi
	testl	%ebx, %esi
	jne	.L69
	movl	-60(%ebp), %ecx
	testl	%ecx, %ecx
	je	.L62
	movzwl	-88(%ebp), %ebx
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	movw	%bx, (%edx)
	jg	.L63
.L64:
	addl	$1, -64(%ebp)
	movl	-104(%ebp), %esi
	cmpl	%esi, -64(%ebp)
	je	.L58
	movl	-108(%ebp), %eax
	movl	-112(%ebp), %ecx
	addl	%eax, -92(%ebp)
	addl	%ecx, -96(%ebp)
	movl	-92(%ebp), %esi
	movl	-96(%ebp), %edx
	jmp	.L59
.L58:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %esi
	movl	140(%esi), %edx
	testl	%edx, %edx
	je	.L67
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
.L67:
	addl	$220, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_byte_msb_16bpp_down, .-convblit_copy_mask_mono_byte_msb_16bpp_down
	.p2align 4,,15
.globl convblit_copy_mask_mono_byte_lsb_bgra
	.type	convblit_copy_mask_mono_byte_lsb_bgra, @function
convblit_copy_mask_mono_byte_lsb_bgra:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$236, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	12(%ebp), %edi
	movl	32(%eax), %eax
	movl	52(%edx), %edx
	movl	%eax, -184(%ebp)
	movl	36(%ecx), %eax
	movl	%edx, -96(%ebp)
	movb	%al, -89(%ebp)
	movl	%eax, %edx
	movl	%eax, %ecx
	shrl	$24, %eax
	movb	%al, -56(%ebp)
	movl	40(%edi), %eax
	shrl	$8, %edx
	shrl	$16, %ecx
	movl	64(%edi), %edi
	movb	%dl, -88(%ebp)
	movb	%cl, -72(%ebp)
	movl	%eax, %edx
	movl	%eax, %ecx
	shrl	$8, %edx
	movb	%al, -169(%ebp)
	shrl	$24, %eax
	movb	%dl, -168(%ebp)
	movl	12(%ebp), %edx
	shrl	$16, %ecx
	movb	%al, -136(%ebp)
	movl	12(%ebp), %eax
	movb	%cl, -152(%ebp)
	movl	%edi, -188(%ebp)
	movl	%edx, %ecx
	movl	56(%edx), %ebx
	movl	24(%eax), %eax
	movl	%ecx, %edi
	movl	12(%edi), %edi
	movl	60(%edx), %esi
	movl	16(%ecx), %ecx
	movl	%eax, -176(%ebp)
	addl	8(%edx), %eax
	testl	%edi, %edi
	movl	%eax, -28(%ebp)
	movl	28(%edx), %eax
	movl	20(%edx), %edx
	movl	%edi, -180(%ebp)
	jle	.L71
	movl	-176(%ebp), %edi
	imull	-184(%ebp), %eax
	movl	$0, -100(%ebp)
	sarl	$3, %edi
	addl	%edi, %eax
	movzbl	-201(%ebp), %edi
	leal	(%ebx,%eax), %eax
	movl	%eax, -104(%ebp)
	movl	-188(%ebp), %eax
	imull	%edx, %eax
	leal	(%eax,%ecx,4), %eax
	leal	(%esi,%eax), %eax
	movl	-104(%ebp), %esi
	movl	%eax, -108(%ebp)
	movl	%eax, %edx
	.p2align 4,,7
	.p2align 3
.L72:
	movl	-176(%ebp), %eax
	movl	-28(%ebp), %ecx
	cmpl	%ecx, %eax
	jl	.L78
	jmp	.L77
	.p2align 4,,7
	.p2align 3
.L82:
	movzbl	-56(%ebp), %ecx
	movb	%cl, 3(%edx)
	movzbl	-89(%ebp), %ecx
	movb	%cl, 2(%edx)
	movzbl	-88(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-72(%ebp), %ecx
	movb	%cl, (%edx)
.L75:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L77
.L76:
	addl	$4, %edx
.L78:
	testb	$7, %al
	jne	.L73
	movzbl	(%esi), %edi
	addl	$1, %esi
.L73:
	movl	%edi, %ecx
	movzbl	%cl, %ebx
	movl	%eax, %ecx
	andl	$7, %ecx
	btl	%ecx, %ebx
	jc	.L82
	movl	-96(%ebp), %ebx
	testl	%ebx, %ebx
	je	.L75
	movzbl	-136(%ebp), %ecx
	addl	$1, %eax
	movb	%cl, 3(%edx)
	movzbl	-169(%ebp), %ecx
	movb	%cl, 2(%edx)
	movzbl	-168(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-152(%ebp), %ecx
	movb	%cl, (%edx)
	cmpl	%eax, -28(%ebp)
	jg	.L76
.L77:
	addl	$1, -100(%ebp)
	movl	-180(%ebp), %eax
	cmpl	%eax, -100(%ebp)
	je	.L71
	movl	-184(%ebp), %edx
	movl	-188(%ebp), %ecx
	addl	%edx, -104(%ebp)
	addl	%ecx, -108(%ebp)
	movl	-104(%ebp), %esi
	movl	-108(%ebp), %edx
	jmp	.L72
.L71:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %edi
	movl	140(%edi), %eax
	testl	%eax, %eax
	je	.L80
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
.L80:
	addl	$236, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_byte_lsb_bgra, .-convblit_copy_mask_mono_byte_lsb_bgra
	.p2align 4,,15
.globl convblit_copy_mask_mono_byte_lsb_bgra_left
	.type	convblit_copy_mask_mono_byte_lsb_bgra_left, @function
convblit_copy_mask_mono_byte_lsb_bgra_left:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$220, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	8(%ebp), %edi
	movl	32(%eax), %eax
	movl	12(%ebp), %esi
	movl	52(%edx), %edx
	movl	%eax, -172(%ebp)
	movl	36(%ecx), %eax
	movl	%edx, -96(%ebp)
	movb	%al, -89(%ebp)
	movl	%eax, %ebx
	movl	%eax, %edx
	shrl	$24, %eax
	movb	%al, -56(%ebp)
	movl	40(%ecx), %eax
	shrl	$16, %edx
	movb	%dl, -72(%ebp)
	movl	8(%edi), %edx
	shrl	$8, %ebx
	movb	%bl, -88(%ebp)
	movl	12(%ebp), %edi
	movl	%eax, %ecx
	movl	%eax, %ebx
	shrl	$8, %ecx
	subl	$1, %edx
	movb	%cl, -152(%ebp)
	movl	20(%esi), %ecx
	shrl	$16, %ebx
	subl	16(%esi), %edx
	movb	%bl, -136(%ebp)
	movl	64(%esi), %ebx
	movb	%al, -153(%ebp)
	shrl	$24, %eax
	movl	%edx, 20(%esi)
	movl	%ecx, 16(%esi)
	movl	24(%esi), %esi
	movb	%al, -120(%ebp)
	movl	%ebx, %eax
	negl	%eax
	movl	%eax, -32(%ebp)
	movl	%esi, -160(%ebp)
	addl	8(%edi), %esi
	movl	%esi, -28(%ebp)
	movl	56(%edi), %esi
	movl	28(%edi), %eax
	movl	60(%edi), %edi
	movl	%edi, -100(%ebp)
	movl	12(%ebp), %edi
	movl	12(%edi), %edi
	testl	%edi, %edi
	movl	%edi, -164(%ebp)
	jle	.L84
	movl	-160(%ebp), %edi
	imull	-172(%ebp), %eax
	sarl	$3, %edi
	addl	%edi, %eax
	movzbl	-185(%ebp), %edi
	leal	(%esi,%eax), %eax
	movl	%eax, -104(%ebp)
	movl	%edx, %eax
	movl	-104(%ebp), %esi
	imull	%ebx, %eax
	leal	(%eax,%ecx,4), %eax
	addl	-100(%ebp), %eax
	movl	$0, -100(%ebp)
	movl	%eax, -168(%ebp)
	movl	%eax, %edx
	.p2align 4,,7
	.p2align 3
.L85:
	movl	-160(%ebp), %eax
	movl	-28(%ebp), %ebx
	cmpl	%ebx, %eax
	jl	.L91
	jmp	.L90
	.p2align 4,,7
	.p2align 3
.L95:
	movzbl	-56(%ebp), %ebx
	movb	%bl, 3(%edx)
	movzbl	-89(%ebp), %ecx
	movb	%cl, 2(%edx)
	movzbl	-88(%ebp), %ebx
	movb	%bl, 1(%edx)
	movzbl	-72(%ebp), %ecx
	movb	%cl, (%edx)
.L88:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L90
.L89:
	addl	-32(%ebp), %edx
.L91:
	testb	$7, %al
	jne	.L86
	movzbl	(%esi), %edi
	addl	$1, %esi
.L86:
	movl	%edi, %ecx
	movzbl	%cl, %ebx
	movl	%eax, %ecx
	andl	$7, %ecx
	btl	%ecx, %ebx
	jc	.L95
	movl	-96(%ebp), %ecx
	testl	%ecx, %ecx
	je	.L88
	movzbl	-120(%ebp), %ebx
	addl	$1, %eax
	movb	%bl, 3(%edx)
	movzbl	-153(%ebp), %ecx
	movb	%cl, 2(%edx)
	movzbl	-152(%ebp), %ebx
	movb	%bl, 1(%edx)
	movzbl	-136(%ebp), %ecx
	movb	%cl, (%edx)
	cmpl	%eax, -28(%ebp)
	jg	.L89
.L90:
	addl	$1, -100(%ebp)
	movl	-164(%ebp), %ebx
	cmpl	%ebx, -100(%ebp)
	je	.L84
	movl	-100(%ebp), %eax
	movl	-168(%ebp), %ecx
	movl	-172(%ebp), %esi
	addl	%esi, -104(%ebp)
	movl	-104(%ebp), %esi
	leal	(%ecx,%eax,4), %edx
	jmp	.L85
.L84:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %esi
	movl	140(%esi), %edx
	testl	%edx, %edx
	je	.L93
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
.L93:
	addl	$220, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_byte_lsb_bgra_left, .-convblit_copy_mask_mono_byte_lsb_bgra_left
	.p2align 4,,15
.globl convblit_copy_mask_mono_byte_lsb_bgra_right
	.type	convblit_copy_mask_mono_byte_lsb_bgra_right, @function
convblit_copy_mask_mono_byte_lsb_bgra_right:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$220, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	12(%ebp), %esi
	movl	32(%eax), %eax
	movl	8(%ebp), %edi
	movl	52(%edx), %edx
	movl	%eax, -172(%ebp)
	movl	36(%ecx), %eax
	movl	%edx, -96(%ebp)
	movb	%al, -89(%ebp)
	movl	%eax, %ebx
	movl	%eax, %edx
	shrl	$24, %eax
	movb	%al, -56(%ebp)
	movl	40(%ecx), %eax
	shrl	$8, %ebx
	movb	%bl, -88(%ebp)
	shrl	$16, %edx
	movb	%dl, -72(%ebp)
	movl	12(%edi), %edx
	movl	%esi, %edi
	movl	%eax, %ebx
	movl	%eax, %ecx
	shrl	$16, %ebx
	movb	%bl, -136(%ebp)
	movl	24(%esi), %ebx
	shrl	$8, %ecx
	movb	%al, -153(%ebp)
	shrl	$24, %eax
	subl	$1, %edx
	movb	%cl, -152(%ebp)
	movl	16(%esi), %ecx
	movb	%al, -120(%ebp)
	movl	64(%esi), %eax
	subl	20(%esi), %edx
	movl	%ebx, -160(%ebp)
	addl	8(%esi), %ebx
	movl	%edx, 16(%esi)
	movl	%ecx, 20(%esi)
	movl	%eax, -32(%ebp)
	movl	%ebx, -28(%ebp)
	movl	12(%edi), %edi
	movl	56(%esi), %ebx
	movl	28(%esi), %eax
	movl	60(%esi), %esi
	testl	%edi, %edi
	movl	%edi, -164(%ebp)
	jle	.L97
	movl	-160(%ebp), %edi
	imull	-172(%ebp), %eax
	movl	$0, -100(%ebp)
	sarl	$3, %edi
	addl	%edi, %eax
	movzbl	-185(%ebp), %edi
	leal	(%ebx,%eax), %eax
	movl	%eax, -104(%ebp)
	movl	-32(%ebp), %eax
	imull	%ecx, %eax
	leal	(%eax,%edx,4), %eax
	leal	(%esi,%eax), %eax
	movl	-104(%ebp), %esi
	movl	%eax, -168(%ebp)
	movl	%eax, %edx
	.p2align 4,,7
	.p2align 3
.L98:
	movl	-160(%ebp), %eax
	movl	-28(%ebp), %ecx
	cmpl	%ecx, %eax
	jl	.L104
	jmp	.L103
	.p2align 4,,7
	.p2align 3
.L108:
	movzbl	-56(%ebp), %ebx
	movb	%bl, 3(%edx)
	movzbl	-89(%ebp), %ecx
	movb	%cl, 2(%edx)
	movzbl	-88(%ebp), %ebx
	movb	%bl, 1(%edx)
	movzbl	-72(%ebp), %ecx
	movb	%cl, (%edx)
.L101:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L103
.L102:
	addl	-32(%ebp), %edx
.L104:
	testb	$7, %al
	jne	.L99
	movzbl	(%esi), %edi
	addl	$1, %esi
.L99:
	movl	%edi, %ecx
	movzbl	%cl, %ebx
	movl	%eax, %ecx
	andl	$7, %ecx
	btl	%ecx, %ebx
	jc	.L108
	movl	-96(%ebp), %ebx
	testl	%ebx, %ebx
	je	.L101
	movzbl	-120(%ebp), %ebx
	addl	$1, %eax
	movb	%bl, 3(%edx)
	movzbl	-153(%ebp), %ecx
	movb	%cl, 2(%edx)
	movzbl	-152(%ebp), %ebx
	movb	%bl, 1(%edx)
	movzbl	-136(%ebp), %ecx
	movb	%cl, (%edx)
	cmpl	%eax, -28(%ebp)
	jg	.L102
.L103:
	addl	$1, -100(%ebp)
	movl	-164(%ebp), %ebx
	cmpl	%ebx, -100(%ebp)
	je	.L97
	movl	-100(%ebp), %edx
	movl	-168(%ebp), %eax
	movl	-172(%ebp), %esi
	addl	%esi, -104(%ebp)
	sall	$2, %edx
	movl	-104(%ebp), %esi
	subl	%edx, %eax
	movl	%eax, %edx
	jmp	.L98
.L97:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ebx
	movl	140(%ebx), %edx
	testl	%edx, %edx
	je	.L106
	movl	12(%ebp), %esi
	movl	12(%esi), %ecx
	movl	8(%esi), %eax
	movl	%ecx, 12(%esp)
	movl	%eax, 16(%esp)
	movl	20(%esi), %eax
	movl	%eax, 8(%esp)
	movl	16(%esi), %eax
	movl	%ebx, (%esp)
	addl	$1, %eax
	subl	%ecx, %eax
	movl	%eax, 4(%esp)
	call	*%edx
.L106:
	addl	$220, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_byte_lsb_bgra_right, .-convblit_copy_mask_mono_byte_lsb_bgra_right
	.p2align 4,,15
.globl convblit_copy_mask_mono_byte_lsb_bgra_down
	.type	convblit_copy_mask_mono_byte_lsb_bgra_down, @function
convblit_copy_mask_mono_byte_lsb_bgra_down:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$236, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	8(%ebp), %esi
	movl	32(%eax), %eax
	movl	12(%ebp), %edi
	movl	52(%edx), %edx
	movl	%eax, -184(%ebp)
	movl	36(%ecx), %eax
	movl	%edx, -96(%ebp)
	movb	%al, -89(%ebp)
	movl	%eax, %ebx
	movl	%eax, %edx
	shrl	$24, %eax
	movb	%al, -56(%ebp)
	movl	40(%ecx), %eax
	shrl	$8, %ebx
	shrl	$16, %edx
	movb	%bl, -88(%ebp)
	movb	%dl, -72(%ebp)
	movl	%eax, %ecx
	movl	%eax, %ebx
	shrl	$8, %ecx
	movb	%cl, -168(%ebp)
	movl	8(%esi), %ecx
	shrl	$16, %ebx
	movb	%al, -169(%ebp)
	shrl	$24, %eax
	movb	%al, -136(%ebp)
	movl	24(%edi), %eax
	movb	%bl, -152(%ebp)
	movl	64(%edi), %ebx
	subl	$1, %ecx
	subl	16(%edi), %ecx
	movl	%eax, -176(%ebp)
	addl	8(%edi), %eax
	movl	%ecx, 16(%edi)
	movl	12(%esi), %edx
	subl	$1, %edx
	subl	20(%edi), %edx
	movl	%edx, 20(%edi)
	movl	%eax, -28(%ebp)
	movl	56(%edi), %esi
	movl	28(%edi), %eax
	movl	60(%edi), %edi
	movl	%edi, -100(%ebp)
	movl	12(%ebp), %edi
	movl	12(%edi), %edi
	testl	%edi, %edi
	movl	%edi, -180(%ebp)
	jle	.L110
	movl	-176(%ebp), %edi
	imull	-184(%ebp), %eax
	sarl	$3, %edi
	addl	%edi, %eax
	movzbl	-201(%ebp), %edi
	leal	(%esi,%eax), %eax
	movl	%eax, -104(%ebp)
	movl	%edx, %eax
	movl	-104(%ebp), %esi
	imull	%ebx, %eax
	negl	%ebx
	movl	%ebx, -188(%ebp)
	leal	(%eax,%ecx,4), %eax
	addl	-100(%ebp), %eax
	movl	$0, -100(%ebp)
	movl	%eax, -108(%ebp)
	movl	%eax, %edx
	.p2align 4,,7
	.p2align 3
.L111:
	movl	-176(%ebp), %eax
	movl	-28(%ebp), %ecx
	cmpl	%ecx, %eax
	jl	.L117
	jmp	.L116
	.p2align 4,,7
	.p2align 3
.L121:
	movzbl	-56(%ebp), %ebx
	movb	%bl, 3(%edx)
	movzbl	-89(%ebp), %ecx
	movb	%cl, 2(%edx)
	movzbl	-88(%ebp), %ebx
	movb	%bl, 1(%edx)
	movzbl	-72(%ebp), %ecx
	movb	%cl, (%edx)
.L114:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L116
.L115:
	subl	$4, %edx
.L117:
	testb	$7, %al
	jne	.L112
	movzbl	(%esi), %edi
	addl	$1, %esi
.L112:
	movl	%edi, %ecx
	movzbl	%cl, %ebx
	movl	%eax, %ecx
	andl	$7, %ecx
	btl	%ecx, %ebx
	jc	.L121
	movl	-96(%ebp), %ecx
	testl	%ecx, %ecx
	je	.L114
	movzbl	-136(%ebp), %ebx
	addl	$1, %eax
	movb	%bl, 3(%edx)
	movzbl	-169(%ebp), %ecx
	movb	%cl, 2(%edx)
	movzbl	-168(%ebp), %ebx
	movb	%bl, 1(%edx)
	movzbl	-152(%ebp), %ecx
	movb	%cl, (%edx)
	cmpl	%eax, -28(%ebp)
	jg	.L115
.L116:
	addl	$1, -100(%ebp)
	movl	-180(%ebp), %ebx
	cmpl	%ebx, -100(%ebp)
	je	.L110
	movl	-184(%ebp), %esi
	movl	-188(%ebp), %eax
	addl	%esi, -104(%ebp)
	addl	%eax, -108(%ebp)
	movl	-104(%ebp), %esi
	movl	-108(%ebp), %edx
	jmp	.L111
.L110:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ebx
	movl	140(%ebx), %edx
	testl	%edx, %edx
	je	.L119
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
.L119:
	addl	$236, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_byte_lsb_bgra_down, .-convblit_copy_mask_mono_byte_lsb_bgra_down
	.p2align 4,,15
.globl convblit_copy_mask_mono_byte_lsb_bgr
	.type	convblit_copy_mask_mono_byte_lsb_bgr, @function
convblit_copy_mask_mono_byte_lsb_bgr:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$204, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	12(%ebp), %edi
	movl	32(%eax), %eax
	movl	52(%edx), %edx
	movl	64(%edi), %edi
	movl	%eax, -152(%ebp)
	movl	36(%ecx), %eax
	movl	%edx, -80(%ebp)
	movl	%edi, -156(%ebp)
	movb	%al, -73(%ebp)
	movl	%eax, %edx
	shrl	$16, %eax
	movb	%al, -56(%ebp)
	movl	40(%ecx), %eax
	shrl	$8, %edx
	movb	%dl, -72(%ebp)
	movl	12(%ebp), %edx
	movb	%al, -137(%ebp)
	movl	%eax, %ecx
	shrl	$16, %eax
	movl	%edx, %edi
	movl	56(%edx), %ebx
	movb	%al, -120(%ebp)
	movl	12(%ebp), %eax
	shrl	$8, %ecx
	movl	12(%edi), %edi
	movb	%cl, -136(%ebp)
	movl	60(%edx), %esi
	movl	20(%edx), %ecx
	movl	24(%eax), %eax
	movl	%eax, -144(%ebp)
	addl	8(%edx), %eax
	testl	%edi, %edi
	movl	%eax, -28(%ebp)
	movl	28(%edx), %eax
	movl	16(%edx), %edx
	movl	%edi, -148(%ebp)
	jle	.L123
	movl	-144(%ebp), %edi
	leal	(%edx,%edx,2), %edx
	imull	-152(%ebp), %eax
	movl	$0, -84(%ebp)
	sarl	$3, %edi
	addl	%edi, %eax
	movzbl	-169(%ebp), %edi
	leal	(%ebx,%eax), %eax
	movl	%eax, -88(%ebp)
	movl	-156(%ebp), %eax
	imull	%ecx, %eax
	leal	(%edx,%eax), %eax
	leal	(%esi,%eax), %eax
	movl	-88(%ebp), %esi
	movl	%eax, -92(%ebp)
	movl	%eax, %edx
	.p2align 4,,7
	.p2align 3
.L124:
	movl	-144(%ebp), %eax
	movl	-28(%ebp), %ecx
	cmpl	%ecx, %eax
	jl	.L130
	jmp	.L129
	.p2align 4,,7
	.p2align 3
.L134:
	movzbl	-73(%ebp), %ecx
	movb	%cl, 2(%edx)
	movzbl	-72(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-56(%ebp), %ecx
	movb	%cl, (%edx)
.L127:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L129
.L128:
	addl	$3, %edx
.L130:
	testb	$7, %al
	jne	.L125
	movzbl	(%esi), %edi
	addl	$1, %esi
.L125:
	movl	%edi, %ecx
	movzbl	%cl, %ebx
	movl	%eax, %ecx
	andl	$7, %ecx
	btl	%ecx, %ebx
	jc	.L134
	movl	-80(%ebp), %ebx
	testl	%ebx, %ebx
	je	.L127
	movzbl	-137(%ebp), %ecx
	addl	$1, %eax
	movb	%cl, 2(%edx)
	movzbl	-136(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-120(%ebp), %ecx
	movb	%cl, (%edx)
	cmpl	%eax, -28(%ebp)
	jg	.L128
.L129:
	addl	$1, -84(%ebp)
	movl	-148(%ebp), %eax
	cmpl	%eax, -84(%ebp)
	je	.L123
	movl	-152(%ebp), %edx
	movl	-156(%ebp), %ecx
	addl	%edx, -88(%ebp)
	addl	%ecx, -92(%ebp)
	movl	-88(%ebp), %esi
	movl	-92(%ebp), %edx
	jmp	.L124
.L123:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %edi
	movl	140(%edi), %eax
	testl	%eax, %eax
	je	.L132
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
.L132:
	addl	$204, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_byte_lsb_bgr, .-convblit_copy_mask_mono_byte_lsb_bgr
	.p2align 4,,15
.globl convblit_copy_mask_mono_byte_lsb_bgr_left
	.type	convblit_copy_mask_mono_byte_lsb_bgr_left, @function
convblit_copy_mask_mono_byte_lsb_bgr_left:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$172, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	8(%ebp), %edi
	movl	32(%eax), %eax
	movl	52(%edx), %edx
	movl	%eax, -136(%ebp)
	movl	36(%ecx), %eax
	movl	%edx, -80(%ebp)
	movb	%al, -73(%ebp)
	movl	%eax, %ebx
	shrl	$16, %eax
	movb	%al, -56(%ebp)
	movl	40(%ecx), %eax
	shrl	$8, %ebx
	movb	%bl, -72(%ebp)
	movl	%ecx, %ebx
	movl	20(%ecx), %ecx
	movl	64(%ebx), %esi
	movl	%eax, %edx
	shrl	$8, %edx
	movb	%dl, -120(%ebp)
	movl	8(%edi), %edx
	movl	12(%ebp), %edi
	movb	%al, -121(%ebp)
	shrl	$16, %eax
	movb	%al, -104(%ebp)
	movl	%esi, %eax
	subl	$1, %edx
	negl	%eax
	subl	16(%ebx), %edx
	movl	%ecx, 16(%ebx)
	movl	%eax, -32(%ebp)
	movl	56(%edi), %eax
	movl	%edx, 20(%ebx)
	movl	24(%ebx), %ebx
	movl	%ebx, -128(%ebp)
	addl	8(%edi), %ebx
	movl	%ebx, -28(%ebp)
	movl	%eax, -88(%ebp)
	movl	60(%edi), %ebx
	movl	28(%edi), %eax
	movl	%ebx, -84(%ebp)
	movl	12(%edi), %ebx
	testl	%ebx, %ebx
	jle	.L136
	movl	-128(%ebp), %edi
	imull	%esi, %edx
	imull	-136(%ebp), %eax
	sarl	$3, %edi
	addl	%edi, %eax
	movzbl	-137(%ebp), %edi
	addl	-88(%ebp), %eax
	movl	%eax, -88(%ebp)
	leal	(%ecx,%ecx,2), %eax
	movl	-88(%ebp), %esi
	leal	(%edx,%eax), %eax
	addl	-84(%ebp), %eax
	movl	%eax, -84(%ebp)
	leal	-3(%ebx,%ebx,2), %eax
	movl	-84(%ebp), %edx
	addl	-84(%ebp), %eax
	movl	%eax, -132(%ebp)
	.p2align 4,,7
	.p2align 3
.L137:
	movl	-128(%ebp), %eax
	movl	-28(%ebp), %ecx
	cmpl	%ecx, %eax
	jl	.L143
	jmp	.L142
	.p2align 4,,7
	.p2align 3
.L147:
	movzbl	-73(%ebp), %ebx
	movb	%bl, 2(%edx)
	movzbl	-72(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-56(%ebp), %ebx
	movb	%bl, (%edx)
.L140:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L142
.L141:
	addl	-32(%ebp), %edx
.L143:
	testb	$7, %al
	jne	.L138
	movzbl	(%esi), %edi
	addl	$1, %esi
.L138:
	movl	%edi, %ecx
	movzbl	%cl, %ebx
	movl	%eax, %ecx
	andl	$7, %ecx
	btl	%ecx, %ebx
	jc	.L147
	movl	-80(%ebp), %ecx
	testl	%ecx, %ecx
	je	.L140
	movzbl	-121(%ebp), %ecx
	addl	$1, %eax
	movb	%cl, 2(%edx)
	movzbl	-120(%ebp), %ebx
	movb	%bl, 1(%edx)
	movzbl	-104(%ebp), %ecx
	movb	%cl, (%edx)
	cmpl	%eax, -28(%ebp)
	jg	.L141
.L142:
	movl	-132(%ebp), %ebx
	cmpl	%ebx, -84(%ebp)
	je	.L136
	movl	-136(%ebp), %eax
	addl	%eax, -88(%ebp)
	addl	$3, -84(%ebp)
	movl	-88(%ebp), %esi
	movl	-84(%ebp), %edx
	jmp	.L137
.L136:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ebx
	movl	140(%ebx), %edx
	testl	%edx, %edx
	je	.L145
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
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	*%edx
.L145:
	addl	$172, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_byte_lsb_bgr_left, .-convblit_copy_mask_mono_byte_lsb_bgr_left
	.p2align 4,,15
.globl convblit_copy_mask_mono_byte_lsb_bgr_right
	.type	convblit_copy_mask_mono_byte_lsb_bgr_right, @function
convblit_copy_mask_mono_byte_lsb_bgr_right:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$172, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	12(%ebp), %edi
	movl	32(%eax), %eax
	movl	52(%edx), %edx
	movl	56(%edi), %esi
	movl	%eax, -136(%ebp)
	movl	36(%ecx), %eax
	movl	%edx, -80(%ebp)
	movb	%al, -73(%ebp)
	movl	%eax, %ebx
	shrl	$16, %eax
	movb	%al, -56(%ebp)
	movl	40(%ecx), %eax
	shrl	$8, %ebx
	movb	%bl, -72(%ebp)
	movl	16(%ecx), %ebx
	movl	8(%ebp), %ecx
	movl	%eax, %edx
	shrl	$8, %edx
	movb	%dl, -120(%ebp)
	movl	12(%ecx), %edx
	movb	%al, -121(%ebp)
	shrl	$16, %eax
	movl	24(%edi), %ecx
	movb	%al, -104(%ebp)
	movl	64(%edi), %eax
	subl	$1, %edx
	subl	20(%edi), %edx
	movl	%eax, -32(%ebp)
	movl	28(%edi), %eax
	movl	%ebx, 20(%edi)
	movl	%edx, 16(%edi)
	movl	%ecx, -128(%ebp)
	addl	8(%edi), %ecx
	movl	60(%edi), %edi
	movl	%ecx, -28(%ebp)
	movl	%edi, -84(%ebp)
	movl	12(%ebp), %edi
	movl	12(%edi), %ecx
	testl	%ecx, %ecx
	jle	.L149
	movl	-128(%ebp), %edi
	leal	(%edx,%edx,2), %edx
	imull	-136(%ebp), %eax
	sarl	$3, %edi
	addl	%edi, %eax
	movzbl	-137(%ebp), %edi
	leal	(%esi,%eax), %eax
	movl	%eax, -88(%ebp)
	movl	-32(%ebp), %eax
	movl	-88(%ebp), %esi
	imull	%ebx, %eax
	leal	(%edx,%eax), %eax
	addl	-84(%ebp), %eax
	movl	%eax, -84(%ebp)
	movl	-84(%ebp), %edx
	leal	(%ecx,%ecx,2), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	-84(%ebp), %edx
	addl	$3, %eax
	movl	%eax, -132(%ebp)
	.p2align 4,,7
	.p2align 3
.L150:
	movl	-128(%ebp), %eax
	movl	-28(%ebp), %ecx
	cmpl	%ecx, %eax
	jl	.L156
	jmp	.L155
	.p2align 4,,7
	.p2align 3
.L160:
	movzbl	-73(%ebp), %ebx
	movb	%bl, 2(%edx)
	movzbl	-72(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-56(%ebp), %ebx
	movb	%bl, (%edx)
.L153:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L155
.L154:
	addl	-32(%ebp), %edx
.L156:
	testb	$7, %al
	jne	.L151
	movzbl	(%esi), %edi
	addl	$1, %esi
.L151:
	movl	%edi, %ecx
	movzbl	%cl, %ebx
	movl	%eax, %ecx
	andl	$7, %ecx
	btl	%ecx, %ebx
	jc	.L160
	movl	-80(%ebp), %ebx
	testl	%ebx, %ebx
	je	.L153
	movzbl	-121(%ebp), %ecx
	addl	$1, %eax
	movb	%cl, 2(%edx)
	movzbl	-120(%ebp), %ebx
	movb	%bl, 1(%edx)
	movzbl	-104(%ebp), %ecx
	movb	%cl, (%edx)
	cmpl	%eax, -28(%ebp)
	jg	.L154
.L155:
	movl	-132(%ebp), %ebx
	cmpl	%ebx, -84(%ebp)
	je	.L149
	movl	-136(%ebp), %eax
	addl	%eax, -88(%ebp)
	subl	$3, -84(%ebp)
	movl	-88(%ebp), %esi
	movl	-84(%ebp), %edx
	jmp	.L150
.L149:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ebx
	movl	140(%ebx), %edx
	testl	%edx, %edx
	je	.L158
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
.L158:
	addl	$172, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_byte_lsb_bgr_right, .-convblit_copy_mask_mono_byte_lsb_bgr_right
	.p2align 4,,15
.globl convblit_copy_mask_mono_byte_lsb_bgr_down
	.type	convblit_copy_mask_mono_byte_lsb_bgr_down, @function
convblit_copy_mask_mono_byte_lsb_bgr_down:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$204, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	32(%eax), %eax
	movl	52(%edx), %edx
	movl	%eax, -152(%ebp)
	movl	36(%ecx), %eax
	movl	%edx, -80(%ebp)
	movb	%al, -73(%ebp)
	movl	%eax, %ebx
	shrl	$16, %eax
	movb	%al, -56(%ebp)
	movl	40(%ecx), %eax
	shrl	$8, %ebx
	movl	8(%ebp), %ecx
	movb	%bl, -72(%ebp)
	movl	12(%ebp), %ebx
	movl	%eax, %edx
	shrl	$8, %edx
	movb	%dl, -136(%ebp)
	movl	8(%ecx), %edx
	movl	%ebx, %edi
	movb	%al, -137(%ebp)
	shrl	$16, %eax
	movl	56(%edi), %esi
	movb	%al, -120(%ebp)
	movl	24(%edi), %eax
	subl	$1, %edx
	subl	16(%ebx), %edx
	movl	%eax, -144(%ebp)
	addl	8(%edi), %eax
	movl	%edx, 16(%ebx)
	movl	12(%ecx), %ecx
	movl	%eax, -28(%ebp)
	movl	28(%edi), %eax
	movl	60(%edi), %edi
	subl	$1, %ecx
	subl	20(%ebx), %ecx
	movl	%ecx, 20(%ebx)
	movl	64(%ebx), %ebx
	movl	%edi, -84(%ebp)
	movl	12(%ebp), %edi
	movl	12(%edi), %edi
	testl	%edi, %edi
	movl	%edi, -148(%ebp)
	jle	.L162
	movl	-144(%ebp), %edi
	leal	(%edx,%edx,2), %edx
	imull	-152(%ebp), %eax
	sarl	$3, %edi
	addl	%edi, %eax
	movzbl	-169(%ebp), %edi
	leal	(%esi,%eax), %eax
	movl	%eax, -88(%ebp)
	movl	%ecx, %eax
	movl	-88(%ebp), %esi
	imull	%ebx, %eax
	negl	%ebx
	movl	%ebx, -156(%ebp)
	leal	(%edx,%eax), %eax
	addl	-84(%ebp), %eax
	movl	$0, -84(%ebp)
	movl	%eax, -92(%ebp)
	movl	%eax, %edx
	.p2align 4,,7
	.p2align 3
.L163:
	movl	-144(%ebp), %eax
	movl	-28(%ebp), %ecx
	cmpl	%ecx, %eax
	jl	.L169
	jmp	.L168
	.p2align 4,,7
	.p2align 3
.L173:
	movzbl	-73(%ebp), %ebx
	movb	%bl, 2(%edx)
	movzbl	-72(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-56(%ebp), %ebx
	movb	%bl, (%edx)
.L166:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L168
.L167:
	subl	$3, %edx
.L169:
	testb	$7, %al
	jne	.L164
	movzbl	(%esi), %edi
	addl	$1, %esi
.L164:
	movl	%edi, %ecx
	movzbl	%cl, %ebx
	movl	%eax, %ecx
	andl	$7, %ecx
	btl	%ecx, %ebx
	jc	.L173
	movl	-80(%ebp), %ecx
	testl	%ecx, %ecx
	je	.L166
	movzbl	-137(%ebp), %ecx
	addl	$1, %eax
	movb	%cl, 2(%edx)
	movzbl	-136(%ebp), %ebx
	movb	%bl, 1(%edx)
	movzbl	-120(%ebp), %ecx
	movb	%cl, (%edx)
	cmpl	%eax, -28(%ebp)
	jg	.L167
.L168:
	addl	$1, -84(%ebp)
	movl	-148(%ebp), %ebx
	cmpl	%ebx, -84(%ebp)
	je	.L162
	movl	-152(%ebp), %esi
	movl	-156(%ebp), %eax
	addl	%esi, -88(%ebp)
	addl	%eax, -92(%ebp)
	movl	-88(%ebp), %esi
	movl	-92(%ebp), %edx
	jmp	.L163
.L162:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ebx
	movl	140(%ebx), %edx
	testl	%edx, %edx
	je	.L171
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
.L171:
	addl	$204, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_byte_lsb_bgr_down, .-convblit_copy_mask_mono_byte_lsb_bgr_down
	.p2align 4,,15
.globl convblit_copy_mask_mono_byte_lsb_16bpp
	.type	convblit_copy_mask_mono_byte_lsb_16bpp, @function
convblit_copy_mask_mono_byte_lsb_16bpp:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$188, %esp
	movl	12(%ebp), %edx
	movl	12(%ebp), %ecx
	movl	12(%ebp), %eax
	movl	12(%ebp), %esi
	movl	52(%edx), %edx
	movl	32(%eax), %eax
	movl	64(%esi), %esi
	movl	%edx, -60(%ebp)
	movl	36(%ecx), %edx
	movl	%eax, -108(%ebp)
	movl	%esi, -112(%ebp)
	movb	%dl, -168(%ebp)
	movl	%edx, %eax
	shrl	$16, %edx
	movb	%dl, -56(%ebp)
	movl	40(%ecx), %edx
	shrl	$8, %eax
	movb	%al, -152(%ebp)
	movl	12(%ebp), %eax
	movb	%dl, -88(%ebp)
	movl	%edx, %ecx
	shrl	$16, %edx
	movl	24(%eax), %eax
	movb	%dl, -64(%ebp)
	movl	12(%ebp), %edx
	shrl	$8, %ecx
	movb	%cl, -136(%ebp)
	movl	%eax, -100(%ebp)
	movl	60(%edx), %ecx
	movl	%edx, %esi
	addl	8(%edx), %eax
	movl	56(%edx), %ebx
	movl	%ecx, -92(%ebp)
	movl	16(%esi), %ecx
	movl	12(%esi), %esi
	movl	%eax, -28(%ebp)
	movl	28(%edx), %eax
	movl	20(%edx), %edx
	testl	%esi, %esi
	movl	%esi, -104(%ebp)
	jle	.L175
	movl	-100(%ebp), %esi
	imull	-108(%ebp), %eax
	sarl	$3, %esi
	leal	(%esi,%eax), %eax
	leal	(%ebx,%eax), %eax
	movl	%eax, -96(%ebp)
	movl	-112(%ebp), %eax
	movl	-96(%ebp), %esi
	imull	%edx, %eax
	movzbl	-56(%ebp), %edx
	leal	(%eax,%ecx,2), %eax
	addl	-92(%ebp), %eax
	shrb	$3, %dl
	movzbl	%dl, %edx
	movl	%eax, -92(%ebp)
	movzbl	-168(%ebp), %eax
	movw	%dx, -56(%ebp)
	movzbl	-64(%ebp), %edx
	movl	$0, -64(%ebp)
	andl	$248, %eax
	sall	$8, %eax
	orw	%ax, -56(%ebp)
	movzbl	-152(%ebp), %eax
	shrb	$3, %dl
	movzbl	%dl, %edx
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -56(%ebp)
	movzbl	-88(%ebp), %eax
	movw	%dx, -88(%ebp)
	movl	-92(%ebp), %edx
	andl	$248, %eax
	sall	$8, %eax
	orw	%ax, -88(%ebp)
	movzbl	-136(%ebp), %eax
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -88(%ebp)
	.p2align 4,,7
	.p2align 3
.L176:
	movl	-100(%ebp), %eax
	movl	-28(%ebp), %ecx
	cmpl	%ecx, %eax
	jl	.L182
	jmp	.L181
	.p2align 4,,7
	.p2align 3
.L186:
	movzwl	-56(%ebp), %ecx
	movw	%cx, (%edx)
.L179:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L181
.L180:
	addl	$2, %edx
.L182:
	testb	$7, %al
	jne	.L177
	movzbl	(%esi), %edi
	addl	$1, %esi
.L177:
	movl	%edi, %ecx
	movzbl	%cl, %ebx
	movl	%eax, %ecx
	andl	$7, %ecx
	btl	%ecx, %ebx
	jc	.L186
	movl	-60(%ebp), %ebx
	testl	%ebx, %ebx
	je	.L179
	movzwl	-88(%ebp), %ecx
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	movw	%cx, (%edx)
	jg	.L180
.L181:
	addl	$1, -64(%ebp)
	movl	-104(%ebp), %esi
	cmpl	%esi, -64(%ebp)
	je	.L175
	movl	-112(%ebp), %edx
	movl	-108(%ebp), %eax
	addl	%eax, -96(%ebp)
	addl	%edx, -92(%ebp)
	movl	-96(%ebp), %esi
	movl	-92(%ebp), %edx
	jmp	.L176
.L175:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %esi
	movl	140(%esi), %eax
	testl	%eax, %eax
	je	.L184
	movl	12(%ebp), %ecx
	movl	12(%ecx), %edx
	movl	%edx, 16(%esp)
	movl	8(%ecx), %edx
	movl	%edx, 12(%esp)
	movl	20(%ecx), %edx
	movl	%edx, 8(%esp)
	movl	16(%ecx), %edx
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	call	*%eax
.L184:
	addl	$188, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_byte_lsb_16bpp, .-convblit_copy_mask_mono_byte_lsb_16bpp
	.p2align 4,,15
.globl convblit_copy_mask_mono_byte_lsb_16bpp_left
	.type	convblit_copy_mask_mono_byte_lsb_16bpp_left, @function
convblit_copy_mask_mono_byte_lsb_16bpp_left:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$204, %esp
	movl	12(%ebp), %ebx
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %esi
	movl	36(%ebx), %edx
	movl	32(%eax), %eax
	movl	52(%ecx), %ecx
	movb	%dl, -168(%ebp)
	movl	%eax, -108(%ebp)
	movl	%edx, %eax
	shrl	$16, %edx
	movb	%dl, -56(%ebp)
	movl	40(%ebx), %edx
	shrl	$8, %eax
	movl	%ecx, -60(%ebp)
	movb	%al, -152(%ebp)
	movl	24(%esi), %eax
	movl	%edx, %ecx
	shrl	$8, %ecx
	movb	%cl, -136(%ebp)
	movl	20(%ebx), %ecx
	movl	8(%ebp), %ebx
	movb	%dl, -88(%ebp)
	shrl	$16, %edx
	movb	%dl, -64(%ebp)
	movl	%eax, -96(%ebp)
	movl	8(%ebx), %edx
	movl	64(%esi), %ebx
	addl	8(%esi), %eax
	subl	$1, %edx
	movl	%ebx, %edi
	negl	%edi
	movl	%edi, -32(%ebp)
	movl	%esi, %edi
	movl	%eax, -28(%ebp)
	movl	28(%edi), %eax
	movl	60(%edi), %edi
	subl	16(%esi), %edx
	movl	%ecx, 16(%esi)
	movl	%edx, 20(%esi)
	movl	56(%esi), %esi
	movl	%edi, -100(%ebp)
	movl	12(%ebp), %edi
	movl	12(%edi), %edi
	testl	%edi, %edi
	movl	%edi, -104(%ebp)
	jle	.L188
	movl	-96(%ebp), %edi
	imull	-108(%ebp), %eax
	sarl	$3, %edi
	addl	%edi, %eax
	movzbl	-169(%ebp), %edi
	leal	(%esi,%eax), %eax
	movl	%eax, -92(%ebp)
	movl	%edx, %eax
	movzbl	-56(%ebp), %edx
	imull	%ebx, %eax
	movl	-92(%ebp), %esi
	shrb	$3, %dl
	leal	(%eax,%ecx,2), %eax
	movzbl	%dl, %edx
	addl	-100(%ebp), %eax
	movw	%dx, -56(%ebp)
	movzbl	-64(%ebp), %edx
	movl	$0, -64(%ebp)
	movl	%eax, -100(%ebp)
	movzbl	-168(%ebp), %eax
	shrb	$3, %dl
	movzbl	%dl, %edx
	andl	$248, %eax
	sall	$8, %eax
	orw	%ax, -56(%ebp)
	movzbl	-152(%ebp), %eax
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -56(%ebp)
	movzbl	-88(%ebp), %eax
	movw	%dx, -88(%ebp)
	movl	-100(%ebp), %edx
	andl	$248, %eax
	sall	$8, %eax
	orw	%ax, -88(%ebp)
	movzbl	-136(%ebp), %eax
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -88(%ebp)
	.p2align 4,,7
	.p2align 3
.L189:
	movl	-96(%ebp), %eax
	movl	-28(%ebp), %ebx
	cmpl	%ebx, %eax
	jl	.L195
	jmp	.L194
	.p2align 4,,7
	.p2align 3
.L199:
	movzwl	-56(%ebp), %ebx
	movw	%bx, (%edx)
.L192:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L194
.L193:
	addl	-32(%ebp), %edx
.L195:
	testb	$7, %al
	jne	.L190
	movzbl	(%esi), %edi
	addl	$1, %esi
.L190:
	movl	%edi, %ecx
	movzbl	%cl, %ebx
	movl	%eax, %ecx
	andl	$7, %ecx
	btl	%ecx, %ebx
	jc	.L199
	movl	-60(%ebp), %ecx
	testl	%ecx, %ecx
	je	.L192
	movzwl	-88(%ebp), %ecx
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	movw	%cx, (%edx)
	jg	.L193
.L194:
	addl	$1, -64(%ebp)
	movl	-104(%ebp), %ebx
	cmpl	%ebx, -64(%ebp)
	je	.L188
	movl	-64(%ebp), %eax
	movl	-100(%ebp), %ecx
	movl	-108(%ebp), %esi
	addl	%esi, -92(%ebp)
	movl	-92(%ebp), %esi
	leal	(%ecx,%eax,2), %edx
	jmp	.L189
.L188:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %esi
	movl	140(%esi), %edx
	testl	%edx, %edx
	je	.L197
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
.L197:
	addl	$204, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_byte_lsb_16bpp_left, .-convblit_copy_mask_mono_byte_lsb_16bpp_left
	.p2align 4,,15
.globl convblit_copy_mask_mono_byte_lsb_16bpp_right
	.type	convblit_copy_mask_mono_byte_lsb_16bpp_right, @function
convblit_copy_mask_mono_byte_lsb_16bpp_right:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$204, %esp
	movl	12(%ebp), %ebx
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %esi
	movl	36(%ebx), %edx
	movl	32(%eax), %eax
	movl	52(%ecx), %ecx
	movl	64(%esi), %edi
	movb	%dl, -168(%ebp)
	movl	%eax, -108(%ebp)
	movl	%edx, %eax
	shrl	$16, %edx
	movb	%dl, -56(%ebp)
	movl	40(%ebx), %edx
	shrl	$8, %eax
	movl	%ecx, -60(%ebp)
	movb	%al, -152(%ebp)
	movl	24(%esi), %eax
	movl	%edi, -32(%ebp)
	movl	%esi, %edi
	movl	%edx, %ecx
	movl	12(%edi), %edi
	shrl	$8, %ecx
	movb	%cl, -136(%ebp)
	movl	16(%ebx), %ecx
	movl	8(%ebp), %ebx
	movb	%dl, -88(%ebp)
	shrl	$16, %edx
	movb	%dl, -64(%ebp)
	movl	%eax, -96(%ebp)
	movl	12(%ebx), %edx
	addl	8(%esi), %eax
	movl	56(%esi), %ebx
	subl	$1, %edx
	subl	20(%esi), %edx
	testl	%edi, %edi
	movl	%ecx, 20(%esi)
	movl	%eax, -28(%ebp)
	movl	28(%esi), %eax
	movl	%edx, 16(%esi)
	movl	60(%esi), %esi
	movl	%edi, -100(%ebp)
	jle	.L201
	movl	-96(%ebp), %edi
	imull	-108(%ebp), %eax
	sarl	$3, %edi
	addl	%edi, %eax
	movzbl	-169(%ebp), %edi
	leal	(%ebx,%eax), %eax
	movl	%eax, -92(%ebp)
	movl	-32(%ebp), %eax
	imull	%ecx, %eax
	leal	(%eax,%edx,2), %eax
	movzbl	-56(%ebp), %edx
	leal	(%esi,%eax), %eax
	movl	-92(%ebp), %esi
	movl	%eax, -104(%ebp)
	movzbl	-168(%ebp), %eax
	shrb	$3, %dl
	movzbl	%dl, %edx
	andl	$248, %eax
	movw	%dx, -56(%ebp)
	sall	$8, %eax
	movzbl	-64(%ebp), %edx
	orw	%ax, -56(%ebp)
	movzbl	-152(%ebp), %eax
	movl	$0, -64(%ebp)
	shrb	$3, %dl
	movzbl	%dl, %edx
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -56(%ebp)
	movzbl	-88(%ebp), %eax
	movw	%dx, -88(%ebp)
	movl	-104(%ebp), %edx
	andl	$248, %eax
	sall	$8, %eax
	orw	%ax, -88(%ebp)
	movzbl	-136(%ebp), %eax
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -88(%ebp)
	.p2align 4,,7
	.p2align 3
.L202:
	movl	-96(%ebp), %eax
	movl	-28(%ebp), %ecx
	cmpl	%ecx, %eax
	jl	.L208
	jmp	.L207
	.p2align 4,,7
	.p2align 3
.L212:
	movzwl	-56(%ebp), %ebx
	movw	%bx, (%edx)
.L205:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L207
.L206:
	addl	-32(%ebp), %edx
.L208:
	testb	$7, %al
	jne	.L203
	movzbl	(%esi), %edi
	addl	$1, %esi
.L203:
	movl	%edi, %ecx
	movzbl	%cl, %ebx
	movl	%eax, %ecx
	andl	$7, %ecx
	btl	%ecx, %ebx
	jc	.L212
	movl	-60(%ebp), %ebx
	testl	%ebx, %ebx
	je	.L205
	movzwl	-88(%ebp), %ecx
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	movw	%cx, (%edx)
	jg	.L206
.L207:
	addl	$1, -64(%ebp)
	movl	-100(%ebp), %ebx
	cmpl	%ebx, -64(%ebp)
	je	.L201
	movl	-64(%ebp), %edx
	movl	-104(%ebp), %eax
	movl	-108(%ebp), %esi
	addl	%esi, -92(%ebp)
	addl	%edx, %edx
	movl	-92(%ebp), %esi
	subl	%edx, %eax
	movl	%eax, %edx
	jmp	.L202
.L201:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ebx
	movl	140(%ebx), %edx
	testl	%edx, %edx
	je	.L210
	movl	12(%ebp), %esi
	movl	12(%esi), %ecx
	movl	8(%esi), %eax
	movl	%ecx, 12(%esp)
	movl	%eax, 16(%esp)
	movl	20(%esi), %eax
	movl	%eax, 8(%esp)
	movl	16(%esi), %eax
	movl	%ebx, (%esp)
	addl	$1, %eax
	subl	%ecx, %eax
	movl	%eax, 4(%esp)
	call	*%edx
.L210:
	addl	$204, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_byte_lsb_16bpp_right, .-convblit_copy_mask_mono_byte_lsb_16bpp_right
	.p2align 4,,15
.globl convblit_copy_mask_mono_word_msb_bgra
	.type	convblit_copy_mask_mono_word_msb_bgra, @function
convblit_copy_mask_mono_word_msb_bgra:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$252, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	12(%ebp), %esi
	movl	32(%eax), %eax
	movl	12(%ebp), %edi
	movl	52(%edx), %edx
	movl	%eax, -184(%ebp)
	movl	36(%ecx), %eax
	movl	24(%edi), %edi
	movl	%edx, -96(%ebp)
	movb	%al, -89(%ebp)
	movl	%eax, %edx
	movl	%eax, %ecx
	shrl	$24, %eax
	movb	%al, -56(%ebp)
	movl	40(%esi), %eax
	shrl	$8, %edx
	shrl	$16, %ecx
	movl	64(%esi), %esi
	movb	%dl, -88(%ebp)
	movb	%cl, -72(%ebp)
	movb	%al, -169(%ebp)
	movl	%eax, %edx
	movl	%eax, %ecx
	shrl	$24, %eax
	movb	%al, -136(%ebp)
	movl	12(%ebp), %eax
	shrl	$8, %edx
	movl	%edi, -176(%ebp)
	shrl	$16, %ecx
	movb	%dl, -168(%ebp)
	movb	%cl, -152(%ebp)
	addl	8(%eax), %edi
	movl	%eax, %edx
	movl	%edx, %ecx
	movl	56(%eax), %ebx
	movl	%esi, -188(%ebp)
	movl	28(%eax), %eax
	movl	%edi, -28(%ebp)
	movl	%ecx, %edi
	movl	60(%edx), %esi
	movl	12(%edi), %edi
	movl	20(%edx), %edx
	movl	16(%ecx), %ecx
	testl	%edi, %edi
	movl	%edi, -180(%ebp)
	jle	.L214
	movl	-176(%ebp), %edi
	imull	-184(%ebp), %eax
	movl	$0, -100(%ebp)
	sarl	$3, %edi
	addl	%edi, %eax
	movzwl	-202(%ebp), %edi
	leal	(%ebx,%eax), %eax
	movl	%eax, -108(%ebp)
	movl	-188(%ebp), %eax
	imull	%edx, %eax
	leal	(%eax,%ecx,4), %eax
	leal	(%esi,%eax), %eax
	movl	%eax, -104(%ebp)
	.p2align 4,,7
	.p2align 3
.L220:
	movl	-28(%ebp), %eax
	cmpl	%eax, -176(%ebp)
	jge	.L215
	movl	-108(%ebp), %esi
	movl	-104(%ebp), %edx
	movl	-176(%ebp), %eax
	movl	%esi, -220(%ebp)
	jmp	.L219
	.p2align 4,,7
	.p2align 3
.L224:
	movzbl	-56(%ebp), %ecx
	movb	%cl, 3(%edx)
	movzbl	-89(%ebp), %ecx
	movb	%cl, 2(%edx)
	movzbl	-88(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-72(%ebp), %ecx
	movb	%cl, (%edx)
.L218:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L215
.L225:
	addl	$4, %edx
.L219:
	testb	$15, %al
	jne	.L216
	movl	-220(%ebp), %ecx
	movzwl	(%ecx), %edi
	addl	$2, %ecx
	movl	%ecx, -220(%ebp)
.L216:
	movl	%eax, %esi
	movzwl	%di, %ebx
	andl	$15, %esi
	movl	%esi, -208(%ebp)
	movzbl	-208(%ebp), %ecx
	movl	$32768, %esi
	sarl	%cl, %esi
	testl	%ebx, %esi
	jne	.L224
	movl	-96(%ebp), %esi
	testl	%esi, %esi
	je	.L218
	movzbl	-136(%ebp), %ecx
	addl	$1, %eax
	movb	%cl, 3(%edx)
	movzbl	-169(%ebp), %ecx
	movb	%cl, 2(%edx)
	movzbl	-168(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-152(%ebp), %ecx
	movb	%cl, (%edx)
	cmpl	%eax, -28(%ebp)
	jg	.L225
.L215:
	addl	$1, -100(%ebp)
	movl	-180(%ebp), %esi
	cmpl	%esi, -100(%ebp)
	je	.L214
	movl	-184(%ebp), %eax
	movl	-188(%ebp), %edx
	addl	%eax, -108(%ebp)
	addl	%edx, -104(%ebp)
	jmp	.L220
.L214:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ecx
	movl	140(%ecx), %eax
	testl	%eax, %eax
	je	.L222
	movl	12(%ebp), %esi
	movl	12(%esi), %edx
	movl	%edx, 16(%esp)
	movl	8(%esi), %edx
	movl	%edx, 12(%esp)
	movl	20(%esi), %edx
	movl	%edx, 8(%esp)
	movl	16(%esi), %edx
	movl	%ecx, (%esp)
	movl	%edx, 4(%esp)
	call	*%eax
.L222:
	addl	$252, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_word_msb_bgra, .-convblit_copy_mask_mono_word_msb_bgra
	.p2align 4,,15
.globl convblit_copy_mask_mono_word_msb_bgra_left
	.type	convblit_copy_mask_mono_word_msb_bgra_left, @function
convblit_copy_mask_mono_word_msb_bgra_left:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$236, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	8(%ebp), %edi
	movl	32(%eax), %eax
	movl	12(%ebp), %esi
	movl	52(%edx), %edx
	movl	%eax, -184(%ebp)
	movl	36(%ecx), %eax
	movl	%edx, -96(%ebp)
	movb	%al, -89(%ebp)
	movl	%eax, %ebx
	movl	%eax, %edx
	shrl	$24, %eax
	movb	%al, -56(%ebp)
	movl	40(%ecx), %eax
	shrl	$16, %edx
	movb	%dl, -72(%ebp)
	movl	8(%edi), %edx
	shrl	$8, %ebx
	movb	%bl, -88(%ebp)
	movl	12(%ebp), %edi
	movl	%eax, %ecx
	movl	%eax, %ebx
	shrl	$8, %ecx
	subl	$1, %edx
	movb	%cl, -168(%ebp)
	movl	20(%esi), %ecx
	shrl	$16, %ebx
	subl	16(%esi), %edx
	movb	%bl, -152(%ebp)
	movl	64(%esi), %ebx
	movb	%al, -169(%ebp)
	shrl	$24, %eax
	movl	%edx, 20(%esi)
	movl	%ecx, 16(%esi)
	movl	24(%esi), %esi
	movb	%al, -136(%ebp)
	movl	%ebx, %eax
	negl	%eax
	movl	%eax, -32(%ebp)
	movl	%esi, -176(%ebp)
	addl	8(%edi), %esi
	movl	%esi, -28(%ebp)
	movl	56(%edi), %esi
	movl	28(%edi), %eax
	movl	60(%edi), %edi
	movl	%edi, -100(%ebp)
	movl	12(%ebp), %edi
	movl	12(%edi), %edi
	testl	%edi, %edi
	movl	%edi, -180(%ebp)
	jle	.L227
	movl	-176(%ebp), %edi
	imull	-184(%ebp), %eax
	sarl	$3, %edi
	addl	%edi, %eax
	movzwl	-186(%ebp), %edi
	leal	(%esi,%eax), %eax
	movl	%eax, -108(%ebp)
	movl	%edx, %eax
	imull	%ebx, %eax
	leal	(%eax,%ecx,4), %eax
	addl	-100(%ebp), %eax
	movl	$0, -100(%ebp)
	movl	%eax, -104(%ebp)
	.p2align 4,,7
	.p2align 3
.L233:
	movl	-28(%ebp), %eax
	cmpl	%eax, -176(%ebp)
	jge	.L228
	movl	-108(%ebp), %esi
	movl	-104(%ebp), %edx
	movl	-176(%ebp), %eax
	movl	%esi, -204(%ebp)
	jmp	.L232
	.p2align 4,,7
	.p2align 3
.L237:
	movzbl	-56(%ebp), %ecx
	movb	%cl, 3(%edx)
	movzbl	-89(%ebp), %ebx
	movb	%bl, 2(%edx)
	movzbl	-88(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-72(%ebp), %ebx
	movb	%bl, (%edx)
.L231:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L228
.L238:
	addl	-32(%ebp), %edx
.L232:
	testb	$15, %al
	jne	.L229
	movl	-204(%ebp), %ecx
	movzwl	(%ecx), %edi
	addl	$2, %ecx
	movl	%ecx, -204(%ebp)
.L229:
	movl	%eax, %esi
	movzwl	%di, %ebx
	andl	$15, %esi
	movl	%esi, -192(%ebp)
	movzbl	-192(%ebp), %ecx
	movl	$32768, %esi
	sarl	%cl, %esi
	testl	%ebx, %esi
	jne	.L237
	movl	-96(%ebp), %ecx
	testl	%ecx, %ecx
	je	.L231
	movzbl	-136(%ebp), %ecx
	addl	$1, %eax
	movb	%cl, 3(%edx)
	movzbl	-169(%ebp), %ebx
	movb	%bl, 2(%edx)
	movzbl	-168(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-152(%ebp), %ebx
	movb	%bl, (%edx)
	cmpl	%eax, -28(%ebp)
	jg	.L238
.L228:
	addl	$1, -100(%ebp)
	movl	-180(%ebp), %esi
	cmpl	%esi, -100(%ebp)
	je	.L227
	movl	-184(%ebp), %eax
	addl	%eax, -108(%ebp)
	addl	$4, -104(%ebp)
	jmp	.L233
.L227:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ecx
	movl	140(%ecx), %edx
	testl	%edx, %edx
	je	.L235
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
.L235:
	addl	$236, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_word_msb_bgra_left, .-convblit_copy_mask_mono_word_msb_bgra_left
	.p2align 4,,15
.globl convblit_copy_mask_mono_word_msb_bgra_right
	.type	convblit_copy_mask_mono_word_msb_bgra_right, @function
convblit_copy_mask_mono_word_msb_bgra_right:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$236, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	12(%ebp), %esi
	movl	32(%eax), %eax
	movl	8(%ebp), %edi
	movl	52(%edx), %edx
	movl	%eax, -184(%ebp)
	movl	36(%ecx), %eax
	movl	%edx, -96(%ebp)
	movb	%al, -89(%ebp)
	movl	%eax, %ebx
	movl	%eax, %edx
	shrl	$24, %eax
	movb	%al, -56(%ebp)
	movl	40(%ecx), %eax
	shrl	$8, %ebx
	movb	%bl, -88(%ebp)
	shrl	$16, %edx
	movb	%dl, -72(%ebp)
	movl	12(%edi), %edx
	movl	%esi, %edi
	movl	%eax, %ebx
	movl	%eax, %ecx
	shrl	$16, %ebx
	movb	%bl, -152(%ebp)
	movl	24(%esi), %ebx
	shrl	$8, %ecx
	movb	%al, -169(%ebp)
	shrl	$24, %eax
	subl	$1, %edx
	movb	%cl, -168(%ebp)
	movl	16(%esi), %ecx
	movb	%al, -136(%ebp)
	movl	64(%esi), %eax
	subl	20(%esi), %edx
	movl	%ebx, -176(%ebp)
	addl	8(%esi), %ebx
	movl	%edx, 16(%esi)
	movl	%ecx, 20(%esi)
	movl	%eax, -32(%ebp)
	movl	%ebx, -28(%ebp)
	movl	12(%edi), %edi
	movl	56(%esi), %ebx
	movl	28(%esi), %eax
	movl	60(%esi), %esi
	testl	%edi, %edi
	movl	%edi, -180(%ebp)
	jle	.L240
	movl	-176(%ebp), %edi
	imull	-184(%ebp), %eax
	movl	$0, -100(%ebp)
	sarl	$3, %edi
	addl	%edi, %eax
	movzwl	-186(%ebp), %edi
	leal	(%ebx,%eax), %eax
	movl	%eax, -108(%ebp)
	movl	-32(%ebp), %eax
	imull	%ecx, %eax
	leal	(%eax,%edx,4), %eax
	leal	(%esi,%eax), %eax
	movl	%eax, -104(%ebp)
	.p2align 4,,7
	.p2align 3
.L246:
	movl	-28(%ebp), %eax
	cmpl	%eax, -176(%ebp)
	jge	.L241
	movl	-108(%ebp), %esi
	movl	-104(%ebp), %edx
	movl	-176(%ebp), %eax
	movl	%esi, -204(%ebp)
	jmp	.L245
	.p2align 4,,7
	.p2align 3
.L250:
	movzbl	-56(%ebp), %ecx
	movb	%cl, 3(%edx)
	movzbl	-89(%ebp), %ebx
	movb	%bl, 2(%edx)
	movzbl	-88(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-72(%ebp), %ebx
	movb	%bl, (%edx)
.L244:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L241
.L251:
	addl	-32(%ebp), %edx
.L245:
	testb	$15, %al
	jne	.L242
	movl	-204(%ebp), %ecx
	movzwl	(%ecx), %edi
	addl	$2, %ecx
	movl	%ecx, -204(%ebp)
.L242:
	movl	%eax, %esi
	movzwl	%di, %ebx
	andl	$15, %esi
	movl	%esi, -192(%ebp)
	movzbl	-192(%ebp), %ecx
	movl	$32768, %esi
	sarl	%cl, %esi
	testl	%ebx, %esi
	jne	.L250
	movl	-96(%ebp), %ebx
	testl	%ebx, %ebx
	je	.L244
	movzbl	-136(%ebp), %ecx
	addl	$1, %eax
	movb	%cl, 3(%edx)
	movzbl	-169(%ebp), %ebx
	movb	%bl, 2(%edx)
	movzbl	-168(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-152(%ebp), %ebx
	movb	%bl, (%edx)
	cmpl	%eax, -28(%ebp)
	jg	.L251
.L241:
	addl	$1, -100(%ebp)
	movl	-180(%ebp), %esi
	cmpl	%esi, -100(%ebp)
	je	.L240
	movl	-184(%ebp), %eax
	addl	%eax, -108(%ebp)
	subl	$4, -104(%ebp)
	jmp	.L246
.L240:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ecx
	movl	140(%ecx), %edx
	testl	%edx, %edx
	je	.L248
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
.L248:
	addl	$236, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_word_msb_bgra_right, .-convblit_copy_mask_mono_word_msb_bgra_right
	.p2align 4,,15
.globl convblit_copy_mask_mono_word_msb_bgra_down
	.type	convblit_copy_mask_mono_word_msb_bgra_down, @function
convblit_copy_mask_mono_word_msb_bgra_down:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$252, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	8(%ebp), %esi
	movl	32(%eax), %eax
	movl	12(%ebp), %edi
	movl	52(%edx), %edx
	movl	%eax, -184(%ebp)
	movl	36(%ecx), %eax
	movl	%edx, -96(%ebp)
	movb	%al, -89(%ebp)
	movl	%eax, %ebx
	movl	%eax, %edx
	shrl	$24, %eax
	movb	%al, -56(%ebp)
	movl	40(%ecx), %eax
	shrl	$8, %ebx
	shrl	$16, %edx
	movb	%bl, -88(%ebp)
	movb	%dl, -72(%ebp)
	movl	%eax, %ecx
	movl	%eax, %ebx
	shrl	$8, %ecx
	movb	%cl, -168(%ebp)
	movl	8(%esi), %ecx
	shrl	$16, %ebx
	movb	%al, -169(%ebp)
	shrl	$24, %eax
	movb	%al, -136(%ebp)
	movl	24(%edi), %eax
	movb	%bl, -152(%ebp)
	movl	64(%edi), %ebx
	subl	$1, %ecx
	subl	16(%edi), %ecx
	movl	%eax, -176(%ebp)
	addl	8(%edi), %eax
	movl	%ecx, 16(%edi)
	movl	12(%esi), %edx
	subl	$1, %edx
	subl	20(%edi), %edx
	movl	%edx, 20(%edi)
	movl	%eax, -28(%ebp)
	movl	56(%edi), %esi
	movl	28(%edi), %eax
	movl	60(%edi), %edi
	movl	%edi, -100(%ebp)
	movl	12(%ebp), %edi
	movl	12(%edi), %edi
	testl	%edi, %edi
	movl	%edi, -180(%ebp)
	jle	.L253
	movl	-176(%ebp), %edi
	imull	-184(%ebp), %eax
	sarl	$3, %edi
	addl	%edi, %eax
	movzwl	-202(%ebp), %edi
	leal	(%esi,%eax), %eax
	movl	%eax, -108(%ebp)
	movl	%edx, %eax
	imull	%ebx, %eax
	negl	%ebx
	movl	%ebx, -188(%ebp)
	leal	(%eax,%ecx,4), %eax
	addl	-100(%ebp), %eax
	movl	$0, -100(%ebp)
	movl	%eax, -104(%ebp)
	.p2align 4,,7
	.p2align 3
.L259:
	movl	-28(%ebp), %eax
	cmpl	%eax, -176(%ebp)
	jge	.L254
	movl	-108(%ebp), %esi
	movl	-104(%ebp), %edx
	movl	-176(%ebp), %eax
	movl	%esi, -220(%ebp)
	jmp	.L258
	.p2align 4,,7
	.p2align 3
.L263:
	movzbl	-56(%ebp), %ecx
	movb	%cl, 3(%edx)
	movzbl	-89(%ebp), %ebx
	movb	%bl, 2(%edx)
	movzbl	-88(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-72(%ebp), %ebx
	movb	%bl, (%edx)
.L257:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L254
.L264:
	subl	$4, %edx
.L258:
	testb	$15, %al
	jne	.L255
	movl	-220(%ebp), %ecx
	movzwl	(%ecx), %edi
	addl	$2, %ecx
	movl	%ecx, -220(%ebp)
.L255:
	movl	%eax, %esi
	movzwl	%di, %ebx
	andl	$15, %esi
	movl	%esi, -208(%ebp)
	movzbl	-208(%ebp), %ecx
	movl	$32768, %esi
	sarl	%cl, %esi
	testl	%ebx, %esi
	jne	.L263
	movl	-96(%ebp), %esi
	testl	%esi, %esi
	je	.L257
	movzbl	-136(%ebp), %ecx
	addl	$1, %eax
	movb	%cl, 3(%edx)
	movzbl	-169(%ebp), %ebx
	movb	%bl, 2(%edx)
	movzbl	-168(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-152(%ebp), %ebx
	movb	%bl, (%edx)
	cmpl	%eax, -28(%ebp)
	jg	.L264
.L254:
	addl	$1, -100(%ebp)
	movl	-180(%ebp), %esi
	cmpl	%esi, -100(%ebp)
	je	.L253
	movl	-184(%ebp), %eax
	movl	-188(%ebp), %edx
	addl	%eax, -108(%ebp)
	addl	%edx, -104(%ebp)
	jmp	.L259
.L253:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ecx
	movl	140(%ecx), %edx
	testl	%edx, %edx
	je	.L261
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
.L261:
	addl	$252, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_word_msb_bgra_down, .-convblit_copy_mask_mono_word_msb_bgra_down
	.p2align 4,,15
.globl convblit_copy_mask_mono_word_msb_bgr
	.type	convblit_copy_mask_mono_word_msb_bgr, @function
convblit_copy_mask_mono_word_msb_bgr:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$220, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	12(%ebp), %edi
	movl	32(%eax), %eax
	movl	12(%ebp), %esi
	movl	52(%edx), %edx
	movl	24(%edi), %edi
	movl	%eax, -152(%ebp)
	movl	36(%ecx), %eax
	movl	64(%esi), %esi
	movl	%edx, -80(%ebp)
	movl	%edi, -144(%ebp)
	movb	%al, -73(%ebp)
	movl	%eax, %edx
	shrl	$16, %eax
	movb	%al, -56(%ebp)
	movl	40(%ecx), %eax
	shrl	$8, %edx
	movb	%dl, -72(%ebp)
	movl	%esi, -156(%ebp)
	movb	%al, -137(%ebp)
	movl	%eax, %ecx
	shrl	$16, %eax
	movb	%al, -120(%ebp)
	movl	12(%ebp), %eax
	shrl	$8, %ecx
	movb	%cl, -136(%ebp)
	addl	8(%eax), %edi
	movl	%eax, %edx
	movl	56(%eax), %ebx
	movl	60(%edx), %esi
	movl	%edi, -28(%ebp)
	movl	%edx, %edi
	movl	20(%edx), %ecx
	movl	12(%edi), %edi
	movl	28(%eax), %eax
	movl	16(%edx), %edx
	testl	%edi, %edi
	movl	%edi, -148(%ebp)
	jle	.L266
	movl	-144(%ebp), %edi
	leal	(%edx,%edx,2), %edx
	imull	-152(%ebp), %eax
	movl	$0, -84(%ebp)
	sarl	$3, %edi
	addl	%edi, %eax
	movzwl	-170(%ebp), %edi
	leal	(%ebx,%eax), %eax
	movl	%eax, -92(%ebp)
	movl	-156(%ebp), %eax
	imull	%ecx, %eax
	leal	(%edx,%eax), %eax
	leal	(%esi,%eax), %eax
	movl	%eax, -88(%ebp)
	.p2align 4,,7
	.p2align 3
.L272:
	movl	-28(%ebp), %eax
	cmpl	%eax, -144(%ebp)
	jge	.L267
	movl	-92(%ebp), %esi
	movl	-88(%ebp), %edx
	movl	-144(%ebp), %eax
	movl	%esi, -188(%ebp)
	jmp	.L271
	.p2align 4,,7
	.p2align 3
.L276:
	movzbl	-73(%ebp), %ecx
	movb	%cl, 2(%edx)
	movzbl	-72(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-56(%ebp), %ecx
	movb	%cl, (%edx)
.L270:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L267
.L277:
	addl	$3, %edx
.L271:
	testb	$15, %al
	jne	.L268
	movl	-188(%ebp), %ecx
	movzwl	(%ecx), %edi
	addl	$2, %ecx
	movl	%ecx, -188(%ebp)
.L268:
	movl	%eax, %esi
	movzwl	%di, %ebx
	andl	$15, %esi
	movl	%esi, -176(%ebp)
	movzbl	-176(%ebp), %ecx
	movl	$32768, %esi
	sarl	%cl, %esi
	testl	%ebx, %esi
	jne	.L276
	movl	-80(%ebp), %ecx
	testl	%ecx, %ecx
	je	.L270
	movzbl	-137(%ebp), %ecx
	addl	$1, %eax
	movb	%cl, 2(%edx)
	movzbl	-136(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-120(%ebp), %ecx
	movb	%cl, (%edx)
	cmpl	%eax, -28(%ebp)
	jg	.L277
.L267:
	addl	$1, -84(%ebp)
	movl	-148(%ebp), %esi
	cmpl	%esi, -84(%ebp)
	je	.L266
	movl	-152(%ebp), %eax
	movl	-156(%ebp), %edx
	addl	%eax, -92(%ebp)
	addl	%edx, -88(%ebp)
	jmp	.L272
.L266:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ecx
	movl	140(%ecx), %eax
	testl	%eax, %eax
	je	.L274
	movl	12(%ebp), %esi
	movl	12(%esi), %edx
	movl	%edx, 16(%esp)
	movl	8(%esi), %edx
	movl	%edx, 12(%esp)
	movl	20(%esi), %edx
	movl	%edx, 8(%esp)
	movl	16(%esi), %edx
	movl	%ecx, (%esp)
	movl	%edx, 4(%esp)
	call	*%eax
.L274:
	addl	$220, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_word_msb_bgr, .-convblit_copy_mask_mono_word_msb_bgr
	.p2align 4,,15
.globl convblit_copy_mask_mono_word_msb_bgr_left
	.type	convblit_copy_mask_mono_word_msb_bgr_left, @function
convblit_copy_mask_mono_word_msb_bgr_left:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$188, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	8(%ebp), %esi
	movl	32(%eax), %eax
	movl	52(%edx), %edx
	movl	%eax, -136(%ebp)
	movl	36(%ecx), %eax
	movl	%edx, -80(%ebp)
	movb	%al, -73(%ebp)
	movl	%eax, %ebx
	shrl	$16, %eax
	movb	%al, -56(%ebp)
	movl	40(%ecx), %eax
	shrl	$8, %ebx
	movb	%bl, -72(%ebp)
	movl	%ecx, %ebx
	movl	20(%ecx), %ecx
	movl	%eax, %edx
	shrl	$8, %edx
	movb	%dl, -120(%ebp)
	movl	8(%esi), %edx
	movb	%al, -121(%ebp)
	shrl	$16, %eax
	movl	64(%ebx), %esi
	movb	%al, -104(%ebp)
	movl	24(%ebx), %eax
	subl	$1, %edx
	subl	16(%ebx), %edx
	movl	%esi, %edi
	movl	%ecx, 16(%ebx)
	negl	%edi
	movl	%eax, -128(%ebp)
	movl	%edx, 20(%ebx)
	addl	8(%ebx), %eax
	movl	56(%ebx), %ebx
	movl	%edi, -32(%ebp)
	movl	%eax, -28(%ebp)
	movl	%ebx, -88(%ebp)
	movl	12(%ebp), %edi
	movl	60(%edi), %ebx
	movl	28(%edi), %eax
	movl	%ebx, -84(%ebp)
	movl	12(%edi), %ebx
	testl	%ebx, %ebx
	jle	.L279
	movl	-128(%ebp), %edi
	imull	%esi, %edx
	imull	-136(%ebp), %eax
	sarl	$3, %edi
	addl	%edi, %eax
	movzwl	-138(%ebp), %edi
	addl	-88(%ebp), %eax
	movl	%eax, -88(%ebp)
	leal	(%ecx,%ecx,2), %eax
	leal	(%edx,%eax), %eax
	addl	-84(%ebp), %eax
	movl	%eax, -84(%ebp)
	leal	-3(%ebx,%ebx,2), %eax
	addl	-84(%ebp), %eax
	movl	%eax, -132(%ebp)
	.p2align 4,,7
	.p2align 3
.L285:
	movl	-28(%ebp), %eax
	cmpl	%eax, -128(%ebp)
	jge	.L280
	movl	-88(%ebp), %esi
	movl	-84(%ebp), %edx
	movl	-128(%ebp), %eax
	movl	%esi, -156(%ebp)
	jmp	.L284
	.p2align 4,,7
	.p2align 3
.L289:
	movzbl	-73(%ebp), %ecx
	movb	%cl, 2(%edx)
	movzbl	-72(%ebp), %ebx
	movb	%bl, 1(%edx)
	movzbl	-56(%ebp), %ecx
	movb	%cl, (%edx)
.L283:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L280
.L290:
	addl	-32(%ebp), %edx
.L284:
	testb	$15, %al
	jne	.L281
	movl	-156(%ebp), %ecx
	movzwl	(%ecx), %edi
	addl	$2, %ecx
	movl	%ecx, -156(%ebp)
.L281:
	movl	%eax, %esi
	movzwl	%di, %ebx
	andl	$15, %esi
	movl	%esi, -144(%ebp)
	movzbl	-144(%ebp), %ecx
	movl	$32768, %esi
	sarl	%cl, %esi
	testl	%ebx, %esi
	jne	.L289
	movl	-80(%ebp), %ebx
	testl	%ebx, %ebx
	je	.L283
	movzbl	-121(%ebp), %ebx
	addl	$1, %eax
	movb	%bl, 2(%edx)
	movzbl	-120(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-104(%ebp), %ebx
	movb	%bl, (%edx)
	cmpl	%eax, -28(%ebp)
	jg	.L290
.L280:
	movl	-132(%ebp), %esi
	cmpl	%esi, -84(%ebp)
	je	.L279
	movl	-136(%ebp), %eax
	addl	%eax, -88(%ebp)
	addl	$3, -84(%ebp)
	jmp	.L285
.L279:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ecx
	movl	140(%ecx), %edx
	testl	%edx, %edx
	je	.L287
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
.L287:
	addl	$188, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_word_msb_bgr_left, .-convblit_copy_mask_mono_word_msb_bgr_left
	.p2align 4,,15
.globl convblit_copy_mask_mono_word_msb_bgr_right
	.type	convblit_copy_mask_mono_word_msb_bgr_right, @function
convblit_copy_mask_mono_word_msb_bgr_right:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$188, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	12(%ebp), %esi
	movl	32(%eax), %eax
	movl	52(%edx), %edx
	movl	64(%esi), %edi
	movl	%eax, -136(%ebp)
	movl	36(%ecx), %eax
	movl	%edx, -80(%ebp)
	movl	%edi, -32(%ebp)
	movb	%al, -73(%ebp)
	movl	%eax, %ebx
	shrl	$16, %eax
	movb	%al, -56(%ebp)
	movl	40(%ecx), %eax
	shrl	$8, %ebx
	movb	%bl, -72(%ebp)
	movl	16(%ecx), %ebx
	movl	8(%ebp), %ecx
	movl	%eax, %edx
	shrl	$8, %edx
	movb	%al, -121(%ebp)
	shrl	$16, %eax
	movb	%dl, -120(%ebp)
	movl	12(%ecx), %edx
	movl	%esi, %ecx
	movb	%al, -104(%ebp)
	movl	24(%esi), %eax
	movl	60(%ecx), %edi
	subl	$1, %edx
	movl	%eax, -128(%ebp)
	subl	20(%esi), %edx
	addl	8(%esi), %eax
	movl	%ebx, 20(%esi)
	movl	%edx, 16(%esi)
	movl	56(%esi), %esi
	movl	%eax, -28(%ebp)
	movl	28(%ecx), %eax
	movl	%edi, -84(%ebp)
	movl	12(%ecx), %ecx
	testl	%ecx, %ecx
	jle	.L292
	movl	-128(%ebp), %edi
	leal	(%edx,%edx,2), %edx
	imull	-136(%ebp), %eax
	sarl	$3, %edi
	addl	%edi, %eax
	movzwl	-138(%ebp), %edi
	leal	(%esi,%eax), %eax
	movl	%eax, -88(%ebp)
	movl	-32(%ebp), %eax
	imull	%ebx, %eax
	leal	(%edx,%eax), %eax
	addl	-84(%ebp), %eax
	movl	%eax, -84(%ebp)
	movl	-84(%ebp), %edx
	leal	(%ecx,%ecx,2), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addl	$3, %eax
	movl	%eax, -132(%ebp)
	.p2align 4,,7
	.p2align 3
.L298:
	movl	-28(%ebp), %ecx
	cmpl	%ecx, -128(%ebp)
	jge	.L293
	movl	-88(%ebp), %esi
	movl	-84(%ebp), %edx
	movl	-128(%ebp), %eax
	movl	%esi, -156(%ebp)
	jmp	.L297
	.p2align 4,,7
	.p2align 3
.L302:
	movzbl	-73(%ebp), %ecx
	movb	%cl, 2(%edx)
	movzbl	-72(%ebp), %ebx
	movb	%bl, 1(%edx)
	movzbl	-56(%ebp), %ecx
	movb	%cl, (%edx)
.L296:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L293
.L303:
	addl	-32(%ebp), %edx
.L297:
	testb	$15, %al
	jne	.L294
	movl	-156(%ebp), %ebx
	movzwl	(%ebx), %edi
	addl	$2, %ebx
	movl	%ebx, -156(%ebp)
.L294:
	movl	%eax, %esi
	movzwl	%di, %ebx
	andl	$15, %esi
	movl	%esi, -144(%ebp)
	movzbl	-144(%ebp), %ecx
	movl	$32768, %esi
	sarl	%cl, %esi
	testl	%ebx, %esi
	jne	.L302
	movl	-80(%ebp), %esi
	testl	%esi, %esi
	je	.L296
	movzbl	-121(%ebp), %ebx
	addl	$1, %eax
	movb	%bl, 2(%edx)
	movzbl	-120(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-104(%ebp), %ebx
	movb	%bl, (%edx)
	cmpl	%eax, -28(%ebp)
	jg	.L303
.L293:
	movl	-132(%ebp), %esi
	cmpl	%esi, -84(%ebp)
	je	.L292
	movl	-136(%ebp), %eax
	addl	%eax, -88(%ebp)
	subl	$3, -84(%ebp)
	jmp	.L298
.L292:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ecx
	movl	140(%ecx), %edx
	testl	%edx, %edx
	je	.L300
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
.L300:
	addl	$188, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_word_msb_bgr_right, .-convblit_copy_mask_mono_word_msb_bgr_right
	.p2align 4,,15
.globl convblit_copy_mask_mono_word_msb_bgr_down
	.type	convblit_copy_mask_mono_word_msb_bgr_down, @function
convblit_copy_mask_mono_word_msb_bgr_down:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$220, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	32(%eax), %eax
	movl	52(%edx), %edx
	movl	%eax, -152(%ebp)
	movl	36(%ecx), %eax
	movl	%edx, -80(%ebp)
	movb	%al, -73(%ebp)
	movl	%eax, %ebx
	shrl	$16, %eax
	movb	%al, -56(%ebp)
	movl	40(%ecx), %eax
	shrl	$8, %ebx
	movl	8(%ebp), %ecx
	movb	%bl, -72(%ebp)
	movl	12(%ebp), %ebx
	movl	%eax, %edx
	shrl	$8, %edx
	movb	%dl, -136(%ebp)
	movl	8(%ecx), %edx
	movl	%ebx, %edi
	movb	%al, -137(%ebp)
	shrl	$16, %eax
	movl	56(%edi), %esi
	movb	%al, -120(%ebp)
	movl	24(%edi), %eax
	subl	$1, %edx
	subl	16(%ebx), %edx
	movl	%eax, -144(%ebp)
	addl	8(%edi), %eax
	movl	%edx, 16(%ebx)
	movl	12(%ecx), %ecx
	movl	%eax, -28(%ebp)
	movl	28(%edi), %eax
	movl	60(%edi), %edi
	subl	$1, %ecx
	subl	20(%ebx), %ecx
	movl	%ecx, 20(%ebx)
	movl	64(%ebx), %ebx
	movl	%edi, -84(%ebp)
	movl	12(%ebp), %edi
	movl	12(%edi), %edi
	testl	%edi, %edi
	movl	%edi, -148(%ebp)
	jle	.L305
	movl	-144(%ebp), %edi
	leal	(%edx,%edx,2), %edx
	imull	-152(%ebp), %eax
	sarl	$3, %edi
	addl	%edi, %eax
	movzwl	-170(%ebp), %edi
	leal	(%esi,%eax), %eax
	movl	%eax, -92(%ebp)
	movl	%ecx, %eax
	imull	%ebx, %eax
	negl	%ebx
	movl	%ebx, -156(%ebp)
	leal	(%edx,%eax), %eax
	addl	-84(%ebp), %eax
	movl	$0, -84(%ebp)
	movl	%eax, -88(%ebp)
	.p2align 4,,7
	.p2align 3
.L311:
	movl	-28(%ebp), %eax
	cmpl	%eax, -144(%ebp)
	jge	.L306
	movl	-92(%ebp), %esi
	movl	-88(%ebp), %edx
	movl	-144(%ebp), %eax
	movl	%esi, -188(%ebp)
	jmp	.L310
	.p2align 4,,7
	.p2align 3
.L315:
	movzbl	-73(%ebp), %ecx
	movb	%cl, 2(%edx)
	movzbl	-72(%ebp), %ebx
	movb	%bl, 1(%edx)
	movzbl	-56(%ebp), %ecx
	movb	%cl, (%edx)
.L309:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L306
.L316:
	subl	$3, %edx
.L310:
	testb	$15, %al
	jne	.L307
	movl	-188(%ebp), %ecx
	movzwl	(%ecx), %edi
	addl	$2, %ecx
	movl	%ecx, -188(%ebp)
.L307:
	movl	%eax, %esi
	movzwl	%di, %ebx
	andl	$15, %esi
	movl	%esi, -176(%ebp)
	movzbl	-176(%ebp), %ecx
	movl	$32768, %esi
	sarl	%cl, %esi
	testl	%ebx, %esi
	jne	.L315
	movl	-80(%ebp), %ecx
	testl	%ecx, %ecx
	je	.L309
	movzbl	-137(%ebp), %ebx
	addl	$1, %eax
	movb	%bl, 2(%edx)
	movzbl	-136(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-120(%ebp), %ebx
	movb	%bl, (%edx)
	cmpl	%eax, -28(%ebp)
	jg	.L316
.L306:
	addl	$1, -84(%ebp)
	movl	-148(%ebp), %esi
	cmpl	%esi, -84(%ebp)
	je	.L305
	movl	-152(%ebp), %eax
	movl	-156(%ebp), %edx
	addl	%eax, -92(%ebp)
	addl	%edx, -88(%ebp)
	jmp	.L311
.L305:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ecx
	movl	140(%ecx), %edx
	testl	%edx, %edx
	je	.L313
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
.L313:
	addl	$220, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_word_msb_bgr_down, .-convblit_copy_mask_mono_word_msb_bgr_down
	.p2align 4,,15
.globl convblit_copy_mask_mono_word_msb_16bpp
	.type	convblit_copy_mask_mono_word_msb_16bpp, @function
convblit_copy_mask_mono_word_msb_16bpp:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$220, %esp
	movl	12(%ebp), %edx
	movl	12(%ebp), %ecx
	movl	12(%ebp), %eax
	movl	12(%ebp), %esi
	movl	52(%edx), %edx
	movl	32(%eax), %eax
	movl	64(%esi), %esi
	movl	%edx, -60(%ebp)
	movl	36(%ecx), %edx
	movl	%eax, -108(%ebp)
	movl	%esi, -112(%ebp)
	movb	%dl, -168(%ebp)
	movl	%edx, %eax
	shrl	$16, %edx
	movb	%dl, -56(%ebp)
	movl	40(%ecx), %edx
	shrl	$8, %eax
	movb	%al, -152(%ebp)
	movl	12(%ebp), %eax
	movb	%dl, -88(%ebp)
	movl	%edx, %ecx
	shrl	$16, %edx
	movl	24(%eax), %eax
	movb	%dl, -64(%ebp)
	movl	12(%ebp), %edx
	shrl	$8, %ecx
	movb	%cl, -136(%ebp)
	movl	%eax, -100(%ebp)
	movl	60(%edx), %ecx
	movl	%edx, %esi
	addl	8(%edx), %eax
	movl	56(%edx), %ebx
	movl	%ecx, -92(%ebp)
	movl	16(%esi), %ecx
	movl	12(%esi), %esi
	movl	%eax, -28(%ebp)
	movl	28(%edx), %eax
	movl	20(%edx), %edx
	testl	%esi, %esi
	movl	%esi, -104(%ebp)
	jle	.L318
	movl	-100(%ebp), %esi
	imull	-108(%ebp), %eax
	sarl	$3, %esi
	leal	(%esi,%eax), %eax
	leal	(%ebx,%eax), %eax
	movl	%eax, -96(%ebp)
	movl	-112(%ebp), %eax
	imull	%edx, %eax
	movzbl	-56(%ebp), %edx
	leal	(%eax,%ecx,2), %eax
	addl	-92(%ebp), %eax
	shrb	$3, %dl
	movzbl	%dl, %edx
	movl	%eax, -92(%ebp)
	movzbl	-168(%ebp), %eax
	movw	%dx, -56(%ebp)
	movzbl	-64(%ebp), %edx
	movl	$0, -64(%ebp)
	andl	$248, %eax
	sall	$8, %eax
	orw	%ax, -56(%ebp)
	movzbl	-152(%ebp), %eax
	shrb	$3, %dl
	movzbl	%dl, %edx
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -56(%ebp)
	movzbl	-88(%ebp), %eax
	movw	%dx, -88(%ebp)
	andl	$248, %eax
	sall	$8, %eax
	orw	%ax, -88(%ebp)
	movzbl	-136(%ebp), %eax
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -88(%ebp)
	.p2align 4,,7
	.p2align 3
.L324:
	movl	-28(%ebp), %eax
	cmpl	%eax, -100(%ebp)
	jge	.L319
	movl	-96(%ebp), %esi
	movl	-92(%ebp), %edx
	movl	-100(%ebp), %eax
	movl	%esi, -188(%ebp)
	jmp	.L323
	.p2align 4,,7
	.p2align 3
.L328:
	movzwl	-56(%ebp), %ecx
	movw	%cx, (%edx)
.L322:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L319
.L329:
	addl	$2, %edx
.L323:
	testb	$15, %al
	jne	.L320
	movl	-188(%ebp), %ecx
	movzwl	(%ecx), %edi
	addl	$2, %ecx
	movl	%ecx, -188(%ebp)
.L320:
	movl	%eax, %esi
	movzwl	%di, %ebx
	andl	$15, %esi
	movl	%esi, -172(%ebp)
	movzbl	-172(%ebp), %ecx
	movl	$32768, %esi
	sarl	%cl, %esi
	testl	%ebx, %esi
	jne	.L328
	movl	-60(%ebp), %ebx
	testl	%ebx, %ebx
	je	.L322
	movzwl	-88(%ebp), %esi
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	movw	%si, (%edx)
	jg	.L329
.L319:
	addl	$1, -64(%ebp)
	movl	-104(%ebp), %eax
	cmpl	%eax, -64(%ebp)
	je	.L318
	movl	-108(%ebp), %edx
	movl	-112(%ebp), %ecx
	addl	%edx, -96(%ebp)
	addl	%ecx, -92(%ebp)
	jmp	.L324
.L318:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %esi
	movl	140(%esi), %eax
	testl	%eax, %eax
	je	.L326
	movl	12(%ebp), %ecx
	movl	12(%ecx), %edx
	movl	%edx, 16(%esp)
	movl	8(%ecx), %edx
	movl	%edx, 12(%esp)
	movl	20(%ecx), %edx
	movl	%edx, 8(%esp)
	movl	16(%ecx), %edx
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	call	*%eax
.L326:
	addl	$220, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_word_msb_16bpp, .-convblit_copy_mask_mono_word_msb_16bpp
	.p2align 4,,15
.globl convblit_copy_mask_mono_word_msb_16bpp_left
	.type	convblit_copy_mask_mono_word_msb_16bpp_left, @function
convblit_copy_mask_mono_word_msb_16bpp_left:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$220, %esp
	movl	12(%ebp), %ebx
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %esi
	movl	36(%ebx), %edx
	movl	32(%eax), %eax
	movl	52(%ecx), %ecx
	movb	%dl, -168(%ebp)
	movl	%eax, -108(%ebp)
	movl	%edx, %eax
	shrl	$16, %edx
	movb	%dl, -56(%ebp)
	movl	40(%ebx), %edx
	shrl	$8, %eax
	movl	%ecx, -60(%ebp)
	movb	%al, -152(%ebp)
	movl	24(%esi), %eax
	movl	%edx, %ecx
	shrl	$8, %ecx
	movb	%cl, -136(%ebp)
	movl	20(%ebx), %ecx
	movl	8(%ebp), %ebx
	movb	%dl, -88(%ebp)
	shrl	$16, %edx
	movb	%dl, -64(%ebp)
	movl	%eax, -100(%ebp)
	movl	8(%ebx), %edx
	movl	64(%esi), %ebx
	addl	8(%esi), %eax
	subl	$1, %edx
	movl	%ebx, %edi
	negl	%edi
	movl	%edi, -32(%ebp)
	movl	%esi, %edi
	movl	%eax, -28(%ebp)
	movl	28(%edi), %eax
	movl	60(%edi), %edi
	subl	16(%esi), %edx
	movl	%ecx, 16(%esi)
	movl	%edx, 20(%esi)
	movl	56(%esi), %esi
	movl	%edi, -92(%ebp)
	movl	12(%ebp), %edi
	movl	12(%edi), %edi
	testl	%edi, %edi
	movl	%edi, -104(%ebp)
	jle	.L331
	movl	-100(%ebp), %edi
	imull	-108(%ebp), %eax
	sarl	$3, %edi
	addl	%edi, %eax
	movzwl	-170(%ebp), %edi
	leal	(%esi,%eax), %eax
	movl	%eax, -96(%ebp)
	movl	%edx, %eax
	movzbl	-56(%ebp), %edx
	imull	%ebx, %eax
	shrb	$3, %dl
	leal	(%eax,%ecx,2), %eax
	movzbl	%dl, %edx
	addl	-92(%ebp), %eax
	movw	%dx, -56(%ebp)
	movzbl	-64(%ebp), %edx
	movl	$0, -64(%ebp)
	movl	%eax, -92(%ebp)
	movzbl	-168(%ebp), %eax
	shrb	$3, %dl
	movzbl	%dl, %edx
	andl	$248, %eax
	sall	$8, %eax
	orw	%ax, -56(%ebp)
	movzbl	-152(%ebp), %eax
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -56(%ebp)
	movzbl	-88(%ebp), %eax
	movw	%dx, -88(%ebp)
	andl	$248, %eax
	sall	$8, %eax
	orw	%ax, -88(%ebp)
	movzbl	-136(%ebp), %eax
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -88(%ebp)
	.p2align 4,,7
	.p2align 3
.L337:
	movl	-28(%ebp), %eax
	cmpl	%eax, -100(%ebp)
	jge	.L332
	movl	-96(%ebp), %esi
	movl	-92(%ebp), %edx
	movl	-100(%ebp), %eax
	movl	%esi, -188(%ebp)
	jmp	.L336
	.p2align 4,,7
	.p2align 3
.L341:
	movzwl	-56(%ebp), %ecx
	movw	%cx, (%edx)
.L335:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L332
.L342:
	addl	-32(%ebp), %edx
.L336:
	testb	$15, %al
	jne	.L333
	movl	-188(%ebp), %ecx
	movzwl	(%ecx), %edi
	addl	$2, %ecx
	movl	%ecx, -188(%ebp)
.L333:
	movl	%eax, %esi
	movzwl	%di, %ebx
	andl	$15, %esi
	movl	%esi, -176(%ebp)
	movzbl	-176(%ebp), %ecx
	movl	$32768, %esi
	sarl	%cl, %esi
	testl	%ebx, %esi
	jne	.L341
	movl	-60(%ebp), %esi
	testl	%esi, %esi
	je	.L335
	movzwl	-88(%ebp), %ebx
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	movw	%bx, (%edx)
	jg	.L342
.L332:
	addl	$1, -64(%ebp)
	movl	-104(%ebp), %esi
	cmpl	%esi, -64(%ebp)
	je	.L331
	movl	-108(%ebp), %eax
	addl	%eax, -96(%ebp)
	addl	$2, -92(%ebp)
	jmp	.L337
.L331:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ecx
	movl	140(%ecx), %edx
	testl	%edx, %edx
	je	.L339
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
.L339:
	addl	$220, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_word_msb_16bpp_left, .-convblit_copy_mask_mono_word_msb_16bpp_left
	.p2align 4,,15
.globl convblit_copy_mask_mono_word_msb_16bpp_right
	.type	convblit_copy_mask_mono_word_msb_16bpp_right, @function
convblit_copy_mask_mono_word_msb_16bpp_right:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$220, %esp
	movl	12(%ebp), %ebx
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %esi
	movl	36(%ebx), %edx
	movl	32(%eax), %eax
	movl	52(%ecx), %ecx
	movl	64(%esi), %edi
	movb	%dl, -168(%ebp)
	movl	%eax, -108(%ebp)
	movl	%edx, %eax
	shrl	$16, %edx
	movb	%dl, -56(%ebp)
	movl	40(%ebx), %edx
	shrl	$8, %eax
	movl	%ecx, -60(%ebp)
	movb	%al, -152(%ebp)
	movl	24(%esi), %eax
	movl	%edi, -32(%ebp)
	movl	%esi, %edi
	movl	%edx, %ecx
	movl	12(%edi), %edi
	shrl	$8, %ecx
	movb	%cl, -136(%ebp)
	movl	16(%ebx), %ecx
	movl	8(%ebp), %ebx
	movb	%dl, -88(%ebp)
	shrl	$16, %edx
	movb	%dl, -64(%ebp)
	movl	%eax, -100(%ebp)
	movl	12(%ebx), %edx
	addl	8(%esi), %eax
	movl	56(%esi), %ebx
	subl	$1, %edx
	subl	20(%esi), %edx
	testl	%edi, %edi
	movl	%ecx, 20(%esi)
	movl	%eax, -28(%ebp)
	movl	28(%esi), %eax
	movl	%edx, 16(%esi)
	movl	60(%esi), %esi
	movl	%edi, -104(%ebp)
	jle	.L344
	movl	-100(%ebp), %edi
	imull	-108(%ebp), %eax
	sarl	$3, %edi
	addl	%edi, %eax
	movzwl	-170(%ebp), %edi
	leal	(%ebx,%eax), %eax
	movl	%eax, -96(%ebp)
	movl	-32(%ebp), %eax
	imull	%ecx, %eax
	leal	(%eax,%edx,2), %eax
	movzbl	-56(%ebp), %edx
	leal	(%esi,%eax), %eax
	movl	%eax, -92(%ebp)
	movzbl	-168(%ebp), %eax
	shrb	$3, %dl
	movzbl	%dl, %edx
	andl	$248, %eax
	movw	%dx, -56(%ebp)
	sall	$8, %eax
	movzbl	-64(%ebp), %edx
	orw	%ax, -56(%ebp)
	movzbl	-152(%ebp), %eax
	movl	$0, -64(%ebp)
	shrb	$3, %dl
	movzbl	%dl, %edx
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -56(%ebp)
	movzbl	-88(%ebp), %eax
	movw	%dx, -88(%ebp)
	andl	$248, %eax
	sall	$8, %eax
	orw	%ax, -88(%ebp)
	movzbl	-136(%ebp), %eax
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -88(%ebp)
	.p2align 4,,7
	.p2align 3
.L350:
	movl	-28(%ebp), %eax
	cmpl	%eax, -100(%ebp)
	jge	.L345
	movl	-96(%ebp), %esi
	movl	-92(%ebp), %edx
	movl	-100(%ebp), %eax
	movl	%esi, -188(%ebp)
	jmp	.L349
	.p2align 4,,7
	.p2align 3
.L354:
	movzwl	-56(%ebp), %ecx
	movw	%cx, (%edx)
.L348:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L345
.L355:
	addl	-32(%ebp), %edx
.L349:
	testb	$15, %al
	jne	.L346
	movl	-188(%ebp), %ecx
	movzwl	(%ecx), %edi
	addl	$2, %ecx
	movl	%ecx, -188(%ebp)
.L346:
	movl	%eax, %esi
	movzwl	%di, %ebx
	andl	$15, %esi
	movl	%esi, -176(%ebp)
	movzbl	-176(%ebp), %ecx
	movl	$32768, %esi
	sarl	%cl, %esi
	testl	%ebx, %esi
	jne	.L354
	movl	-60(%ebp), %ecx
	testl	%ecx, %ecx
	je	.L348
	movzwl	-88(%ebp), %ebx
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	movw	%bx, (%edx)
	jg	.L355
.L345:
	addl	$1, -64(%ebp)
	movl	-104(%ebp), %esi
	cmpl	%esi, -64(%ebp)
	je	.L344
	movl	-108(%ebp), %eax
	addl	%eax, -96(%ebp)
	subl	$2, -92(%ebp)
	jmp	.L350
.L344:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ecx
	movl	140(%ecx), %edx
	testl	%edx, %edx
	je	.L352
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
.L352:
	addl	$220, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_word_msb_16bpp_right, .-convblit_copy_mask_mono_word_msb_16bpp_right
	.p2align 4,,15
.globl convblit_copy_mask_mono_byte_msb_bgra
	.type	convblit_copy_mask_mono_byte_msb_bgra, @function
convblit_copy_mask_mono_byte_msb_bgra:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$252, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	12(%ebp), %esi
	movl	32(%eax), %eax
	movl	12(%ebp), %edi
	movl	52(%edx), %edx
	movl	%eax, -184(%ebp)
	movl	36(%ecx), %eax
	movl	24(%edi), %edi
	movl	%edx, -96(%ebp)
	movb	%al, -89(%ebp)
	movl	%eax, %edx
	movl	%eax, %ecx
	shrl	$24, %eax
	movb	%al, -56(%ebp)
	movl	40(%esi), %eax
	shrl	$8, %edx
	shrl	$16, %ecx
	movl	64(%esi), %esi
	movb	%dl, -88(%ebp)
	movb	%cl, -72(%ebp)
	movb	%al, -169(%ebp)
	movl	%eax, %edx
	movl	%eax, %ecx
	shrl	$24, %eax
	movb	%al, -136(%ebp)
	movl	12(%ebp), %eax
	shrl	$8, %edx
	movl	%edi, -176(%ebp)
	shrl	$16, %ecx
	movb	%dl, -168(%ebp)
	movb	%cl, -152(%ebp)
	addl	8(%eax), %edi
	movl	%eax, %edx
	movl	%edx, %ecx
	movl	56(%eax), %ebx
	movl	%esi, -188(%ebp)
	movl	28(%eax), %eax
	movl	%edi, -28(%ebp)
	movl	%ecx, %edi
	movl	60(%edx), %esi
	movl	12(%edi), %edi
	movl	20(%edx), %edx
	movl	16(%ecx), %ecx
	testl	%edi, %edi
	movl	%edi, -180(%ebp)
	jle	.L357
	movl	-176(%ebp), %edi
	imull	-184(%ebp), %eax
	movl	$0, -100(%ebp)
	sarl	$3, %edi
	addl	%edi, %eax
	movzbl	-201(%ebp), %edi
	leal	(%ebx,%eax), %eax
	movl	%eax, -104(%ebp)
	movl	-188(%ebp), %eax
	imull	%edx, %eax
	leal	(%eax,%ecx,4), %eax
	leal	(%esi,%eax), %eax
	movl	-104(%ebp), %esi
	movl	%eax, -108(%ebp)
	movl	%eax, %edx
	.p2align 4,,7
	.p2align 3
.L358:
	movl	-176(%ebp), %eax
	movl	-28(%ebp), %ecx
	cmpl	%ecx, %eax
	jge	.L363
	movl	%esi, -220(%ebp)
	jmp	.L364
	.p2align 4,,7
	.p2align 3
.L368:
	movzbl	-56(%ebp), %ecx
	movb	%cl, 3(%edx)
	movzbl	-89(%ebp), %ecx
	movb	%cl, 2(%edx)
	movzbl	-88(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-72(%ebp), %ecx
	movb	%cl, (%edx)
.L361:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L363
.L362:
	addl	$4, %edx
.L364:
	testb	$7, %al
	jne	.L359
	movl	-220(%ebp), %ecx
	movzbl	(%ecx), %edi
	addl	$1, %ecx
	movl	%ecx, -220(%ebp)
.L359:
	movl	%eax, %esi
	movl	%edi, %ecx
	andl	$7, %esi
	movzbl	%cl, %ebx
	movl	%esi, -208(%ebp)
	movzbl	-208(%ebp), %ecx
	movl	$128, %esi
	sarl	%cl, %esi
	testl	%ebx, %esi
	jne	.L368
	movl	-96(%ebp), %ebx
	testl	%ebx, %ebx
	je	.L361
	movzbl	-136(%ebp), %ecx
	addl	$1, %eax
	movb	%cl, 3(%edx)
	movzbl	-169(%ebp), %ecx
	movb	%cl, 2(%edx)
	movzbl	-168(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-152(%ebp), %ecx
	movb	%cl, (%edx)
	cmpl	%eax, -28(%ebp)
	jg	.L362
.L363:
	addl	$1, -100(%ebp)
	movl	-180(%ebp), %esi
	cmpl	%esi, -100(%ebp)
	je	.L357
	movl	-188(%ebp), %edx
	movl	-184(%ebp), %eax
	addl	%eax, -104(%ebp)
	addl	%edx, -108(%ebp)
	movl	-104(%ebp), %esi
	movl	-108(%ebp), %edx
	jmp	.L358
.L357:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %esi
	movl	140(%esi), %eax
	testl	%eax, %eax
	je	.L366
	movl	12(%ebp), %edi
	movl	12(%edi), %edx
	movl	%edx, 16(%esp)
	movl	8(%edi), %edx
	movl	%edx, 12(%esp)
	movl	20(%edi), %edx
	movl	%edx, 8(%esp)
	movl	16(%edi), %edx
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	call	*%eax
.L366:
	addl	$252, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_byte_msb_bgra, .-convblit_copy_mask_mono_byte_msb_bgra
	.p2align 4,,15
.globl convblit_copy_mask_mono_byte_msb_bgra_left
	.type	convblit_copy_mask_mono_byte_msb_bgra_left, @function
convblit_copy_mask_mono_byte_msb_bgra_left:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$236, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	8(%ebp), %edi
	movl	32(%eax), %eax
	movl	12(%ebp), %esi
	movl	52(%edx), %edx
	movl	%eax, -172(%ebp)
	movl	36(%ecx), %eax
	movl	%edx, -96(%ebp)
	movb	%al, -89(%ebp)
	movl	%eax, %ebx
	movl	%eax, %edx
	shrl	$24, %eax
	movb	%al, -56(%ebp)
	movl	40(%ecx), %eax
	shrl	$16, %edx
	movb	%dl, -72(%ebp)
	movl	8(%edi), %edx
	shrl	$8, %ebx
	movb	%bl, -88(%ebp)
	movl	12(%ebp), %edi
	movl	%eax, %ecx
	movl	%eax, %ebx
	shrl	$8, %ecx
	subl	$1, %edx
	movb	%cl, -152(%ebp)
	movl	20(%esi), %ecx
	shrl	$16, %ebx
	subl	16(%esi), %edx
	movb	%bl, -136(%ebp)
	movl	64(%esi), %ebx
	movb	%al, -153(%ebp)
	shrl	$24, %eax
	movl	%edx, 20(%esi)
	movl	%ecx, 16(%esi)
	movl	24(%esi), %esi
	movb	%al, -120(%ebp)
	movl	%ebx, %eax
	negl	%eax
	movl	%eax, -32(%ebp)
	movl	%esi, -160(%ebp)
	addl	8(%edi), %esi
	movl	%esi, -28(%ebp)
	movl	56(%edi), %esi
	movl	28(%edi), %eax
	movl	60(%edi), %edi
	movl	%edi, -100(%ebp)
	movl	12(%ebp), %edi
	movl	12(%edi), %edi
	testl	%edi, %edi
	movl	%edi, -164(%ebp)
	jle	.L370
	movl	-160(%ebp), %edi
	imull	-172(%ebp), %eax
	sarl	$3, %edi
	addl	%edi, %eax
	movzbl	-185(%ebp), %edi
	leal	(%esi,%eax), %eax
	movl	%eax, -104(%ebp)
	movl	%edx, %eax
	movl	-104(%ebp), %esi
	imull	%ebx, %eax
	leal	(%eax,%ecx,4), %eax
	addl	-100(%ebp), %eax
	movl	$0, -100(%ebp)
	movl	%eax, -168(%ebp)
	movl	%eax, %edx
	.p2align 4,,7
	.p2align 3
.L371:
	movl	-160(%ebp), %eax
	movl	-28(%ebp), %ecx
	cmpl	%ecx, %eax
	jge	.L376
	movl	%esi, -204(%ebp)
	jmp	.L377
	.p2align 4,,7
	.p2align 3
.L381:
	movzbl	-56(%ebp), %ecx
	movb	%cl, 3(%edx)
	movzbl	-89(%ebp), %ebx
	movb	%bl, 2(%edx)
	movzbl	-88(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-72(%ebp), %ebx
	movb	%bl, (%edx)
.L374:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L376
.L375:
	addl	-32(%ebp), %edx
.L377:
	testb	$7, %al
	jne	.L372
	movl	-204(%ebp), %ecx
	movzbl	(%ecx), %edi
	addl	$1, %ecx
	movl	%ecx, -204(%ebp)
.L372:
	movl	%eax, %esi
	movl	%edi, %ecx
	andl	$7, %esi
	movzbl	%cl, %ebx
	movl	%esi, -192(%ebp)
	movzbl	-192(%ebp), %ecx
	movl	$128, %esi
	sarl	%cl, %esi
	testl	%ebx, %esi
	jne	.L381
	movl	-96(%ebp), %esi
	testl	%esi, %esi
	je	.L374
	movzbl	-120(%ebp), %ecx
	addl	$1, %eax
	movb	%cl, 3(%edx)
	movzbl	-153(%ebp), %ebx
	movb	%bl, 2(%edx)
	movzbl	-152(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-136(%ebp), %ebx
	movb	%bl, (%edx)
	cmpl	%eax, -28(%ebp)
	jg	.L375
.L376:
	addl	$1, -100(%ebp)
	movl	-164(%ebp), %esi
	cmpl	%esi, -100(%ebp)
	je	.L370
	movl	-100(%ebp), %ecx
	movl	-168(%ebp), %ebx
	movl	-172(%ebp), %eax
	addl	%eax, -104(%ebp)
	movl	-104(%ebp), %esi
	leal	(%ebx,%ecx,4), %edx
	jmp	.L371
.L370:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ebx
	movl	140(%ebx), %edx
	testl	%edx, %edx
	je	.L379
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
.L379:
	addl	$236, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_byte_msb_bgra_left, .-convblit_copy_mask_mono_byte_msb_bgra_left
	.p2align 4,,15
.globl convblit_copy_mask_mono_byte_msb_bgra_right
	.type	convblit_copy_mask_mono_byte_msb_bgra_right, @function
convblit_copy_mask_mono_byte_msb_bgra_right:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$236, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	12(%ebp), %esi
	movl	32(%eax), %eax
	movl	8(%ebp), %edi
	movl	52(%edx), %edx
	movl	%eax, -172(%ebp)
	movl	36(%ecx), %eax
	movl	%edx, -96(%ebp)
	movb	%al, -89(%ebp)
	movl	%eax, %ebx
	movl	%eax, %edx
	shrl	$24, %eax
	movb	%al, -56(%ebp)
	movl	40(%ecx), %eax
	shrl	$8, %ebx
	movb	%bl, -88(%ebp)
	shrl	$16, %edx
	movb	%dl, -72(%ebp)
	movl	12(%edi), %edx
	movl	%esi, %edi
	movl	%eax, %ebx
	movl	%eax, %ecx
	shrl	$16, %ebx
	movb	%bl, -136(%ebp)
	movl	24(%esi), %ebx
	shrl	$8, %ecx
	movb	%al, -153(%ebp)
	shrl	$24, %eax
	subl	$1, %edx
	movb	%cl, -152(%ebp)
	movl	16(%esi), %ecx
	movb	%al, -120(%ebp)
	movl	64(%esi), %eax
	subl	20(%esi), %edx
	movl	%ebx, -160(%ebp)
	addl	8(%esi), %ebx
	movl	%edx, 16(%esi)
	movl	%ecx, 20(%esi)
	movl	%eax, -32(%ebp)
	movl	%ebx, -28(%ebp)
	movl	12(%edi), %edi
	movl	56(%esi), %ebx
	movl	28(%esi), %eax
	movl	60(%esi), %esi
	testl	%edi, %edi
	movl	%edi, -164(%ebp)
	jle	.L383
	movl	-160(%ebp), %edi
	imull	-172(%ebp), %eax
	movl	$0, -100(%ebp)
	sarl	$3, %edi
	addl	%edi, %eax
	movzbl	-185(%ebp), %edi
	leal	(%ebx,%eax), %eax
	movl	%eax, -104(%ebp)
	movl	-32(%ebp), %eax
	imull	%ecx, %eax
	leal	(%eax,%edx,4), %eax
	leal	(%esi,%eax), %eax
	movl	-104(%ebp), %esi
	movl	%eax, -168(%ebp)
	movl	%eax, %edx
	.p2align 4,,7
	.p2align 3
.L384:
	movl	-160(%ebp), %eax
	movl	-28(%ebp), %ebx
	cmpl	%ebx, %eax
	jge	.L389
	movl	%esi, -204(%ebp)
	jmp	.L390
	.p2align 4,,7
	.p2align 3
.L394:
	movzbl	-56(%ebp), %ecx
	movb	%cl, 3(%edx)
	movzbl	-89(%ebp), %ebx
	movb	%bl, 2(%edx)
	movzbl	-88(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-72(%ebp), %ebx
	movb	%bl, (%edx)
.L387:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L389
.L388:
	addl	-32(%ebp), %edx
.L390:
	testb	$7, %al
	jne	.L385
	movl	-204(%ebp), %ecx
	movzbl	(%ecx), %edi
	addl	$1, %ecx
	movl	%ecx, -204(%ebp)
.L385:
	movl	%eax, %esi
	movl	%edi, %ecx
	andl	$7, %esi
	movzbl	%cl, %ebx
	movl	%esi, -192(%ebp)
	movzbl	-192(%ebp), %ecx
	movl	$128, %esi
	sarl	%cl, %esi
	testl	%ebx, %esi
	jne	.L394
	movl	-96(%ebp), %ecx
	testl	%ecx, %ecx
	je	.L387
	movzbl	-120(%ebp), %ecx
	addl	$1, %eax
	movb	%cl, 3(%edx)
	movzbl	-153(%ebp), %ebx
	movb	%bl, 2(%edx)
	movzbl	-152(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-136(%ebp), %ebx
	movb	%bl, (%edx)
	cmpl	%eax, -28(%ebp)
	jg	.L388
.L389:
	addl	$1, -100(%ebp)
	movl	-164(%ebp), %esi
	cmpl	%esi, -100(%ebp)
	je	.L383
	movl	-100(%ebp), %edx
	movl	-168(%ebp), %ecx
	movl	-172(%ebp), %eax
	addl	%eax, -104(%ebp)
	sall	$2, %edx
	movl	-104(%ebp), %esi
	subl	%edx, %ecx
	movl	%ecx, %edx
	jmp	.L384
.L383:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %esi
	movl	140(%esi), %edx
	testl	%edx, %edx
	je	.L392
	movl	12(%ebp), %edi
	movl	12(%edi), %ecx
	movl	8(%edi), %eax
	movl	%ecx, 12(%esp)
	movl	%eax, 16(%esp)
	movl	20(%edi), %eax
	movl	%eax, 8(%esp)
	movl	16(%edi), %eax
	movl	%esi, (%esp)
	addl	$1, %eax
	subl	%ecx, %eax
	movl	%eax, 4(%esp)
	call	*%edx
.L392:
	addl	$236, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_byte_msb_bgra_right, .-convblit_copy_mask_mono_byte_msb_bgra_right
	.p2align 4,,15
.globl convblit_copy_mask_mono_byte_msb_bgra_down
	.type	convblit_copy_mask_mono_byte_msb_bgra_down, @function
convblit_copy_mask_mono_byte_msb_bgra_down:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$252, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	8(%ebp), %esi
	movl	32(%eax), %eax
	movl	12(%ebp), %edi
	movl	52(%edx), %edx
	movl	%eax, -184(%ebp)
	movl	36(%ecx), %eax
	movl	%edx, -96(%ebp)
	movb	%al, -89(%ebp)
	movl	%eax, %ebx
	movl	%eax, %edx
	shrl	$24, %eax
	movb	%al, -56(%ebp)
	movl	40(%ecx), %eax
	shrl	$8, %ebx
	shrl	$16, %edx
	movb	%bl, -88(%ebp)
	movb	%dl, -72(%ebp)
	movl	%eax, %ecx
	movl	%eax, %ebx
	shrl	$8, %ecx
	movb	%cl, -168(%ebp)
	movl	8(%esi), %ecx
	shrl	$16, %ebx
	movb	%al, -169(%ebp)
	shrl	$24, %eax
	movb	%al, -136(%ebp)
	movl	24(%edi), %eax
	movb	%bl, -152(%ebp)
	movl	64(%edi), %ebx
	subl	$1, %ecx
	subl	16(%edi), %ecx
	movl	%eax, -176(%ebp)
	addl	8(%edi), %eax
	movl	%ecx, 16(%edi)
	movl	12(%esi), %edx
	subl	$1, %edx
	subl	20(%edi), %edx
	movl	%edx, 20(%edi)
	movl	%eax, -28(%ebp)
	movl	56(%edi), %esi
	movl	28(%edi), %eax
	movl	60(%edi), %edi
	movl	%edi, -100(%ebp)
	movl	12(%ebp), %edi
	movl	12(%edi), %edi
	testl	%edi, %edi
	movl	%edi, -180(%ebp)
	jle	.L396
	movl	-176(%ebp), %edi
	imull	-184(%ebp), %eax
	sarl	$3, %edi
	addl	%edi, %eax
	movzbl	-201(%ebp), %edi
	leal	(%esi,%eax), %eax
	movl	%eax, -104(%ebp)
	movl	%edx, %eax
	movl	-104(%ebp), %esi
	imull	%ebx, %eax
	negl	%ebx
	movl	%ebx, -188(%ebp)
	leal	(%eax,%ecx,4), %eax
	addl	-100(%ebp), %eax
	movl	$0, -100(%ebp)
	movl	%eax, -108(%ebp)
	movl	%eax, %edx
	.p2align 4,,7
	.p2align 3
.L397:
	movl	-176(%ebp), %eax
	movl	-28(%ebp), %ecx
	cmpl	%ecx, %eax
	jge	.L402
	movl	%esi, -220(%ebp)
	jmp	.L403
	.p2align 4,,7
	.p2align 3
.L407:
	movzbl	-56(%ebp), %ecx
	movb	%cl, 3(%edx)
	movzbl	-89(%ebp), %ebx
	movb	%bl, 2(%edx)
	movzbl	-88(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-72(%ebp), %ebx
	movb	%bl, (%edx)
.L400:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L402
.L401:
	subl	$4, %edx
.L403:
	testb	$7, %al
	jne	.L398
	movl	-220(%ebp), %ecx
	movzbl	(%ecx), %edi
	addl	$1, %ecx
	movl	%ecx, -220(%ebp)
.L398:
	movl	%eax, %esi
	movl	%edi, %ecx
	andl	$7, %esi
	movzbl	%cl, %ebx
	movl	%esi, -208(%ebp)
	movzbl	-208(%ebp), %ecx
	movl	$128, %esi
	sarl	%cl, %esi
	testl	%ebx, %esi
	jne	.L407
	movl	-96(%ebp), %ebx
	testl	%ebx, %ebx
	je	.L400
	movzbl	-136(%ebp), %ecx
	addl	$1, %eax
	movb	%cl, 3(%edx)
	movzbl	-169(%ebp), %ebx
	movb	%bl, 2(%edx)
	movzbl	-168(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-152(%ebp), %ebx
	movb	%bl, (%edx)
	cmpl	%eax, -28(%ebp)
	jg	.L401
.L402:
	addl	$1, -100(%ebp)
	movl	-180(%ebp), %esi
	cmpl	%esi, -100(%ebp)
	je	.L396
	movl	-188(%ebp), %edx
	movl	-184(%ebp), %eax
	addl	%eax, -104(%ebp)
	addl	%edx, -108(%ebp)
	movl	-104(%ebp), %esi
	movl	-108(%ebp), %edx
	jmp	.L397
.L396:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ebx
	movl	140(%ebx), %edx
	testl	%edx, %edx
	je	.L405
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
.L405:
	addl	$252, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_byte_msb_bgra_down, .-convblit_copy_mask_mono_byte_msb_bgra_down
	.p2align 4,,15
.globl convblit_copy_mask_mono_byte_msb_bgr
	.type	convblit_copy_mask_mono_byte_msb_bgr, @function
convblit_copy_mask_mono_byte_msb_bgr:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$220, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	12(%ebp), %edi
	movl	32(%eax), %eax
	movl	12(%ebp), %esi
	movl	52(%edx), %edx
	movl	24(%edi), %edi
	movl	%eax, -152(%ebp)
	movl	36(%ecx), %eax
	movl	64(%esi), %esi
	movl	%edx, -80(%ebp)
	movl	%edi, -144(%ebp)
	movb	%al, -73(%ebp)
	movl	%eax, %edx
	shrl	$16, %eax
	movb	%al, -56(%ebp)
	movl	40(%ecx), %eax
	shrl	$8, %edx
	movb	%dl, -72(%ebp)
	movl	%esi, -156(%ebp)
	movb	%al, -137(%ebp)
	movl	%eax, %ecx
	shrl	$16, %eax
	movb	%al, -120(%ebp)
	movl	12(%ebp), %eax
	shrl	$8, %ecx
	movb	%cl, -136(%ebp)
	addl	8(%eax), %edi
	movl	%eax, %edx
	movl	56(%eax), %ebx
	movl	60(%edx), %esi
	movl	%edi, -28(%ebp)
	movl	%edx, %edi
	movl	20(%edx), %ecx
	movl	12(%edi), %edi
	movl	28(%eax), %eax
	movl	16(%edx), %edx
	testl	%edi, %edi
	movl	%edi, -148(%ebp)
	jle	.L409
	movl	-144(%ebp), %edi
	leal	(%edx,%edx,2), %edx
	imull	-152(%ebp), %eax
	movl	$0, -84(%ebp)
	sarl	$3, %edi
	addl	%edi, %eax
	movzbl	-169(%ebp), %edi
	leal	(%ebx,%eax), %eax
	movl	%eax, -88(%ebp)
	movl	-156(%ebp), %eax
	imull	%ecx, %eax
	leal	(%edx,%eax), %eax
	leal	(%esi,%eax), %eax
	movl	-88(%ebp), %esi
	movl	%eax, -92(%ebp)
	movl	%eax, %edx
	.p2align 4,,7
	.p2align 3
.L410:
	movl	-144(%ebp), %eax
	movl	-28(%ebp), %ecx
	cmpl	%ecx, %eax
	jge	.L415
	movl	%esi, -188(%ebp)
	jmp	.L416
	.p2align 4,,7
	.p2align 3
.L420:
	movzbl	-73(%ebp), %ecx
	movb	%cl, 2(%edx)
	movzbl	-72(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-56(%ebp), %ecx
	movb	%cl, (%edx)
.L413:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L415
.L414:
	addl	$3, %edx
.L416:
	testb	$7, %al
	jne	.L411
	movl	-188(%ebp), %ecx
	movzbl	(%ecx), %edi
	addl	$1, %ecx
	movl	%ecx, -188(%ebp)
.L411:
	movl	%eax, %esi
	movl	%edi, %ecx
	andl	$7, %esi
	movzbl	%cl, %ebx
	movl	%esi, -176(%ebp)
	movzbl	-176(%ebp), %ecx
	movl	$128, %esi
	sarl	%cl, %esi
	testl	%ebx, %esi
	jne	.L420
	movl	-80(%ebp), %esi
	testl	%esi, %esi
	je	.L413
	movzbl	-137(%ebp), %ecx
	addl	$1, %eax
	movb	%cl, 2(%edx)
	movzbl	-136(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-120(%ebp), %ecx
	movb	%cl, (%edx)
	cmpl	%eax, -28(%ebp)
	jg	.L414
.L415:
	addl	$1, -84(%ebp)
	movl	-148(%ebp), %esi
	cmpl	%esi, -84(%ebp)
	je	.L409
	movl	-156(%ebp), %edx
	movl	-152(%ebp), %eax
	addl	%eax, -88(%ebp)
	addl	%edx, -92(%ebp)
	movl	-88(%ebp), %esi
	movl	-92(%ebp), %edx
	jmp	.L410
.L409:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %esi
	movl	140(%esi), %eax
	testl	%eax, %eax
	je	.L418
	movl	12(%ebp), %edi
	movl	12(%edi), %edx
	movl	%edx, 16(%esp)
	movl	8(%edi), %edx
	movl	%edx, 12(%esp)
	movl	20(%edi), %edx
	movl	%edx, 8(%esp)
	movl	16(%edi), %edx
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	call	*%eax
.L418:
	addl	$220, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_byte_msb_bgr, .-convblit_copy_mask_mono_byte_msb_bgr
	.p2align 4,,15
.globl convblit_copy_mask_mono_byte_msb_bgr_left
	.type	convblit_copy_mask_mono_byte_msb_bgr_left, @function
convblit_copy_mask_mono_byte_msb_bgr_left:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$188, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	8(%ebp), %esi
	movl	32(%eax), %eax
	movl	52(%edx), %edx
	movl	%eax, -136(%ebp)
	movl	36(%ecx), %eax
	movl	%edx, -80(%ebp)
	movb	%al, -73(%ebp)
	movl	%eax, %ebx
	shrl	$16, %eax
	movb	%al, -56(%ebp)
	movl	40(%ecx), %eax
	shrl	$8, %ebx
	movb	%bl, -72(%ebp)
	movl	%ecx, %ebx
	movl	20(%ecx), %ecx
	movl	%eax, %edx
	shrl	$8, %edx
	movb	%dl, -120(%ebp)
	movl	8(%esi), %edx
	movb	%al, -121(%ebp)
	shrl	$16, %eax
	movl	64(%ebx), %esi
	movb	%al, -104(%ebp)
	movl	24(%ebx), %eax
	subl	$1, %edx
	subl	16(%ebx), %edx
	movl	%esi, %edi
	movl	%ecx, 16(%ebx)
	negl	%edi
	movl	%eax, -128(%ebp)
	movl	%edx, 20(%ebx)
	addl	8(%ebx), %eax
	movl	56(%ebx), %ebx
	movl	%edi, -32(%ebp)
	movl	%eax, -28(%ebp)
	movl	%ebx, -88(%ebp)
	movl	12(%ebp), %edi
	movl	60(%edi), %ebx
	movl	28(%edi), %eax
	movl	%ebx, -84(%ebp)
	movl	12(%edi), %ebx
	testl	%ebx, %ebx
	jle	.L422
	movl	-128(%ebp), %edi
	imull	%esi, %edx
	imull	-136(%ebp), %eax
	sarl	$3, %edi
	addl	%edi, %eax
	movzbl	-137(%ebp), %edi
	addl	-88(%ebp), %eax
	movl	%eax, -88(%ebp)
	leal	(%ecx,%ecx,2), %eax
	movl	-88(%ebp), %esi
	leal	(%edx,%eax), %eax
	addl	-84(%ebp), %eax
	movl	%eax, -84(%ebp)
	leal	-3(%ebx,%ebx,2), %eax
	movl	-84(%ebp), %edx
	addl	-84(%ebp), %eax
	movl	%eax, -132(%ebp)
	.p2align 4,,7
	.p2align 3
.L423:
	movl	-128(%ebp), %eax
	movl	-28(%ebp), %ecx
	cmpl	%ecx, %eax
	jge	.L428
	movl	%esi, -156(%ebp)
	jmp	.L429
	.p2align 4,,7
	.p2align 3
.L433:
	movzbl	-73(%ebp), %ecx
	movb	%cl, 2(%edx)
	movzbl	-72(%ebp), %ebx
	movb	%bl, 1(%edx)
	movzbl	-56(%ebp), %ecx
	movb	%cl, (%edx)
.L426:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L428
.L427:
	addl	-32(%ebp), %edx
.L429:
	testb	$7, %al
	jne	.L424
	movl	-156(%ebp), %ecx
	movzbl	(%ecx), %edi
	addl	$1, %ecx
	movl	%ecx, -156(%ebp)
.L424:
	movl	%eax, %esi
	movl	%edi, %ecx
	andl	$7, %esi
	movzbl	%cl, %ebx
	movl	%esi, -144(%ebp)
	movzbl	-144(%ebp), %ecx
	movl	$128, %esi
	sarl	%cl, %esi
	testl	%ebx, %esi
	jne	.L433
	movl	-80(%ebp), %ecx
	testl	%ecx, %ecx
	je	.L426
	movzbl	-121(%ebp), %ebx
	addl	$1, %eax
	movb	%bl, 2(%edx)
	movzbl	-120(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-104(%ebp), %ebx
	movb	%bl, (%edx)
	cmpl	%eax, -28(%ebp)
	jg	.L427
.L428:
	movl	-132(%ebp), %esi
	cmpl	%esi, -84(%ebp)
	je	.L422
	movl	-136(%ebp), %eax
	addl	%eax, -88(%ebp)
	addl	$3, -84(%ebp)
	movl	-88(%ebp), %esi
	movl	-84(%ebp), %edx
	jmp	.L423
.L422:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ebx
	movl	140(%ebx), %edx
	testl	%edx, %edx
	je	.L431
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
.L431:
	addl	$188, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_byte_msb_bgr_left, .-convblit_copy_mask_mono_byte_msb_bgr_left
	.p2align 4,,15
.globl convblit_copy_mask_mono_byte_msb_bgr_right
	.type	convblit_copy_mask_mono_byte_msb_bgr_right, @function
convblit_copy_mask_mono_byte_msb_bgr_right:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$188, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	12(%ebp), %esi
	movl	32(%eax), %eax
	movl	52(%edx), %edx
	movl	64(%esi), %edi
	movl	%eax, -136(%ebp)
	movl	36(%ecx), %eax
	movl	%edx, -80(%ebp)
	movl	%edi, -32(%ebp)
	movb	%al, -73(%ebp)
	movl	%eax, %ebx
	shrl	$16, %eax
	movb	%al, -56(%ebp)
	movl	40(%ecx), %eax
	shrl	$8, %ebx
	movb	%bl, -72(%ebp)
	movl	16(%ecx), %ebx
	movl	8(%ebp), %ecx
	movl	%eax, %edx
	shrl	$8, %edx
	movb	%al, -121(%ebp)
	shrl	$16, %eax
	movb	%dl, -120(%ebp)
	movl	12(%ecx), %edx
	movl	%esi, %ecx
	movb	%al, -104(%ebp)
	movl	24(%esi), %eax
	movl	60(%ecx), %edi
	subl	$1, %edx
	movl	%eax, -128(%ebp)
	subl	20(%esi), %edx
	addl	8(%esi), %eax
	movl	%ebx, 20(%esi)
	movl	%edx, 16(%esi)
	movl	56(%esi), %esi
	movl	%eax, -28(%ebp)
	movl	28(%ecx), %eax
	movl	%edi, -84(%ebp)
	movl	12(%ecx), %ecx
	testl	%ecx, %ecx
	jle	.L435
	movl	-128(%ebp), %edi
	leal	(%edx,%edx,2), %edx
	imull	-136(%ebp), %eax
	sarl	$3, %edi
	addl	%edi, %eax
	movzbl	-137(%ebp), %edi
	leal	(%esi,%eax), %eax
	movl	%eax, -88(%ebp)
	movl	-32(%ebp), %eax
	movl	-88(%ebp), %esi
	imull	%ebx, %eax
	leal	(%edx,%eax), %eax
	addl	-84(%ebp), %eax
	movl	%eax, -84(%ebp)
	movl	-84(%ebp), %edx
	leal	(%ecx,%ecx,2), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	-84(%ebp), %edx
	addl	$3, %eax
	movl	%eax, -132(%ebp)
	.p2align 4,,7
	.p2align 3
.L436:
	movl	-128(%ebp), %eax
	movl	-28(%ebp), %ecx
	cmpl	%ecx, %eax
	jge	.L441
	movl	%esi, -156(%ebp)
	jmp	.L442
	.p2align 4,,7
	.p2align 3
.L446:
	movzbl	-73(%ebp), %ecx
	movb	%cl, 2(%edx)
	movzbl	-72(%ebp), %ebx
	movb	%bl, 1(%edx)
	movzbl	-56(%ebp), %ecx
	movb	%cl, (%edx)
.L439:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L441
.L440:
	addl	-32(%ebp), %edx
.L442:
	testb	$7, %al
	jne	.L437
	movl	-156(%ebp), %ecx
	movzbl	(%ecx), %edi
	addl	$1, %ecx
	movl	%ecx, -156(%ebp)
.L437:
	movl	%eax, %esi
	movl	%edi, %ecx
	andl	$7, %esi
	movzbl	%cl, %ebx
	movl	%esi, -144(%ebp)
	movzbl	-144(%ebp), %ecx
	movl	$128, %esi
	sarl	%cl, %esi
	testl	%ebx, %esi
	jne	.L446
	movl	-80(%ebp), %ebx
	testl	%ebx, %ebx
	je	.L439
	movzbl	-121(%ebp), %ebx
	addl	$1, %eax
	movb	%bl, 2(%edx)
	movzbl	-120(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-104(%ebp), %ebx
	movb	%bl, (%edx)
	cmpl	%eax, -28(%ebp)
	jg	.L440
.L441:
	movl	-132(%ebp), %esi
	cmpl	%esi, -84(%ebp)
	je	.L435
	movl	-136(%ebp), %eax
	addl	%eax, -88(%ebp)
	subl	$3, -84(%ebp)
	movl	-88(%ebp), %esi
	movl	-84(%ebp), %edx
	jmp	.L436
.L435:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ebx
	movl	140(%ebx), %edx
	testl	%edx, %edx
	je	.L444
	movl	12(%ebp), %esi
	movl	12(%esi), %ecx
	movl	8(%esi), %eax
	movl	%ecx, 12(%esp)
	movl	%eax, 16(%esp)
	movl	20(%esi), %eax
	movl	%eax, 8(%esp)
	movl	16(%esi), %eax
	movl	%ebx, (%esp)
	addl	$1, %eax
	subl	%ecx, %eax
	movl	%eax, 4(%esp)
	call	*%edx
.L444:
	addl	$188, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_byte_msb_bgr_right, .-convblit_copy_mask_mono_byte_msb_bgr_right
	.p2align 4,,15
.globl convblit_copy_mask_mono_byte_msb_bgr_down
	.type	convblit_copy_mask_mono_byte_msb_bgr_down, @function
convblit_copy_mask_mono_byte_msb_bgr_down:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$220, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	32(%eax), %eax
	movl	52(%edx), %edx
	movl	%eax, -152(%ebp)
	movl	36(%ecx), %eax
	movl	%edx, -80(%ebp)
	movb	%al, -73(%ebp)
	movl	%eax, %ebx
	shrl	$16, %eax
	movb	%al, -56(%ebp)
	movl	40(%ecx), %eax
	shrl	$8, %ebx
	movl	8(%ebp), %ecx
	movb	%bl, -72(%ebp)
	movl	12(%ebp), %ebx
	movl	%eax, %edx
	shrl	$8, %edx
	movb	%dl, -136(%ebp)
	movl	8(%ecx), %edx
	movl	%ebx, %edi
	movb	%al, -137(%ebp)
	shrl	$16, %eax
	movl	56(%edi), %esi
	movb	%al, -120(%ebp)
	movl	24(%edi), %eax
	subl	$1, %edx
	subl	16(%ebx), %edx
	movl	%eax, -144(%ebp)
	addl	8(%edi), %eax
	movl	%edx, 16(%ebx)
	movl	12(%ecx), %ecx
	movl	%eax, -28(%ebp)
	movl	28(%edi), %eax
	movl	60(%edi), %edi
	subl	$1, %ecx
	subl	20(%ebx), %ecx
	movl	%ecx, 20(%ebx)
	movl	64(%ebx), %ebx
	movl	%edi, -84(%ebp)
	movl	12(%ebp), %edi
	movl	12(%edi), %edi
	testl	%edi, %edi
	movl	%edi, -148(%ebp)
	jle	.L448
	movl	-144(%ebp), %edi
	leal	(%edx,%edx,2), %edx
	imull	-152(%ebp), %eax
	sarl	$3, %edi
	addl	%edi, %eax
	movzbl	-169(%ebp), %edi
	leal	(%esi,%eax), %eax
	movl	%eax, -88(%ebp)
	movl	%ecx, %eax
	movl	-88(%ebp), %esi
	imull	%ebx, %eax
	negl	%ebx
	movl	%ebx, -156(%ebp)
	leal	(%edx,%eax), %eax
	addl	-84(%ebp), %eax
	movl	$0, -84(%ebp)
	movl	%eax, -92(%ebp)
	movl	%eax, %edx
	.p2align 4,,7
	.p2align 3
.L449:
	movl	-144(%ebp), %eax
	movl	-28(%ebp), %ecx
	cmpl	%ecx, %eax
	jge	.L454
	movl	%esi, -188(%ebp)
	jmp	.L455
	.p2align 4,,7
	.p2align 3
.L459:
	movzbl	-73(%ebp), %ecx
	movb	%cl, 2(%edx)
	movzbl	-72(%ebp), %ebx
	movb	%bl, 1(%edx)
	movzbl	-56(%ebp), %ecx
	movb	%cl, (%edx)
.L452:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L454
.L453:
	subl	$3, %edx
.L455:
	testb	$7, %al
	jne	.L450
	movl	-188(%ebp), %ecx
	movzbl	(%ecx), %edi
	addl	$1, %ecx
	movl	%ecx, -188(%ebp)
.L450:
	movl	%eax, %esi
	movl	%edi, %ecx
	andl	$7, %esi
	movzbl	%cl, %ebx
	movl	%esi, -176(%ebp)
	movzbl	-176(%ebp), %ecx
	movl	$128, %esi
	sarl	%cl, %esi
	testl	%ebx, %esi
	jne	.L459
	movl	-80(%ebp), %esi
	testl	%esi, %esi
	je	.L452
	movzbl	-137(%ebp), %ebx
	addl	$1, %eax
	movb	%bl, 2(%edx)
	movzbl	-136(%ebp), %ecx
	movb	%cl, 1(%edx)
	movzbl	-120(%ebp), %ebx
	movb	%bl, (%edx)
	cmpl	%eax, -28(%ebp)
	jg	.L453
.L454:
	addl	$1, -84(%ebp)
	movl	-148(%ebp), %esi
	cmpl	%esi, -84(%ebp)
	je	.L448
	movl	-156(%ebp), %edx
	movl	-152(%ebp), %eax
	addl	%eax, -88(%ebp)
	addl	%edx, -92(%ebp)
	movl	-88(%ebp), %esi
	movl	-92(%ebp), %edx
	jmp	.L449
.L448:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ebx
	movl	140(%ebx), %edx
	testl	%edx, %edx
	je	.L457
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
.L457:
	addl	$220, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_byte_msb_bgr_down, .-convblit_copy_mask_mono_byte_msb_bgr_down
	.p2align 4,,15
.globl convblit_copy_mask_mono_byte_msb_16bpp
	.type	convblit_copy_mask_mono_byte_msb_16bpp, @function
convblit_copy_mask_mono_byte_msb_16bpp:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$220, %esp
	movl	12(%ebp), %edx
	movl	12(%ebp), %ecx
	movl	12(%ebp), %eax
	movl	12(%ebp), %esi
	movl	52(%edx), %edx
	movl	32(%eax), %eax
	movl	64(%esi), %esi
	movl	%edx, -60(%ebp)
	movl	36(%ecx), %edx
	movl	%eax, -108(%ebp)
	movl	%esi, -112(%ebp)
	movb	%dl, -168(%ebp)
	movl	%edx, %eax
	shrl	$16, %edx
	movb	%dl, -56(%ebp)
	movl	40(%ecx), %edx
	shrl	$8, %eax
	movb	%al, -152(%ebp)
	movl	12(%ebp), %eax
	movb	%dl, -88(%ebp)
	movl	%edx, %ecx
	shrl	$16, %edx
	movl	24(%eax), %eax
	movb	%dl, -64(%ebp)
	movl	12(%ebp), %edx
	shrl	$8, %ecx
	movb	%cl, -136(%ebp)
	movl	%eax, -100(%ebp)
	movl	60(%edx), %ecx
	movl	%edx, %esi
	addl	8(%edx), %eax
	movl	56(%edx), %ebx
	movl	%ecx, -92(%ebp)
	movl	16(%esi), %ecx
	movl	12(%esi), %esi
	movl	%eax, -28(%ebp)
	movl	28(%edx), %eax
	movl	20(%edx), %edx
	testl	%esi, %esi
	movl	%esi, -104(%ebp)
	jle	.L461
	movl	-100(%ebp), %esi
	imull	-108(%ebp), %eax
	sarl	$3, %esi
	leal	(%esi,%eax), %eax
	leal	(%ebx,%eax), %eax
	movl	%eax, -96(%ebp)
	movl	-112(%ebp), %eax
	movl	-96(%ebp), %esi
	imull	%edx, %eax
	movzbl	-56(%ebp), %edx
	leal	(%eax,%ecx,2), %eax
	addl	-92(%ebp), %eax
	shrb	$3, %dl
	movzbl	%dl, %edx
	movl	%eax, -92(%ebp)
	movzbl	-168(%ebp), %eax
	movw	%dx, -56(%ebp)
	movzbl	-64(%ebp), %edx
	movl	$0, -64(%ebp)
	andl	$248, %eax
	sall	$8, %eax
	orw	%ax, -56(%ebp)
	movzbl	-152(%ebp), %eax
	shrb	$3, %dl
	movzbl	%dl, %edx
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -56(%ebp)
	movzbl	-88(%ebp), %eax
	movw	%dx, -88(%ebp)
	movl	-92(%ebp), %edx
	andl	$248, %eax
	sall	$8, %eax
	orw	%ax, -88(%ebp)
	movzbl	-136(%ebp), %eax
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -88(%ebp)
	.p2align 4,,7
	.p2align 3
.L462:
	movl	-100(%ebp), %eax
	movl	-28(%ebp), %ecx
	cmpl	%ecx, %eax
	jge	.L467
	movl	%esi, -188(%ebp)
	jmp	.L468
	.p2align 4,,7
	.p2align 3
.L472:
	movzwl	-56(%ebp), %ecx
	movw	%cx, (%edx)
.L465:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L467
.L466:
	addl	$2, %edx
.L468:
	testb	$7, %al
	jne	.L463
	movl	-188(%ebp), %ecx
	movzbl	(%ecx), %edi
	addl	$1, %ecx
	movl	%ecx, -188(%ebp)
.L463:
	movl	%eax, %esi
	movl	%edi, %ecx
	andl	$7, %esi
	movzbl	%cl, %ebx
	movl	%esi, -172(%ebp)
	movzbl	-172(%ebp), %ecx
	movl	$128, %esi
	sarl	%cl, %esi
	testl	%ebx, %esi
	jne	.L472
	movl	-60(%ebp), %ecx
	testl	%ecx, %ecx
	je	.L465
	movzwl	-88(%ebp), %esi
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	movw	%si, (%edx)
	jg	.L466
.L467:
	addl	$1, -64(%ebp)
	movl	-104(%ebp), %eax
	cmpl	%eax, -64(%ebp)
	je	.L461
	movl	-108(%ebp), %edx
	movl	-112(%ebp), %ecx
	addl	%edx, -96(%ebp)
	addl	%ecx, -92(%ebp)
	movl	-96(%ebp), %esi
	movl	-92(%ebp), %edx
	jmp	.L462
.L461:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %esi
	movl	140(%esi), %eax
	testl	%eax, %eax
	je	.L470
	movl	12(%ebp), %ecx
	movl	12(%ecx), %edx
	movl	%edx, 16(%esp)
	movl	8(%ecx), %edx
	movl	%edx, 12(%esp)
	movl	20(%ecx), %edx
	movl	%edx, 8(%esp)
	movl	16(%ecx), %edx
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	call	*%eax
.L470:
	addl	$220, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_byte_msb_16bpp, .-convblit_copy_mask_mono_byte_msb_16bpp
	.p2align 4,,15
.globl convblit_copy_mask_mono_byte_msb_16bpp_left
	.type	convblit_copy_mask_mono_byte_msb_16bpp_left, @function
convblit_copy_mask_mono_byte_msb_16bpp_left:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$220, %esp
	movl	12(%ebp), %ebx
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %esi
	movl	36(%ebx), %edx
	movl	32(%eax), %eax
	movl	52(%ecx), %ecx
	movb	%dl, -168(%ebp)
	movl	%eax, -108(%ebp)
	movl	%edx, %eax
	shrl	$16, %edx
	movb	%dl, -56(%ebp)
	movl	40(%ebx), %edx
	shrl	$8, %eax
	movl	%ecx, -60(%ebp)
	movb	%al, -152(%ebp)
	movl	24(%esi), %eax
	movl	%edx, %ecx
	shrl	$8, %ecx
	movb	%cl, -136(%ebp)
	movl	20(%ebx), %ecx
	movl	8(%ebp), %ebx
	movb	%dl, -88(%ebp)
	shrl	$16, %edx
	movb	%dl, -64(%ebp)
	movl	%eax, -96(%ebp)
	movl	8(%ebx), %edx
	movl	64(%esi), %ebx
	addl	8(%esi), %eax
	subl	$1, %edx
	movl	%ebx, %edi
	negl	%edi
	movl	%edi, -32(%ebp)
	movl	%esi, %edi
	movl	%eax, -28(%ebp)
	movl	28(%edi), %eax
	movl	60(%edi), %edi
	subl	16(%esi), %edx
	movl	%ecx, 16(%esi)
	movl	%edx, 20(%esi)
	movl	56(%esi), %esi
	movl	%edi, -100(%ebp)
	movl	12(%ebp), %edi
	movl	12(%edi), %edi
	testl	%edi, %edi
	movl	%edi, -104(%ebp)
	jle	.L474
	movl	-96(%ebp), %edi
	imull	-108(%ebp), %eax
	sarl	$3, %edi
	addl	%edi, %eax
	movzbl	-169(%ebp), %edi
	leal	(%esi,%eax), %eax
	movl	%eax, -92(%ebp)
	movl	%edx, %eax
	movzbl	-56(%ebp), %edx
	imull	%ebx, %eax
	movl	-92(%ebp), %esi
	shrb	$3, %dl
	leal	(%eax,%ecx,2), %eax
	movzbl	%dl, %edx
	addl	-100(%ebp), %eax
	movw	%dx, -56(%ebp)
	movzbl	-64(%ebp), %edx
	movl	$0, -64(%ebp)
	movl	%eax, -100(%ebp)
	movzbl	-168(%ebp), %eax
	shrb	$3, %dl
	movzbl	%dl, %edx
	andl	$248, %eax
	sall	$8, %eax
	orw	%ax, -56(%ebp)
	movzbl	-152(%ebp), %eax
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -56(%ebp)
	movzbl	-88(%ebp), %eax
	movw	%dx, -88(%ebp)
	movl	-100(%ebp), %edx
	andl	$248, %eax
	sall	$8, %eax
	orw	%ax, -88(%ebp)
	movzbl	-136(%ebp), %eax
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -88(%ebp)
	.p2align 4,,7
	.p2align 3
.L475:
	movl	-96(%ebp), %eax
	movl	-28(%ebp), %ecx
	cmpl	%ecx, %eax
	jge	.L480
	movl	%esi, -188(%ebp)
	jmp	.L481
	.p2align 4,,7
	.p2align 3
.L485:
	movzwl	-56(%ebp), %ecx
	movw	%cx, (%edx)
.L478:
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	jle	.L480
.L479:
	addl	-32(%ebp), %edx
.L481:
	testb	$7, %al
	jne	.L476
	movl	-188(%ebp), %ecx
	movzbl	(%ecx), %edi
	addl	$1, %ecx
	movl	%ecx, -188(%ebp)
.L476:
	movl	%eax, %esi
	movl	%edi, %ecx
	andl	$7, %esi
	movzbl	%cl, %ebx
	movl	%esi, -176(%ebp)
	movzbl	-176(%ebp), %ecx
	movl	$128, %esi
	sarl	%cl, %esi
	testl	%ebx, %esi
	jne	.L485
	movl	-60(%ebp), %ebx
	testl	%ebx, %ebx
	je	.L478
	movzwl	-88(%ebp), %ebx
	addl	$1, %eax
	cmpl	%eax, -28(%ebp)
	movw	%bx, (%edx)
	jg	.L479
.L480:
	addl	$1, -64(%ebp)
	movl	-104(%ebp), %esi
	cmpl	%esi, -64(%ebp)
	je	.L474
	movl	-64(%ebp), %ecx
	movl	-100(%ebp), %ebx
	movl	-108(%ebp), %eax
	addl	%eax, -92(%ebp)
	movl	-92(%ebp), %esi
	leal	(%ebx,%ecx,2), %edx
	jmp	.L475
.L474:
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ebx
	movl	140(%ebx), %edx
	testl	%edx, %edx
	je	.L483
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
.L483:
	addl	$220, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_copy_mask_mono_byte_msb_16bpp_left, .-convblit_copy_mask_mono_byte_msb_16bpp_left
	.p2align 4,,15
.globl convblit_blend_mask_alpha_byte_bgra_down
	.type	convblit_blend_mask_alpha_byte_bgra_down, @function
convblit_blend_mask_alpha_byte_bgra_down:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$236, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	8(%ebp), %esi
	movl	32(%eax), %eax
	movl	12(%ebp), %edi
	movl	52(%edx), %edx
	movl	%eax, -208(%ebp)
	movl	36(%ecx), %eax
	movl	%edx, -32(%ebp)
	movb	%al, -169(%ebp)
	movl	%eax, %ebx
	movl	%eax, %edx
	shrl	$24, %eax
	movb	%al, -200(%ebp)
	movl	40(%ecx), %eax
	shrl	$16, %edx
	movb	%dl, -136(%ebp)
	shrl	$8, %ebx
	movb	%bl, -168(%ebp)
	movl	%eax, %ecx
	movl	%eax, %ebx
	shrl	$8, %ecx
	movb	%cl, -88(%ebp)
	movl	8(%esi), %ecx
	shrl	$16, %ebx
	movb	%al, -93(%ebp)
	shrl	$24, %eax
	movb	%al, -56(%ebp)
	movl	56(%edi), %eax
	movb	%bl, -72(%ebp)
	movl	24(%edi), %ebx
	subl	$1, %ecx
	subl	16(%edi), %ecx
	movl	%eax, -92(%ebp)
	movl	28(%edi), %eax
	movl	%ecx, 16(%edi)
	movl	12(%esi), %edx
	movl	64(%edi), %esi
	subl	$1, %edx
	subl	20(%edi), %edx
	movl	%edx, 20(%edi)
	movl	60(%edi), %edi
	movl	%edi, -28(%ebp)
	movl	12(%ebp), %edi
	movl	12(%edi), %edi
	testl	%edi, %edi
	movl	%edi, -204(%ebp)
	jle	.L487
	imull	-208(%ebp), %eax
	movl	$0, -104(%ebp)
	leal	(%eax,%ebx), %ebx
	movl	%edx, %eax
	movzbl	-168(%ebp), %edx
	imull	%esi, %eax
	negl	%esi
	addl	-92(%ebp), %ebx
	movl	%esi, -212(%ebp)
	movl	%edx, -100(%ebp)
	leal	(%eax,%ecx,4), %eax
	addl	-28(%ebp), %eax
	movl	%eax, -108(%ebp)
	movzbl	-169(%ebp), %eax
	movl	%eax, -140(%ebp)
	movzbl	-93(%ebp), %eax
	movl	-140(%ebp), %ecx
	subl	%eax, %ecx
	movl	%ecx, -144(%ebp)
	.p2align 4,,7
	.p2align 3
.L494:
	movl	12(%ebp), %esi
	movl	8(%esi), %ecx
	testl	%ecx, %ecx
	jle	.L488
	movzbl	-136(%ebp), %edi
	xorl	%edx, %edx
	movl	-108(%ebp), %eax
	movl	%ecx, -28(%ebp)
	movl	%edi, -92(%ebp)
	jmp	.L493
	.p2align 4,,7
	.p2align 3
.L498:
	movl	-32(%ebp), %edi
	testl	%edi, %edi
	je	.L490
	movzbl	-56(%ebp), %ecx
	movb	%cl, 3(%eax)
	movzbl	-93(%ebp), %ecx
	movb	%cl, 2(%eax)
	movzbl	-88(%ebp), %ecx
	movb	%cl, 1(%eax)
	movzbl	-72(%ebp), %ecx
	movb	%cl, (%eax)
.L490:
	addl	$1, %edx
	cmpl	-28(%ebp), %edx
	je	.L488
.L500:
	subl	$4, %eax
.L493:
	movzbl	(%ebx,%edx), %edi
	testl	%edi, %edi
	je	.L498
	cmpl	$255, %edi
	je	.L499
	movl	-32(%ebp), %esi
	testl	%esi, %esi
	je	.L492
	movzbl	-56(%ebp), %ecx
	addl	$1, %edi
	addl	$1, %edx
	notl	%ecx
	movl	%ecx, %esi
	movzbl	-56(%ebp), %ecx
	andl	$255, %esi
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, 3(%eax)
	movl	-144(%ebp), %esi
	movzbl	-93(%ebp), %ecx
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, 2(%eax)
	movzbl	-88(%ebp), %esi
	movl	-100(%ebp), %ecx
	subl	%esi, %ecx
	movl	%ecx, %esi
	movzbl	-88(%ebp), %ecx
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, 1(%eax)
	movzbl	-72(%ebp), %esi
	movl	-92(%ebp), %ecx
	subl	%esi, %ecx
	movl	%ecx, %esi
	movzbl	-72(%ebp), %ecx
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, (%eax)
	cmpl	-28(%ebp), %edx
	jne	.L500
	.p2align 4,,7
	.p2align 3
.L488:
	addl	$1, -104(%ebp)
	movl	-204(%ebp), %esi
	cmpl	%esi, -104(%ebp)
	je	.L487
	movl	-212(%ebp), %edi
	addl	-208(%ebp), %ebx
	addl	%edi, -108(%ebp)
	jmp	.L494
	.p2align 4,,7
	.p2align 3
.L492:
	movzbl	3(%eax), %ecx
	addl	$1, %edi
	notl	%ecx
	movl	%ecx, %esi
	movzbl	3(%eax), %ecx
	andl	$255, %esi
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movzbl	2(%eax), %esi
	movb	%cl, 3(%eax)
	movl	-140(%ebp), %ecx
	subl	%esi, %ecx
	movl	%ecx, %esi
	movzbl	2(%eax), %ecx
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movzbl	1(%eax), %esi
	movb	%cl, 2(%eax)
	movl	-100(%ebp), %ecx
	subl	%esi, %ecx
	movl	%ecx, %esi
	movzbl	1(%eax), %ecx
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movzbl	(%eax), %esi
	movb	%cl, 1(%eax)
	movl	-92(%ebp), %ecx
	subl	%esi, %ecx
	movl	%ecx, %esi
	movzbl	(%eax), %ecx
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, (%eax)
	jmp	.L490
	.p2align 4,,7
	.p2align 3
.L499:
	movzbl	-200(%ebp), %ecx
	movb	%cl, 3(%eax)
	movzbl	-169(%ebp), %ecx
	movb	%cl, 2(%eax)
	movzbl	-168(%ebp), %ecx
	movb	%cl, 1(%eax)
	movzbl	-136(%ebp), %ecx
	movb	%cl, (%eax)
	jmp	.L490
.L487:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %eax
	movl	140(%eax), %edx
	testl	%edx, %edx
	je	.L496
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
.L496:
	addl	$236, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_blend_mask_alpha_byte_bgra_down, .-convblit_blend_mask_alpha_byte_bgra_down
	.p2align 4,,15
.globl convblit_blend_mask_alpha_byte_bgr
	.type	convblit_blend_mask_alpha_byte_bgr, @function
convblit_blend_mask_alpha_byte_bgr:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$204, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	12(%ebp), %esi
	movl	32(%eax), %eax
	movl	52(%edx), %edi
	movl	56(%esi), %esi
	movl	%eax, -164(%ebp)
	movl	36(%edx), %eax
	movl	%esi, -76(%ebp)
	movl	%eax, %ecx
	movb	%al, -153(%ebp)
	shrl	$16, %eax
	movb	%al, -120(%ebp)
	movl	40(%edx), %eax
	shrl	$8, %ecx
	movb	%cl, -152(%ebp)
	movl	12(%ebp), %ecx
	movl	%eax, %edx
	shrl	$8, %edx
	movl	64(%ecx), %ecx
	movb	%dl, -72(%ebp)
	movl	12(%ebp), %edx
	movb	%al, -77(%ebp)
	shrl	$16, %eax
	movb	%al, -56(%ebp)
	movl	%ecx, -168(%ebp)
	movl	%edx, %esi
	movl	60(%edx), %ecx
	movl	12(%esi), %esi
	movl	28(%edx), %eax
	movl	24(%edx), %ebx
	movl	%ecx, -28(%ebp)
	movl	20(%edx), %ecx
	testl	%esi, %esi
	movl	16(%edx), %edx
	movl	%esi, -160(%ebp)
	jle	.L502
	imull	-164(%ebp), %eax
	leal	(%edx,%edx,2), %edx
	movl	$0, -88(%ebp)
	leal	(%eax,%ebx), %ebx
	movl	-168(%ebp), %eax
	addl	-76(%ebp), %ebx
	imull	%ecx, %eax
	leal	(%edx,%eax), %eax
	movzbl	-152(%ebp), %edx
	addl	-28(%ebp), %eax
	movl	%eax, -92(%ebp)
	movzbl	-153(%ebp), %eax
	movl	%edx, -84(%ebp)
	movl	%eax, -124(%ebp)
	movzbl	-77(%ebp), %eax
	movl	-124(%ebp), %ecx
	subl	%eax, %ecx
	movl	%ecx, -128(%ebp)
	.p2align 4,,7
	.p2align 3
.L509:
	movl	12(%ebp), %esi
	movl	8(%esi), %ecx
	testl	%ecx, %ecx
	jle	.L503
	movzbl	-120(%ebp), %esi
	xorl	%edx, %edx
	movl	-92(%ebp), %eax
	movl	%ecx, -172(%ebp)
	movl	%esi, -76(%ebp)
	jmp	.L508
	.p2align 4,,7
	.p2align 3
.L513:
	testl	%edi, %edi
	je	.L505
	movzbl	-77(%ebp), %ecx
	movb	%cl, 2(%eax)
	movzbl	-72(%ebp), %ecx
	movb	%cl, 1(%eax)
	movzbl	-56(%ebp), %ecx
	movb	%cl, (%eax)
.L505:
	addl	$1, %edx
	cmpl	-172(%ebp), %edx
	je	.L503
.L515:
	addl	$3, %eax
.L508:
	movzbl	(%ebx,%edx), %esi
	testl	%esi, %esi
	je	.L513
	cmpl	$255, %esi
	je	.L514
	testl	%edi, %edi
	je	.L507
	addl	$1, %esi
	movzbl	-77(%ebp), %ecx
	addl	$1, %edx
	movl	%esi, -28(%ebp)
	movl	-128(%ebp), %esi
	imull	-28(%ebp), %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, 2(%eax)
	movzbl	-72(%ebp), %esi
	movl	-84(%ebp), %ecx
	subl	%esi, %ecx
	movl	-28(%ebp), %esi
	imull	%ecx, %esi
	movzbl	-72(%ebp), %ecx
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, 1(%eax)
	movzbl	-56(%ebp), %esi
	movl	-76(%ebp), %ecx
	subl	%esi, %ecx
	movl	-28(%ebp), %esi
	imull	%ecx, %esi
	movzbl	-56(%ebp), %ecx
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, (%eax)
	cmpl	-172(%ebp), %edx
	jne	.L515
	.p2align 4,,7
	.p2align 3
.L503:
	addl	$1, -88(%ebp)
	movl	-160(%ebp), %esi
	cmpl	%esi, -88(%ebp)
	je	.L502
	movl	-168(%ebp), %eax
	addl	-164(%ebp), %ebx
	addl	%eax, -92(%ebp)
	jmp	.L509
	.p2align 4,,7
	.p2align 3
.L507:
	addl	$1, %esi
	movl	-124(%ebp), %ecx
	movl	%esi, -28(%ebp)
	movzbl	2(%eax), %esi
	subl	%esi, %ecx
	movl	-28(%ebp), %esi
	imull	%ecx, %esi
	movzbl	2(%eax), %ecx
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movzbl	1(%eax), %esi
	movb	%cl, 2(%eax)
	movl	-84(%ebp), %ecx
	subl	%esi, %ecx
	movl	-28(%ebp), %esi
	imull	%ecx, %esi
	movzbl	1(%eax), %ecx
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movzbl	(%eax), %esi
	movb	%cl, 1(%eax)
	movl	-76(%ebp), %ecx
	subl	%esi, %ecx
	movl	-28(%ebp), %esi
	imull	%ecx, %esi
	movzbl	(%eax), %ecx
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, (%eax)
	jmp	.L505
	.p2align 4,,7
	.p2align 3
.L514:
	movzbl	-153(%ebp), %ecx
	movb	%cl, 2(%eax)
	movzbl	-152(%ebp), %ecx
	movb	%cl, 1(%eax)
	movzbl	-120(%ebp), %ecx
	movb	%cl, (%eax)
	jmp	.L505
.L502:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %edx
	movl	140(%edx), %eax
	testl	%eax, %eax
	je	.L511
	movl	12(%ebp), %ecx
	movl	8(%ebp), %esi
	movl	12(%ecx), %edx
	movl	%edx, 16(%esp)
	movl	8(%ecx), %edx
	movl	%edx, 12(%esp)
	movl	20(%ecx), %edx
	movl	%edx, 8(%esp)
	movl	16(%ecx), %edx
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	call	*%eax
.L511:
	addl	$204, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_blend_mask_alpha_byte_bgr, .-convblit_blend_mask_alpha_byte_bgr
	.p2align 4,,15
.globl convblit_blend_mask_alpha_byte_bgr_left
	.type	convblit_blend_mask_alpha_byte_bgr_left, @function
convblit_blend_mask_alpha_byte_bgr_left:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$172, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	8(%ebp), %esi
	movl	32(%eax), %eax
	movl	52(%edx), %edi
	movl	%eax, -148(%ebp)
	movl	36(%edx), %eax
	movb	%al, -137(%ebp)
	movl	%eax, %ecx
	shrl	$16, %eax
	movb	%al, -104(%ebp)
	movl	40(%edx), %eax
	shrl	$8, %ecx
	movb	%cl, -136(%ebp)
	movl	20(%edx), %ecx
	movl	8(%esi), %edx
	movb	%al, -77(%ebp)
	movl	%eax, %ebx
	shrl	$16, %eax
	movb	%al, -56(%ebp)
	movl	12(%ebp), %eax
	shrl	$8, %ebx
	movb	%bl, -72(%ebp)
	subl	$1, %edx
	movl	64(%eax), %ebx
	movl	56(%eax), %esi
	subl	16(%eax), %edx
	movl	%ecx, 16(%eax)
	movl	%ebx, -32(%ebp)
	negl	%ebx
	movl	%ebx, -36(%ebp)
	movl	%eax, %ebx
	movl	%esi, -76(%ebp)
	movl	24(%ebx), %esi
	movl	60(%ebx), %ebx
	movl	%edx, 20(%eax)
	movl	28(%eax), %eax
	movl	%esi, -84(%ebp)
	movl	%ebx, -28(%ebp)
	movl	12(%ebp), %ebx
	movl	12(%ebx), %esi
	testl	%esi, %esi
	jle	.L517
	imull	-148(%ebp), %eax
	movl	-76(%ebp), %ebx
	addl	-84(%ebp), %eax
	imull	-32(%ebp), %edx
	addl	%eax, %ebx
	leal	(%ecx,%ecx,2), %eax
	leal	(%edx,%eax), %eax
	addl	-28(%ebp), %eax
	movl	%eax, -84(%ebp)
	leal	-3(%esi,%esi,2), %eax
	movzbl	-137(%ebp), %esi
	addl	-84(%ebp), %eax
	movl	%eax, -144(%ebp)
	movzbl	-136(%ebp), %eax
	movl	%esi, -108(%ebp)
	movl	%eax, -88(%ebp)
	movzbl	-77(%ebp), %eax
	subl	%eax, %esi
	movl	%esi, -112(%ebp)
	.p2align 4,,7
	.p2align 3
.L524:
	movl	12(%ebp), %edx
	movl	8(%edx), %ecx
	testl	%ecx, %ecx
	jle	.L518
	movzbl	-104(%ebp), %esi
	xorl	%edx, %edx
	movl	-84(%ebp), %eax
	movl	%ecx, -28(%ebp)
	movl	%esi, -76(%ebp)
	jmp	.L523
	.p2align 4,,7
	.p2align 3
.L528:
	testl	%edi, %edi
	je	.L520
	movzbl	-77(%ebp), %ecx
	movb	%cl, 2(%eax)
	movzbl	-72(%ebp), %ecx
	movb	%cl, 1(%eax)
	movzbl	-56(%ebp), %ecx
	movb	%cl, (%eax)
.L520:
	addl	$1, %edx
	cmpl	-28(%ebp), %edx
	je	.L518
.L530:
	addl	-36(%ebp), %eax
.L523:
	movzbl	(%ebx,%edx), %esi
	testl	%esi, %esi
	je	.L528
	cmpl	$255, %esi
	je	.L529
	testl	%edi, %edi
	je	.L522
	addl	$1, %esi
	movzbl	-77(%ebp), %ecx
	addl	$1, %edx
	movl	%esi, -32(%ebp)
	movl	-112(%ebp), %esi
	imull	-32(%ebp), %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, 2(%eax)
	movzbl	-72(%ebp), %esi
	movl	-88(%ebp), %ecx
	subl	%esi, %ecx
	movl	-32(%ebp), %esi
	imull	%ecx, %esi
	movzbl	-72(%ebp), %ecx
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, 1(%eax)
	movzbl	-56(%ebp), %esi
	movl	-76(%ebp), %ecx
	subl	%esi, %ecx
	movl	-32(%ebp), %esi
	imull	%ecx, %esi
	movzbl	-56(%ebp), %ecx
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, (%eax)
	cmpl	-28(%ebp), %edx
	jne	.L530
	.p2align 4,,7
	.p2align 3
.L518:
	movl	-144(%ebp), %esi
	cmpl	%esi, -84(%ebp)
	je	.L517
	addl	-148(%ebp), %ebx
	addl	$3, -84(%ebp)
	jmp	.L524
	.p2align 4,,7
	.p2align 3
.L522:
	addl	$1, %esi
	movl	-108(%ebp), %ecx
	movl	%esi, -32(%ebp)
	movzbl	2(%eax), %esi
	subl	%esi, %ecx
	movl	-32(%ebp), %esi
	imull	%ecx, %esi
	movzbl	2(%eax), %ecx
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movzbl	1(%eax), %esi
	movb	%cl, 2(%eax)
	movl	-88(%ebp), %ecx
	subl	%esi, %ecx
	movl	-32(%ebp), %esi
	imull	%ecx, %esi
	movzbl	1(%eax), %ecx
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movzbl	(%eax), %esi
	movb	%cl, 1(%eax)
	movl	-76(%ebp), %ecx
	subl	%esi, %ecx
	movl	-32(%ebp), %esi
	imull	%ecx, %esi
	movzbl	(%eax), %ecx
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, (%eax)
	jmp	.L520
	.p2align 4,,7
	.p2align 3
.L529:
	movzbl	-137(%ebp), %ecx
	movb	%cl, 2(%eax)
	movzbl	-136(%ebp), %ecx
	movb	%cl, 1(%eax)
	movzbl	-104(%ebp), %ecx
	movb	%cl, (%eax)
	jmp	.L520
.L517:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %eax
	movl	140(%eax), %edx
	testl	%edx, %edx
	je	.L526
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
.L526:
	addl	$172, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_blend_mask_alpha_byte_bgr_left, .-convblit_blend_mask_alpha_byte_bgr_left
	.p2align 4,,15
.globl convblit_blend_mask_alpha_byte_bgr_right
	.type	convblit_blend_mask_alpha_byte_bgr_right, @function
convblit_blend_mask_alpha_byte_bgr_right:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$172, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	32(%eax), %eax
	movl	16(%edx), %esi
	movl	52(%edx), %edi
	movl	%eax, -148(%ebp)
	movl	36(%edx), %eax
	movb	%al, -137(%ebp)
	movl	%eax, %ecx
	shrl	$16, %eax
	movb	%al, -104(%ebp)
	movl	40(%edx), %eax
	shrl	$8, %ecx
	movb	%cl, -136(%ebp)
	movl	12(%ebp), %ecx
	movb	%al, -77(%ebp)
	movl	%eax, %ebx
	shrl	$16, %eax
	movb	%al, -56(%ebp)
	movl	8(%ebp), %eax
	shrl	$8, %ebx
	movb	%bl, -72(%ebp)
	movl	64(%ecx), %ebx
	movl	12(%eax), %edx
	movl	%ebx, -36(%ebp)
	movl	56(%ecx), %eax
	movl	12(%ebp), %ebx
	subl	$1, %edx
	subl	20(%ecx), %edx
	movl	%eax, -28(%ebp)
	movl	60(%ebx), %ebx
	movl	%esi, 20(%ecx)
	movl	28(%ecx), %eax
	movl	%edx, 16(%ecx)
	movl	24(%ecx), %ecx
	movl	%ecx, -76(%ebp)
	movl	%ebx, -32(%ebp)
	movl	12(%ebp), %ebx
	movl	12(%ebx), %ecx
	testl	%ecx, %ecx
	jle	.L532
	imull	-148(%ebp), %eax
	movl	-28(%ebp), %ebx
	leal	(%edx,%edx,2), %edx
	addl	-76(%ebp), %eax
	addl	%eax, %ebx
	movl	-36(%ebp), %eax
	imull	%esi, %eax
	leal	(%edx,%eax), %eax
	movzbl	-136(%ebp), %edx
	addl	-32(%ebp), %eax
	movl	%eax, -84(%ebp)
	movl	-84(%ebp), %esi
	leal	(%ecx,%ecx,2), %eax
	movl	%edx, -88(%ebp)
	subl	%eax, %esi
	movl	%esi, %eax
	addl	$3, %eax
	movl	%eax, -144(%ebp)
	movzbl	-137(%ebp), %eax
	movl	%eax, -108(%ebp)
	movzbl	-77(%ebp), %eax
	movl	-108(%ebp), %ecx
	subl	%eax, %ecx
	movl	%ecx, -112(%ebp)
	.p2align 4,,7
	.p2align 3
.L539:
	movl	12(%ebp), %esi
	movl	8(%esi), %ecx
	testl	%ecx, %ecx
	jle	.L533
	movzbl	-104(%ebp), %esi
	xorl	%edx, %edx
	movl	-84(%ebp), %eax
	movl	%ecx, -28(%ebp)
	movl	%esi, -76(%ebp)
	jmp	.L538
	.p2align 4,,7
	.p2align 3
.L543:
	testl	%edi, %edi
	je	.L535
	movzbl	-77(%ebp), %ecx
	movb	%cl, 2(%eax)
	movzbl	-72(%ebp), %ecx
	movb	%cl, 1(%eax)
	movzbl	-56(%ebp), %ecx
	movb	%cl, (%eax)
.L535:
	addl	$1, %edx
	cmpl	-28(%ebp), %edx
	je	.L533
.L545:
	addl	-36(%ebp), %eax
.L538:
	movzbl	(%ebx,%edx), %esi
	testl	%esi, %esi
	je	.L543
	cmpl	$255, %esi
	je	.L544
	testl	%edi, %edi
	je	.L537
	addl	$1, %esi
	movzbl	-77(%ebp), %ecx
	addl	$1, %edx
	movl	%esi, -32(%ebp)
	movl	-112(%ebp), %esi
	imull	-32(%ebp), %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, 2(%eax)
	movzbl	-72(%ebp), %esi
	movl	-88(%ebp), %ecx
	subl	%esi, %ecx
	movl	-32(%ebp), %esi
	imull	%ecx, %esi
	movzbl	-72(%ebp), %ecx
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, 1(%eax)
	movzbl	-56(%ebp), %esi
	movl	-76(%ebp), %ecx
	subl	%esi, %ecx
	movl	-32(%ebp), %esi
	imull	%ecx, %esi
	movzbl	-56(%ebp), %ecx
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, (%eax)
	cmpl	-28(%ebp), %edx
	jne	.L545
	.p2align 4,,7
	.p2align 3
.L533:
	movl	-144(%ebp), %esi
	cmpl	%esi, -84(%ebp)
	je	.L532
	addl	-148(%ebp), %ebx
	subl	$3, -84(%ebp)
	jmp	.L539
	.p2align 4,,7
	.p2align 3
.L537:
	addl	$1, %esi
	movl	-108(%ebp), %ecx
	movl	%esi, -32(%ebp)
	movzbl	2(%eax), %esi
	subl	%esi, %ecx
	movl	-32(%ebp), %esi
	imull	%ecx, %esi
	movzbl	2(%eax), %ecx
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movzbl	1(%eax), %esi
	movb	%cl, 2(%eax)
	movl	-88(%ebp), %ecx
	subl	%esi, %ecx
	movl	-32(%ebp), %esi
	imull	%ecx, %esi
	movzbl	1(%eax), %ecx
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movzbl	(%eax), %esi
	movb	%cl, 1(%eax)
	movl	-76(%ebp), %ecx
	subl	%esi, %ecx
	movl	-32(%ebp), %esi
	imull	%ecx, %esi
	movzbl	(%eax), %ecx
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, (%eax)
	jmp	.L535
	.p2align 4,,7
	.p2align 3
.L544:
	movzbl	-137(%ebp), %ecx
	movb	%cl, 2(%eax)
	movzbl	-136(%ebp), %ecx
	movb	%cl, 1(%eax)
	movzbl	-104(%ebp), %ecx
	movb	%cl, (%eax)
	jmp	.L535
.L532:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %eax
	movl	140(%eax), %edx
	testl	%edx, %edx
	je	.L541
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
.L541:
	addl	$172, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_blend_mask_alpha_byte_bgr_right, .-convblit_blend_mask_alpha_byte_bgr_right
	.p2align 4,,15
.globl convblit_blend_mask_alpha_byte_bgra_left
	.type	convblit_blend_mask_alpha_byte_bgra_left, @function
convblit_blend_mask_alpha_byte_bgra_left:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$236, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	8(%ebp), %edi
	movl	32(%eax), %eax
	movl	12(%ebp), %esi
	movl	52(%edx), %edx
	movl	%eax, -208(%ebp)
	movl	36(%ecx), %eax
	movl	%edx, -36(%ebp)
	movb	%al, -169(%ebp)
	movl	%eax, %ebx
	movl	%eax, %edx
	shrl	$24, %eax
	movb	%al, -200(%ebp)
	movl	40(%ecx), %eax
	shrl	$16, %edx
	movb	%dl, -136(%ebp)
	movl	8(%edi), %edx
	shrl	$8, %ebx
	movb	%bl, -168(%ebp)
	movl	%eax, %ecx
	movl	%eax, %ebx
	shrl	$8, %ecx
	subl	$1, %edx
	movb	%cl, -88(%ebp)
	movl	20(%esi), %ecx
	shrl	$16, %ebx
	subl	16(%esi), %edx
	movb	%al, -93(%ebp)
	shrl	$24, %eax
	movb	%al, -56(%ebp)
	movl	%esi, %eax
	movl	%edx, 20(%esi)
	movl	56(%eax), %edi
	movl	%ecx, 16(%esi)
	movl	64(%esi), %esi
	movb	%bl, -72(%ebp)
	movl	%edi, -92(%ebp)
	movl	%esi, %ebx
	negl	%ebx
	movl	%ebx, -32(%ebp)
	movl	%eax, %ebx
	movl	28(%eax), %eax
	movl	%ebx, %edi
	movl	24(%ebx), %ebx
	movl	60(%edi), %edi
	movl	%edi, -28(%ebp)
	movl	12(%ebp), %edi
	movl	12(%edi), %edi
	testl	%edi, %edi
	movl	%edi, -204(%ebp)
	jle	.L547
	imull	-208(%ebp), %eax
	movl	$0, -104(%ebp)
	leal	(%eax,%ebx), %ebx
	movl	%edx, %eax
	movzbl	-168(%ebp), %edx
	imull	%esi, %eax
	addl	-92(%ebp), %ebx
	movl	%edx, -100(%ebp)
	leal	(%eax,%ecx,4), %eax
	addl	-28(%ebp), %eax
	movl	%eax, -108(%ebp)
	movzbl	-169(%ebp), %eax
	movl	%eax, -140(%ebp)
	movzbl	-93(%ebp), %eax
	movl	-140(%ebp), %ecx
	subl	%eax, %ecx
	movl	%ecx, -144(%ebp)
	.p2align 4,,7
	.p2align 3
.L554:
	movl	12(%ebp), %esi
	movl	8(%esi), %ecx
	testl	%ecx, %ecx
	jle	.L548
	movzbl	-136(%ebp), %edi
	xorl	%edx, %edx
	movl	-108(%ebp), %eax
	movl	%ecx, -28(%ebp)
	movl	%edi, -92(%ebp)
	jmp	.L553
	.p2align 4,,7
	.p2align 3
.L558:
	movl	-36(%ebp), %esi
	testl	%esi, %esi
	je	.L550
	movzbl	-56(%ebp), %ecx
	movb	%cl, 3(%eax)
	movzbl	-93(%ebp), %ecx
	movb	%cl, 2(%eax)
	movzbl	-88(%ebp), %ecx
	movb	%cl, 1(%eax)
	movzbl	-72(%ebp), %ecx
	movb	%cl, (%eax)
.L550:
	addl	$1, %edx
	cmpl	-28(%ebp), %edx
	je	.L548
.L560:
	addl	-32(%ebp), %eax
.L553:
	movzbl	(%ebx,%edx), %edi
	testl	%edi, %edi
	je	.L558
	cmpl	$255, %edi
	je	.L559
	movl	-36(%ebp), %ecx
	testl	%ecx, %ecx
	je	.L552
	movzbl	-56(%ebp), %ecx
	addl	$1, %edi
	addl	$1, %edx
	notl	%ecx
	movl	%ecx, %esi
	movzbl	-56(%ebp), %ecx
	andl	$255, %esi
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, 3(%eax)
	movl	-144(%ebp), %esi
	movzbl	-93(%ebp), %ecx
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, 2(%eax)
	movzbl	-88(%ebp), %esi
	movl	-100(%ebp), %ecx
	subl	%esi, %ecx
	movl	%ecx, %esi
	movzbl	-88(%ebp), %ecx
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, 1(%eax)
	movzbl	-72(%ebp), %esi
	movl	-92(%ebp), %ecx
	subl	%esi, %ecx
	movl	%ecx, %esi
	movzbl	-72(%ebp), %ecx
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, (%eax)
	cmpl	-28(%ebp), %edx
	jne	.L560
	.p2align 4,,7
	.p2align 3
.L548:
	addl	$1, -104(%ebp)
	movl	-204(%ebp), %esi
	cmpl	%esi, -104(%ebp)
	je	.L547
	addl	-208(%ebp), %ebx
	addl	$4, -108(%ebp)
	jmp	.L554
	.p2align 4,,7
	.p2align 3
.L552:
	movzbl	3(%eax), %ecx
	addl	$1, %edi
	notl	%ecx
	movl	%ecx, %esi
	movzbl	3(%eax), %ecx
	andl	$255, %esi
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movzbl	2(%eax), %esi
	movb	%cl, 3(%eax)
	movl	-140(%ebp), %ecx
	subl	%esi, %ecx
	movl	%ecx, %esi
	movzbl	2(%eax), %ecx
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movzbl	1(%eax), %esi
	movb	%cl, 2(%eax)
	movl	-100(%ebp), %ecx
	subl	%esi, %ecx
	movl	%ecx, %esi
	movzbl	1(%eax), %ecx
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movzbl	(%eax), %esi
	movb	%cl, 1(%eax)
	movl	-92(%ebp), %ecx
	subl	%esi, %ecx
	movl	%ecx, %esi
	movzbl	(%eax), %ecx
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, (%eax)
	jmp	.L550
	.p2align 4,,7
	.p2align 3
.L559:
	movzbl	-200(%ebp), %ecx
	movb	%cl, 3(%eax)
	movzbl	-169(%ebp), %ecx
	movb	%cl, 2(%eax)
	movzbl	-168(%ebp), %ecx
	movb	%cl, 1(%eax)
	movzbl	-136(%ebp), %ecx
	movb	%cl, (%eax)
	jmp	.L550
.L547:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %edi
	movl	140(%edi), %edx
	testl	%edx, %edx
	je	.L556
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
.L556:
	addl	$236, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_blend_mask_alpha_byte_bgra_left, .-convblit_blend_mask_alpha_byte_bgra_left
	.p2align 4,,15
.globl convblit_blend_mask_alpha_byte_bgra_right
	.type	convblit_blend_mask_alpha_byte_bgra_right, @function
convblit_blend_mask_alpha_byte_bgra_right:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$252, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	8(%ebp), %edi
	movl	32(%eax), %eax
	movl	12(%ebp), %esi
	movl	52(%edx), %edx
	movl	%eax, -208(%ebp)
	movl	36(%ecx), %eax
	movl	%edx, -32(%ebp)
	movb	%al, -169(%ebp)
	movl	%eax, %ebx
	movl	%eax, %edx
	shrl	$24, %eax
	movb	%al, -200(%ebp)
	movl	40(%ecx), %eax
	shrl	$16, %edx
	shrl	$8, %ebx
	movb	%dl, -136(%ebp)
	movl	12(%edi), %edx
	movb	%bl, -168(%ebp)
	movl	60(%esi), %edi
	movl	%eax, %ecx
	movl	%eax, %ebx
	shrl	$8, %ecx
	shrl	$16, %ebx
	subl	$1, %edx
	movb	%al, -93(%ebp)
	shrl	$24, %eax
	movb	%cl, -88(%ebp)
	movl	16(%esi), %ecx
	movb	%bl, -72(%ebp)
	movl	56(%esi), %ebx
	movb	%al, -56(%ebp)
	movl	64(%esi), %eax
	subl	20(%esi), %edx
	movl	%ecx, 20(%esi)
	movl	%ebx, -92(%ebp)
	movl	24(%esi), %ebx
	movl	%edx, 16(%esi)
	movl	%eax, -28(%ebp)
	movl	28(%esi), %eax
	movl	12(%esi), %esi
	testl	%esi, %esi
	movl	%esi, -204(%ebp)
	jle	.L562
	imull	-208(%ebp), %eax
	movl	$0, -104(%ebp)
	leal	(%eax,%ebx), %ebx
	movl	-28(%ebp), %eax
	addl	-92(%ebp), %ebx
	imull	%ecx, %eax
	leal	(%eax,%edx,4), %eax
	leal	(%edi,%eax), %eax
	movzbl	-169(%ebp), %edi
	movl	%eax, -108(%ebp)
	movzbl	-168(%ebp), %eax
	movl	%edi, -140(%ebp)
	movl	%eax, -100(%ebp)
	movzbl	-93(%ebp), %eax
	subl	%eax, %edi
	movl	%edi, -144(%ebp)
	.p2align 4,,7
	.p2align 3
.L569:
	movl	12(%ebp), %edx
	movl	8(%edx), %ecx
	testl	%ecx, %ecx
	jle	.L563
	movzbl	-136(%ebp), %esi
	xorl	%edx, %edx
	movl	-108(%ebp), %eax
	movl	%ecx, -220(%ebp)
	movl	%esi, -92(%ebp)
	jmp	.L568
	.p2align 4,,7
	.p2align 3
.L573:
	movl	-32(%ebp), %esi
	testl	%esi, %esi
	je	.L565
	movzbl	-56(%ebp), %ecx
	movb	%cl, 3(%eax)
	movzbl	-93(%ebp), %ecx
	movb	%cl, 2(%eax)
	movzbl	-88(%ebp), %ecx
	movb	%cl, 1(%eax)
	movzbl	-72(%ebp), %ecx
	movb	%cl, (%eax)
.L565:
	addl	$1, %edx
	cmpl	-220(%ebp), %edx
	je	.L563
.L575:
	addl	-28(%ebp), %eax
.L568:
	movzbl	(%ebx,%edx), %edi
	testl	%edi, %edi
	je	.L573
	cmpl	$255, %edi
	je	.L574
	movl	-32(%ebp), %ecx
	testl	%ecx, %ecx
	je	.L567
	movzbl	-56(%ebp), %ecx
	addl	$1, %edi
	addl	$1, %edx
	notl	%ecx
	movl	%ecx, %esi
	movzbl	-56(%ebp), %ecx
	andl	$255, %esi
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, 3(%eax)
	movl	-144(%ebp), %esi
	movzbl	-93(%ebp), %ecx
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, 2(%eax)
	movzbl	-88(%ebp), %esi
	movl	-100(%ebp), %ecx
	subl	%esi, %ecx
	movl	%ecx, %esi
	movzbl	-88(%ebp), %ecx
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, 1(%eax)
	movzbl	-72(%ebp), %esi
	movl	-92(%ebp), %ecx
	subl	%esi, %ecx
	movl	%ecx, %esi
	movzbl	-72(%ebp), %ecx
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, (%eax)
	cmpl	-220(%ebp), %edx
	jne	.L575
	.p2align 4,,7
	.p2align 3
.L563:
	addl	$1, -104(%ebp)
	movl	-204(%ebp), %esi
	cmpl	%esi, -104(%ebp)
	je	.L562
	addl	-208(%ebp), %ebx
	subl	$4, -108(%ebp)
	jmp	.L569
	.p2align 4,,7
	.p2align 3
.L567:
	movzbl	3(%eax), %ecx
	addl	$1, %edi
	notl	%ecx
	movl	%ecx, %esi
	movzbl	3(%eax), %ecx
	andl	$255, %esi
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movzbl	2(%eax), %esi
	movb	%cl, 3(%eax)
	movl	-140(%ebp), %ecx
	subl	%esi, %ecx
	movl	%ecx, %esi
	movzbl	2(%eax), %ecx
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movzbl	1(%eax), %esi
	movb	%cl, 2(%eax)
	movl	-100(%ebp), %ecx
	subl	%esi, %ecx
	movl	%ecx, %esi
	movzbl	1(%eax), %ecx
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movzbl	(%eax), %esi
	movb	%cl, 1(%eax)
	movl	-92(%ebp), %ecx
	subl	%esi, %ecx
	movl	%ecx, %esi
	movzbl	(%eax), %ecx
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, (%eax)
	jmp	.L565
	.p2align 4,,7
	.p2align 3
.L574:
	movzbl	-200(%ebp), %ecx
	movb	%cl, 3(%eax)
	movzbl	-169(%ebp), %ecx
	movb	%cl, 2(%eax)
	movzbl	-168(%ebp), %ecx
	movb	%cl, 1(%eax)
	movzbl	-136(%ebp), %ecx
	movb	%cl, (%eax)
	jmp	.L565
.L562:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %edi
	movl	140(%edi), %edx
	testl	%edx, %edx
	je	.L571
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
.L571:
	addl	$252, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_blend_mask_alpha_byte_bgra_right, .-convblit_blend_mask_alpha_byte_bgra_right
	.p2align 4,,15
.globl convblit_blend_mask_alpha_byte_bgra
	.type	convblit_blend_mask_alpha_byte_bgra, @function
convblit_blend_mask_alpha_byte_bgra:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$252, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	12(%ebp), %esi
	movl	32(%eax), %eax
	movl	52(%edx), %edx
	movl	%eax, -208(%ebp)
	movl	36(%ecx), %eax
	movl	%edx, -28(%ebp)
	movb	%al, -169(%ebp)
	movl	%eax, %edx
	movl	%eax, %ecx
	shrl	$24, %eax
	movb	%al, -200(%ebp)
	movl	40(%esi), %eax
	shrl	$8, %edx
	movb	%dl, -168(%ebp)
	shrl	$16, %ecx
	movl	64(%esi), %esi
	movb	%cl, -136(%ebp)
	movl	%eax, %edx
	movl	%eax, %ecx
	shrl	$8, %edx
	movb	%dl, -88(%ebp)
	movl	12(%ebp), %edx
	shrl	$16, %ecx
	movb	%al, -93(%ebp)
	shrl	$24, %eax
	movb	%al, -56(%ebp)
	movl	12(%ebp), %eax
	movb	%cl, -72(%ebp)
	movl	%edx, %ecx
	movl	24(%edx), %ebx
	movl	%esi, -212(%ebp)
	movl	%ecx, %esi
	movl	60(%edx), %edi
	movl	12(%esi), %esi
	movl	56(%eax), %eax
	movl	16(%ecx), %ecx
	testl	%esi, %esi
	movl	%eax, -92(%ebp)
	movl	28(%edx), %eax
	movl	20(%edx), %edx
	movl	%esi, -204(%ebp)
	jle	.L577
	imull	-208(%ebp), %eax
	movl	$0, -104(%ebp)
	leal	(%eax,%ebx), %ebx
	movl	-212(%ebp), %eax
	addl	-92(%ebp), %ebx
	imull	%edx, %eax
	movzbl	-168(%ebp), %edx
	leal	(%eax,%ecx,4), %eax
	leal	(%edi,%eax), %eax
	movl	%eax, -108(%ebp)
	movzbl	-169(%ebp), %eax
	movl	%edx, -100(%ebp)
	movl	%eax, -140(%ebp)
	movzbl	-93(%ebp), %eax
	movl	-140(%ebp), %ecx
	subl	%eax, %ecx
	movl	%ecx, -144(%ebp)
	.p2align 4,,7
	.p2align 3
.L584:
	movl	12(%ebp), %esi
	movl	8(%esi), %ecx
	testl	%ecx, %ecx
	jle	.L578
	movzbl	-136(%ebp), %esi
	xorl	%edx, %edx
	movl	-108(%ebp), %eax
	movl	%ecx, -220(%ebp)
	movl	%esi, -92(%ebp)
	jmp	.L583
	.p2align 4,,7
	.p2align 3
.L588:
	movl	-28(%ebp), %esi
	testl	%esi, %esi
	je	.L580
	movzbl	-56(%ebp), %ecx
	movb	%cl, 3(%eax)
	movzbl	-93(%ebp), %ecx
	movb	%cl, 2(%eax)
	movzbl	-88(%ebp), %ecx
	movb	%cl, 1(%eax)
	movzbl	-72(%ebp), %ecx
	movb	%cl, (%eax)
.L580:
	addl	$1, %edx
	cmpl	-220(%ebp), %edx
	je	.L578
.L590:
	addl	$4, %eax
.L583:
	movzbl	(%ebx,%edx), %edi
	testl	%edi, %edi
	je	.L588
	cmpl	$255, %edi
	je	.L589
	movl	-28(%ebp), %ecx
	testl	%ecx, %ecx
	je	.L582
	movzbl	-56(%ebp), %ecx
	addl	$1, %edi
	addl	$1, %edx
	notl	%ecx
	movl	%ecx, %esi
	movzbl	-56(%ebp), %ecx
	andl	$255, %esi
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, 3(%eax)
	movl	-144(%ebp), %esi
	movzbl	-93(%ebp), %ecx
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, 2(%eax)
	movzbl	-88(%ebp), %esi
	movl	-100(%ebp), %ecx
	subl	%esi, %ecx
	movl	%ecx, %esi
	movzbl	-88(%ebp), %ecx
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, 1(%eax)
	movzbl	-72(%ebp), %esi
	movl	-92(%ebp), %ecx
	subl	%esi, %ecx
	movl	%ecx, %esi
	movzbl	-72(%ebp), %ecx
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, (%eax)
	cmpl	-220(%ebp), %edx
	jne	.L590
	.p2align 4,,7
	.p2align 3
.L578:
	addl	$1, -104(%ebp)
	movl	-204(%ebp), %esi
	cmpl	%esi, -104(%ebp)
	je	.L577
	movl	-212(%ebp), %eax
	addl	-208(%ebp), %ebx
	addl	%eax, -108(%ebp)
	jmp	.L584
	.p2align 4,,7
	.p2align 3
.L582:
	movzbl	3(%eax), %ecx
	addl	$1, %edi
	notl	%ecx
	movl	%ecx, %esi
	movzbl	3(%eax), %ecx
	andl	$255, %esi
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movzbl	2(%eax), %esi
	movb	%cl, 3(%eax)
	movl	-140(%ebp), %ecx
	subl	%esi, %ecx
	movl	%ecx, %esi
	movzbl	2(%eax), %ecx
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movzbl	1(%eax), %esi
	movb	%cl, 2(%eax)
	movl	-100(%ebp), %ecx
	subl	%esi, %ecx
	movl	%ecx, %esi
	movzbl	1(%eax), %ecx
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movzbl	(%eax), %esi
	movb	%cl, 1(%eax)
	movl	-92(%ebp), %ecx
	subl	%esi, %ecx
	movl	%ecx, %esi
	movzbl	(%eax), %ecx
	imull	%edi, %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, (%eax)
	jmp	.L580
	.p2align 4,,7
	.p2align 3
.L589:
	movzbl	-200(%ebp), %ecx
	movb	%cl, 3(%eax)
	movzbl	-169(%ebp), %ecx
	movb	%cl, 2(%eax)
	movzbl	-168(%ebp), %ecx
	movb	%cl, 1(%eax)
	movzbl	-136(%ebp), %ecx
	movb	%cl, (%eax)
	jmp	.L580
.L577:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %edx
	movl	140(%edx), %eax
	testl	%eax, %eax
	je	.L586
	movl	12(%ebp), %ecx
	movl	8(%ebp), %esi
	movl	12(%ecx), %edx
	movl	%edx, 16(%esp)
	movl	8(%ecx), %edx
	movl	%edx, 12(%esp)
	movl	20(%ecx), %edx
	movl	%edx, 8(%esp)
	movl	16(%ecx), %edx
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	call	*%eax
.L586:
	addl	$252, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_blend_mask_alpha_byte_bgra, .-convblit_blend_mask_alpha_byte_bgra
	.p2align 4,,15
.globl convblit_blend_mask_alpha_byte_16bpp_down
	.type	convblit_blend_mask_alpha_byte_16bpp_down, @function
convblit_blend_mask_alpha_byte_16bpp_down:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$204, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	8(%ebp), %ebx
	movl	12(%ebp), %esi
	movl	32(%eax), %eax
	movl	52(%edx), %edi
	movl	%eax, -168(%ebp)
	movl	36(%edx), %eax
	movb	%al, -88(%ebp)
	movl	%eax, %ecx
	shrl	$16, %eax
	movb	%al, -136(%ebp)
	movl	40(%edx), %eax
	shrl	$8, %ecx
	movb	%cl, -28(%ebp)
	movl	56(%esi), %ecx
	movb	%al, -104(%ebp)
	shrl	$8, %eax
	movb	%al, -56(%ebp)
	movl	8(%ebx), %eax
	movl	%ecx, -108(%ebp)
	movl	28(%esi), %ecx
	subl	$1, %eax
	subl	16(%edx), %eax
	movl	%eax, 16(%edx)
	movl	12(%ebx), %edx
	movl	64(%esi), %ebx
	subl	$1, %edx
	subl	20(%esi), %edx
	movl	%edx, 20(%esi)
	movl	24(%esi), %esi
	movl	%esi, -140(%ebp)
	movl	12(%ebp), %esi
	movl	60(%esi), %esi
	movl	%esi, -60(%ebp)
	movl	12(%ebp), %esi
	movl	12(%esi), %esi
	testl	%esi, %esi
	movl	%esi, -164(%ebp)
	jle	.L592
	imull	%ebx, %edx
	movl	-108(%ebp), %esi
	negl	%ebx
	imull	-168(%ebp), %ecx
	addl	-140(%ebp), %ecx
	movl	%ebx, -172(%ebp)
	leal	(%edx,%eax,2), %eax
	movzbl	-56(%ebp), %edx
	addl	-60(%ebp), %eax
	addl	%ecx, %esi
	movl	%eax, -156(%ebp)
	movl	12(%ebp), %eax
	shrb	$3, %dl
	movzbl	%dl, %edx
	movw	%dx, -150(%ebp)
	movzbl	-28(%ebp), %edx
	movl	8(%eax), %eax
	shrb	$3, %dl
	movzbl	%dl, %edx
	movl	%eax, -60(%ebp)
	movzbl	-104(%ebp), %eax
	movw	%dx, -158(%ebp)
	movzbl	-88(%ebp), %edx
	andl	$248, %eax
	sall	$8, %eax
	andw	$248, %dx
	orw	%ax, -150(%ebp)
	movzbl	-56(%ebp), %eax
	sall	$8, %edx
	movzwl	%dx, %ecx
	movl	%ecx, -144(%ebp)
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -150(%ebp)
	movzbl	-88(%ebp), %eax
	movw	%dx, -88(%ebp)
	andl	$248, %eax
	sall	$8, %eax
	orw	%ax, -158(%ebp)
	movzbl	-28(%ebp), %eax
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -158(%ebp)
	movzbl	-28(%ebp), %eax
	andw	$252, %ax
	sall	$3, %eax
	movw	%ax, -108(%ebp)
	movzbl	-136(%ebp), %eax
	movzwl	-108(%ebp), %ebx
	shrb	$3, %al
	movzbl	%al, %eax
	movw	%ax, -104(%ebp)
	movzwl	%ax, %eax
	movl	%ebx, -140(%ebp)
	movl	%eax, -136(%ebp)
	movl	$0, -148(%ebp)
	.p2align 4,,7
	.p2align 3
.L599:
	movl	-60(%ebp), %eax
	testl	%eax, %eax
	jle	.L593
	movl	-156(%ebp), %edx
	xorl	%eax, %eax
	jmp	.L598
	.p2align 4,,7
	.p2align 3
.L604:
	testl	%edi, %edi
	je	.L595
	movzwl	-150(%ebp), %ecx
	movw	%cx, (%edx)
.L595:
	addl	$1, %eax
	cmpl	-60(%ebp), %eax
	je	.L593
.L606:
	subl	$2, %edx
.L598:
	movzbl	(%esi,%eax), %ecx
	testl	%ecx, %ecx
	je	.L604
	cmpl	$255, %ecx
	je	.L605
	testl	%edi, %edi
	je	.L597
	movl	$256, %ebx
	subl	%ecx, %ebx
	movl	12(%ebp), %ecx
	movl	%ebx, -28(%ebp)
	movl	48(%ecx), %ecx
	movl	%ecx, -176(%ebp)
	andl	$31, %ecx
	subl	-136(%ebp), %ecx
	imull	%ebx, %ecx
	movl	-176(%ebp), %ebx
	andl	$63488, %ebx
	subl	-144(%ebp), %ebx
	imull	-28(%ebp), %ebx
	shrl	$8, %ecx
	addw	-104(%ebp), %cx
	shrl	$8, %ebx
	addw	-88(%ebp), %bx
	andl	$31, %ecx
	andw	$-2048, %bx
	orl	%ebx, %ecx
	movl	-176(%ebp), %ebx
.L603:
	andl	$2016, %ebx
	addl	$1, %eax
	subl	-140(%ebp), %ebx
	imull	-28(%ebp), %ebx
	shrl	$8, %ebx
	addw	-108(%ebp), %bx
	andw	$2016, %bx
	orl	%ebx, %ecx
	cmpl	-60(%ebp), %eax
	movw	%cx, (%edx)
	jne	.L606
.L593:
	addl	$1, -148(%ebp)
	movl	-164(%ebp), %ebx
	cmpl	%ebx, -148(%ebp)
	je	.L592
	movl	-172(%ebp), %eax
	addl	-168(%ebp), %esi
	addl	%eax, -156(%ebp)
	jmp	.L599
	.p2align 4,,7
	.p2align 3
.L597:
	movl	$256, %ebx
	subl	%ecx, %ebx
	movzwl	(%edx), %ecx
	movl	%ebx, -28(%ebp)
	movl	%ecx, -56(%ebp)
	andl	$31, %ecx
	subl	-136(%ebp), %ecx
	imull	%ebx, %ecx
	movl	-56(%ebp), %ebx
	andl	$63488, %ebx
	subl	-144(%ebp), %ebx
	imull	-28(%ebp), %ebx
	shrl	$8, %ecx
	addw	-104(%ebp), %cx
	shrl	$8, %ebx
	addw	-88(%ebp), %bx
	andl	$31, %ecx
	andw	$-2048, %bx
	orl	%ebx, %ecx
	movl	-56(%ebp), %ebx
	jmp	.L603
	.p2align 4,,7
	.p2align 3
.L605:
	movzwl	-158(%ebp), %ebx
	movw	%bx, (%edx)
	jmp	.L595
.L592:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ecx
	movl	140(%ecx), %edx
	testl	%edx, %edx
	je	.L601
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
.L601:
	addl	$204, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_blend_mask_alpha_byte_16bpp_down, .-convblit_blend_mask_alpha_byte_16bpp_down
	.p2align 4,,15
.globl convblit_blend_mask_alpha_byte_bgr_down
	.type	convblit_blend_mask_alpha_byte_bgr_down, @function
convblit_blend_mask_alpha_byte_bgr_down:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$188, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	8(%ebp), %esi
	movl	32(%eax), %eax
	movl	52(%edx), %edi
	movl	%eax, -164(%ebp)
	movl	36(%edx), %eax
	movb	%al, -153(%ebp)
	movl	%eax, %ecx
	shrl	$16, %eax
	movb	%al, -120(%ebp)
	movl	40(%edx), %eax
	shrl	$8, %ecx
	movl	8(%esi), %edx
	movb	%cl, -152(%ebp)
	movb	%al, -77(%ebp)
	movl	%eax, %ebx
	shrl	$16, %eax
	subl	$1, %edx
	movb	%al, -56(%ebp)
	movl	12(%ebp), %eax
	shrl	$8, %ebx
	movb	%bl, -72(%ebp)
	movl	56(%eax), %ebx
	subl	16(%eax), %edx
	movl	%ebx, -28(%ebp)
	movl	%eax, %ebx
	movl	24(%ebx), %ebx
	movl	%edx, 16(%eax)
	movl	12(%esi), %ecx
	movl	64(%eax), %esi
	movl	%ebx, -76(%ebp)
	movl	12(%ebp), %ebx
	subl	$1, %ecx
	subl	20(%eax), %ecx
	movl	60(%ebx), %ebx
	movl	%ecx, 20(%eax)
	movl	28(%eax), %eax
	movl	%ebx, -32(%ebp)
	movl	12(%ebp), %ebx
	movl	12(%ebx), %ebx
	testl	%ebx, %ebx
	movl	%ebx, -160(%ebp)
	jle	.L608
	imull	-164(%ebp), %eax
	movl	-28(%ebp), %ebx
	leal	(%edx,%edx,2), %edx
	addl	-76(%ebp), %eax
	movl	$0, -88(%ebp)
	addl	%eax, %ebx
	movl	%ecx, %eax
	imull	%esi, %eax
	negl	%esi
	movl	%esi, -168(%ebp)
	movzbl	-153(%ebp), %esi
	leal	(%edx,%eax), %eax
	addl	-32(%ebp), %eax
	movl	%esi, -124(%ebp)
	movl	%eax, -92(%ebp)
	movzbl	-152(%ebp), %eax
	movl	%eax, -84(%ebp)
	movzbl	-77(%ebp), %eax
	subl	%eax, %esi
	movl	%esi, -128(%ebp)
	.p2align 4,,7
	.p2align 3
.L615:
	movl	12(%ebp), %edx
	movl	8(%edx), %ecx
	testl	%ecx, %ecx
	jle	.L609
	movzbl	-120(%ebp), %esi
	xorl	%edx, %edx
	movl	-92(%ebp), %eax
	movl	%ecx, -28(%ebp)
	movl	%esi, -76(%ebp)
	jmp	.L614
	.p2align 4,,7
	.p2align 3
.L619:
	testl	%edi, %edi
	je	.L611
	movzbl	-77(%ebp), %ecx
	movb	%cl, 2(%eax)
	movzbl	-72(%ebp), %ecx
	movb	%cl, 1(%eax)
	movzbl	-56(%ebp), %ecx
	movb	%cl, (%eax)
.L611:
	addl	$1, %edx
	cmpl	-28(%ebp), %edx
	je	.L609
.L621:
	subl	$3, %eax
.L614:
	movzbl	(%ebx,%edx), %esi
	testl	%esi, %esi
	je	.L619
	cmpl	$255, %esi
	je	.L620
	testl	%edi, %edi
	je	.L613
	addl	$1, %esi
	movzbl	-77(%ebp), %ecx
	addl	$1, %edx
	movl	%esi, -32(%ebp)
	movl	-128(%ebp), %esi
	imull	-32(%ebp), %esi
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, 2(%eax)
	movzbl	-72(%ebp), %esi
	movl	-84(%ebp), %ecx
	subl	%esi, %ecx
	movl	-32(%ebp), %esi
	imull	%ecx, %esi
	movzbl	-72(%ebp), %ecx
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, 1(%eax)
	movzbl	-56(%ebp), %esi
	movl	-76(%ebp), %ecx
	subl	%esi, %ecx
	movl	-32(%ebp), %esi
	imull	%ecx, %esi
	movzbl	-56(%ebp), %ecx
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, (%eax)
	cmpl	-28(%ebp), %edx
	jne	.L621
	.p2align 4,,7
	.p2align 3
.L609:
	addl	$1, -88(%ebp)
	movl	-160(%ebp), %esi
	cmpl	%esi, -88(%ebp)
	je	.L608
	movl	-168(%ebp), %eax
	addl	-164(%ebp), %ebx
	addl	%eax, -92(%ebp)
	jmp	.L615
	.p2align 4,,7
	.p2align 3
.L613:
	addl	$1, %esi
	movl	-124(%ebp), %ecx
	movl	%esi, -32(%ebp)
	movzbl	2(%eax), %esi
	subl	%esi, %ecx
	movl	-32(%ebp), %esi
	imull	%ecx, %esi
	movzbl	2(%eax), %ecx
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movzbl	1(%eax), %esi
	movb	%cl, 2(%eax)
	movl	-84(%ebp), %ecx
	subl	%esi, %ecx
	movl	-32(%ebp), %esi
	imull	%ecx, %esi
	movzbl	1(%eax), %ecx
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movzbl	(%eax), %esi
	movb	%cl, 1(%eax)
	movl	-76(%ebp), %ecx
	subl	%esi, %ecx
	movl	-32(%ebp), %esi
	imull	%ecx, %esi
	movzbl	(%eax), %ecx
	shrl	$8, %esi
	leal	(%ecx,%esi), %esi
	movl	%esi, %ecx
	movb	%cl, (%eax)
	jmp	.L611
	.p2align 4,,7
	.p2align 3
.L620:
	movzbl	-153(%ebp), %ecx
	movb	%cl, 2(%eax)
	movzbl	-152(%ebp), %ecx
	movb	%cl, 1(%eax)
	movzbl	-120(%ebp), %ecx
	movb	%cl, (%eax)
	jmp	.L611
.L608:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ecx
	movl	140(%ecx), %edx
	testl	%edx, %edx
	je	.L617
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
.L617:
	addl	$188, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_blend_mask_alpha_byte_bgr_down, .-convblit_blend_mask_alpha_byte_bgr_down
	.p2align 4,,15
.globl convblit_blend_mask_alpha_byte_16bpp
	.type	convblit_blend_mask_alpha_byte_16bpp, @function
convblit_blend_mask_alpha_byte_16bpp:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$188, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	32(%eax), %eax
	movl	64(%edx), %ebx
	movl	56(%edx), %esi
	movl	52(%edx), %edi
	movl	%eax, -148(%ebp)
	movl	36(%edx), %eax
	movl	%ebx, -152(%ebp)
	movl	%esi, -128(%ebp)
	movl	%eax, %ecx
	movb	%al, -88(%ebp)
	shrl	$16, %eax
	movb	%al, -120(%ebp)
	movl	40(%edx), %eax
	shrl	$8, %ecx
	movb	%cl, -28(%ebp)
	movb	%al, -104(%ebp)
	shrl	$8, %eax
	movb	%al, -56(%ebp)
	movl	%edx, %eax
	movl	28(%edx), %edx
	movl	%eax, %ecx
	movl	24(%eax), %eax
	movl	60(%ecx), %ebx
	movl	%ecx, %esi
	movl	20(%ecx), %ecx
	movl	%ebx, -60(%ebp)
	movl	%esi, %ebx
	movl	16(%esi), %esi
	movl	12(%ebx), %ebx
	testl	%ebx, %ebx
	movl	%ebx, -144(%ebp)
	jle	.L623
	imull	-148(%ebp), %edx
	movl	-128(%ebp), %ebx
	leal	(%edx,%eax), %eax
	movzbl	-56(%ebp), %edx
	addl	%eax, %ebx
	movl	-152(%ebp), %eax
	shrb	$3, %dl
	imull	%ecx, %eax
	movzbl	%dl, %edx
	movw	%dx, -138(%ebp)
	movzbl	-28(%ebp), %edx
	leal	(%eax,%esi,2), %esi
	movl	12(%ebp), %eax
	addl	-60(%ebp), %esi
	shrb	$3, %dl
	movzbl	%dl, %edx
	movl	8(%eax), %eax
	movw	%dx, -140(%ebp)
	movzbl	-88(%ebp), %edx
	movl	%eax, -60(%ebp)
	movzbl	-104(%ebp), %eax
	andw	$248, %dx
	sall	$8, %edx
	movzwl	%dx, %ecx
	andl	$248, %eax
	sall	$8, %eax
	orw	%ax, -138(%ebp)
	movzbl	-56(%ebp), %eax
	movl	%ecx, -132(%ebp)
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -138(%ebp)
	movzbl	-88(%ebp), %eax
	movw	%dx, -88(%ebp)
	andl	$248, %eax
	sall	$8, %eax
	orw	%ax, -140(%ebp)
	movzbl	-28(%ebp), %eax
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -140(%ebp)
	movzbl	-28(%ebp), %eax
	andw	$252, %ax
	sall	$3, %eax
	movw	%ax, -122(%ebp)
	movzbl	-120(%ebp), %eax
	shrb	$3, %al
	movzbl	%al, %eax
	movw	%ax, -104(%ebp)
	movzwl	-122(%ebp), %eax
	movzwl	-104(%ebp), %edx
	movl	%eax, -128(%ebp)
	movl	%edx, -120(%ebp)
	movl	$0, -136(%ebp)
	.p2align 4,,7
	.p2align 3
.L630:
	movl	-60(%ebp), %edx
	testl	%edx, %edx
	jle	.L624
	xorl	%eax, %eax
	jmp	.L629
	.p2align 4,,7
	.p2align 3
.L635:
	testl	%edi, %edi
	je	.L626
	movzwl	-138(%ebp), %ecx
	movw	%cx, (%esi,%eax,2)
.L626:
	addl	$1, %eax
	cmpl	-60(%ebp), %eax
	je	.L624
.L629:
	movzbl	(%ebx,%eax), %edx
	testl	%edx, %edx
	je	.L635
	cmpl	$255, %edx
	je	.L636
	testl	%edi, %edi
	.p2align 4,,3
	je	.L628
	movl	$256, %ecx
	subl	%edx, %ecx
	movl	12(%ebp), %edx
	movl	%ecx, -28(%ebp)
	movl	48(%edx), %edx
	movl	%edx, -156(%ebp)
	andl	$31, %edx
	subl	-120(%ebp), %edx
	imull	%ecx, %edx
	movl	-156(%ebp), %ecx
	andl	$63488, %ecx
	subl	-132(%ebp), %ecx
	imull	-28(%ebp), %ecx
	shrl	$8, %edx
	addw	-104(%ebp), %dx
	shrl	$8, %ecx
	addw	-88(%ebp), %cx
	andl	$31, %edx
	andw	$-2048, %cx
	orl	%ecx, %edx
	movl	-156(%ebp), %ecx
.L634:
	andl	$2016, %ecx
	subl	-128(%ebp), %ecx
	imull	-28(%ebp), %ecx
	shrl	$8, %ecx
	addw	-122(%ebp), %cx
	andw	$2016, %cx
	orl	%ecx, %edx
	movw	%dx, (%esi,%eax,2)
	addl	$1, %eax
	cmpl	-60(%ebp), %eax
	jne	.L629
.L624:
	addl	$1, -136(%ebp)
	movl	-144(%ebp), %ecx
	cmpl	%ecx, -136(%ebp)
	je	.L623
	addl	-148(%ebp), %ebx
	addl	-152(%ebp), %esi
	jmp	.L630
	.p2align 4,,7
	.p2align 3
.L628:
	movl	$256, %ecx
	subl	%edx, %ecx
	movzwl	(%esi,%eax,2), %edx
	movl	%ecx, -28(%ebp)
	movl	%edx, -56(%ebp)
	andl	$31, %edx
	subl	-120(%ebp), %edx
	imull	%ecx, %edx
	movl	-56(%ebp), %ecx
	andl	$63488, %ecx
	subl	-132(%ebp), %ecx
	imull	-28(%ebp), %ecx
	shrl	$8, %edx
	addw	-104(%ebp), %dx
	shrl	$8, %ecx
	addw	-88(%ebp), %cx
	andl	$31, %edx
	andw	$-2048, %cx
	orl	%ecx, %edx
	movl	-56(%ebp), %ecx
	jmp	.L634
	.p2align 4,,7
	.p2align 3
.L636:
	movzwl	-140(%ebp), %edx
	movw	%dx, (%esi,%eax,2)
	jmp	.L626
.L623:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %ebx
	movl	140(%ebx), %eax
	testl	%eax, %eax
	je	.L632
	movl	12(%ebp), %esi
	movl	12(%esi), %edx
	movl	%edx, 16(%esp)
	movl	8(%esi), %edx
	movl	%edx, 12(%esp)
	movl	20(%esi), %edx
	movl	%edx, 8(%esp)
	movl	16(%esi), %edx
	movl	%ebx, (%esp)
	movl	%edx, 4(%esp)
	call	*%eax
.L632:
	addl	$188, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_blend_mask_alpha_byte_16bpp, .-convblit_blend_mask_alpha_byte_16bpp
	.p2align 4,,15
.globl convblit_blend_mask_alpha_byte_16bpp_left
	.type	convblit_blend_mask_alpha_byte_16bpp_left, @function
convblit_blend_mask_alpha_byte_16bpp_left:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$204, %esp
	movl	12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	8(%ebp), %esi
	movl	32(%eax), %eax
	movl	%edx, %ebx
	movl	52(%edx), %edi
	movl	%eax, -168(%ebp)
	movl	36(%edx), %eax
	movb	%al, -88(%ebp)
	movl	%eax, %ecx
	shrl	$16, %eax
	movb	%al, -136(%ebp)
	movl	40(%edx), %eax
	shrl	$8, %ecx
	movl	20(%edx), %edx
	movb	%cl, -28(%ebp)
	movl	%ebx, %ecx
	movl	56(%ecx), %ecx
	movb	%al, -104(%ebp)
	shrl	$8, %eax
	movb	%al, -56(%ebp)
	movl	8(%esi), %eax
	movl	%ecx, -108(%ebp)
	subl	$1, %eax
	subl	16(%ebx), %eax
	movl	%edx, 16(%ebx)
	movl	%eax, 20(%ebx)
	movl	64(%ebx), %ebx
	movl	%ebx, %esi
	negl	%esi
	movl	%esi, -64(%ebp)
	movl	12(%ebp), %esi
	movl	28(%esi), %ecx
	movl	24(%esi), %esi
	movl	%esi, -140(%ebp)
	movl	12(%ebp), %esi
	movl	60(%esi), %esi
	movl	%esi, -60(%ebp)
	movl	12(%ebp), %esi
	movl	12(%esi), %esi
	testl	%esi, %esi
	movl	%esi, -164(%ebp)
	jle	.L638
	imull	%ebx, %eax
	movl	-108(%ebp), %esi
	imull	-168(%ebp), %ecx
	addl	-140(%ebp), %ecx
	leal	(%eax,%edx,2), %eax
	movzbl	-56(%ebp), %edx
	addl	-60(%ebp), %eax
	addl	%ecx, %esi
	movl	%eax, -156(%ebp)
	movl	12(%ebp), %eax
	shrb	$3, %dl
	movzbl	%dl, %edx
	movw	%dx, -150(%ebp)
	movzbl	-28(%ebp), %edx
	movl	8(%eax), %eax
	shrb	$3, %dl
	movzbl	%dl, %edx
	movl	%eax, -60(%ebp)
	movzbl	-104(%ebp), %eax
	movw	%dx, -158(%ebp)
	movzbl	-88(%ebp), %edx
	andl	$248, %eax
	sall	$8, %eax
	andw	$248, %dx
	orw	%ax, -150(%ebp)
	movzbl	-56(%ebp), %eax
	sall	$8, %edx
	movzwl	%dx, %ecx
	movl	%ecx, -144(%ebp)
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -150(%ebp)
	movzbl	-88(%ebp), %eax
	movw	%dx, -88(%ebp)
	andl	$248, %eax
	sall	$8, %eax
	orw	%ax, -158(%ebp)
	movzbl	-28(%ebp), %eax
	andl	$252, %eax
	sall	$3, %eax
	orw	%ax, -158(%ebp)
	movzbl	-28(%ebp), %eax
	andw	$252, %ax
	sall	$3, %eax
	movw	%ax, -108(%ebp)
	movzbl	-136(%ebp), %eax
	movzwl	-108(%ebp), %ebx
	shrb	$3, %al
	movzbl	%al, %eax
	movw	%ax, -104(%ebp)
	movzwl	%ax, %eax
	movl	%ebx, -140(%ebp)
	movl	%eax, -136(%ebp)
	movl	$0, -148(%ebp)
	.p2align 4,,7
	.p2align 3
.L645:
	movl	-60(%ebp), %ecx
	testl	%ecx, %ecx
	jle	.L639
	movl	-156(%ebp), %edx
	xorl	%eax, %eax
	jmp	.L644
	.p2align 4,,7
	.p2align 3
.L650:
	testl	%edi, %edi
	je	.L641
	movzwl	-150(%ebp), %ecx
	movw	%cx, (%edx)
.L641:
	addl	$1, %eax
	cmpl	-60(%ebp), %eax
	je	.L639
.L652:
	addl	-64(%ebp), %edx
.L644:
	movzbl	(%esi,%eax), %ecx
	testl	%ecx, %ecx
	je	.L650
	cmpl	$255, %ecx
	je	.L651
	testl	%edi, %edi
	je	.L643
	movl	$256, %ebx
	subl	%ecx, %ebx
	movl	12(%ebp), %ecx
	movl	%ebx, -28(%ebp)
	movl	48(%ecx), %ecx
	movl	%ecx, -172(%ebp)
	andl	$31, %ecx
	subl	-136(%ebp), %ecx
	imull	%ebx, %ecx
	movl	-172(%ebp), %ebx
	andl	$63488, %ebx
	subl	-144(%ebp), %ebx
	imull	-28(%ebp), %ebx
	shrl	$8, %ecx
	addw	-104(%ebp), %cx
	shrl	$8, %ebx
	addw	-88(%ebp), %bx
	andl	$31, %ecx
	andw	$-2048, %bx
	orl	%ebx, %ecx
	movl	-172(%ebp), %ebx
.L649:
	andl	$2016, %ebx
	addl	$1, %eax
	subl	-140(%ebp), %ebx
	imull	-28(%ebp), %ebx
	shrl	$8, %ebx
	addw	-108(%ebp), %bx
	andw	$2016, %bx
	orl	%ebx, %ecx
	cmpl	-60(%ebp), %eax
	movw	%cx, (%edx)
	jne	.L652
.L639:
	addl	$1, -148(%ebp)
	movl	-164(%ebp), %ebx
	cmpl	%ebx, -148(%ebp)
	je	.L638
	addl	-168(%ebp), %esi
	addl	$2, -156(%ebp)
	jmp	.L645
	.p2align 4,,7
	.p2align 3
.L643:
	movl	$256, %ebx
	subl	%ecx, %ebx
	movzwl	(%edx), %ecx
	movl	%ebx, -28(%ebp)
	movl	%ecx, -56(%ebp)
	andl	$31, %ecx
	subl	-136(%ebp), %ecx
	imull	%ebx, %ecx
	movl	-56(%ebp), %ebx
	andl	$63488, %ebx
	subl	-144(%ebp), %ebx
	imull	-28(%ebp), %ebx
	shrl	$8, %ecx
	addw	-104(%ebp), %cx
	shrl	$8, %ebx
	addw	-88(%ebp), %bx
	andl	$31, %ecx
	andw	$-2048, %bx
	orl	%ebx, %ecx
	movl	-56(%ebp), %ebx
	jmp	.L649
	.p2align 4,,7
	.p2align 3
.L651:
	movzwl	-158(%ebp), %ebx
	movw	%bx, (%edx)
	jmp	.L641
.L638:
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	8(%ebp), %esi
	movl	140(%esi), %edx
	testl	%edx, %edx
	je	.L647
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
	movl	%esi, (%esp)
	movl	%eax, 4(%esp)
	call	*%edx
.L647:
	addl	$204, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	convblit_blend_mask_alpha_byte_16bpp_left, .-convblit_blend_mask_alpha_byte_16bpp_left
	.ident	"GCC: (Ubuntu 4.4.1-4ubuntu8) 4.4.1"
	.section	.note.GNU-stack,"",@progbits
