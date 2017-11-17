	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 12
	.globl	_min
	.p2align	4, 0x90
_min:                                   ## @min
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp0:
	.cfi_def_cfa_offset 16
Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp2:
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -12(%rbp)
	movl	-4(%rbp), %edx
	movl	%edx, -16(%rbp)
	movl	-8(%rbp), %edx
	cmpl	-16(%rbp), %edx
	jge	LBB0_2
## BB#1:
	movl	-8(%rbp), %eax
	movl	%eax, -16(%rbp)
LBB0_2:
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	LBB0_4
## BB#3:
	movl	-12(%rbp), %eax
	movl	%eax, -16(%rbp)
LBB0_4:
	movl	-16(%rbp), %eax
	popq	%rbp
	retq
	.cfi_endproc

	.section	__DATA,__data
	.globl	_g                      ## @g
	.p2align	2
_g:
	.long	4                       ## 0x4


.subsections_via_symbols
