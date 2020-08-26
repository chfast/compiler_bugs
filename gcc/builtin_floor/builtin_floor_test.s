	.file	"builtin_floor_test.c"
	.text
	.p2align 4
	.globl	builtin_floorf
	.type	builtin_floorf, @function
builtin_floorf:
.LFB0:
	.cfi_startproc
	movss	.LC1(%rip), %xmm2
	movss	.LC0(%rip), %xmm4
	movaps	%xmm0, %xmm3
	movaps	%xmm0, %xmm1
	andps	%xmm2, %xmm3
	ucomiss	%xmm3, %xmm4
	jbe	.L2
	cvttss2sil	%xmm0, %eax
	pxor	%xmm3, %xmm3
	andnps	%xmm1, %xmm2
	cvtsi2ssl	%eax, %xmm3
	movaps	%xmm3, %xmm4
	cmpnless	%xmm0, %xmm4
	movss	.LC2(%rip), %xmm0
	andps	%xmm0, %xmm4
	subss	%xmm4, %xmm3
	movaps	%xmm3, %xmm0
	orps	%xmm2, %xmm0
.L2:
	ret
	.cfi_endproc
.LFE0:
	.size	builtin_floorf, .-builtin_floorf
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$1024, %edi
	call	fesetround
	movss	.LC3(%rip), %xmm0
	call	builtin_floorf
	movd	%xmm0, %eax
	testl	%eax, %eax
	sets	%al
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1258291200
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	2147483647
	.long	0
	.long	0
	.long	0
	.section	.rodata.cst4
	.align 4
.LC2:
	.long	1065353216
	.align 4
.LC3:
	.long	1048576000
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
