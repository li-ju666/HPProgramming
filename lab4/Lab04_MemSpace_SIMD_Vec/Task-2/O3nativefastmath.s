	.file	"Multigrid0.c"
	.text
	.p2align 4,,15
	.globl	alloc_matrix
	.type	alloc_matrix, @function
alloc_matrix:
.LFB52:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movslq	%edi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	0(,%rbp,8), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	call	malloc@PLT
	testl	%ebp, %ebp
	movq	%rax, %r13
	jle	.L5
	movq	%rax, %rbx
	leal	-1(%rbp), %eax
	leaq	8(%r13,%rax,8), %r12
	.p2align 4,,10
	.p2align 3
.L3:
	movl	$8, %esi
	movq	%rbp, %rdi
	addq	$8, %rbx
	call	calloc@PLT
	movq	%rax, -8(%rbx)
	cmpq	%r12, %rbx
	jne	.L3
.L5:
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	movq	%r13, %rax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE52:
	.size	alloc_matrix, .-alloc_matrix
	.p2align 4,,15
	.globl	dealloc_matrix
	.type	dealloc_matrix, @function
dealloc_matrix:
.LFB53:
	.cfi_startproc
	testl	%esi, %esi
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	jle	.L9
	leal	-1(%rsi), %eax
	movq	%rdi, %rbx
	leaq	8(%rdi,%rax,8), %rbp
	.p2align 4,,10
	.p2align 3
.L10:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%rbp, %rbx
	jne	.L10
.L9:
	popq	%rbx
	.cfi_def_cfa_offset 24
	movq	%r12, %rdi
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.cfi_endproc
.LFE53:
	.size	dealloc_matrix, .-dealloc_matrix
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"r"
.LC1:
	.string	"%lf\n"
	.text
	.p2align 4,,15
	.globl	read_data
	.type	read_data, @function
read_data:
.LFB54:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbp
	movq	%rsi, %rdi
	leaq	.LC0(%rip), %rsi
	movl	%edx, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	call	fopen@PLT
	testq	%rax, %rax
	je	.L19
	testl	%ebx, %ebx
	jle	.L18
	movq	%rax, %r12
	leal	-1(%rbx), %eax
	leaq	.LC1(%rip), %r13
	leaq	8(%rbp,%rax,8), %r15
	leaq	8(,%rax,8), %r14
	.p2align 4,,10
	.p2align 3
.L16:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L17:
	movq	0(%rbp), %rdx
	xorl	%eax, %eax
	movq	%r13, %rsi
	movq	%r12, %rdi
	addq	%rbx, %rdx
	addq	$8, %rbx
	call	__isoc99_fscanf@PLT
	cmpq	%rbx, %r14
	jne	.L17
	addq	$8, %rbp
	cmpq	%r15, %rbp
	jne	.L16
.L18:
	movl	$1, %eax
.L21:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L19:
	.cfi_restore_state
	movl	$-1, %eax
	jmp	.L21
	.cfi_endproc
.LFE54:
	.size	read_data, .-read_data
	.p2align 4,,15
	.globl	get_m
	.type	get_m, @function
get_m:
.LFB55:
	.cfi_startproc
	testl	%edi, %edi
	jle	.L29
	leal	-1(%rdi), %eax
	cmpl	$16, %eax
	jbe	.L30
	movl	%edi, %edx
	vmovdqa64	.LC2(%rip), %zmm0
	xorl	%eax, %eax
	shrl	$4, %edx
	.p2align 4,,10
	.p2align 3
.L26:
	addl	$1, %eax
	vpslld	$1, %zmm0, %zmm0
	cmpl	%edx, %eax
	jb	.L26
	vpxord	%zmm3, %zmm3, %zmm3
	movl	%edi, %ecx
	andl	$-16, %ecx
	cmpl	%ecx, %edi
	leal	1(%rcx), %edx
	vshufi32x4	$78, %zmm3, %zmm0, %zmm1
	vpmulld	%zmm1, %zmm0, %zmm2
	vmovdqa64	.LC3(%rip), %zmm0
	vpermi2d	%zmm3, %zmm2, %zmm0
	vpmulld	%zmm0, %zmm2, %zmm1
	vmovdqa64	.LC4(%rip), %zmm0
	vpermi2d	%zmm3, %zmm1, %zmm0
	vpmulld	%zmm0, %zmm1, %zmm0
	vmovdqa64	.LC5(%rip), %zmm1
	vpermi2d	%zmm3, %zmm0, %zmm1
	vpmulld	%zmm1, %zmm0, %zmm0
	vmovd	%xmm0, %eax
	je	.L34
	vzeroupper
.L25:
	leal	1(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L33
	leal	2(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L33
	leal	3(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L33
	leal	4(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L33
	leal	5(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L33
	leal	6(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L33
	leal	7(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L33
	leal	8(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L33
	leal	9(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L33
	leal	10(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L33
	leal	11(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L33
	leal	12(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L33
	leal	13(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L33
	leal	14(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L33
	leal	15(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L33
	addl	%eax, %eax
	addl	$16, %edx
	leal	(%rax,%rax), %ecx
	cmpl	%edx, %edi
	cmovge	%ecx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L29:
	movl	$1, %eax
.L33:
	rep ret
	.p2align 4,,10
	.p2align 3
.L30:
	movl	$1, %eax
	movl	$1, %edx
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L34:
	vzeroupper
	ret
	.cfi_endproc
.LFE55:
	.size	get_m, .-get_m
	.section	.rodata.str1.1
.LC7:
	.string	"\n"
	.text
	.p2align 4,,15
	.globl	fill_f
	.type	fill_f, @function
fill_f:
.LFB56:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	leaq	.LC7(%rip), %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	%esi, %ebx
	subq	$48, %rsp
	.cfi_def_cfa_offset 96
	vmovsd	%xmm0, 32(%rsp)
	call	puts@PLT
	testl	%ebx, %ebx
	jle	.L40
	vmovsd	32(%rsp), %xmm3
	leal	-1(%rbx), %ebp
	movl	$1, %r12d
	vpxord	%zmm0, %zmm0, %zmm0
	vmulsd	%xmm3, %xmm3, %xmm17
	addq	$2, %rbp
	vpxord	%zmm2, %zmm2, %zmm2
	vmovsd	%xmm17, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L37:
	vmulsd	%xmm0, %xmm2, %xmm0
	movq	-8(%r13,%r12,8), %r14
	movl	$1, %ebx
	vpxord	%zmm2, %zmm2, %zmm2
	vmulsd	40(%rsp), %xmm0, %xmm5
	vpxord	%zmm0, %zmm0, %zmm0
	vmovsd	%xmm5, 24(%rsp)
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L38:
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sd	%eax, %xmm1, %xmm1
	vmulsd	32(%rsp), %xmm1, %xmm1
	vmulsd	.LC8(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, 16(%rsp)
	call	sin@PLT
	vmovsd	16(%rsp), %xmm1
	vmovsd	%xmm0, 8(%rsp)
	vmulsd	.LC9(%rip), %xmm1, %xmm0
	call	sin@PLT
	vmovsd	8(%rsp), %xmm2
.L39:
	vmulsd	%xmm0, %xmm2, %xmm2
	movl	%ebx, %eax
	vmulsd	24(%rsp), %xmm2, %xmm2
	vmovsd	%xmm2, -8(%r14,%rbx,8)
	addq	$1, %rbx
	cmpq	%rbp, %rbx
	jne	.L38
	movl	%r12d, %eax
	addq	$1, %r12
	cmpq	%rbp, %r12
	je	.L40
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sd	%eax, %xmm1, %xmm1
	vmulsd	32(%rsp), %xmm1, %xmm1
	vmulsd	.LC8(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, 16(%rsp)
	call	sin@PLT
	vmovsd	16(%rsp), %xmm1
	vmovsd	%xmm0, 8(%rsp)
	vmulsd	.LC10(%rip), %xmm1, %xmm0
	call	sin@PLT
	vmovsd	8(%rsp), %xmm2
	jmp	.L37
	.p2align 4,,10
	.p2align 3
.L40:
	addq	$48, %rsp
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE56:
	.size	fill_f, .-fill_f
	.p2align 4,,15
	.globl	L1_norm
	.type	L1_norm, @function
L1_norm:
.LFB57:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L51
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-64, %rsp
	leal	-1(%rsi), %eax
	vmovq	.LC11(%rip), %xmm5
	pushq	-8(%r10)
	pushq	%rbp
	leaq	8(%rdi,%rax,8), %r11
	vpxord	%zmm0, %zmm0, %zmm0
	vmovapd	.LC12(%rip), %zmm3
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	vmovapd	%xmm5, %xmm4
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x70,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x78
	movq	%rax, %r9
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x68
	movl	$8, %r10d
	.p2align 4,,10
	.p2align 3
.L44:
	movq	(%rdi), %rcx
	movq	%rcx, %rax
	shrq	$3, %rax
	negq	%rax
	andl	$7, %eax
	leal	7(%rax), %edx
	cmpl	$8, %edx
	cmovb	%r10d, %edx
	cmpl	%r9d, %edx
	ja	.L52
	testl	%eax, %eax
	je	.L53
	vmovsd	(%rcx), %xmm1
	cmpl	$1, %eax
	vandpd	%xmm5, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	je	.L54
	vmovsd	8(%rcx), %xmm1
	cmpl	$2, %eax
	vandpd	%xmm5, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	je	.L55
	vmovsd	16(%rcx), %xmm1
	cmpl	$3, %eax
	vandpd	%xmm5, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	je	.L56
	vmovsd	24(%rcx), %xmm1
	cmpl	$4, %eax
	vandpd	%xmm5, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	je	.L57
	vmovsd	32(%rcx), %xmm1
	cmpl	$5, %eax
	vandpd	%xmm5, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	je	.L58
	vmovsd	40(%rcx), %xmm1
	cmpl	$7, %eax
	vandpd	%xmm5, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	jne	.L59
	vmovsd	48(%rcx), %xmm1
	movl	$7, %r8d
	vandpd	%xmm5, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
.L49:
	movl	%esi, %r12d
	vxorpd	%zmm1, %zmm1, %zmm1
	subl	%eax, %r12d
	leaq	(%rcx,%rax,8), %rdx
	xorl	%eax, %eax
	movl	%r12d, %ebx
	shrl	$3, %ebx
	.p2align 4,,10
	.p2align 3
.L46:
	vandpd	(%rdx), %zmm3, %zmm2
	addl	$1, %eax
	addq	$64, %rdx
	cmpl	%ebx, %eax
	vaddpd	%zmm2, %zmm1, %zmm1
	jb	.L46
	vshufi32x4	$78, %zmm1, %zmm1, %zmm2
	movl	%r12d, %edx
	andl	$-8, %edx
	cmpl	%edx, %r12d
	leal	(%rdx,%r8), %eax
	vaddpd	%zmm1, %zmm2, %zmm1
	vshufi32x4	$77, %zmm1, %zmm1, %zmm2
	vaddpd	%zmm1, %zmm2, %zmm2
	vpshufd	$254, %zmm2, %zmm1
	vaddpd	%zmm2, %zmm1, %zmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	je	.L45
.L48:
	movslq	%eax, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	leal	1(%rax), %edx
	vandpd	%xmm4, %xmm1, %xmm1
	cmpl	%edx, %esi
	vaddsd	%xmm1, %xmm0, %xmm0
	jle	.L45
	movslq	%edx, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	leal	2(%rax), %edx
	vandpd	%xmm4, %xmm1, %xmm1
	cmpl	%edx, %esi
	vaddsd	%xmm1, %xmm0, %xmm0
	jle	.L45
	movslq	%edx, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	leal	3(%rax), %edx
	vandpd	%xmm4, %xmm1, %xmm1
	cmpl	%edx, %esi
	vaddsd	%xmm1, %xmm0, %xmm0
	jle	.L45
	movslq	%edx, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	leal	4(%rax), %edx
	vandpd	%xmm4, %xmm1, %xmm1
	cmpl	%edx, %esi
	vaddsd	%xmm1, %xmm0, %xmm0
	jle	.L45
	movslq	%edx, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	leal	5(%rax), %edx
	vandpd	%xmm4, %xmm1, %xmm1
	cmpl	%edx, %esi
	vaddsd	%xmm1, %xmm0, %xmm0
	jle	.L45
	movslq	%edx, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	leal	6(%rax), %edx
	vandpd	%xmm4, %xmm1, %xmm1
	cmpl	%edx, %esi
	vaddsd	%xmm1, %xmm0, %xmm0
	jle	.L45
	movslq	%edx, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	leal	7(%rax), %edx
	vandpd	%xmm4, %xmm1, %xmm1
	cmpl	%edx, %esi
	vaddsd	%xmm1, %xmm0, %xmm0
	jle	.L45
	movslq	%edx, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	leal	8(%rax), %edx
	vandpd	%xmm4, %xmm1, %xmm1
	cmpl	%edx, %esi
	vaddsd	%xmm1, %xmm0, %xmm0
	jle	.L45
	movslq	%edx, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	leal	9(%rax), %edx
	vandpd	%xmm4, %xmm1, %xmm1
	cmpl	%edx, %esi
	vaddsd	%xmm1, %xmm0, %xmm0
	jle	.L45
	movslq	%edx, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	leal	10(%rax), %edx
	vandpd	%xmm4, %xmm1, %xmm1
	cmpl	%edx, %esi
	vaddsd	%xmm1, %xmm0, %xmm0
	jle	.L45
	movslq	%edx, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	leal	11(%rax), %edx
	vandpd	%xmm4, %xmm1, %xmm1
	cmpl	%edx, %esi
	vaddsd	%xmm1, %xmm0, %xmm0
	jle	.L45
	movslq	%edx, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	leal	12(%rax), %edx
	vandpd	%xmm4, %xmm1, %xmm1
	cmpl	%edx, %esi
	vaddsd	%xmm1, %xmm0, %xmm0
	jle	.L45
	movslq	%edx, %rdx
	addl	$13, %eax
	vmovsd	(%rcx,%rdx,8), %xmm1
	cmpl	%eax, %esi
	vandpd	%xmm4, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	jle	.L45
	cltq
	vmovsd	(%rcx,%rax,8), %xmm1
	vandpd	%xmm4, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L45:
	addq	$8, %rdi
	cmpq	%r11, %rdi
	jne	.L44
	vzeroupper
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L54:
	.cfi_restore_state
	movl	$1, %r8d
	jmp	.L49
	.p2align 4,,10
	.p2align 3
.L53:
	xorl	%r8d, %r8d
	jmp	.L49
	.p2align 4,,10
	.p2align 3
.L55:
	movl	$2, %r8d
	jmp	.L49
	.p2align 4,,10
	.p2align 3
.L52:
	xorl	%eax, %eax
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L56:
	movl	$3, %r8d
	jmp	.L49
	.p2align 4,,10
	.p2align 3
.L57:
	movl	$4, %r8d
	jmp	.L49
	.p2align 4,,10
	.p2align 3
.L58:
	movl	$5, %r8d
	jmp	.L49
.L59:
	movl	$6, %r8d
	jmp	.L49
.L51:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	vpxord	%zmm0, %zmm0, %zmm0
	ret
	.cfi_endproc
.LFE57:
	.size	L1_norm, .-L1_norm
	.p2align 4,,15
	.globl	L2_norm
	.type	L2_norm, @function
L2_norm:
.LFB58:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L93
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-64, %rsp
	leal	-1(%rsi), %eax
	vpxord	%zmm0, %zmm0, %zmm0
	pushq	-8(%r10)
	pushq	%rbp
	leaq	8(%rdi,%rax,8), %r11
	movq	%rax, %r9
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x70,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x78
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x68
	movl	$8, %r10d
	.p2align 4,,10
	.p2align 3
.L74:
	movq	(%rdi), %rcx
	movq	%rcx, %rax
	shrq	$3, %rax
	negq	%rax
	andl	$7, %eax
	leal	7(%rax), %edx
	cmpl	$8, %edx
	cmovb	%r10d, %edx
	cmpl	%r9d, %edx
	ja	.L78
	testl	%eax, %eax
	je	.L79
	vmovsd	(%rcx), %xmm1
	cmpl	$1, %eax
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	je	.L80
	vmovsd	8(%rcx), %xmm1
	cmpl	$2, %eax
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	je	.L81
	vmovsd	16(%rcx), %xmm1
	cmpl	$3, %eax
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	je	.L82
	vmovsd	24(%rcx), %xmm1
	cmpl	$4, %eax
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	je	.L83
	vmovsd	32(%rcx), %xmm1
	cmpl	$5, %eax
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	je	.L84
	vmovsd	40(%rcx), %xmm1
	cmpl	$7, %eax
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	jne	.L85
	vmovsd	48(%rcx), %xmm1
	movl	$7, %r8d
	vfmadd231sd	%xmm1, %xmm1, %xmm0
.L76:
	movl	%esi, %r12d
	vxorpd	%zmm2, %zmm2, %zmm2
	subl	%eax, %r12d
	leaq	(%rcx,%rax,8), %rdx
	xorl	%eax, %eax
	movl	%r12d, %ebx
	shrl	$3, %ebx
	.p2align 4,,10
	.p2align 3
.L72:
	vmovapd	(%rdx), %zmm1
	addl	$1, %eax
	addq	$64, %rdx
	cmpl	%ebx, %eax
	vfmadd231pd	%zmm1, %zmm1, %zmm2
	jb	.L72
	vshufi32x4	$78, %zmm2, %zmm2, %zmm1
	movl	%r12d, %edx
	andl	$-8, %edx
	cmpl	%edx, %r12d
	leal	(%rdx,%r8), %eax
	vaddpd	%zmm2, %zmm1, %zmm2
	vshufi32x4	$77, %zmm2, %zmm2, %zmm1
	vaddpd	%zmm2, %zmm1, %zmm2
	vpshufd	$254, %zmm2, %zmm1
	vaddpd	%zmm2, %zmm1, %zmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	je	.L71
.L75:
	movslq	%eax, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	leal	1(%rax), %edx
	cmpl	%edx, %esi
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	jle	.L71
	movslq	%edx, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	leal	2(%rax), %edx
	cmpl	%edx, %esi
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	jle	.L71
	movslq	%edx, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	leal	3(%rax), %edx
	cmpl	%edx, %esi
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	jle	.L71
	movslq	%edx, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	leal	4(%rax), %edx
	cmpl	%edx, %esi
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	jle	.L71
	movslq	%edx, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	leal	5(%rax), %edx
	cmpl	%edx, %esi
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	jle	.L71
	movslq	%edx, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	leal	6(%rax), %edx
	cmpl	%edx, %esi
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	jle	.L71
	movslq	%edx, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	leal	7(%rax), %edx
	cmpl	%edx, %esi
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	jle	.L71
	movslq	%edx, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	leal	8(%rax), %edx
	cmpl	%edx, %esi
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	jle	.L71
	movslq	%edx, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	leal	9(%rax), %edx
	cmpl	%edx, %esi
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	jle	.L71
	movslq	%edx, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	leal	10(%rax), %edx
	cmpl	%edx, %esi
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	jle	.L71
	movslq	%edx, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	leal	11(%rax), %edx
	cmpl	%edx, %esi
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	jle	.L71
	movslq	%edx, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	leal	12(%rax), %edx
	cmpl	%edx, %esi
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	jle	.L71
	movslq	%edx, %rdx
	addl	$13, %eax
	vmovsd	(%rcx,%rdx,8), %xmm1
	cmpl	%eax, %esi
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	jle	.L71
	cltq
	vmovsd	(%rcx,%rax,8), %xmm1
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	.p2align 4,,10
	.p2align 3
.L71:
	addq	$8, %rdi
	cmpq	%r11, %rdi
	jne	.L74
	vsqrtsd	%xmm0, %xmm0, %xmm0
	vzeroupper
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L80:
	.cfi_restore_state
	movl	$1, %r8d
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L79:
	xorl	%r8d, %r8d
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L81:
	movl	$2, %r8d
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L78:
	xorl	%eax, %eax
	jmp	.L75
	.p2align 4,,10
	.p2align 3
.L82:
	movl	$3, %r8d
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L83:
	movl	$4, %r8d
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L84:
	movl	$5, %r8d
	jmp	.L76
.L85:
	movl	$6, %r8d
	jmp	.L76
.L93:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	vpxord	%zmm0, %zmm0, %zmm0
	ret
	.cfi_endproc
.LFE58:
	.size	L2_norm, .-L2_norm
	.p2align 4,,15
	.globl	Max_norm
	.type	Max_norm, @function
Max_norm:
.LFB59:
	.cfi_startproc
	movq	(%rdi), %rax
	testl	%esi, %esi
	vmovsd	(%rax), %xmm0
	jle	.L116
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-64, %rsp
	leal	-1(%rsi), %eax
	vmovq	.LC11(%rip), %xmm4
	pushq	-8(%r10)
	pushq	%rbp
	leaq	8(%rdi,%rax,8), %r11
	vmovapd	.LC12(%rip), %zmm2
	vmovapd	%xmm4, %xmm3
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x70,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x78
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x68
	movq	%rax, %r9
	movl	$8, %r10d
	.p2align 4,,10
	.p2align 3
.L96:
	movq	(%rdi), %rcx
	movq	%rcx, %rax
	shrq	$3, %rax
	negq	%rax
	andl	$7, %eax
	leal	7(%rax), %edx
	cmpl	$8, %edx
	cmovb	%r10d, %edx
	cmpl	%r9d, %edx
	ja	.L103
	testl	%eax, %eax
	je	.L104
	vmovsd	(%rcx), %xmm1
	cmpl	$1, %eax
	vandpd	%xmm4, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
	je	.L105
	vmovsd	8(%rcx), %xmm1
	cmpl	$2, %eax
	vandpd	%xmm4, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
	je	.L106
	vmovsd	16(%rcx), %xmm1
	cmpl	$3, %eax
	vandpd	%xmm4, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
	je	.L107
	vmovsd	24(%rcx), %xmm1
	cmpl	$4, %eax
	vandpd	%xmm4, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
	je	.L108
	vmovsd	32(%rcx), %xmm1
	cmpl	$5, %eax
	vandpd	%xmm4, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
	je	.L109
	vmovsd	40(%rcx), %xmm1
	cmpl	$7, %eax
	vandpd	%xmm4, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
	jne	.L110
	vmovsd	48(%rcx), %xmm1
	movl	$7, %r8d
	vandpd	%xmm4, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
.L101:
	movl	%esi, %r12d
	vbroadcastsd	%xmm0, %zmm0
	leaq	(%rcx,%rax,8), %rdx
	subl	%eax, %r12d
	xorl	%eax, %eax
	movl	%r12d, %ebx
	shrl	$3, %ebx
	.p2align 4,,10
	.p2align 3
.L98:
	vandpd	(%rdx), %zmm2, %zmm1
	addl	$1, %eax
	addq	$64, %rdx
	cmpl	%ebx, %eax
	vmaxpd	%zmm1, %zmm0, %zmm0
	jb	.L98
	vshufi32x4	$78, %zmm0, %zmm0, %zmm1
	movl	%r12d, %eax
	andl	$-8, %eax
	addl	%eax, %r8d
	cmpl	%eax, %r12d
	vmaxpd	%zmm0, %zmm1, %zmm0
	vshufi32x4	$77, %zmm0, %zmm0, %zmm1
	vmaxpd	%zmm0, %zmm1, %zmm1
	vpshufd	$254, %zmm1, %zmm0
	vmaxpd	%zmm1, %zmm0, %zmm0
	je	.L97
.L100:
	movslq	%r8d, %rax
	vmovsd	(%rcx,%rax,8), %xmm1
	leal	1(%r8), %eax
	vandpd	%xmm3, %xmm1, %xmm1
	cmpl	%eax, %esi
	vmaxsd	%xmm1, %xmm0, %xmm0
	jle	.L97
	cltq
	vmovsd	(%rcx,%rax,8), %xmm1
	leal	2(%r8), %eax
	vandpd	%xmm3, %xmm1, %xmm1
	cmpl	%eax, %esi
	vmaxsd	%xmm1, %xmm0, %xmm0
	jle	.L97
	cltq
	vmovsd	(%rcx,%rax,8), %xmm1
	leal	3(%r8), %eax
	vandpd	%xmm3, %xmm1, %xmm1
	cmpl	%eax, %esi
	vmaxsd	%xmm1, %xmm0, %xmm0
	jle	.L97
	cltq
	vmovsd	(%rcx,%rax,8), %xmm1
	leal	4(%r8), %eax
	vandpd	%xmm3, %xmm1, %xmm1
	cmpl	%eax, %esi
	vmaxsd	%xmm1, %xmm0, %xmm0
	jle	.L97
	cltq
	vmovsd	(%rcx,%rax,8), %xmm1
	leal	5(%r8), %eax
	vandpd	%xmm3, %xmm1, %xmm1
	cmpl	%eax, %esi
	vmaxsd	%xmm1, %xmm0, %xmm0
	jle	.L97
	cltq
	vmovsd	(%rcx,%rax,8), %xmm1
	leal	6(%r8), %eax
	vandpd	%xmm3, %xmm1, %xmm1
	cmpl	%eax, %esi
	vmaxsd	%xmm1, %xmm0, %xmm0
	jle	.L97
	cltq
	vmovsd	(%rcx,%rax,8), %xmm1
	leal	7(%r8), %eax
	vandpd	%xmm3, %xmm1, %xmm1
	cmpl	%eax, %esi
	vmaxsd	%xmm1, %xmm0, %xmm0
	jle	.L97
	cltq
	vmovsd	(%rcx,%rax,8), %xmm1
	leal	8(%r8), %eax
	vandpd	%xmm3, %xmm1, %xmm1
	cmpl	%eax, %esi
	vmaxsd	%xmm1, %xmm0, %xmm0
	jle	.L97
	cltq
	vmovsd	(%rcx,%rax,8), %xmm1
	leal	9(%r8), %eax
	vandpd	%xmm3, %xmm1, %xmm1
	cmpl	%eax, %esi
	vmaxsd	%xmm1, %xmm0, %xmm0
	jle	.L97
	cltq
	vmovsd	(%rcx,%rax,8), %xmm1
	leal	10(%r8), %eax
	vandpd	%xmm3, %xmm1, %xmm1
	cmpl	%eax, %esi
	vmaxsd	%xmm1, %xmm0, %xmm0
	jle	.L97
	cltq
	vmovsd	(%rcx,%rax,8), %xmm1
	leal	11(%r8), %eax
	vandpd	%xmm3, %xmm1, %xmm1
	cmpl	%eax, %esi
	vmaxsd	%xmm1, %xmm0, %xmm0
	jle	.L97
	cltq
	vmovsd	(%rcx,%rax,8), %xmm1
	leal	12(%r8), %eax
	vandpd	%xmm3, %xmm1, %xmm1
	cmpl	%eax, %esi
	vmaxsd	%xmm1, %xmm0, %xmm0
	jle	.L97
	cltq
	addl	$13, %r8d
	vmovsd	(%rcx,%rax,8), %xmm1
	cmpl	%r8d, %esi
	vandpd	%xmm3, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
	jle	.L97
	movslq	%r8d, %r8
	vmovsd	(%rcx,%r8,8), %xmm1
	vandpd	%xmm3, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L97:
	addq	$8, %rdi
	cmpq	%r11, %rdi
	jne	.L96
	vzeroupper
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L105:
	.cfi_restore_state
	movl	$1, %r8d
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L104:
	xorl	%r8d, %r8d
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L106:
	movl	$2, %r8d
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L103:
	xorl	%r8d, %r8d
	jmp	.L100
	.p2align 4,,10
	.p2align 3
.L107:
	movl	$3, %r8d
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L108:
	movl	$4, %r8d
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L109:
	movl	$5, %r8d
	jmp	.L101
.L110:
	movl	$6, %r8d
	jmp	.L101
.L116:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	rep ret
	.cfi_endproc
.LFE59:
	.size	Max_norm, .-Max_norm
	.p2align 4,,15
	.globl	L_def
	.type	L_def, @function
L_def:
.LFB60:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-64, %rsp
	leal	-1(%rcx), %eax
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$8, %rsp
	cmpl	$1, %eax
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movq	%rdx, -120(%rbp)
	movl	%eax, -128(%rbp)
	jle	.L149
	leal	-3(%rcx), %eax
	vmovsd	.LC13(%rip), %xmm4
	vmovapd	.LC14(%rip), %zmm1
	movl	$8, %r12d
	movl	%eax, -124(%rbp)
	leaq	16(,%rax,8), %rax
	vmovapd	%xmm4, %xmm2
	vmovapd	%xmm4, %xmm3
	movq	%rax, -96(%rbp)
	leal	-2(%rcx), %eax
	movl	%eax, -52(%rbp)
	.p2align 4,,10
	.p2align 3
.L129:
	movq	-104(%rbp), %rax
	movq	(%rax,%r12), %rdx
	movq	-8(%rax,%r12), %rsi
	movq	8(%rax,%r12), %rdi
	movq	-120(%rbp), %rax
	movq	(%rax,%r12), %r9
	movq	-112(%rbp), %rax
	movq	(%rax,%r12), %r8
	leaq	8(%rsi), %rax
	leaq	72(%r8), %r11
	leaq	8(%r8), %r10
	cmpq	%rax, %r11
	leaq	72(%rsi), %rax
	setbe	%bl
	cmpq	%rax, %r10
	setnb	%al
	orl	%eax, %ebx
	leaq	80(%rdx), %rax
	cmpq	%rax, %r10
	setnb	%cl
	cmpq	%r11, %rdx
	setnb	%al
	orl	%ecx, %eax
	andl	%ebx, %eax
	cmpl	$9, -52(%rbp)
	leaq	72(%rdi), %rbx
	seta	%cl
	andl	%ecx, %eax
	leaq	8(%rdi), %rcx
	cmpq	%rcx, %r11
	setbe	%cl
	cmpq	%rbx, %r10
	setnb	%bl
	orl	%ebx, %ecx
	testb	%cl, %al
	je	.L130
	leaq	8(%r9), %rax
	leaq	72(%r9), %rcx
	cmpq	%rax, %r11
	setbe	%al
	cmpq	%rcx, %r10
	setnb	%cl
	orb	%cl, %al
	je	.L130
	leaq	8(%rdx), %rax
	shrq	$3, %rax
	negq	%rax
	andl	$7, %eax
	leal	7(%rax), %ecx
	cmpl	-124(%rbp), %ecx
	ja	.L131
	testl	%eax, %eax
	je	.L132
	vmovsd	8(%rdx), %xmm0
	cmpl	$1, %eax
	vfmsub213sd	8(%rsi), %xmm3, %xmm0
	vsubsd	8(%rdi), %xmm0, %xmm0
	vsubsd	(%rdx), %xmm0, %xmm0
	vsubsd	16(%rdx), %xmm0, %xmm0
	vsubsd	8(%r9), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%r8)
	je	.L133
	vmovsd	16(%rdx), %xmm0
	cmpl	$2, %eax
	vfmsub213sd	16(%rsi), %xmm3, %xmm0
	vsubsd	16(%rdi), %xmm0, %xmm0
	vsubsd	8(%rdx), %xmm0, %xmm0
	vsubsd	24(%rdx), %xmm0, %xmm0
	vsubsd	16(%r9), %xmm0, %xmm0
	vmovsd	%xmm0, 16(%r8)
	je	.L134
	vmovsd	24(%rdx), %xmm0
	cmpl	$3, %eax
	vfmsub213sd	24(%rsi), %xmm3, %xmm0
	vsubsd	24(%rdi), %xmm0, %xmm0
	vsubsd	16(%rdx), %xmm0, %xmm0
	vsubsd	32(%rdx), %xmm0, %xmm0
	vsubsd	24(%r9), %xmm0, %xmm0
	vmovsd	%xmm0, 24(%r8)
	je	.L135
	vmovsd	32(%rdx), %xmm0
	cmpl	$4, %eax
	vfmsub213sd	32(%rsi), %xmm3, %xmm0
	vsubsd	32(%rdi), %xmm0, %xmm0
	vsubsd	24(%rdx), %xmm0, %xmm0
	vsubsd	40(%rdx), %xmm0, %xmm0
	vsubsd	32(%r9), %xmm0, %xmm0
	vmovsd	%xmm0, 32(%r8)
	je	.L136
	vmovsd	40(%rdx), %xmm0
	cmpl	$5, %eax
	vfmsub213sd	40(%rsi), %xmm3, %xmm0
	vsubsd	40(%rdi), %xmm0, %xmm0
	vsubsd	32(%rdx), %xmm0, %xmm0
	vsubsd	48(%rdx), %xmm0, %xmm0
	vsubsd	40(%r9), %xmm0, %xmm0
	vmovsd	%xmm0, 40(%r8)
	je	.L137
	vmovsd	48(%rdx), %xmm0
	cmpl	$7, %eax
	vfmsub213sd	48(%rsi), %xmm3, %xmm0
	vsubsd	48(%rdi), %xmm0, %xmm0
	vsubsd	40(%rdx), %xmm0, %xmm0
	vsubsd	56(%rdx), %xmm0, %xmm0
	vsubsd	48(%r9), %xmm0, %xmm0
	vmovsd	%xmm0, 48(%r8)
	jne	.L138
	vmovsd	56(%rdx), %xmm0
	movl	$8, -64(%rbp)
	vfmsub213sd	56(%rsi), %xmm3, %xmm0
	vsubsd	56(%rdi), %xmm0, %xmm0
	vsubsd	48(%rdx), %xmm0, %xmm0
	vsubsd	64(%rdx), %xmm0, %xmm0
	vsubsd	56(%r9), %xmm0, %xmm0
	vmovsd	%xmm0, 56(%r8)
.L123:
	movl	-52(%rbp), %ebx
	leaq	8(,%rax,8), %r10
	movq	%rdx, -80(%rbp)
	movq	%rsi, -88(%rbp)
	xorl	%ecx, %ecx
	leaq	(%rdx,%r10), %r15
	leaq	(%rsi,%r10), %r14
	leaq	(%rdi,%r10), %r13
	subl	%eax, %ebx
	leaq	-8(%rdx,%r10), %rax
	leaq	(%r9,%r10), %r11
	movl	%ebx, -56(%rbp)
	shrl	$3, %ebx
	movl	%ebx, -60(%rbp)
	movq	%rax, -72(%rbp)
	leaq	8(%rdx,%r10), %rbx
	movl	-60(%rbp), %esi
	movq	-72(%rbp), %rdx
	addq	%r8, %r10
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L125:
	vmovapd	(%r15,%rax), %zmm0
	addl	$1, %ecx
	vfmsub213pd	(%r14,%rax), %zmm1, %zmm0
	vsubpd	0(%r13,%rax), %zmm0, %zmm0
	vsubpd	(%rdx,%rax), %zmm0, %zmm0
	vsubpd	(%rbx,%rax), %zmm0, %zmm0
	vsubpd	(%r11,%rax), %zmm0, %zmm0
	vmovupd	%zmm0, (%r10,%rax)
	addq	$64, %rax
	cmpl	%ecx, %esi
	ja	.L125
	movl	-56(%rbp), %ebx
	movl	-64(%rbp), %ecx
	movq	-80(%rbp), %rdx
	movq	-88(%rbp), %rsi
	movl	%ebx, %eax
	andl	$-8, %eax
	addl	%eax, %ecx
	cmpl	%eax, %ebx
	je	.L128
.L122:
	movl	-128(%rbp), %eax
	movslq	%ecx, %rcx
	.p2align 4,,10
	.p2align 3
.L127:
	vmovsd	(%rdx,%rcx,8), %xmm0
	vfmsub213sd	(%rsi,%rcx,8), %xmm2, %xmm0
	vsubsd	(%rdi,%rcx,8), %xmm0, %xmm0
	vsubsd	-8(%rdx,%rcx,8), %xmm0, %xmm0
	vsubsd	8(%rdx,%rcx,8), %xmm0, %xmm0
	vsubsd	(%r9,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%r8,%rcx,8)
	addq	$1, %rcx
	cmpl	%ecx, %eax
	jg	.L127
.L128:
	addq	$8, %r12
	cmpq	%r12, -96(%rbp)
	jne	.L129
.L151:
	vzeroupper
.L149:
	addq	$8, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L130:
	.cfi_restore_state
	movq	-96(%rbp), %rcx
	movl	$8, %eax
	.p2align 4,,10
	.p2align 3
.L121:
	vmovsd	(%rdx,%rax), %xmm0
	vfmsub213sd	(%rsi,%rax), %xmm4, %xmm0
	vsubsd	(%rdi,%rax), %xmm0, %xmm0
	vsubsd	-8(%rdx,%rax), %xmm0, %xmm0
	vsubsd	8(%rdx,%rax), %xmm0, %xmm0
	vsubsd	(%r9,%rax), %xmm0, %xmm0
	vmovsd	%xmm0, (%r8,%rax)
	addq	$8, %rax
	cmpq	%rcx, %rax
	jne	.L121
	addq	$8, %r12
	cmpq	%r12, -96(%rbp)
	jne	.L129
	jmp	.L151
	.p2align 4,,10
	.p2align 3
.L133:
	movl	$2, -64(%rbp)
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L134:
	movl	$3, -64(%rbp)
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L132:
	movl	$1, -64(%rbp)
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L131:
	movl	$1, %ecx
	jmp	.L122
	.p2align 4,,10
	.p2align 3
.L135:
	movl	$4, -64(%rbp)
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L136:
	movl	$5, -64(%rbp)
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L137:
	movl	$6, -64(%rbp)
	jmp	.L123
.L138:
	movl	$7, -64(%rbp)
	jmp	.L123
	.cfi_endproc
.LFE60:
	.size	L_def, .-L_def
	.p2align 4,,15
	.globl	GS_update
	.type	GS_update, @function
GS_update:
.LFB61:
	.cfi_startproc
	cmpl	$2, %edx
	jle	.L160
	leal	-3(%rdx), %eax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%ecx, %ecx
	vmovsd	.LC15(%rip), %xmm3
	leaq	8(,%rax,8), %rbx
	leaq	16(,%rax,8), %r11
	.p2align 4,,10
	.p2align 3
.L155:
	movq	8(%rdi,%rcx), %rdx
	movq	(%rdi,%rcx), %r10
	movl	$8, %eax
	movq	16(%rdi,%rcx), %r9
	movq	8(%rsi,%rcx), %r8
	vmovsd	(%rdx), %xmm2
	.p2align 4,,10
	.p2align 3
.L154:
	vmovsd	(%r10,%rax), %xmm1
	vmovsd	8(%rdx,%rax), %xmm0
	vaddsd	(%r9,%rax), %xmm1, %xmm1
	vaddsd	(%r8,%rax), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vaddsd	%xmm2, %xmm0, %xmm2
	vmulsd	%xmm3, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%rax, %r11
	jne	.L154
	addq	$8, %rcx
	cmpq	%rcx, %rbx
	jne	.L155
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L160:
	.cfi_restore 3
	rep ret
	.cfi_endproc
.LFE61:
	.size	GS_update, .-GS_update
	.p2align 4,,15
	.globl	set_BC
	.type	set_BC, @function
set_BC:
.LFB62:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L167
	movslq	%esi, %rax
	movq	(%rdi), %r10
	salq	$3, %rax
	leaq	-8(%rax), %r9
	movq	-8(%rdi,%rax), %r8
	leal	-1(%rsi), %eax
	leaq	8(,%rax,8), %rcx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L165:
	movq	(%rdi,%rax), %rdx
	movq	$0x000000000, (%r10,%rax)
	movq	$0x000000000, (%r8,%rax)
	addq	$8, %rax
	cmpq	%rcx, %rax
	movq	$0x000000000, (%rdx)
	movq	$0x000000000, (%rdx,%r9)
	jne	.L165
.L167:
	rep ret
	.cfi_endproc
.LFE62:
	.size	set_BC, .-set_BC
	.p2align 4,,15
	.globl	res_R
	.type	res_R, @function
res_R:
.LFB63:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L187
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-64, %rsp
	leal	-1(%rdx), %eax
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movq	%rax, %r13
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	salq	$4, %rax
	movslq	%edx, %r12
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	%r13d, %ebx
	leaq	16(%rdi,%rax), %r15
	movq	%r12, %r14
	movl	%r13d, %r9d
	andl	$-8, %ebx
	addq	$16, %rax
	vmovsd	.LC13(%rip), %xmm1
	vmovdqa64	.LC16(%rip), %zmm3
	salq	$4, %r14
	salq	$3, %r12
	vmovapd	.LC14(%rip), %zmm2
	shrl	$3, %r9d
	movl	%ebx, -52(%rbp)
	movq	%rax, -64(%rbp)
	.p2align 4,,10
	.p2align 3
.L170:
	movq	(%rsi), %rcx
	movq	(%rdi), %rax
	leaq	(%rcx,%r12), %r8
	cmpq	%r8, %rax
	leaq	(%rax,%r14), %r8
	setnb	%r10b
	cmpq	%r8, %rcx
	setnb	%r8b
	orb	%r8b, %r10b
	je	.L177
	cmpl	$8, %edx
	jbe	.L177
	cmpl	$7, %r13d
	jbe	.L178
	movq	%rax, %r8
	movq	%rcx, %r11
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L174:
	vmovupd	(%r8), %zmm0
	vmovdqa64	%zmm3, %zmm4
	addl	$1, %r10d
	subq	$-128, %r8
	addq	$64, %r11
	vpermi2pd	-64(%r8), %zmm0, %zmm4
	vmulpd	%zmm2, %zmm4, %zmm0
	vmovupd	%zmm0, -64(%r11)
	cmpl	%r10d, %r9d
	ja	.L174
	movl	-52(%rbp), %r8d
.L173:
	leal	(%r8,%r8), %r10d
	movslq	%r8d, %rbx
	movslq	%r10d, %r10
	vmulsd	(%rax,%r10,8), %xmm1, %xmm0
	leaq	0(,%r10,8), %r11
	leal	1(%r8), %r10d
	cmpl	%edx, %r10d
	vmovsd	%xmm0, (%rcx,%rbx,8)
	jge	.L171
	vmulsd	16(%rax,%r11), %xmm1, %xmm0
	movslq	%r10d, %r10
	vmovsd	%xmm0, (%rcx,%r10,8)
	leal	2(%r8), %r10d
	cmpl	%r10d, %edx
	jle	.L171
	vmulsd	32(%rax,%r11), %xmm1, %xmm0
	movslq	%r10d, %r10
	vmovsd	%xmm0, (%rcx,%r10,8)
	leal	3(%r8), %r10d
	cmpl	%r10d, %edx
	jle	.L171
	vmulsd	48(%rax,%r11), %xmm1, %xmm0
	movslq	%r10d, %r10
	vmovsd	%xmm0, (%rcx,%r10,8)
	leal	4(%r8), %r10d
	cmpl	%r10d, %edx
	jle	.L171
	vmulsd	64(%rax,%r11), %xmm1, %xmm0
	movslq	%r10d, %r10
	vmovsd	%xmm0, (%rcx,%r10,8)
	leal	5(%r8), %r10d
	cmpl	%r10d, %edx
	jle	.L171
	vmulsd	80(%rax,%r11), %xmm1, %xmm0
	movslq	%r10d, %r10
	vmovsd	%xmm0, (%rcx,%r10,8)
	leal	6(%r8), %r10d
	cmpl	%r10d, %edx
	jle	.L171
	vmulsd	96(%rax,%r11), %xmm1, %xmm0
	addl	$7, %r8d
	movslq	%r10d, %r10
	cmpl	%r8d, %edx
	vmovsd	%xmm0, (%rcx,%r10,8)
	jle	.L171
	vmulsd	112(%rax,%r11), %xmm1, %xmm0
	movslq	%r8d, %r8
	vmovsd	%xmm0, (%rcx,%r8,8)
.L171:
	addq	$16, %rdi
	addq	$8, %rsi
	cmpq	%r15, %rdi
	jne	.L170
	vzeroupper
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L177:
	.cfi_restore_state
	movq	-64(%rbp), %rbx
	leaq	(%rax,%rbx), %r8
	.p2align 4,,10
	.p2align 3
.L172:
	vmulsd	(%rax), %xmm1, %xmm0
	addq	$16, %rax
	addq	$8, %rcx
	vmovsd	%xmm0, -8(%rcx)
	cmpq	%r8, %rax
	jne	.L172
	jmp	.L171
	.p2align 4,,10
	.p2align 3
.L178:
	xorl	%r8d, %r8d
	jmp	.L173
.L187:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	rep ret
	.cfi_endproc
.LFE63:
	.size	res_R, .-res_R
	.p2align 4,,15
	.globl	prol_P
	.type	prol_P, @function
prol_P:
.LFB64:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-64, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movl	%ecx, %r13d
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, %rbx
	subq	$64, %rsp
	testl	%edx, %edx
	movq	%rsi, -64(%rbp)
	jle	.L191
	leal	-1(%rdx), %eax
	movq	%rdi, %r15
	leaq	8(%rdi,%rax,8), %r14
	leaq	8(,%rax,8), %r12
	.p2align 4,,10
	.p2align 3
.L192:
	movq	(%r15), %rdi
	xorl	%esi, %esi
	movq	%r12, %rdx
	addq	$8, %r15
	call	memset@PLT
	cmpq	%r14, %r15
	jne	.L192
.L191:
	leal	-1(%r13), %r11d
	testl	%r11d, %r11d
	jle	.L212
	leal	-2(%r13), %eax
	vmovsd	.LC21(%rip), %xmm10
	vmovsd	.LC15(%rip), %xmm11
	movl	%r11d, %r12d
	movl	%eax, -84(%rbp)
	leaq	8(,%rax,8), %rax
	vmovapd	.LC17(%rip), %zmm5
	vmovapd	%xmm10, %xmm7
	vmovdqa64	.LC18(%rip), %zmm4
	movq	%rax, -56(%rbp)
	movl	%r11d, %eax
	vmovdqa64	.LC19(%rip), %zmm3
	leaq	8(,%rax,8), %rsi
	salq	$4, %rax
	vmovapd	.LC20(%rip), %zmm8
	movq	%rax, -80(%rbp)
	movl	%r11d, %eax
	shrl	$3, %r12d
	andl	$-8, %eax
	vmovapd	%xmm11, %xmm9
	movq	%rsi, -72(%rbp)
	movl	%eax, -88(%rbp)
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L200:
	movq	-64(%rbp), %rcx
	movq	(%rbx,%r10,2), %rdx
	movq	-72(%rbp), %rdi
	movq	-80(%rbp), %r15
	movq	(%rcx,%r10), %rax
	movq	8(%rcx,%r10), %rsi
	movq	8(%rbx,%r10,2), %rcx
	leaq	(%rdx,%r15), %r9
	leaq	(%rax,%rdi), %r13
	leaq	(%rsi,%rdi), %r14
	addq	%rcx, %r15
	cmpq	%r15, %rax
	setnb	%r8b
	cmpq	%r13, %rcx
	setnb	%dil
	orl	%edi, %r8d
	cmpq	%r9, %rax
	setnb	%dil
	cmpq	%r13, %rdx
	setnb	%r13b
	orl	%r13d, %edi
	andl	%edi, %r8d
	cmpl	$7, %r11d
	seta	%dil
	andl	%edi, %r8d
	cmpq	%r14, %rdx
	setnb	%r13b
	cmpq	%r9, %rsi
	leaq	128(%rdx), %r9
	setnb	%dil
	orl	%edi, %r13d
	leaq	128(%rcx), %rdi
	andl	%r13d, %r8d
	cmpq	%rdi, %rdx
	setnb	%dil
	cmpq	%r9, %rcx
	setnb	%r9b
	orl	%r9d, %edi
	testb	%dil, %r8b
	je	.L194
	cmpq	%r15, %rsi
	setnb	%dil
	cmpq	%r14, %rcx
	setnb	%r8b
	orb	%r8b, %dil
	je	.L194
	cmpl	$6, -84(%rbp)
	jbe	.L201
	movq	%rax, %rdi
	movq	%rsi, %r8
	movq	%rdx, %r13
	movq	%rcx, %r9
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L196:
	vmovupd	(%rdi), %zmm0
	vmovdqa64	%zmm4, %zmm6
	vmovdqa64	%zmm3, %zmm16
	vmovdqa64	%zmm3, %zmm17
	addl	$1, %r14d
	addq	$64, %rdi
	vaddpd	-56(%rdi), %zmm0, %zmm2
	addq	$64, %r8
	subq	$-128, %r13
	subq	$-128, %r9
	vaddpd	-64(%r8), %zmm0, %zmm1
	vmulpd	%zmm5, %zmm2, %zmm2
	vmulpd	%zmm5, %zmm1, %zmm1
	vpermi2pd	%zmm2, %zmm0, %zmm6
	vpermi2pd	%zmm2, %zmm0, %zmm16
	vmovdqa64	%zmm4, %zmm2
	vmovupd	%zmm6, -128(%r13)
	vmovupd	%zmm16, -64(%r13)
	vmovupd	-56(%rdi), %zmm0
	vaddpd	-64(%rdi), %zmm0, %zmm0
	vaddpd	-64(%r8), %zmm0, %zmm0
	vaddpd	-56(%r8), %zmm0, %zmm0
	vmulpd	%zmm8, %zmm0, %zmm0
	vpermi2pd	%zmm0, %zmm1, %zmm2
	vpermi2pd	%zmm0, %zmm1, %zmm17
	vmovupd	%zmm2, -128(%r9)
	vmovupd	%zmm17, -64(%r9)
	cmpl	%r14d, %r12d
	ja	.L196
	movl	-88(%rbp), %edi
	cmpl	%edi, %r11d
	je	.L199
.L195:
	movslq	%edi, %r9
	leal	(%rdi,%rdi), %r8d
	salq	$3, %r9
	leaq	(%rax,%r9), %r13
	movslq	%r8d, %r8
	leaq	(%rsi,%r9), %r14
	leaq	8(%rax,%r9), %r15
	vmovsd	0(%r13), %xmm0
	vmovsd	%xmm0, (%rdx,%r8,8)
	vmovsd	0(%r13), %xmm0
	vaddsd	(%r14), %xmm0, %xmm0
	vmulsd	%xmm7, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
	addq	$1, %r8
	vmovsd	0(%r13), %xmm0
	vaddsd	(%r15), %xmm0, %xmm0
	vmulsd	%xmm7, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%r8,8)
	vmovsd	8(%rsi,%r9), %xmm0
	vaddsd	(%r15), %xmm0, %xmm1
	vmovsd	(%r14), %xmm0
	vaddsd	0(%r13), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vmulsd	%xmm9, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
	leal	1(%rdi), %r8d
	cmpl	%r11d, %r8d
	jge	.L199
	movslq	%r8d, %r9
	addl	%r8d, %r8d
	salq	$3, %r9
	movslq	%r8d, %r8
	leaq	(%rax,%r9), %r13
	leaq	(%rsi,%r9), %r14
	leaq	8(%rax,%r9), %r15
	vmovsd	0(%r13), %xmm0
	vmovsd	%xmm0, (%rdx,%r8,8)
	vmovsd	0(%r13), %xmm0
	vaddsd	(%r14), %xmm0, %xmm0
	vmulsd	%xmm7, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
	addq	$1, %r8
	vmovsd	0(%r13), %xmm0
	vaddsd	(%r15), %xmm0, %xmm0
	vmulsd	%xmm7, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%r8,8)
	vmovsd	8(%rsi,%r9), %xmm0
	vaddsd	(%r15), %xmm0, %xmm1
	vmovsd	0(%r13), %xmm0
	vaddsd	(%r14), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vmulsd	%xmm9, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
	leal	2(%rdi), %r8d
	cmpl	%r8d, %r11d
	jle	.L199
	movslq	%r8d, %r9
	addl	%r8d, %r8d
	salq	$3, %r9
	movslq	%r8d, %r8
	leaq	(%rax,%r9), %r13
	leaq	(%rsi,%r9), %r14
	leaq	8(%rax,%r9), %r15
	vmovsd	0(%r13), %xmm0
	vmovsd	%xmm0, (%rdx,%r8,8)
	vmovsd	0(%r13), %xmm0
	vaddsd	(%r14), %xmm0, %xmm0
	vmulsd	%xmm7, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
	addq	$1, %r8
	vmovsd	0(%r13), %xmm0
	vaddsd	(%r15), %xmm0, %xmm0
	vmulsd	%xmm7, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%r8,8)
	vmovsd	8(%rsi,%r9), %xmm0
	vaddsd	(%r15), %xmm0, %xmm1
	vmovsd	0(%r13), %xmm0
	vaddsd	(%r14), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vmulsd	%xmm9, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
	leal	3(%rdi), %r8d
	cmpl	%r8d, %r11d
	jle	.L199
	movslq	%r8d, %r9
	addl	%r8d, %r8d
	salq	$3, %r9
	movslq	%r8d, %r8
	leaq	(%rax,%r9), %r13
	leaq	(%rsi,%r9), %r14
	leaq	8(%rax,%r9), %r15
	vmovsd	0(%r13), %xmm0
	vmovsd	%xmm0, (%rdx,%r8,8)
	vmovsd	0(%r13), %xmm0
	vaddsd	(%r14), %xmm0, %xmm0
	vmulsd	%xmm7, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
	addq	$1, %r8
	vmovsd	0(%r13), %xmm0
	vaddsd	(%r15), %xmm0, %xmm0
	vmulsd	%xmm7, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%r8,8)
	vmovsd	8(%rsi,%r9), %xmm0
	vaddsd	(%r15), %xmm0, %xmm1
	vmovsd	0(%r13), %xmm0
	vaddsd	(%r14), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vmulsd	%xmm9, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
	leal	4(%rdi), %r8d
	cmpl	%r8d, %r11d
	jle	.L199
	movslq	%r8d, %r9
	addl	%r8d, %r8d
	salq	$3, %r9
	movslq	%r8d, %r8
	leaq	(%rax,%r9), %r13
	leaq	(%rsi,%r9), %r14
	leaq	8(%rax,%r9), %r15
	vmovsd	0(%r13), %xmm0
	vmovsd	%xmm0, (%rdx,%r8,8)
	vmovsd	0(%r13), %xmm0
	vaddsd	(%r14), %xmm0, %xmm0
	vmulsd	%xmm7, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
	addq	$1, %r8
	vmovsd	0(%r13), %xmm0
	vaddsd	(%r15), %xmm0, %xmm0
	vmulsd	%xmm7, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%r8,8)
	vmovsd	8(%rsi,%r9), %xmm0
	vaddsd	(%r15), %xmm0, %xmm1
	vmovsd	0(%r13), %xmm0
	vaddsd	(%r14), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vmulsd	%xmm9, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
	leal	5(%rdi), %r8d
	cmpl	%r8d, %r11d
	jle	.L199
	movslq	%r8d, %r9
	addl	%r8d, %r8d
	addl	$6, %edi
	salq	$3, %r9
	movslq	%r8d, %r8
	leaq	(%rax,%r9), %r13
	leaq	(%rsi,%r9), %r14
	leaq	8(%rax,%r9), %r15
	vmovsd	0(%r13), %xmm0
	vmovsd	%xmm0, (%rdx,%r8,8)
	vmovsd	0(%r13), %xmm0
	vaddsd	(%r14), %xmm0, %xmm0
	vmulsd	%xmm7, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
	addq	$1, %r8
	cmpl	%edi, %r11d
	vmovsd	0(%r13), %xmm0
	vaddsd	(%r15), %xmm0, %xmm0
	vmulsd	%xmm7, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%r8,8)
	vmovsd	8(%rsi,%r9), %xmm0
	vaddsd	(%r15), %xmm0, %xmm1
	vmovsd	0(%r13), %xmm0
	vaddsd	(%r14), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vmulsd	%xmm9, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
	jle	.L199
	movslq	%edi, %r8
	addl	%edi, %edi
	salq	$3, %r8
	movslq	%edi, %rdi
	leaq	(%rax,%r8), %r9
	leaq	(%rsi,%r8), %r13
	leaq	8(%rax,%r8), %rax
	vmovsd	(%r9), %xmm0
	vmovsd	%xmm0, (%rdx,%rdi,8)
	vmovsd	(%r9), %xmm0
	vaddsd	0(%r13), %xmm0, %xmm0
	vmulsd	%xmm7, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%rdi,8)
	addq	$1, %rdi
	vmovsd	(%r9), %xmm0
	vaddsd	(%rax), %xmm0, %xmm0
	vmulsd	%xmm7, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rdi,8)
	vmovsd	8(%rsi,%r8), %xmm0
	vaddsd	(%rax), %xmm0, %xmm1
	vmovsd	(%r9), %xmm0
	vaddsd	0(%r13), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vmulsd	%xmm9, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%rdi,8)
.L199:
	addq	$8, %r10
	cmpq	-56(%rbp), %r10
	jne	.L200
	vzeroupper
.L212:
	addq	$64, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L194:
	.cfi_restore_state
	movq	-56(%rbp), %r8
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L198:
	vmovsd	(%rax), %xmm0
	addq	$8, %rax
	vmovsd	%xmm0, (%rdx,%rdi,2)
	vmovsd	(%rsi,%rdi), %xmm0
	vaddsd	-8(%rax), %xmm0, %xmm0
	vmulsd	%xmm10, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%rdi,2)
	vmovsd	(%rax), %xmm0
	vaddsd	-8(%rax), %xmm0, %xmm0
	vmulsd	%xmm10, %xmm0, %xmm0
	vmovsd	%xmm0, 8(%rdx,%rdi,2)
	vmovsd	-8(%rax), %xmm0
	vaddsd	(%rax), %xmm0, %xmm1
	vmovsd	(%rsi,%rdi), %xmm0
	vaddsd	8(%rsi,%rdi), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vmulsd	%xmm11, %xmm0, %xmm0
	vmovsd	%xmm0, 8(%rcx,%rdi,2)
	addq	$8, %rdi
	cmpq	%r8, %rdi
	jne	.L198
	jmp	.L199
	.p2align 4,,10
	.p2align 3
.L201:
	xorl	%edi, %edi
	jmp	.L195
	.cfi_endproc
.LFE64:
	.size	prol_P, .-prol_P
	.p2align 4,,15
	.globl	multigrid_vcycle
	.type	multigrid_vcycle, @function
multigrid_vcycle:
.LFB51:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	16(%rsp), %r13
	.cfi_def_cfa 13, 0
	andq	$-64, %rsp
	pushq	-8(%r13)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	.cfi_escape 0xf,0x3,0x76,0x68,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	pushq	%r12
	pushq	%rbx
	subq	$392, %rsp
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	testl	%edi, %edi
	jle	.L272
	leal	-1(%rdi), %eax
	cmpl	$16, %eax
	movl	%eax, -100(%rbp)
	jbe	.L273
	movl	%edi, %ecx
	vmovdqa64	.LC2(%rip), %zmm2
	xorl	%eax, %eax
	shrl	$4, %ecx
	.p2align 4,,10
	.p2align 3
.L217:
	addl	$1, %eax
	vpslld	$1, %zmm2, %zmm2
	cmpl	%eax, %ecx
	ja	.L217
	vpxord	%zmm4, %zmm4, %zmm4
	movl	%edi, %ecx
	andl	$-16, %ecx
	cmpl	%edi, %ecx
	leal	1(%rcx), %eax
	vshufi32x4	$78, %zmm4, %zmm2, %zmm3
	vpmulld	%zmm2, %zmm3, %zmm2
	vmovdqa64	.LC3(%rip), %zmm3
	vpermi2d	%zmm4, %zmm2, %zmm3
	vpmulld	%zmm2, %zmm3, %zmm3
	vmovdqa64	.LC4(%rip), %zmm2
	vpermi2d	%zmm4, %zmm3, %zmm2
	vpmulld	%zmm3, %zmm2, %zmm3
	vmovdqa64	.LC5(%rip), %zmm2
	vpermi2d	%zmm4, %zmm3, %zmm2
	vpmulld	%zmm3, %zmm2, %zmm2
	vmovd	%xmm2, -52(%rbp)
	je	.L218
.L216:
	leal	1(%rax), %ecx
	sall	-52(%rbp)
	movl	-52(%rbp), %ebx
	cmpl	%ecx, %edi
	jl	.L218
	leal	2(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L218
	leal	3(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L218
	leal	4(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L218
	leal	5(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L218
	leal	6(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L218
	leal	7(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L218
	leal	8(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L218
	leal	9(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L218
	leal	10(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L218
	leal	11(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L218
	leal	12(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L218
	leal	13(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L218
	leal	14(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L218
	leal	15(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L218
	addl	%ebx, %ebx
	addl	$16, %eax
	leal	(%rbx,%rbx), %ecx
	cmpl	%eax, %edi
	cmovl	%ebx, %ecx
	movl	%ecx, -52(%rbp)
	.p2align 4,,10
	.p2align 3
.L218:
	movl	-52(%rbp), %eax
	cmpl	$1, %edi
	leal	1(%rax), %r14d
	jle	.L328
	leal	-2(%rdi), %eax
	cmpl	$16, %eax
	jbe	.L274
	movl	-100(%rbp), %ecx
	vmovdqa64	.LC2(%rip), %zmm2
	xorl	%eax, %eax
	shrl	$4, %ecx
	.p2align 4,,10
	.p2align 3
.L220:
	addl	$1, %eax
	vpslld	$1, %zmm2, %zmm2
	cmpl	%eax, %ecx
	ja	.L220
	vpxord	%zmm4, %zmm4, %zmm4
	movl	-100(%rbp), %ebx
	vshufi32x4	$78, %zmm4, %zmm2, %zmm3
	movl	%ebx, %r9d
	andl	$-16, %r9d
	cmpl	%ebx, %r9d
	leal	1(%r9), %ecx
	vpmulld	%zmm2, %zmm3, %zmm2
	vmovdqa64	.LC3(%rip), %zmm3
	vpermi2d	%zmm4, %zmm2, %zmm3
	vpmulld	%zmm2, %zmm3, %zmm3
	vmovdqa64	.LC4(%rip), %zmm2
	vpermi2d	%zmm4, %zmm3, %zmm2
	vpmulld	%zmm3, %zmm2, %zmm3
	vmovdqa64	.LC5(%rip), %zmm2
	vpermi2d	%zmm4, %zmm3, %zmm2
	vpmulld	%zmm3, %zmm2, %zmm2
	vmovd	%xmm2, %eax
	je	.L221
.L219:
	leal	1(%rcx), %r9d
	addl	%eax, %eax
	cmpl	%r9d, %edi
	jle	.L221
	leal	2(%rcx), %r9d
	addl	%eax, %eax
	cmpl	%r9d, %edi
	jle	.L221
	leal	3(%rcx), %r9d
	addl	%eax, %eax
	cmpl	%r9d, %edi
	jle	.L221
	leal	4(%rcx), %r9d
	addl	%eax, %eax
	cmpl	%r9d, %edi
	jle	.L221
	leal	5(%rcx), %r9d
	addl	%eax, %eax
	cmpl	%r9d, %edi
	jle	.L221
	leal	6(%rcx), %r9d
	addl	%eax, %eax
	cmpl	%r9d, %edi
	jle	.L221
	leal	7(%rcx), %r9d
	addl	%eax, %eax
	cmpl	%r9d, %edi
	jle	.L221
	leal	8(%rcx), %r9d
	addl	%eax, %eax
	cmpl	%r9d, %edi
	jle	.L221
	leal	9(%rcx), %r9d
	addl	%eax, %eax
	cmpl	%r9d, %edi
	jle	.L221
	leal	10(%rcx), %r9d
	addl	%eax, %eax
	cmpl	%r9d, %edi
	jle	.L221
	leal	11(%rcx), %r9d
	addl	%eax, %eax
	cmpl	%r9d, %edi
	jle	.L221
	leal	12(%rcx), %r9d
	addl	%eax, %eax
	cmpl	%r9d, %edi
	jle	.L221
	leal	13(%rcx), %r9d
	addl	%eax, %eax
	cmpl	%r9d, %edi
	jle	.L221
	leal	14(%rcx), %r9d
	addl	%eax, %eax
	cmpl	%r9d, %edi
	jle	.L221
	leal	15(%rcx), %r9d
	addl	%eax, %eax
	cmpl	%r9d, %edi
	jle	.L221
	addl	%eax, %eax
	addl	$16, %ecx
	leal	(%rax,%rax), %r9d
	cmpl	%ecx, %edi
	cmovg	%r9d, %eax
	.p2align 4,,10
	.p2align 3
.L221:
	addl	$1, %eax
	movl	%eax, -72(%rbp)
	vzeroupper
.L222:
	movslq	%r14d, %r12
	leal	-1(%r14), %ebx
	vmovsd	%xmm1, -312(%rbp)
	leaq	0(,%r12,8), %rax
	vmovsd	%xmm0, -368(%rbp)
	movq	%rdx, -88(%rbp)
	movq	%rsi, %r15
	movq	%rax, %rdi
	movq	%rax, -128(%rbp)
	call	malloc@PLT
	movl	%ebx, -56(%rbp)
	movq	%rbx, -144(%rbp)
	leaq	8(,%rbx,8), %rbx
	movq	%rax, -80(%rbp)
	movq	%rax, -424(%rbp)
	movq	%rax, %r13
	movq	%rbx, -112(%rbp)
	addq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L224:
	movl	$8, %esi
	movq	%r12, %rdi
	addq	$8, %r13
	call	calloc@PLT
	movq	%rax, -8(%r13)
	cmpq	%rbx, %r13
	jne	.L224
	movslq	-72(%rbp), %rbx
	movq	%r13, -360(%rbp)
	leaq	0(,%rbx,8), %rax
	movq	%rax, %rdi
	movq	%rax, -120(%rbp)
	call	malloc@PLT
	leal	-1(%rbx), %esi
	movq	%r12, -152(%rbp)
	movq	%rax, -96(%rbp)
	movq	%rax, -376(%rbp)
	movq	%rax, %r12
	leaq	8(,%rsi,8), %r13
	movl	%esi, -68(%rbp)
	movq	%rsi, -136(%rbp)
	movq	%r13, -64(%rbp)
	addq	%rax, %r13
	.p2align 4,,10
	.p2align 3
.L225:
	movl	$8, %esi
	movq	%rbx, %rdi
	addq	$8, %r12
	call	calloc@PLT
	movq	%rax, -8(%r12)
	cmpq	%r13, %r12
	jne	.L225
	movq	-128(%rbp), %rdi
	movq	%r12, -416(%rbp)
	movq	-152(%rbp), %r12
	call	malloc@PLT
	movq	-112(%rbp), %r13
	movq	%rax, -176(%rbp)
	movq	%rbx, -112(%rbp)
	movq	%rax, -392(%rbp)
	movq	%rax, %rbx
	addq	%rax, %r13
	.p2align 4,,10
	.p2align 3
.L226:
	movl	$8, %esi
	movq	%r12, %rdi
	addq	$8, %rbx
	call	calloc@PLT
	movq	%rax, -8(%rbx)
	cmpq	%r13, %rbx
	jne	.L226
	movq	-120(%rbp), %rdi
	movq	%rbx, -408(%rbp)
	movq	-112(%rbp), %rbx
	call	malloc@PLT
	movq	-64(%rbp), %r12
	movq	%rax, -168(%rbp)
	movq	%rax, %r13
	movq	%rax, -384(%rbp)
	addq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L227:
	movl	$8, %esi
	movq	%rbx, %rdi
	addq	$8, %r13
	call	calloc@PLT
	movq	%rax, -8(%r13)
	cmpq	%r12, %r13
	jne	.L227
	vmovsd	.LC22(%rip), %xmm0
	movl	-52(%rbp), %eax
	vmovsd	.LC13(%rip), %xmm4
	movq	%r13, -400(%rbp)
	vdivsd	-312(%rbp), %xmm0, %xmm18
	vmovdqa64	.LC16(%rip), %zmm6
	subl	$2, %eax
	vmovapd	.LC14(%rip), %zmm5
	leaq	8(,%rax,8), %rsi
	leaq	16(,%rax,8), %r12
	movq	-136(%rbp), %rax
	movq	%rsi, -120(%rbp)
	movq	-80(%rbp), %rsi
	salq	$4, %rax
	movq	%rax, -352(%rbp)
	leaq	16(%rsi,%rax), %rax
	movq	%rax, -64(%rbp)
	movq	%rbx, %rax
	salq	$4, %rax
	movq	%rax, -336(%rbp)
	leaq	0(,%rbx,8), %rax
	movq	%rax, -328(%rbp)
	movl	-68(%rbp), %eax
	movl	%eax, %r8d
	andl	$-8, %eax
	movl	%eax, -104(%rbp)
	movq	-144(%rbp), %rax
	shrl	$3, %r8d
	vmovsd	.LC15(%rip), %xmm3
	movl	%r8d, %r13d
	leaq	8(,%rax,8), %rax
	vmovsd	%xmm18, -320(%rbp)
	movq	%rax, -344(%rbp)
.L228:
	xorl	%ecx, %ecx
	cmpl	$1, -52(%rbp)
	je	.L265
	movq	-120(%rbp), %r9
	movq	-88(%rbp), %r10
	.p2align 4,,10
	.p2align 3
.L230:
	movq	8(%r15,%rcx), %rdx
	movq	(%r15,%rcx), %r8
	movl	$8, %eax
	movq	16(%r15,%rcx), %rdi
	movq	8(%r10,%rcx), %rsi
	vmovsd	(%rdx), %xmm0
	.p2align 4,,10
	.p2align 3
.L229:
	vmovsd	8(%rdx,%rax), %xmm1
	vaddsd	(%rsi,%rax), %xmm1, %xmm2
	vmovsd	(%r8,%rax), %xmm1
	vaddsd	(%rdi,%rax), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm2, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%r12, %rax
	jne	.L229
	addq	$8, %rcx
	cmpq	%r9, %rcx
	jne	.L230
.L265:
	movq	-80(%rbp), %rbx
	movq	-88(%rbp), %rdx
	movl	%r14d, %ecx
	movq	%r15, %rdi
	vmovapd	%zmm5, -304(%rbp)
	vmovdqa64	%zmm6, -240(%rbp)
	movq	%rbx, %rsi
	vmovsd	%xmm3, -160(%rbp)
	vmovsd	%xmm4, -152(%rbp)
	vzeroupper
	call	L_def
	movq	%rbx, %r8
	movslq	-104(%rbp), %rbx
	movq	-352(%rbp), %rax
	movl	%r14d, -128(%rbp)
	movq	%r12, -136(%rbp)
	movq	%r15, -144(%rbp)
	movq	-96(%rbp), %r9
	movl	-72(%rbp), %r14d
	leal	(%rbx,%rbx), %r10d
	movq	-328(%rbp), %r12
	movq	-336(%rbp), %r15
	addq	$16, %rax
	leal	1(%rbx), %r11d
	vmovdqa64	-240(%rbp), %zmm6
	movslq	%r10d, %r10
	vmovsd	-152(%rbp), %xmm4
	vmovsd	-160(%rbp), %xmm3
	salq	$3, %r10
	vmovapd	-304(%rbp), %zmm5
	movq	%rax, -112(%rbp)
	.p2align 4,,10
	.p2align 3
.L231:
	movq	(%r9), %rdi
	movq	(%r8), %rsi
	leaq	(%rdi,%r12), %rax
	cmpq	%rax, %rsi
	leaq	(%rsi,%r15), %rax
	setnb	%dl
	cmpq	%rax, %rdi
	setnb	%al
	orb	%al, %dl
	je	.L240
	cmpl	$8, %r14d
	jbe	.L240
	cmpl	$7, -68(%rbp)
	jbe	.L234
	movq	%rdi, %rcx
	movq	%rsi, %rax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L235:
	vmovupd	(%rax), %zmm0
	vmovdqa64	%zmm6, %zmm16
	addl	$1, %edx
	addq	$64, %rcx
	subq	$-128, %rax
	vpermi2pd	-64(%rax), %zmm0, %zmm16
	vmulpd	%zmm5, %zmm16, %zmm0
	vmovupd	%zmm0, -64(%rcx)
	cmpl	%edx, %r13d
	ja	.L235
	vmulsd	(%rsi,%r10), %xmm4, %xmm0
	cmpl	%r11d, %r14d
	movq	%r10, %rdx
	movl	%r11d, %eax
	vmovsd	%xmm0, (%rdi,%rbx,8)
	jle	.L232
.L269:
	vmulsd	16(%rsi,%rdx), %xmm4, %xmm0
	movslq	%eax, %rcx
	vmovsd	%xmm0, (%rdi,%rcx,8)
	leal	1(%rax), %ecx
	cmpl	%ecx, %r14d
	jle	.L232
	vmulsd	32(%rsi,%rdx), %xmm4, %xmm0
	movslq	%ecx, %rcx
	vmovsd	%xmm0, (%rdi,%rcx,8)
	leal	2(%rax), %ecx
	cmpl	%ecx, %r14d
	jle	.L232
	vmulsd	48(%rsi,%rdx), %xmm4, %xmm0
	movslq	%ecx, %rcx
	vmovsd	%xmm0, (%rdi,%rcx,8)
	leal	3(%rax), %ecx
	cmpl	%ecx, %r14d
	jle	.L232
	vmulsd	64(%rsi,%rdx), %xmm4, %xmm0
	movslq	%ecx, %rcx
	vmovsd	%xmm0, (%rdi,%rcx,8)
	leal	4(%rax), %ecx
	cmpl	%ecx, %r14d
	jle	.L232
	vmulsd	80(%rsi,%rdx), %xmm4, %xmm0
	movslq	%ecx, %rcx
	vmovsd	%xmm0, (%rdi,%rcx,8)
	leal	5(%rax), %ecx
	cmpl	%ecx, %r14d
	jle	.L232
	vmulsd	96(%rsi,%rdx), %xmm4, %xmm0
	addl	$6, %eax
	movslq	%ecx, %rcx
	cmpl	%eax, %r14d
	vmovsd	%xmm0, (%rdi,%rcx,8)
	jle	.L232
	vmulsd	112(%rsi,%rdx), %xmm4, %xmm0
	cltq
	vmovsd	%xmm0, (%rdi,%rax,8)
.L232:
	addq	$16, %r8
	addq	$8, %r9
	cmpq	-64(%rbp), %r8
	jne	.L231
	movq	-168(%rbp), %rbx
	movl	-128(%rbp), %r14d
	vmovapd	%zmm5, -304(%rbp)
	movq	-136(%rbp), %r12
	movq	-144(%rbp), %r15
	vmovdqa64	%zmm6, -240(%rbp)
	movq	-96(%rbp), %rdx
	vmovsd	%xmm3, -160(%rbp)
	movl	-100(%rbp), %edi
	movq	%rbx, %rsi
	vmovsd	%xmm4, -152(%rbp)
	vmovsd	-312(%rbp), %xmm1
	vmovsd	-368(%rbp), %xmm0
	vzeroupper
	call	multigrid_vcycle
	movq	%rbx, %rsi
	movq	-176(%rbp), %rbx
	movl	-72(%rbp), %ecx
	movl	%r14d, %edx
	movq	%rbx, %rdi
	call	prol_P
	movl	%r13d, -112(%rbp)
	movq	-344(%rbp), %r13
	xorl	%r10d, %r10d
	vmovsd	-152(%rbp), %xmm4
	movq	%r12, -128(%rbp)
	vmovsd	-160(%rbp), %xmm3
	movq	%rbx, %r12
	vmovdqa64	-240(%rbp), %zmm6
	vmovapd	-304(%rbp), %zmm5
	.p2align 4,,10
	.p2align 3
.L241:
	movq	(%r12,%r10), %rdi
	movq	(%r15,%r10), %rcx
	leaq	64(%rdi), %rax
	cmpq	%rax, %rcx
	leaq	64(%rcx), %rax
	setnb	%dl
	cmpq	%rax, %rdi
	setnb	%al
	orb	%al, %dl
	je	.L292
	cmpl	$11, %r14d
	jbe	.L292
	movq	%rcx, %rdx
	shrq	$3, %rdx
	negq	%rdx
	andl	$7, %edx
	leal	7(%rdx), %eax
	cmpl	-56(%rbp), %eax
	ja	.L245
	testl	%edx, %edx
	je	.L276
	vmovsd	(%rcx), %xmm0
	cmpl	$1, %edx
	vsubsd	(%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx)
	je	.L277
	vmovsd	8(%rcx), %xmm0
	cmpl	$2, %edx
	vsubsd	8(%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%rcx)
	je	.L278
	vmovsd	16(%rcx), %xmm0
	cmpl	$3, %edx
	vsubsd	16(%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, 16(%rcx)
	je	.L279
	vmovsd	24(%rcx), %xmm0
	cmpl	$4, %edx
	vsubsd	24(%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, 24(%rcx)
	je	.L280
	vmovsd	32(%rcx), %xmm0
	cmpl	$5, %edx
	vsubsd	32(%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, 32(%rcx)
	je	.L281
	vmovsd	40(%rcx), %xmm0
	cmpl	$7, %edx
	vsubsd	40(%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, 40(%rcx)
	jne	.L282
	vmovsd	48(%rcx), %xmm0
	movl	$7, %r9d
	vsubsd	48(%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, 48(%rcx)
.L246:
	movl	%r14d, %ebx
	xorl	%eax, %eax
	xorl	%esi, %esi
	subl	%edx, %ebx
	salq	$3, %rdx
	movl	%ebx, %r11d
	leaq	(%rcx,%rdx), %r8
	addq	%rdi, %rdx
	shrl	$3, %r11d
	.p2align 4,,10
	.p2align 3
.L248:
	vmovapd	(%r8,%rax), %zmm0
	addl	$1, %esi
	vsubpd	(%rdx,%rax), %zmm0, %zmm0
	vmovapd	%zmm0, (%r8,%rax)
	addq	$64, %rax
	cmpl	%esi, %r11d
	ja	.L248
	movl	%ebx, %eax
	andl	$-8, %eax
	addl	%eax, %r9d
	cmpl	%ebx, %eax
	je	.L244
	movslq	%r9d, %rdx
	addl	$1, %r9d
	leaq	(%rcx,%rdx,8), %rax
	cmpl	%r14d, %r9d
	vmovsd	(%rax), %xmm0
	vsubsd	(%rdi,%rdx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
	jge	.L244
.L270:
	movslq	%r9d, %rdx
	leaq	(%rcx,%rdx,8), %rax
	vmovsd	(%rax), %xmm0
	vsubsd	(%rdi,%rdx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
	leal	1(%r9), %eax
	cmpl	%r14d, %eax
	jge	.L244
	cltq
	leaq	(%rcx,%rax,8), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%rdi,%rax,8), %xmm0, %xmm0
	leal	2(%r9), %eax
	cmpl	%r14d, %eax
	vmovsd	%xmm0, (%rdx)
	jge	.L244
	cltq
	leaq	(%rcx,%rax,8), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%rdi,%rax,8), %xmm0, %xmm0
	leal	3(%r9), %eax
	cmpl	%r14d, %eax
	vmovsd	%xmm0, (%rdx)
	jge	.L244
	cltq
	leaq	(%rcx,%rax,8), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%rdi,%rax,8), %xmm0, %xmm0
	leal	4(%r9), %eax
	cmpl	%r14d, %eax
	vmovsd	%xmm0, (%rdx)
	jge	.L244
	cltq
	leaq	(%rcx,%rax,8), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%rdi,%rax,8), %xmm0, %xmm0
	leal	5(%r9), %eax
	cmpl	%r14d, %eax
	vmovsd	%xmm0, (%rdx)
	jge	.L244
	cltq
	leaq	(%rcx,%rax,8), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%rdi,%rax,8), %xmm0, %xmm0
	leal	6(%r9), %eax
	cmpl	%r14d, %eax
	vmovsd	%xmm0, (%rdx)
	jge	.L244
	cltq
	leaq	(%rcx,%rax,8), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%rdi,%rax,8), %xmm0, %xmm0
	leal	7(%r9), %eax
	cmpl	%r14d, %eax
	vmovsd	%xmm0, (%rdx)
	jge	.L244
	cltq
	leaq	(%rcx,%rax,8), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%rdi,%rax,8), %xmm0, %xmm0
	leal	8(%r9), %eax
	cmpl	%r14d, %eax
	vmovsd	%xmm0, (%rdx)
	jge	.L244
	cltq
	leaq	(%rcx,%rax,8), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%rdi,%rax,8), %xmm0, %xmm0
	leal	9(%r9), %eax
	cmpl	%r14d, %eax
	vmovsd	%xmm0, (%rdx)
	jge	.L244
	cltq
	leaq	(%rcx,%rax,8), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%rdi,%rax,8), %xmm0, %xmm0
	leal	10(%r9), %eax
	cmpl	%r14d, %eax
	vmovsd	%xmm0, (%rdx)
	jge	.L244
	cltq
	leaq	(%rcx,%rax,8), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%rdi,%rax,8), %xmm0, %xmm0
	leal	11(%r9), %eax
	cmpl	%r14d, %eax
	vmovsd	%xmm0, (%rdx)
	jge	.L244
	cltq
	addl	$12, %r9d
	leaq	(%rcx,%rax,8), %rdx
	cmpl	%r14d, %r9d
	vmovsd	(%rdx), %xmm0
	vsubsd	(%rdi,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx)
	jge	.L244
	movslq	%r9d, %r9
	leaq	(%rcx,%r9,8), %rax
	vmovsd	(%rax), %xmm0
	vsubsd	(%rdi,%r9,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
	.p2align 4,,10
	.p2align 3
.L244:
	addq	$8, %r10
	cmpq	%r10, %r13
	jne	.L241
.L331:
	xorl	%ecx, %ecx
	cmpl	$1, -52(%rbp)
	movl	-112(%rbp), %r13d
	movq	-128(%rbp), %r12
	vmovsd	.LC15(%rip), %xmm7
	je	.L251
	movq	-120(%rbp), %r9
	movq	-88(%rbp), %r10
	.p2align 4,,10
	.p2align 3
.L250:
	movq	8(%r15,%rcx), %rdx
	movq	(%r15,%rcx), %r8
	movl	$8, %eax
	movq	16(%r15,%rcx), %rdi
	movq	8(%r10,%rcx), %rsi
	vmovsd	(%rdx), %xmm0
	.p2align 4,,10
	.p2align 3
.L254:
	vmovsd	8(%rdx,%rax), %xmm1
	vaddsd	(%rsi,%rax), %xmm1, %xmm2
	vmovsd	(%r8,%rax), %xmm1
	vaddsd	(%rdi,%rax), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm2, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vmulsd	%xmm7, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%r12, %rax
	jne	.L254
	addq	$8, %rcx
	cmpq	%r9, %rcx
	jne	.L250
.L251:
	movq	-80(%rbp), %rbx
	vpxord	%zmm2, %zmm2, %zmm2
	movq	-360(%rbp), %r10
	movl	-56(%rbp), %r11d
	movl	$8, %r9d
	.p2align 4,,10
	.p2align 3
.L255:
	movq	(%rbx), %rcx
	movq	%rcx, %rax
	shrq	$3, %rax
	negq	%rax
	andl	$7, %eax
	leal	7(%rax), %edx
	cmpl	$8, %edx
	cmovb	%r9d, %edx
	cmpl	%r11d, %edx
	ja	.L260
	testl	%eax, %eax
	je	.L284
	vmovsd	(%rcx), %xmm0
	cmpl	$1, %eax
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	je	.L285
	vmovsd	8(%rcx), %xmm0
	cmpl	$2, %eax
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	je	.L286
	vmovsd	16(%rcx), %xmm0
	cmpl	$3, %eax
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	je	.L287
	vmovsd	24(%rcx), %xmm0
	cmpl	$4, %eax
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	je	.L288
	vmovsd	32(%rcx), %xmm0
	cmpl	$5, %eax
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	je	.L289
	vmovsd	40(%rcx), %xmm0
	cmpl	$7, %eax
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	jne	.L290
	vmovsd	48(%rcx), %xmm0
	movl	$7, %esi
	vfmadd231sd	%xmm0, %xmm0, %xmm2
.L261:
	movl	%r14d, %r8d
	vxorpd	%zmm0, %zmm0, %zmm0
	subl	%eax, %r8d
	leaq	(%rcx,%rax,8), %rdx
	xorl	%eax, %eax
	movl	%r8d, %edi
	shrl	$3, %edi
	.p2align 4,,10
	.p2align 3
.L257:
	vmovapd	(%rdx), %zmm1
	addl	$1, %eax
	addq	$64, %rdx
	cmpl	%eax, %edi
	vfmadd231pd	%zmm1, %zmm1, %zmm0
	ja	.L257
	vshufi32x4	$78, %zmm0, %zmm0, %zmm1
	movl	%r8d, %eax
	andl	$-8, %eax
	addl	%eax, %esi
	cmpl	%r8d, %eax
	vaddpd	%zmm0, %zmm1, %zmm0
	vshufi32x4	$77, %zmm0, %zmm0, %zmm1
	vaddpd	%zmm0, %zmm1, %zmm0
	vpshufd	$254, %zmm0, %zmm1
	vaddpd	%zmm0, %zmm1, %zmm0
	vaddsd	%xmm0, %xmm2, %xmm2
	je	.L256
	movslq	%esi, %rax
	addl	$1, %esi
	vmovsd	(%rcx,%rax,8), %xmm0
	cmpl	%r14d, %esi
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	jge	.L256
.L271:
	movslq	%esi, %rax
	vmovsd	(%rcx,%rax,8), %xmm0
	leal	1(%rsi), %eax
	cmpl	%r14d, %eax
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	jge	.L256
	cltq
	vmovsd	(%rcx,%rax,8), %xmm0
	leal	2(%rsi), %eax
	cmpl	%r14d, %eax
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	jge	.L256
	cltq
	vmovsd	(%rcx,%rax,8), %xmm0
	leal	3(%rsi), %eax
	cmpl	%r14d, %eax
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	jge	.L256
	cltq
	vmovsd	(%rcx,%rax,8), %xmm0
	leal	4(%rsi), %eax
	cmpl	%r14d, %eax
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	jge	.L256
	cltq
	vmovsd	(%rcx,%rax,8), %xmm0
	leal	5(%rsi), %eax
	cmpl	%r14d, %eax
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	jge	.L256
	cltq
	vmovsd	(%rcx,%rax,8), %xmm0
	leal	6(%rsi), %eax
	cmpl	%r14d, %eax
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	jge	.L256
	cltq
	vmovsd	(%rcx,%rax,8), %xmm0
	leal	7(%rsi), %eax
	cmpl	%r14d, %eax
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	jge	.L256
	cltq
	vmovsd	(%rcx,%rax,8), %xmm0
	leal	8(%rsi), %eax
	cmpl	%r14d, %eax
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	jge	.L256
	cltq
	vmovsd	(%rcx,%rax,8), %xmm0
	leal	9(%rsi), %eax
	cmpl	%r14d, %eax
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	jge	.L256
	cltq
	vmovsd	(%rcx,%rax,8), %xmm0
	leal	10(%rsi), %eax
	cmpl	%r14d, %eax
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	jge	.L256
	cltq
	vmovsd	(%rcx,%rax,8), %xmm0
	leal	11(%rsi), %eax
	cmpl	%r14d, %eax
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	jge	.L256
	cltq
	addl	$12, %esi
	vmovsd	(%rcx,%rax,8), %xmm0
	cmpl	%r14d, %esi
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	jge	.L256
	movslq	%esi, %rsi
	vmovsd	(%rcx,%rsi,8), %xmm0
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	.p2align 4,,10
	.p2align 3
.L256:
	addq	$8, %rbx
	cmpq	%r10, %rbx
	jne	.L255
	vsqrtsd	%xmm2, %xmm2, %xmm2
	vmulsd	-320(%rbp), %xmm2, %xmm2
	vcomisd	.LC23(%rip), %xmm2
	ja	.L228
	movq	-424(%rbp), %r12
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L263:
	movq	(%r12), %rdi
	addq	$8, %r12
	call	free@PLT
	cmpq	%rbx, %r12
	jne	.L263
	movq	-80(%rbp), %rdi
	call	free@PLT
	movq	-376(%rbp), %rbx
	movq	-416(%rbp), %r12
	.p2align 4,,10
	.p2align 3
.L266:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%r12, %rbx
	jne	.L266
	movq	-96(%rbp), %rdi
	call	free@PLT
	movq	-392(%rbp), %rbx
	movq	-408(%rbp), %r12
	.p2align 4,,10
	.p2align 3
.L267:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%r12, %rbx
	jne	.L267
	movq	-176(%rbp), %rdi
	call	free@PLT
	movq	-384(%rbp), %rbx
	movq	-400(%rbp), %r12
	.p2align 4,,10
	.p2align 3
.L268:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%r12, %rbx
	jne	.L268
	movq	-168(%rbp), %rdi
	addq	$392, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	.cfi_remember_state
	.cfi_def_cfa 13, 0
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-16(%r13), %rsp
	.cfi_def_cfa 7, 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.p2align 4,,10
	.p2align 3
.L292:
	.cfi_restore_state
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L243:
	vmovsd	(%rcx,%rax), %xmm0
	vsubsd	(%rdi,%rax), %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%rax)
	addq	$8, %rax
	cmpq	%rax, %r13
	jne	.L243
	addq	$8, %r10
	cmpq	%r10, %r13
	jne	.L241
	jmp	.L331
	.p2align 4,,10
	.p2align 3
.L240:
	movq	-112(%rbp), %rax
	addq	%rsi, %rax
	.p2align 4,,10
	.p2align 3
.L233:
	vmulsd	(%rsi), %xmm4, %xmm0
	addq	$16, %rsi
	addq	$8, %rdi
	vmovsd	%xmm0, -8(%rdi)
	cmpq	%rax, %rsi
	jne	.L233
	jmp	.L232
	.p2align 4,,10
	.p2align 3
.L285:
	movl	$1, %esi
	jmp	.L261
	.p2align 4,,10
	.p2align 3
.L286:
	movl	$2, %esi
	jmp	.L261
	.p2align 4,,10
	.p2align 3
.L284:
	xorl	%esi, %esi
	jmp	.L261
	.p2align 4,,10
	.p2align 3
.L277:
	movl	$1, %r9d
	jmp	.L246
	.p2align 4,,10
	.p2align 3
.L260:
	vmovsd	(%rcx), %xmm0
	movl	$1, %esi
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	jmp	.L271
	.p2align 4,,10
	.p2align 3
.L287:
	movl	$3, %esi
	jmp	.L261
	.p2align 4,,10
	.p2align 3
.L278:
	movl	$2, %r9d
	jmp	.L246
	.p2align 4,,10
	.p2align 3
.L276:
	xorl	%r9d, %r9d
	jmp	.L246
	.p2align 4,,10
	.p2align 3
.L245:
	vmovsd	(%rcx), %xmm0
	movl	$1, %r9d
	vsubsd	(%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx)
	jmp	.L270
	.p2align 4,,10
	.p2align 3
.L234:
	vmulsd	(%rsi), %xmm4, %xmm0
	movl	$1, %eax
	xorl	%edx, %edx
	vmovsd	%xmm0, (%rdi)
	jmp	.L269
	.p2align 4,,10
	.p2align 3
.L288:
	movl	$4, %esi
	jmp	.L261
	.p2align 4,,10
	.p2align 3
.L279:
	movl	$3, %r9d
	jmp	.L246
	.p2align 4,,10
	.p2align 3
.L289:
	movl	$5, %esi
	jmp	.L261
	.p2align 4,,10
	.p2align 3
.L280:
	movl	$4, %r9d
	jmp	.L246
.L290:
	movl	$6, %esi
	jmp	.L261
.L281:
	movl	$5, %r9d
	jmp	.L246
.L282:
	movl	$6, %r9d
	jmp	.L246
.L272:
	movl	$2, %r14d
	movl	$1, -52(%rbp)
.L215:
	cmpl	$1, %edi
	jne	.L275
	vmulsd	%xmm0, %xmm0, %xmm0
	movq	8(%rdx), %rdx
	movq	8(%rsi), %rax
	vmulsd	8(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%rax)
	addq	$392, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	.cfi_remember_state
	.cfi_def_cfa 13, 0
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-16(%r13), %rsp
	.cfi_def_cfa 7, 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L273:
	.cfi_restore_state
	movl	$1, %eax
	movl	$1, -52(%rbp)
	jmp	.L216
.L274:
	movl	$1, %eax
	movl	$1, %ecx
	jmp	.L219
.L275:
	leal	-1(%rdi), %eax
	movl	$2, -72(%rbp)
	movl	%eax, -100(%rbp)
	jmp	.L222
.L328:
	vzeroupper
	jmp	.L215
	.cfi_endproc
.LFE51:
	.size	multigrid_vcycle, .-multigrid_vcycle
	.p2align 4,,15
	.globl	u_update
	.type	u_update, @function
u_update:
.LFB65:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L363
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-64, %rsp
	leal	-1(%rdx), %eax
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leaq	8(,%rax,8), %r15
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	xorl	%r12d, %r12d
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	%eax, -52(%rbp)
	.p2align 4,,10
	.p2align 3
.L334:
	movq	(%rsi,%r12), %r10
	movq	(%rdi,%r12), %r8
	leaq	64(%r10), %rax
	cmpq	%rax, %r8
	leaq	64(%r8), %rax
	setnb	%cl
	cmpq	%rax, %r10
	setnb	%al
	orb	%al, %cl
	je	.L353
	cmpl	$11, %edx
	jbe	.L353
	movq	%r8, %rcx
	shrq	$3, %rcx
	negq	%rcx
	andl	$7, %ecx
	leal	7(%rcx), %eax
	cmpl	-52(%rbp), %eax
	ja	.L338
	testl	%ecx, %ecx
	je	.L346
	vmovsd	(%r8), %xmm0
	cmpl	$1, %ecx
	vsubsd	(%r10), %xmm0, %xmm0
	vmovsd	%xmm0, (%r8)
	je	.L347
	vmovsd	8(%r8), %xmm0
	cmpl	$2, %ecx
	vsubsd	8(%r10), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%r8)
	je	.L348
	vmovsd	16(%r8), %xmm0
	cmpl	$3, %ecx
	vsubsd	16(%r10), %xmm0, %xmm0
	vmovsd	%xmm0, 16(%r8)
	je	.L349
	vmovsd	24(%r8), %xmm0
	cmpl	$4, %ecx
	vsubsd	24(%r10), %xmm0, %xmm0
	vmovsd	%xmm0, 24(%r8)
	je	.L350
	vmovsd	32(%r8), %xmm0
	cmpl	$5, %ecx
	vsubsd	32(%r10), %xmm0, %xmm0
	vmovsd	%xmm0, 32(%r8)
	je	.L351
	vmovsd	40(%r8), %xmm0
	cmpl	$7, %ecx
	vsubsd	40(%r10), %xmm0, %xmm0
	vmovsd	%xmm0, 40(%r8)
	jne	.L352
	vmovsd	48(%r8), %xmm0
	movl	$7, %ebx
	vsubsd	48(%r10), %xmm0, %xmm0
	vmovsd	%xmm0, 48(%r8)
.L339:
	movl	%edx, %r14d
	xorl	%eax, %eax
	xorl	%r9d, %r9d
	subl	%ecx, %r14d
	salq	$3, %rcx
	movl	%r14d, %r13d
	leaq	(%r8,%rcx), %r11
	addq	%r10, %rcx
	shrl	$3, %r13d
	.p2align 4,,10
	.p2align 3
.L341:
	vmovapd	(%r11,%rax), %zmm0
	addl	$1, %r9d
	vsubpd	(%rcx,%rax), %zmm0, %zmm0
	vmovapd	%zmm0, (%r11,%rax)
	addq	$64, %rax
	cmpl	%r9d, %r13d
	ja	.L341
	movl	%r14d, %eax
	andl	$-8, %eax
	addl	%eax, %ebx
	cmpl	%eax, %r14d
	je	.L337
	movslq	%ebx, %rcx
	addl	$1, %ebx
	leaq	(%r8,%rcx,8), %rax
	cmpl	%ebx, %edx
	vmovsd	(%rax), %xmm0
	vsubsd	(%r10,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
	jle	.L337
.L345:
	movslq	%ebx, %rcx
	leaq	(%r8,%rcx,8), %rax
	vmovsd	(%rax), %xmm0
	vsubsd	(%r10,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
	leal	1(%rbx), %eax
	cmpl	%eax, %edx
	jle	.L337
	cltq
	leaq	(%r8,%rax,8), %rcx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	leal	2(%rbx), %eax
	cmpl	%eax, %edx
	vmovsd	%xmm0, (%rcx)
	jle	.L337
	cltq
	leaq	(%r8,%rax,8), %rcx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	leal	3(%rbx), %eax
	cmpl	%eax, %edx
	vmovsd	%xmm0, (%rcx)
	jle	.L337
	cltq
	leaq	(%r8,%rax,8), %rcx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	leal	4(%rbx), %eax
	cmpl	%eax, %edx
	vmovsd	%xmm0, (%rcx)
	jle	.L337
	cltq
	leaq	(%r8,%rax,8), %rcx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	leal	5(%rbx), %eax
	cmpl	%eax, %edx
	vmovsd	%xmm0, (%rcx)
	jle	.L337
	cltq
	leaq	(%r8,%rax,8), %rcx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	leal	6(%rbx), %eax
	cmpl	%eax, %edx
	vmovsd	%xmm0, (%rcx)
	jle	.L337
	cltq
	leaq	(%r8,%rax,8), %rcx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	leal	7(%rbx), %eax
	cmpl	%eax, %edx
	vmovsd	%xmm0, (%rcx)
	jle	.L337
	cltq
	leaq	(%r8,%rax,8), %rcx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	leal	8(%rbx), %eax
	cmpl	%eax, %edx
	vmovsd	%xmm0, (%rcx)
	jle	.L337
	cltq
	leaq	(%r8,%rax,8), %rcx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	leal	9(%rbx), %eax
	cmpl	%eax, %edx
	vmovsd	%xmm0, (%rcx)
	jle	.L337
	cltq
	leaq	(%r8,%rax,8), %rcx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	leal	10(%rbx), %eax
	cmpl	%eax, %edx
	vmovsd	%xmm0, (%rcx)
	jle	.L337
	cltq
	leaq	(%r8,%rax,8), %rcx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	leal	11(%rbx), %eax
	cmpl	%eax, %edx
	vmovsd	%xmm0, (%rcx)
	jle	.L337
	cltq
	addl	$12, %ebx
	leaq	(%r8,%rax,8), %rcx
	cmpl	%ebx, %edx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx)
	jle	.L337
	movslq	%ebx, %rbx
	leaq	(%r8,%rbx,8), %rax
	vmovsd	(%rax), %xmm0
	vsubsd	(%r10,%rbx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
	.p2align 4,,10
	.p2align 3
.L337:
	addq	$8, %r12
	cmpq	%r12, %r15
	jne	.L334
.L360:
	vzeroupper
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L353:
	.cfi_restore_state
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L336:
	vmovsd	(%r8,%rax), %xmm0
	vsubsd	(%r10,%rax), %xmm0, %xmm0
	vmovsd	%xmm0, (%r8,%rax)
	addq	$8, %rax
	cmpq	%r15, %rax
	jne	.L336
	addq	$8, %r12
	cmpq	%r12, %r15
	jne	.L334
	jmp	.L360
	.p2align 4,,10
	.p2align 3
.L347:
	movl	$1, %ebx
	jmp	.L339
	.p2align 4,,10
	.p2align 3
.L346:
	xorl	%ebx, %ebx
	jmp	.L339
	.p2align 4,,10
	.p2align 3
.L348:
	movl	$2, %ebx
	jmp	.L339
	.p2align 4,,10
	.p2align 3
.L338:
	vmovsd	(%r8), %xmm0
	movl	$1, %ebx
	vsubsd	(%r10), %xmm0, %xmm0
	vmovsd	%xmm0, (%r8)
	jmp	.L345
	.p2align 4,,10
	.p2align 3
.L349:
	movl	$3, %ebx
	jmp	.L339
	.p2align 4,,10
	.p2align 3
.L350:
	movl	$4, %ebx
	jmp	.L339
	.p2align 4,,10
	.p2align 3
.L351:
	movl	$5, %ebx
	jmp	.L339
.L352:
	movl	$6, %ebx
	jmp	.L339
.L363:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	rep ret
	.cfi_endproc
.LFE65:
	.size	u_update, .-u_update
	.p2align 4,,15
	.globl	set_zeros
	.type	set_zeros, @function
set_zeros:
.LFB66:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L372
	leal	-1(%rsi), %eax
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	leaq	8(%rdi,%rax,8), %r12
	leaq	8(,%rax,8), %rbp
	.p2align 4,,10
	.p2align 3
.L368:
	movq	(%rbx), %rdi
	xorl	%esi, %esi
	movq	%rbp, %rdx
	addq	$8, %rbx
	call	memset@PLT
	cmpq	%r12, %rbx
	jne	.L368
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L372:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	rep ret
	.cfi_endproc
.LFE66:
	.size	set_zeros, .-set_zeros
	.p2align 4,,15
	.globl	verify
	.type	verify, @function
verify:
.LFB67:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L383
	leal	-1(%rdx), %eax
	vmovq	.LC11(%rip), %xmm2
	vmovsd	.LC23(%rip), %xmm1
	xorl	%r9d, %r9d
	leaq	8(,%rax,8), %r8
.L377:
	movq	(%rdi,%r9), %rcx
	movq	(%rsi,%r9), %rdx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%rdx), %xmm0, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L382
	movl	$8, %eax
	jmp	.L379
	.p2align 4,,10
	.p2align 3
.L378:
	vmovsd	(%rcx,%rax), %xmm0
	vsubsd	(%rdx,%rax), %xmm0, %xmm0
	addq	$8, %rax
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L382
.L379:
	cmpq	%rax, %r8
	jne	.L378
	addq	$8, %r9
	cmpq	%r8, %r9
	jne	.L377
.L383:
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L382:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE67:
	.size	verify, .-verify
	.section	.rodata.str1.1
.LC25:
	.string	"\nResult OK!"
.LC26:
	.string	"\nResult not OK!"
.LC28:
	.string	"time = %lf s\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB50:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movl	$513, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$64, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movl	$29793, %eax
	movl	$1680762733, 49(%rsp)
	movb	$0, 55(%rsp)
	movw	%ax, 53(%rsp)
	call	alloc_matrix
	movl	$513, %edi
	movq	%rax, %r12
	call	alloc_matrix
	movl	$513, %edi
	movq	%rax, %rbp
	call	alloc_matrix
	leaq	49(%rsp), %rsi
	movl	$513, %edx
	movq	%r12, %rdi
	movq	%rax, %rbx
	call	read_data
	vmovsd	.LC24(%rip), %xmm0
	movl	$513, %esi
	movq	%rbx, %rdi
	call	fill_f
	movl	$513, %esi
	movq	%rbx, %rdi
	call	L2_norm
	leaq	16(%rsp), %rdi
	xorl	%esi, %esi
	vmovsd	%xmm0, 8(%rsp)
	call	gettimeofday@PLT
	vmovsd	8(%rsp), %xmm1
	movq	%rbx, %rdx
	vmovsd	.LC24(%rip), %xmm0
	movq	%rbp, %rsi
	movl	$9, %edi
	call	multigrid_vcycle
	leaq	32(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday@PLT
	movl	$513, %edx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	verify
	testl	%eax, %eax
	jne	.L394
	leaq	.LC26(%rip), %rdi
	call	puts@PLT
.L390:
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	.LC28(%rip), %rsi
	vxorpd	%xmm1, %xmm1, %xmm1
	movl	$1, %edi
	vmovsd	.LC27(%rip), %xmm2
	movl	$1, %eax
	vcvtsi2sdq	24(%rsp), %xmm0, %xmm0
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	32(%rsp), %xmm1, %xmm1
	vfnmadd132sd	%xmm2, %xmm1, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	16(%rsp), %xmm3, %xmm3
	vcvtsi2sdq	40(%rsp), %xmm1, %xmm1
	vfmsub132sd	%xmm2, %xmm3, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	call	__printf_chk@PLT
	movl	$513, %esi
	movq	%r12, %rdi
	call	dealloc_matrix
	movl	$513, %esi
	movq	%rbp, %rdi
	call	dealloc_matrix
	movl	$513, %esi
	movq	%rbx, %rdi
	call	dealloc_matrix
	xorl	%eax, %eax
	movq	56(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L395
	addq	$64, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L394:
	.cfi_restore_state
	leaq	.LC25(%rip), %rdi
	call	puts@PLT
	jmp	.L390
.L395:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE50:
	.size	main, .-main
	.section	.rodata.str1.1
.LC29:
	.string	"%lf "
	.text
	.p2align 4,,15
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB68:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L403
	leal	-1(%rsi), %eax
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	leaq	.LC29(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	leaq	8(%rdi,%rax,8), %r14
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	leaq	8(,%rax,8), %r13
	movq	%rdi, %rbp
	.p2align 4,,10
	.p2align 3
.L398:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L399:
	movq	0(%rbp), %rax
	movq	%r12, %rsi
	movl	$1, %edi
	vmovsd	(%rax,%rbx), %xmm0
	movl	$1, %eax
	addq	$8, %rbx
	call	__printf_chk@PLT
	cmpq	%rbx, %r13
	jne	.L399
	movl	$10, %edi
	addq	$8, %rbp
	call	putchar@PLT
	cmpq	%r14, %rbp
	jne	.L398
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L403:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	rep ret
	.cfi_endproc
.LFE68:
	.size	print_matrix, .-print_matrix
	.globl	epsilon
	.section	.rodata
	.align 8
	.type	epsilon, @object
	.size	epsilon, 8
epsilon:
	.long	2296604913
	.long	1055193269
	.globl	pi
	.align 8
	.type	pi, @object
	.size	pi, 8
pi:
	.long	1413754136
	.long	1074340347
	.globl	l
	.align 4
	.type	l, @object
	.size	l, 4
l:
	.long	9
	.align 64
.LC2:
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.align 64
.LC3:
	.long	4
	.long	5
	.long	6
	.long	7
	.long	8
	.long	9
	.long	10
	.long	11
	.long	12
	.long	13
	.long	14
	.long	15
	.long	16
	.long	17
	.long	18
	.long	19
	.align 64
.LC4:
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.long	8
	.long	9
	.long	10
	.long	11
	.long	12
	.long	13
	.long	14
	.long	15
	.long	16
	.long	17
	.align 64
.LC5:
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.long	8
	.long	9
	.long	10
	.long	11
	.long	12
	.long	13
	.long	14
	.long	15
	.long	16
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC8:
	.long	1413754136
	.long	1074340347
	.align 8
.LC9:
	.long	3700601565
	.long	1075168253
	.align 8
.LC10:
	.long	450716388
	.long	1074906499
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC11:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata
	.align 64
.LC12:
	.long	4294967295
	.long	2147483647
	.long	4294967295
	.long	2147483647
	.long	4294967295
	.long	2147483647
	.long	4294967295
	.long	2147483647
	.long	4294967295
	.long	2147483647
	.long	4294967295
	.long	2147483647
	.long	4294967295
	.long	2147483647
	.long	4294967295
	.long	2147483647
	.section	.rodata.cst8
	.align 8
.LC13:
	.long	0
	.long	1074790400
	.section	.rodata
	.align 64
.LC14:
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.section	.rodata.cst8
	.align 8
.LC15:
	.long	0
	.long	1070596096
	.section	.rodata
	.align 64
.LC16:
	.quad	0
	.quad	2
	.quad	4
	.quad	6
	.quad	8
	.quad	10
	.quad	12
	.quad	14
	.align 64
.LC17:
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.align 64
.LC18:
	.quad	0
	.quad	8
	.quad	1
	.quad	9
	.quad	2
	.quad	10
	.quad	3
	.quad	11
	.align 64
.LC19:
	.quad	4
	.quad	12
	.quad	5
	.quad	13
	.quad	6
	.quad	14
	.quad	7
	.quad	15
	.align 64
.LC20:
	.long	0
	.long	1070596096
	.long	0
	.long	1070596096
	.long	0
	.long	1070596096
	.long	0
	.long	1070596096
	.long	0
	.long	1070596096
	.long	0
	.long	1070596096
	.long	0
	.long	1070596096
	.long	0
	.long	1070596096
	.section	.rodata.cst8
	.align 8
.LC21:
	.long	0
	.long	1071644672
	.align 8
.LC22:
	.long	0
	.long	1072693248
	.align 8
.LC23:
	.long	2296604913
	.long	1055193269
	.align 8
.LC24:
	.long	0
	.long	1063256064
	.align 8
.LC27:
	.long	2696277389
	.long	1051772663
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
