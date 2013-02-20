	.file	"main.c"
	.text
	.p2align 4,,15
	.globl	SubtractImages
	.type	SubtractImages, @function
SubtractImages:
.LFB56:
	.cfi_startproc
	movl	%edx, %edx
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	addq	%rdi, %rdx
	cmpq	%rdx, %rdi
	jae	.L11
	leaq	16(%rsi), %rcx
	movq	%rdx, %r11
	leaq	16(%rdi), %r9
	subq	%rdi, %r11
	movq	%r11, %rax
	shrq	$4, %rax
	movq	%rax, %r10
	salq	$4, %r10
	cmpq	$15, %r11
	seta	%r8b
	cmpq	%rcx, %rdi
	setae	%cl
	cmpq	%r9, %rsi
	setae	%r9b
	orl	%r9d, %ecx
	testb	%cl, %r8b
	je	.L10
	testq	%r10, %r10
	je	.L10
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L4:
	vmovdqu	(%rdi,%rcx), %xmm1
	addq	$1, %r9
	vmovdqu	(%rsi,%rcx), %xmm0
	vpsubb	%xmm0, %xmm1, %xmm3
	vpsubb	%xmm1, %xmm0, %xmm2
	vpcmpgtb	%xmm0, %xmm1, %xmm0
	vpblendvb	%xmm0, %xmm3, %xmm2, %xmm0
	vmovdqu	%xmm0, (%rdi,%rcx)
	addq	$16, %rcx
	cmpq	%r9, %rax
	ja	.L4
	leaq	(%rdi,%r10), %rax
	cmpq	%r10, %r11
	leaq	(%rsi,%r10), %r8
	je	.L11
	.p2align 4,,10
	.p2align 3
.L12:
	movzbl	(%r8), %esi
	movzbl	(%rax), %edi
	movl	%esi, %ebx
	subl	%edi, %ebx
	movl	%edi, %ecx
	subl	%esi, %ecx
	movl	%ebx, %r9d
	cmpb	%sil, %dil
	cmovle	%r9d, %ecx
	addq	$1, %r8
	movb	%cl, (%rax)
	addq	$1, %rax
	cmpq	%rax, %rdx
	ja	.L12
.L11:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	movl	$1, %eax
	ret
.L10:
	.cfi_restore_state
	movq	%rsi, %r8
	movq	%rdi, %rax
	jmp	.L12
	.cfi_endproc
.LFE56:
	.size	SubtractImages, .-SubtractImages
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB57:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$6220800, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	call	malloc
	movl	$6220800, %edi
	movq	%rax, %r12
	call	malloc
	movl	$1000, %ebx
	movq	%rax, %rbp
	.p2align 4,,10
	.p2align 3
.L18:
	movl	$6220800, %edx
	movl	$123, %esi
	movq	%r12, %rdi
	call	memset
	movl	$6220800, %edx
	movl	$123, %esi
	movq	%rbp, %rdi
	call	memset
	subl	$1, %ebx
	jne	.L18
	popq	%rbx
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE57:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.7.2-2ubuntu1) 4.7.2"
	.section	.note.GNU-stack,"",@progbits
