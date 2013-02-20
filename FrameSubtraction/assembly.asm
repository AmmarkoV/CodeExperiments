	.file	"main.c"
	.text
	.globl	SubtractImages
	.type	SubtractImages, @function
SubtractImages:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, -52(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -24(%rbp)
	movl	-52(%rbp), %edx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L2
.L5:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %edx
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	jle	.L3
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	movl	%eax, %edx
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	movb	%dl, (%rax)
	jmp	.L4
.L3:
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	movb	%dl, (%rax)
.L4:
	addq	$1, -24(%rbp)
	addq	$1, -16(%rbp)
.L2:
	movq	-24(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jb	.L5
	movl	$1, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	SubtractImages, .-SubtractImages
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$1920, -28(%rbp)
	movl	$1080, -24(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, %edx
	imull	-24(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -16(%rbp)
	movl	-20(%rbp), %eax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -8(%rbp)
	movl	$0, -32(%rbp)
	movl	$0, -32(%rbp)
	jmp	.L8
.L9:
	movl	-20(%rbp), %edx
	movq	-16(%rbp), %rax
	movl	$123, %esi
	movq	%rax, %rdi
	call	memset
	movl	-20(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	$123, %esi
	movq	%rax, %rdi
	call	memset
	movl	-20(%rbp), %edx
	movq	-8(%rbp), %rcx
	movq	-16(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SubtractImages
	addl	$1, -32(%rbp)
.L8:
	cmpl	$999, -32(%rbp)
	jbe	.L9
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.7.2-2ubuntu1) 4.7.2"
	.section	.note.GNU-stack,"",@progbits
