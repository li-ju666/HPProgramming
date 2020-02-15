	.file	"Multigrid0.c"
	.text
	.p2align 4,,15
	.globl	alloc_matrix
	.type	alloc_matrix, @function
alloc_matrix:
.LFB43:
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
.LFE43:
	.size	alloc_matrix, .-alloc_matrix
	.p2align 4,,15
	.globl	dealloc_matrix
	.type	dealloc_matrix, @function
dealloc_matrix:
.LFB44:
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
.LFE44:
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
.LFB45:
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
.LFE45:
	.size	read_data, .-read_data
	.p2align 4,,15
	.globl	get_m
	.type	get_m, @function
get_m:
.LFB46:
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
.LFE46:
	.size	get_m, .-get_m
	.section	.rodata.str1.1
.LC6:
	.string	"\n"
	.text
	.p2align 4,,15
	.globl	fill_f
	.type	fill_f, @function
fill_f:
.LFB47:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdi, %r14
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	leaq	.LC6(%rip), %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	%esi, %ebx
	subq	$48, %rsp
	.cfi_def_cfa_offset 96
	vmovsd	%xmm0, (%rsp)
	call	puts@PLT
	testl	%ebx, %ebx
	jle	.L40
	vmovsd	(%rsp), %xmm2
	leal	-1(%rbx), %ebp
	xorl	%r13d, %r13d
	vmulsd	%xmm2, %xmm2, %xmm17
	addq	$1, %rbp
	vmovsd	%xmm17, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L37:
	vxorpd	%xmm1, %xmm1, %xmm1
	xorl	%ebx, %ebx
	vcvtsi2sd	%r13d, %xmm1, %xmm1
	vmulsd	.LC7(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, 8(%rsp)
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	8(%rsp), %xmm1
	vmovsd	%xmm0, 24(%rsp)
	vmulsd	.LC9(%rip), %xmm1, %xmm0
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	movq	(%r14,%r13,8), %r12
	vmovsd	%xmm0, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L38:
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sd	%ebx, %xmm1, %xmm1
	vmulsd	.LC7(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, 16(%rsp)
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	16(%rsp), %xmm1
	vmovsd	%xmm0, 8(%rsp)
	vmulsd	.LC8(%rip), %xmm1, %xmm0
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	40(%rsp), %xmm3
	vmulsd	8(%rsp), %xmm3, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm0
	vmulsd	24(%rsp), %xmm0, %xmm0
	vmulsd	32(%rsp), %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	addq	$1, %rbx
	cmpq	%rbx, %rbp
	jne	.L38
	addq	$1, %r13
	cmpq	%rbp, %r13
	jne	.L37
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
.LFE47:
	.size	fill_f, .-fill_f
	.p2align 4,,15
	.globl	L1_norm
	.type	L1_norm, @function
L1_norm:
.LFB48:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L46
	leal	-1(%rsi), %eax
	vpxord	%zmm0, %zmm0, %zmm0
	vmovq	.LC11(%rip), %xmm2
	salq	$3, %rax
	leaq	8(%rax,%rdi), %rsi
	leaq	8(%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L44:
	movq	(%rdi), %rax
	leaq	(%rcx,%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L45:
	vmovsd	(%rax), %xmm1
	addq	$8, %rax
	cmpq	%rax, %rdx
	vandpd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	jne	.L45
	addq	$8, %rdi
	cmpq	%rsi, %rdi
	jne	.L44
	rep ret
.L46:
	vpxord	%zmm0, %zmm0, %zmm0
	ret
	.cfi_endproc
.LFE48:
	.size	L1_norm, .-L1_norm
	.p2align 4,,15
	.globl	L2_norm
	.type	L2_norm, @function
L2_norm:
.LFB49:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L54
	leal	-1(%rsi), %eax
	vpxord	%zmm2, %zmm2, %zmm2
	vpxord	%zmm0, %zmm0, %zmm0
	salq	$3, %rax
	leaq	8(%rax,%rdi), %rsi
	leaq	8(%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L51:
	movq	(%rdi), %rax
	leaq	(%rcx,%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L52:
	vmovsd	(%rax), %xmm1
	addq	$8, %rax
	cmpq	%rax, %rdx
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	jne	.L52
	addq	$8, %rdi
	cmpq	%rsi, %rdi
	jne	.L51
	vucomisd	%xmm0, %xmm2
	vsqrtsd	%xmm0, %xmm1, %xmm1
	ja	.L61
	vmovapd	%xmm1, %xmm0
	ret
.L54:
	vpxord	%zmm1, %zmm1, %zmm1
	vmovapd	%xmm1, %xmm0
	ret
.L61:
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	vmovsd	%xmm1, 8(%rsp)
	call	sqrt@PLT
	vmovsd	8(%rsp), %xmm1
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	vmovapd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE49:
	.size	L2_norm, .-L2_norm
	.p2align 4,,15
	.globl	Max_norm
	.type	Max_norm, @function
Max_norm:
.LFB50:
	.cfi_startproc
	movq	(%rdi), %rax
	testl	%esi, %esi
	vmovsd	(%rax), %xmm0
	jle	.L71
	leal	-1(%rsi), %eax
	vmovq	.LC11(%rip), %xmm2
	salq	$3, %rax
	leaq	8(%rdi,%rax), %rsi
	leaq	8(%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L67:
	movq	(%rdi), %rax
	leaq	(%rcx,%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L66:
	vmovsd	(%rax), %xmm1
	addq	$8, %rax
	cmpq	%rax, %rdx
	vandpd	%xmm2, %xmm1, %xmm1
	vmaxsd	%xmm0, %xmm1, %xmm0
	jne	.L66
	addq	$8, %rdi
	cmpq	%rdi, %rsi
	jne	.L67
.L71:
	rep ret
	.cfi_endproc
.LFE50:
	.size	Max_norm, .-Max_norm
	.p2align 4,,15
	.globl	L_def
	.type	L_def, @function
L_def:
.LFB51:
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
	jle	.L102
	leal	-3(%rcx), %eax
	vmovsd	.LC12(%rip), %xmm4
	vmovapd	.LC13(%rip), %zmm1
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
.L82:
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
	je	.L83
	leaq	8(%r9), %rax
	leaq	72(%r9), %rcx
	cmpq	%rax, %r11
	setbe	%al
	cmpq	%rcx, %r10
	setnb	%cl
	orb	%cl, %al
	je	.L83
	leaq	8(%rdx), %rax
	shrq	$3, %rax
	negq	%rax
	andl	$7, %eax
	leal	7(%rax), %ecx
	cmpl	-124(%rbp), %ecx
	ja	.L84
	testl	%eax, %eax
	je	.L85
	vmovsd	8(%rdx), %xmm0
	cmpl	$1, %eax
	vfmsub213sd	8(%rsi), %xmm3, %xmm0
	vsubsd	8(%rdi), %xmm0, %xmm0
	vsubsd	(%rdx), %xmm0, %xmm0
	vsubsd	16(%rdx), %xmm0, %xmm0
	vsubsd	8(%r9), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%r8)
	je	.L86
	vmovsd	16(%rdx), %xmm0
	cmpl	$2, %eax
	vfmsub213sd	16(%rsi), %xmm3, %xmm0
	vsubsd	16(%rdi), %xmm0, %xmm0
	vsubsd	8(%rdx), %xmm0, %xmm0
	vsubsd	24(%rdx), %xmm0, %xmm0
	vsubsd	16(%r9), %xmm0, %xmm0
	vmovsd	%xmm0, 16(%r8)
	je	.L87
	vmovsd	24(%rdx), %xmm0
	cmpl	$3, %eax
	vfmsub213sd	24(%rsi), %xmm3, %xmm0
	vsubsd	24(%rdi), %xmm0, %xmm0
	vsubsd	16(%rdx), %xmm0, %xmm0
	vsubsd	32(%rdx), %xmm0, %xmm0
	vsubsd	24(%r9), %xmm0, %xmm0
	vmovsd	%xmm0, 24(%r8)
	je	.L88
	vmovsd	32(%rdx), %xmm0
	cmpl	$4, %eax
	vfmsub213sd	32(%rsi), %xmm3, %xmm0
	vsubsd	32(%rdi), %xmm0, %xmm0
	vsubsd	24(%rdx), %xmm0, %xmm0
	vsubsd	40(%rdx), %xmm0, %xmm0
	vsubsd	32(%r9), %xmm0, %xmm0
	vmovsd	%xmm0, 32(%r8)
	je	.L89
	vmovsd	40(%rdx), %xmm0
	cmpl	$5, %eax
	vfmsub213sd	40(%rsi), %xmm3, %xmm0
	vsubsd	40(%rdi), %xmm0, %xmm0
	vsubsd	32(%rdx), %xmm0, %xmm0
	vsubsd	48(%rdx), %xmm0, %xmm0
	vsubsd	40(%r9), %xmm0, %xmm0
	vmovsd	%xmm0, 40(%r8)
	je	.L90
	vmovsd	48(%rdx), %xmm0
	cmpl	$7, %eax
	vfmsub213sd	48(%rsi), %xmm3, %xmm0
	vsubsd	48(%rdi), %xmm0, %xmm0
	vsubsd	40(%rdx), %xmm0, %xmm0
	vsubsd	56(%rdx), %xmm0, %xmm0
	vsubsd	48(%r9), %xmm0, %xmm0
	vmovsd	%xmm0, 48(%r8)
	jne	.L91
	vmovsd	56(%rdx), %xmm0
	movl	$8, -64(%rbp)
	vfmsub213sd	56(%rsi), %xmm3, %xmm0
	vsubsd	56(%rdi), %xmm0, %xmm0
	vsubsd	48(%rdx), %xmm0, %xmm0
	vsubsd	64(%rdx), %xmm0, %xmm0
	vsubsd	56(%r9), %xmm0, %xmm0
	vmovsd	%xmm0, 56(%r8)
.L76:
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
.L78:
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
	ja	.L78
	movl	-56(%rbp), %ebx
	movl	-64(%rbp), %ecx
	movq	-80(%rbp), %rdx
	movq	-88(%rbp), %rsi
	movl	%ebx, %eax
	andl	$-8, %eax
	addl	%eax, %ecx
	cmpl	%eax, %ebx
	je	.L81
.L75:
	movl	-128(%rbp), %eax
	movslq	%ecx, %rcx
	.p2align 4,,10
	.p2align 3
.L80:
	vmovsd	(%rdx,%rcx,8), %xmm0
	vfmsub213sd	(%rsi,%rcx,8), %xmm2, %xmm0
	vsubsd	(%rdi,%rcx,8), %xmm0, %xmm0
	vsubsd	-8(%rdx,%rcx,8), %xmm0, %xmm0
	vsubsd	8(%rdx,%rcx,8), %xmm0, %xmm0
	vsubsd	(%r9,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%r8,%rcx,8)
	addq	$1, %rcx
	cmpl	%ecx, %eax
	jg	.L80
.L81:
	addq	$8, %r12
	cmpq	%r12, -96(%rbp)
	jne	.L82
.L104:
	vzeroupper
.L102:
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
.L83:
	.cfi_restore_state
	movq	-96(%rbp), %rcx
	movl	$8, %eax
	.p2align 4,,10
	.p2align 3
.L74:
	vmovsd	(%rdx,%rax), %xmm0
	vfmsub213sd	(%rsi,%rax), %xmm4, %xmm0
	vsubsd	(%rdi,%rax), %xmm0, %xmm0
	vsubsd	-8(%rdx,%rax), %xmm0, %xmm0
	vsubsd	8(%rdx,%rax), %xmm0, %xmm0
	vsubsd	(%r9,%rax), %xmm0, %xmm0
	vmovsd	%xmm0, (%r8,%rax)
	addq	$8, %rax
	cmpq	%rcx, %rax
	jne	.L74
	addq	$8, %r12
	cmpq	%r12, -96(%rbp)
	jne	.L82
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L86:
	movl	$2, -64(%rbp)
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L87:
	movl	$3, -64(%rbp)
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L85:
	movl	$1, -64(%rbp)
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L84:
	movl	$1, %ecx
	jmp	.L75
	.p2align 4,,10
	.p2align 3
.L88:
	movl	$4, -64(%rbp)
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L89:
	movl	$5, -64(%rbp)
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L90:
	movl	$6, -64(%rbp)
	jmp	.L76
.L91:
	movl	$7, -64(%rbp)
	jmp	.L76
	.cfi_endproc
.LFE51:
	.size	L_def, .-L_def
	.p2align 4,,15
	.globl	GS_update
	.type	GS_update, @function
GS_update:
.LFB52:
	.cfi_startproc
	cmpl	$2, %edx
	jle	.L113
	leal	-3(%rdx), %eax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%ecx, %ecx
	vmovsd	.LC14(%rip), %xmm2
	leaq	8(,%rax,8), %rbx
	leaq	16(,%rax,8), %r11
	.p2align 4,,10
	.p2align 3
.L108:
	movq	8(%rdi,%rcx), %rdx
	movq	(%rdi,%rcx), %r10
	movl	$8, %eax
	movq	16(%rdi,%rcx), %r9
	movq	8(%rsi,%rcx), %r8
	vmovsd	(%rdx), %xmm1
	.p2align 4,,10
	.p2align 3
.L107:
	vmovsd	(%r10,%rax), %xmm0
	vaddsd	(%r9,%rax), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vaddsd	8(%rdx,%rax), %xmm0, %xmm0
	vaddsd	(%r8,%rax), %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm1
	vmovsd	%xmm1, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%rax, %r11
	jne	.L107
	addq	$8, %rcx
	cmpq	%rcx, %rbx
	jne	.L108
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L113:
	.cfi_restore 3
	rep ret
	.cfi_endproc
.LFE52:
	.size	GS_update, .-GS_update
	.p2align 4,,15
	.globl	set_BC
	.type	set_BC, @function
set_BC:
.LFB53:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L120
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
.L118:
	movq	(%rdi,%rax), %rdx
	movq	$0x000000000, (%r10,%rax)
	movq	$0x000000000, (%r8,%rax)
	addq	$8, %rax
	cmpq	%rcx, %rax
	movq	$0x000000000, (%rdx)
	movq	$0x000000000, (%rdx,%r9)
	jne	.L118
.L120:
	rep ret
	.cfi_endproc
.LFE53:
	.size	set_BC, .-set_BC
	.p2align 4,,15
	.globl	res_R
	.type	res_R, @function
res_R:
.LFB54:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L140
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
	vmovsd	.LC12(%rip), %xmm1
	vmovdqa64	.LC15(%rip), %zmm3
	salq	$4, %r14
	salq	$3, %r12
	vmovapd	.LC13(%rip), %zmm2
	shrl	$3, %r9d
	movl	%ebx, -52(%rbp)
	movq	%rax, -64(%rbp)
	.p2align 4,,10
	.p2align 3
.L123:
	movq	(%rsi), %rcx
	movq	(%rdi), %rax
	leaq	(%rcx,%r12), %r8
	cmpq	%r8, %rax
	leaq	(%rax,%r14), %r8
	setnb	%r10b
	cmpq	%r8, %rcx
	setnb	%r8b
	orb	%r8b, %r10b
	je	.L130
	cmpl	$8, %edx
	jbe	.L130
	cmpl	$7, %r13d
	jbe	.L131
	movq	%rax, %r8
	movq	%rcx, %r11
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L127:
	vmovupd	(%r8), %zmm0
	vmovdqa64	%zmm3, %zmm4
	addl	$1, %r10d
	subq	$-128, %r8
	addq	$64, %r11
	vpermi2pd	-64(%r8), %zmm0, %zmm4
	vmulpd	%zmm2, %zmm4, %zmm0
	vmovupd	%zmm0, -64(%r11)
	cmpl	%r10d, %r9d
	ja	.L127
	movl	-52(%rbp), %r8d
.L126:
	leal	(%r8,%r8), %r10d
	movslq	%r8d, %rbx
	movslq	%r10d, %r10
	vmulsd	(%rax,%r10,8), %xmm1, %xmm0
	leaq	0(,%r10,8), %r11
	leal	1(%r8), %r10d
	cmpl	%edx, %r10d
	vmovsd	%xmm0, (%rcx,%rbx,8)
	jge	.L124
	vmulsd	16(%rax,%r11), %xmm1, %xmm0
	movslq	%r10d, %r10
	vmovsd	%xmm0, (%rcx,%r10,8)
	leal	2(%r8), %r10d
	cmpl	%r10d, %edx
	jle	.L124
	vmulsd	32(%rax,%r11), %xmm1, %xmm0
	movslq	%r10d, %r10
	vmovsd	%xmm0, (%rcx,%r10,8)
	leal	3(%r8), %r10d
	cmpl	%r10d, %edx
	jle	.L124
	vmulsd	48(%rax,%r11), %xmm1, %xmm0
	movslq	%r10d, %r10
	vmovsd	%xmm0, (%rcx,%r10,8)
	leal	4(%r8), %r10d
	cmpl	%r10d, %edx
	jle	.L124
	vmulsd	64(%rax,%r11), %xmm1, %xmm0
	movslq	%r10d, %r10
	vmovsd	%xmm0, (%rcx,%r10,8)
	leal	5(%r8), %r10d
	cmpl	%r10d, %edx
	jle	.L124
	vmulsd	80(%rax,%r11), %xmm1, %xmm0
	movslq	%r10d, %r10
	vmovsd	%xmm0, (%rcx,%r10,8)
	leal	6(%r8), %r10d
	cmpl	%r10d, %edx
	jle	.L124
	vmulsd	96(%rax,%r11), %xmm1, %xmm0
	addl	$7, %r8d
	movslq	%r10d, %r10
	cmpl	%r8d, %edx
	vmovsd	%xmm0, (%rcx,%r10,8)
	jle	.L124
	vmulsd	112(%rax,%r11), %xmm1, %xmm0
	movslq	%r8d, %r8
	vmovsd	%xmm0, (%rcx,%r8,8)
.L124:
	addq	$16, %rdi
	addq	$8, %rsi
	cmpq	%r15, %rdi
	jne	.L123
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
.L130:
	.cfi_restore_state
	movq	-64(%rbp), %rbx
	leaq	(%rax,%rbx), %r8
	.p2align 4,,10
	.p2align 3
.L125:
	vmulsd	(%rax), %xmm1, %xmm0
	addq	$16, %rax
	addq	$8, %rcx
	vmovsd	%xmm0, -8(%rcx)
	cmpq	%r8, %rax
	jne	.L125
	jmp	.L124
	.p2align 4,,10
	.p2align 3
.L131:
	xorl	%r8d, %r8d
	jmp	.L126
.L140:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	rep ret
	.cfi_endproc
.LFE54:
	.size	res_R, .-res_R
	.p2align 4,,15
	.globl	prol_P
	.type	prol_P, @function
prol_P:
.LFB55:
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
	jle	.L144
	leal	-1(%rdx), %eax
	movq	%rdi, %r15
	leaq	8(%rdi,%rax,8), %r14
	leaq	8(,%rax,8), %r12
	.p2align 4,,10
	.p2align 3
.L145:
	movq	(%r15), %rdi
	xorl	%esi, %esi
	movq	%r12, %rdx
	addq	$8, %r15
	call	memset@PLT
	cmpq	%r14, %r15
	jne	.L145
.L144:
	leal	-1(%r13), %r11d
	testl	%r11d, %r11d
	jle	.L165
	leal	-2(%r13), %eax
	vmovsd	.LC20(%rip), %xmm10
	vmovsd	.LC14(%rip), %xmm11
	movl	%r11d, %r12d
	movl	%eax, -84(%rbp)
	leaq	8(,%rax,8), %rax
	vmovapd	.LC16(%rip), %zmm5
	vmovapd	%xmm10, %xmm7
	vmovdqa64	.LC17(%rip), %zmm4
	movq	%rax, -56(%rbp)
	movl	%r11d, %eax
	vmovdqa64	.LC18(%rip), %zmm3
	leaq	8(,%rax,8), %rsi
	salq	$4, %rax
	vmovapd	.LC19(%rip), %zmm8
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
.L153:
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
	je	.L147
	cmpq	%r15, %rsi
	setnb	%dil
	cmpq	%r14, %rcx
	setnb	%r8b
	orb	%r8b, %dil
	je	.L147
	cmpl	$6, -84(%rbp)
	jbe	.L154
	movq	%rax, %rdi
	movq	%rsi, %r8
	movq	%rdx, %r13
	movq	%rcx, %r9
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L149:
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
	ja	.L149
	movl	-88(%rbp), %edi
	cmpl	%edi, %r11d
	je	.L152
.L148:
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
	vmovsd	0(%r13), %xmm0
	vaddsd	(%r15), %xmm0, %xmm0
	vaddsd	(%r14), %xmm0, %xmm0
	vaddsd	8(%rsi,%r9), %xmm0, %xmm0
	vmulsd	%xmm9, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
	leal	1(%rdi), %r8d
	cmpl	%r11d, %r8d
	jge	.L152
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
	vmovsd	0(%r13), %xmm0
	vaddsd	(%r15), %xmm0, %xmm0
	vaddsd	(%r14), %xmm0, %xmm0
	vaddsd	8(%rsi,%r9), %xmm0, %xmm0
	vmulsd	%xmm9, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
	leal	2(%rdi), %r8d
	cmpl	%r8d, %r11d
	jle	.L152
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
	vmovsd	0(%r13), %xmm0
	vaddsd	(%r15), %xmm0, %xmm0
	vaddsd	(%r14), %xmm0, %xmm0
	vaddsd	8(%rsi,%r9), %xmm0, %xmm0
	vmulsd	%xmm9, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
	leal	3(%rdi), %r8d
	cmpl	%r8d, %r11d
	jle	.L152
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
	vmovsd	0(%r13), %xmm0
	vaddsd	(%r15), %xmm0, %xmm0
	vaddsd	(%r14), %xmm0, %xmm0
	vaddsd	8(%rsi,%r9), %xmm0, %xmm0
	vmulsd	%xmm9, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
	leal	4(%rdi), %r8d
	cmpl	%r8d, %r11d
	jle	.L152
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
	vmovsd	0(%r13), %xmm0
	vaddsd	(%r15), %xmm0, %xmm0
	vaddsd	(%r14), %xmm0, %xmm0
	vaddsd	8(%rsi,%r9), %xmm0, %xmm0
	vmulsd	%xmm9, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
	leal	5(%rdi), %r8d
	cmpl	%r8d, %r11d
	jle	.L152
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
	vmovsd	0(%r13), %xmm0
	vaddsd	(%r15), %xmm0, %xmm0
	vaddsd	(%r14), %xmm0, %xmm0
	vaddsd	8(%rsi,%r9), %xmm0, %xmm0
	vmulsd	%xmm9, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
	jle	.L152
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
	vmovsd	(%r9), %xmm0
	vaddsd	(%rax), %xmm0, %xmm0
	vaddsd	0(%r13), %xmm0, %xmm0
	vaddsd	8(%rsi,%r8), %xmm0, %xmm0
	vmulsd	%xmm9, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%rdi,8)
.L152:
	addq	$8, %r10
	cmpq	-56(%rbp), %r10
	jne	.L153
	vzeroupper
.L165:
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
.L147:
	.cfi_restore_state
	movq	-56(%rbp), %r8
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L151:
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
	vaddsd	(%rax), %xmm0, %xmm0
	vaddsd	(%rsi,%rdi), %xmm0, %xmm0
	vaddsd	8(%rsi,%rdi), %xmm0, %xmm0
	vmulsd	%xmm11, %xmm0, %xmm0
	vmovsd	%xmm0, 8(%rcx,%rdi,2)
	addq	$8, %rdi
	cmpq	%r8, %rdi
	jne	.L151
	jmp	.L152
	.p2align 4,,10
	.p2align 3
.L154:
	xorl	%edi, %edi
	jmp	.L148
	.cfi_endproc
.LFE55:
	.size	prol_P, .-prol_P
	.p2align 4,,15
	.globl	multigrid_vcycle
	.type	multigrid_vcycle, @function
multigrid_vcycle:
.LFB42:
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
	subq	$520, %rsp
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	testl	%edi, %edi
	jle	.L220
	leal	-1(%rdi), %r8d
	cmpl	$16, %r8d
	jbe	.L221
	movl	%edi, %ecx
	vmovdqa64	.LC2(%rip), %zmm2
	xorl	%eax, %eax
	shrl	$4, %ecx
	.p2align 4,,10
	.p2align 3
.L170:
	addl	$1, %eax
	vpslld	$1, %zmm2, %zmm2
	cmpl	%eax, %ecx
	ja	.L170
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
	je	.L171
.L169:
	leal	1(%rax), %ecx
	sall	-52(%rbp)
	movl	-52(%rbp), %ebx
	cmpl	%ecx, %edi
	jl	.L171
	leal	2(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L171
	leal	3(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L171
	leal	4(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L171
	leal	5(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L171
	leal	6(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L171
	leal	7(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L171
	leal	8(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L171
	leal	9(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L171
	leal	10(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L171
	leal	11(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L171
	leal	12(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L171
	leal	13(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L171
	leal	14(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L171
	leal	15(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L171
	addl	%ebx, %ebx
	addl	$16, %eax
	leal	(%rbx,%rbx), %ecx
	cmpl	%eax, %edi
	cmovl	%ebx, %ecx
	movl	%ecx, -52(%rbp)
	.p2align 4,,10
	.p2align 3
.L171:
	movl	-52(%rbp), %eax
	cmpl	$1, %edi
	leal	1(%rax), %r13d
	jle	.L269
	leal	-2(%rdi), %eax
	cmpl	$16, %eax
	jbe	.L222
	movl	%r8d, %ecx
	vmovdqa64	.LC2(%rip), %zmm2
	xorl	%eax, %eax
	shrl	$4, %ecx
	.p2align 4,,10
	.p2align 3
.L173:
	addl	$1, %eax
	vpslld	$1, %zmm2, %zmm2
	cmpl	%eax, %ecx
	ja	.L173
	vpxord	%zmm4, %zmm4, %zmm4
	movl	%r8d, %r9d
	andl	$-16, %r9d
	cmpl	%r8d, %r9d
	leal	1(%r9), %ecx
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
	vmovd	%xmm2, %eax
	je	.L174
.L172:
	leal	1(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L174
	leal	2(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L174
	leal	3(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L174
	leal	4(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L174
	leal	5(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L174
	leal	6(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L174
	leal	7(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L174
	leal	8(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L174
	leal	9(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L174
	leal	10(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L174
	leal	11(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L174
	leal	12(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L174
	leal	13(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L174
	leal	14(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L174
	leal	15(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L174
	addl	%eax, %eax
	addl	$16, %ecx
	leal	(%rax,%rax), %r8d
	cmpl	%ecx, %edi
	cmovg	%r8d, %eax
	.p2align 4,,10
	.p2align 3
.L174:
	leal	1(%rax), %r15d
	vzeroupper
.L175:
	movslq	%r13d, %rbx
	movl	%edi, -176(%rbp)
	movq	%rsi, %r12
	leaq	0(,%rbx,8), %rax
	vmovsd	%xmm1, -88(%rbp)
	movq	%rdx, -96(%rbp)
	vmovsd	%xmm0, -472(%rbp)
	movq	%rax, %rdi
	movq	%rax, -104(%rbp)
	call	malloc@PLT
	leal	-1(%r13), %esi
	movq	%r12, -64(%rbp)
	movq	%rax, -80(%rbp)
	movq	%rax, -504(%rbp)
	movq	%rax, %r12
	leaq	8(,%rsi,8), %r14
	movl	%esi, -68(%rbp)
	movq	%rsi, -240(%rbp)
	movq	%r14, -160(%rbp)
	addq	%rax, %r14
	.p2align 4,,10
	.p2align 3
.L177:
	movl	$8, %esi
	movq	%rbx, %rdi
	addq	$8, %r12
	call	calloc@PLT
	movq	%rax, -8(%r12)
	cmpq	%r14, %r12
	jne	.L177
	movslq	%r15d, %r14
	movq	%r12, -168(%rbp)
	movq	-64(%rbp), %r12
	leaq	0(,%r14,8), %rax
	movq	%rax, %rdi
	movq	%rax, -64(%rbp)
	call	malloc@PLT
	leal	-1(%r15), %esi
	movq	%rbx, -112(%rbp)
	movq	%r12, -136(%rbp)
	movq	%rax, -120(%rbp)
	movq	%rax, -496(%rbp)
	movq	%rax, %rbx
	movl	%esi, -56(%rbp)
	movq	%rsi, -144(%rbp)
	leaq	8(,%rsi,8), %rsi
	movq	%rsi, -128(%rbp)
	addq	%rax, %rsi
	movq	%rsi, %r12
	.p2align 4,,10
	.p2align 3
.L178:
	movl	$8, %esi
	movq	%r14, %rdi
	addq	$8, %rbx
	call	calloc@PLT
	movq	%rax, -8(%rbx)
	cmpq	%r12, %rbx
	jne	.L178
	movq	-104(%rbp), %rdi
	movq	-136(%rbp), %r12
	movq	%rbx, -528(%rbp)
	movq	-112(%rbp), %rbx
	call	malloc@PLT
	movq	-160(%rbp), %rsi
	movl	%r13d, -104(%rbp)
	movq	%r12, -136(%rbp)
	movq	%rax, -112(%rbp)
	movq	%rax, %r12
	movq	%rax, -488(%rbp)
	addq	%rax, %rsi
	movq	%rsi, %r13
	.p2align 4,,10
	.p2align 3
.L179:
	movl	$8, %esi
	movq	%rbx, %rdi
	addq	$8, %r12
	call	calloc@PLT
	movq	%rax, -8(%r12)
	cmpq	%r13, %r12
	jne	.L179
	movq	-64(%rbp), %rdi
	movq	%r12, -520(%rbp)
	movl	-104(%rbp), %r13d
	movq	-136(%rbp), %r12
	call	malloc@PLT
	movq	-128(%rbp), %rbx
	movq	%r12, -64(%rbp)
	movq	%rax, %r12
	movq	%rax, -104(%rbp)
	movq	%rax, -480(%rbp)
	addq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L180:
	movl	$8, %esi
	movq	%r14, %rdi
	addq	$8, %r12
	call	calloc@PLT
	movq	%rax, -8(%r12)
	cmpq	%rbx, %r12
	jne	.L180
	movl	-52(%rbp), %eax
	movq	-80(%rbp), %rsi
	movq	%r12, -512(%rbp)
	movq	-64(%rbp), %r12
	vmovsd	-88(%rbp), %xmm1
	subl	$2, %eax
	vmovsd	.LC14(%rip), %xmm3
	leaq	8(,%rax,8), %rbx
	vmovdqa64	.LC15(%rip), %zmm5
	vmovapd	.LC13(%rip), %zmm4
	movq	%rbx, -136(%rbp)
	leaq	16(,%rax,8), %rbx
	movq	-144(%rbp), %rax
	salq	$4, %rax
	movq	%rax, -464(%rbp)
	leaq	16(%rsi,%rax), %rax
	movq	%rax, -64(%rbp)
	movq	%r14, %rax
	salq	$4, %rax
	movq	%rax, -448(%rbp)
	leaq	0(,%r14,8), %rax
	movq	%rax, -440(%rbp)
	movl	-56(%rbp), %eax
	movl	%eax, %r14d
	andl	$-8, %eax
	movl	%eax, -172(%rbp)
	movq	-240(%rbp), %rax
	shrl	$3, %r14d
	leaq	8(,%rax,8), %rax
	movq	%rax, -456(%rbp)
.L181:
	vdivsd	-88(%rbp), %xmm1, %xmm1
	vucomisd	.LC21(%rip), %xmm1
	jbe	.L267
	xorl	%ecx, %ecx
	cmpl	$1, -52(%rbp)
	je	.L214
	movq	-136(%rbp), %r9
	movq	-96(%rbp), %r10
	.p2align 4,,10
	.p2align 3
.L183:
	movq	8(%r12,%rcx), %rdx
	movq	(%r12,%rcx), %r8
	movl	$8, %eax
	movq	16(%r12,%rcx), %rdi
	movq	8(%r10,%rcx), %rsi
	vmovsd	(%rdx), %xmm0
	.p2align 4,,10
	.p2align 3
.L182:
	vmovsd	(%r8,%rax), %xmm1
	vaddsd	(%rdi,%rax), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vaddsd	8(%rdx,%rax), %xmm0, %xmm0
	vaddsd	(%rsi,%rax), %xmm0, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%rbx, %rax
	jne	.L182
	addq	$8, %rcx
	cmpq	%r9, %rcx
	jne	.L183
.L214:
	movq	-96(%rbp), %rdx
	movq	-80(%rbp), %rsi
	movl	%r13d, %ecx
	movq	%r12, %rdi
	vmovapd	%zmm4, -432(%rbp)
	vmovdqa64	%zmm5, -368(%rbp)
	vmovsd	%xmm3, -152(%rbp)
	vzeroupper
	call	L_def
	movslq	-172(%rbp), %rsi
	movq	-464(%rbp), %rax
	movq	%rbx, -240(%rbp)
	movq	%r12, -304(%rbp)
	movq	-120(%rbp), %r9
	movq	-80(%rbp), %r8
	movq	-440(%rbp), %rbx
	leal	(%rsi,%rsi), %r10d
	movq	-448(%rbp), %r12
	addq	$16, %rax
	vmovsd	.LC12(%rip), %xmm1
	leal	1(%rsi), %r11d
	movslq	%r10d, %r10
	vmovsd	-152(%rbp), %xmm3
	vmovdqa64	-368(%rbp), %zmm5
	movl	%r13d, -144(%rbp)
	salq	$3, %r10
	vmovapd	-432(%rbp), %zmm4
	movq	%rax, -128(%rbp)
	movq	%rsi, %r13
	.p2align 4,,10
	.p2align 3
.L184:
	movq	(%r9), %rdi
	movq	(%r8), %rsi
	leaq	(%rdi,%rbx), %rax
	cmpq	%rax, %rsi
	leaq	(%rsi,%r12), %rax
	setnb	%dl
	cmpq	%rax, %rdi
	setnb	%al
	orb	%al, %dl
	je	.L193
	cmpl	$8, %r15d
	jbe	.L193
	cmpl	$7, -56(%rbp)
	jbe	.L187
	movq	%rdi, %rcx
	movq	%rsi, %rax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L188:
	vmovupd	(%rax), %zmm0
	vmovdqa64	%zmm5, %zmm6
	addl	$1, %edx
	addq	$64, %rcx
	subq	$-128, %rax
	vpermi2pd	-64(%rax), %zmm0, %zmm6
	vmulpd	%zmm4, %zmm6, %zmm0
	vmovupd	%zmm0, -64(%rcx)
	cmpl	%edx, %r14d
	ja	.L188
	vmulsd	(%rsi,%r10), %xmm1, %xmm0
	cmpl	%r11d, %r15d
	movq	%r10, %rdx
	movl	%r11d, %eax
	vmovsd	%xmm0, (%rdi,%r13,8)
	jle	.L185
.L218:
	vmulsd	16(%rsi,%rdx), %xmm1, %xmm0
	movslq	%eax, %rcx
	vmovsd	%xmm0, (%rdi,%rcx,8)
	leal	1(%rax), %ecx
	cmpl	%ecx, %r15d
	jle	.L185
	vmulsd	32(%rsi,%rdx), %xmm1, %xmm0
	movslq	%ecx, %rcx
	vmovsd	%xmm0, (%rdi,%rcx,8)
	leal	2(%rax), %ecx
	cmpl	%ecx, %r15d
	jle	.L185
	vmulsd	48(%rsi,%rdx), %xmm1, %xmm0
	movslq	%ecx, %rcx
	vmovsd	%xmm0, (%rdi,%rcx,8)
	leal	3(%rax), %ecx
	cmpl	%ecx, %r15d
	jle	.L185
	vmulsd	64(%rsi,%rdx), %xmm1, %xmm0
	movslq	%ecx, %rcx
	vmovsd	%xmm0, (%rdi,%rcx,8)
	leal	4(%rax), %ecx
	cmpl	%ecx, %r15d
	jle	.L185
	vmulsd	80(%rsi,%rdx), %xmm1, %xmm0
	movslq	%ecx, %rcx
	vmovsd	%xmm0, (%rdi,%rcx,8)
	leal	5(%rax), %ecx
	cmpl	%ecx, %r15d
	jle	.L185
	vmulsd	96(%rsi,%rdx), %xmm1, %xmm0
	addl	$6, %eax
	movslq	%ecx, %rcx
	cmpl	%eax, %r15d
	vmovsd	%xmm0, (%rdi,%rcx,8)
	jle	.L185
	vmulsd	112(%rsi,%rdx), %xmm1, %xmm0
	cltq
	vmovsd	%xmm0, (%rdi,%rax,8)
.L185:
	addq	$16, %r8
	addq	$8, %r9
	cmpq	-64(%rbp), %r8
	jne	.L184
	movl	-176(%rbp), %eax
	movl	-144(%rbp), %r13d
	vmovapd	%zmm4, -432(%rbp)
	movq	-240(%rbp), %rbx
	movq	-304(%rbp), %r12
	vmovdqa64	%zmm5, -368(%rbp)
	movq	-120(%rbp), %rdx
	vmovsd	%xmm3, -152(%rbp)
	movq	-104(%rbp), %rsi
	leal	-1(%rax), %edi
	vmovsd	-88(%rbp), %xmm1
	vmovsd	-472(%rbp), %xmm0
	vzeroupper
	call	multigrid_vcycle
	movq	-104(%rbp), %rsi
	movq	-112(%rbp), %rdi
	movl	%r15d, %ecx
	movl	%r13d, %edx
	call	prol_P
	movl	%r15d, -128(%rbp)
	movq	%rbx, -240(%rbp)
	xorl	%r10d, %r10d
	movq	-456(%rbp), %r15
	movq	-112(%rbp), %rbx
	vmovsd	-152(%rbp), %xmm3
	movl	%r14d, -144(%rbp)
	vmovdqa64	-368(%rbp), %zmm5
	vmovapd	-432(%rbp), %zmm4
	.p2align 4,,10
	.p2align 3
.L194:
	movq	(%rbx,%r10), %rdi
	movq	(%r12,%r10), %rcx
	leaq	64(%rdi), %rax
	cmpq	%rax, %rcx
	leaq	64(%rcx), %rax
	setnb	%dl
	cmpq	%rax, %rdi
	setnb	%al
	orb	%al, %dl
	je	.L233
	cmpl	$11, %r13d
	jbe	.L233
	movq	%rcx, %rdx
	shrq	$3, %rdx
	negq	%rdx
	andl	$7, %edx
	leal	7(%rdx), %eax
	cmpl	-68(%rbp), %eax
	ja	.L198
	testl	%edx, %edx
	je	.L224
	vmovsd	(%rcx), %xmm0
	cmpl	$1, %edx
	vsubsd	(%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx)
	je	.L225
	vmovsd	8(%rcx), %xmm0
	cmpl	$2, %edx
	vsubsd	8(%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%rcx)
	je	.L226
	vmovsd	16(%rcx), %xmm0
	cmpl	$3, %edx
	vsubsd	16(%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, 16(%rcx)
	je	.L227
	vmovsd	24(%rcx), %xmm0
	cmpl	$4, %edx
	vsubsd	24(%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, 24(%rcx)
	je	.L228
	vmovsd	32(%rcx), %xmm0
	cmpl	$5, %edx
	vsubsd	32(%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, 32(%rcx)
	je	.L229
	vmovsd	40(%rcx), %xmm0
	cmpl	$7, %edx
	vsubsd	40(%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, 40(%rcx)
	jne	.L230
	vmovsd	48(%rcx), %xmm0
	movl	$7, %r9d
	vsubsd	48(%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, 48(%rcx)
.L199:
	movl	%r13d, %r14d
	xorl	%eax, %eax
	xorl	%esi, %esi
	subl	%edx, %r14d
	salq	$3, %rdx
	movl	%r14d, %r11d
	leaq	(%rcx,%rdx), %r8
	addq	%rdi, %rdx
	shrl	$3, %r11d
	.p2align 4,,10
	.p2align 3
.L201:
	vmovapd	(%r8,%rax), %zmm0
	addl	$1, %esi
	vsubpd	(%rdx,%rax), %zmm0, %zmm0
	vmovapd	%zmm0, (%r8,%rax)
	addq	$64, %rax
	cmpl	%esi, %r11d
	ja	.L201
	movl	%r14d, %eax
	andl	$-8, %eax
	addl	%eax, %r9d
	cmpl	%r14d, %eax
	je	.L197
	movslq	%r9d, %rdx
	addl	$1, %r9d
	leaq	(%rcx,%rdx,8), %rax
	cmpl	%r13d, %r9d
	vmovsd	(%rax), %xmm0
	vsubsd	(%rdi,%rdx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
	jge	.L197
.L219:
	movslq	%r9d, %rdx
	leaq	(%rcx,%rdx,8), %rax
	vmovsd	(%rax), %xmm0
	vsubsd	(%rdi,%rdx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
	leal	1(%r9), %eax
	cmpl	%r13d, %eax
	jge	.L197
	cltq
	leaq	(%rcx,%rax,8), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%rdi,%rax,8), %xmm0, %xmm0
	leal	2(%r9), %eax
	cmpl	%r13d, %eax
	vmovsd	%xmm0, (%rdx)
	jge	.L197
	cltq
	leaq	(%rcx,%rax,8), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%rdi,%rax,8), %xmm0, %xmm0
	leal	3(%r9), %eax
	cmpl	%r13d, %eax
	vmovsd	%xmm0, (%rdx)
	jge	.L197
	cltq
	leaq	(%rcx,%rax,8), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%rdi,%rax,8), %xmm0, %xmm0
	leal	4(%r9), %eax
	cmpl	%r13d, %eax
	vmovsd	%xmm0, (%rdx)
	jge	.L197
	cltq
	leaq	(%rcx,%rax,8), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%rdi,%rax,8), %xmm0, %xmm0
	leal	5(%r9), %eax
	cmpl	%r13d, %eax
	vmovsd	%xmm0, (%rdx)
	jge	.L197
	cltq
	leaq	(%rcx,%rax,8), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%rdi,%rax,8), %xmm0, %xmm0
	leal	6(%r9), %eax
	cmpl	%r13d, %eax
	vmovsd	%xmm0, (%rdx)
	jge	.L197
	cltq
	leaq	(%rcx,%rax,8), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%rdi,%rax,8), %xmm0, %xmm0
	leal	7(%r9), %eax
	cmpl	%r13d, %eax
	vmovsd	%xmm0, (%rdx)
	jge	.L197
	cltq
	leaq	(%rcx,%rax,8), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%rdi,%rax,8), %xmm0, %xmm0
	leal	8(%r9), %eax
	cmpl	%r13d, %eax
	vmovsd	%xmm0, (%rdx)
	jge	.L197
	cltq
	leaq	(%rcx,%rax,8), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%rdi,%rax,8), %xmm0, %xmm0
	leal	9(%r9), %eax
	cmpl	%r13d, %eax
	vmovsd	%xmm0, (%rdx)
	jge	.L197
	cltq
	leaq	(%rcx,%rax,8), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%rdi,%rax,8), %xmm0, %xmm0
	leal	10(%r9), %eax
	cmpl	%r13d, %eax
	vmovsd	%xmm0, (%rdx)
	jge	.L197
	cltq
	leaq	(%rcx,%rax,8), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%rdi,%rax,8), %xmm0, %xmm0
	leal	11(%r9), %eax
	cmpl	%r13d, %eax
	vmovsd	%xmm0, (%rdx)
	jge	.L197
	cltq
	addl	$12, %r9d
	leaq	(%rcx,%rax,8), %rdx
	cmpl	%r13d, %r9d
	vmovsd	(%rdx), %xmm0
	vsubsd	(%rdi,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx)
	jge	.L197
	movslq	%r9d, %r9
	leaq	(%rcx,%r9,8), %rax
	vmovsd	(%rax), %xmm0
	vsubsd	(%rdi,%r9,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
	.p2align 4,,10
	.p2align 3
.L197:
	addq	$8, %r10
	cmpq	%r15, %r10
	jne	.L194
.L272:
	xorl	%ecx, %ecx
	cmpl	$1, -52(%rbp)
	movl	-128(%rbp), %r15d
	movl	-144(%rbp), %r14d
	movq	-240(%rbp), %rbx
	vmovsd	.LC14(%rip), %xmm2
	je	.L204
	movq	-136(%rbp), %r9
	movq	-96(%rbp), %r10
	.p2align 4,,10
	.p2align 3
.L203:
	movq	8(%r12,%rcx), %rdx
	movq	(%r12,%rcx), %r8
	movl	$8, %eax
	movq	16(%r12,%rcx), %rdi
	movq	8(%r10,%rcx), %rsi
	vmovsd	(%rdx), %xmm0
	.p2align 4,,10
	.p2align 3
.L207:
	vmovsd	(%r8,%rax), %xmm1
	vaddsd	(%rdi,%rax), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vaddsd	8(%rdx,%rax), %xmm0, %xmm0
	vaddsd	(%rsi,%rax), %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%rbx, %rax
	jne	.L207
	addq	$8, %rcx
	cmpq	%r9, %rcx
	jne	.L203
.L204:
	movq	-80(%rbp), %rcx
	vpxord	%zmm2, %zmm2, %zmm2
	vpxord	%zmm0, %zmm0, %zmm0
	movq	-160(%rbp), %rsi
	movq	-168(%rbp), %rdi
	.p2align 4,,10
	.p2align 3
.L208:
	movq	(%rcx), %rax
	leaq	(%rsi,%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L209:
	vmovsd	(%rax), %xmm1
	addq	$8, %rax
	cmpq	%rdx, %rax
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	jne	.L209
	addq	$8, %rcx
	cmpq	%rdi, %rcx
	jne	.L208
	vucomisd	%xmm0, %xmm2
	vsqrtsd	%xmm0, %xmm1, %xmm1
	jbe	.L181
	vmovapd	%zmm4, -304(%rbp)
	vmovdqa64	%zmm5, -240(%rbp)
	vmovsd	%xmm3, -144(%rbp)
	vmovsd	%xmm1, -128(%rbp)
	vzeroupper
	call	sqrt@PLT
	vmovapd	-304(%rbp), %zmm4
	vmovdqa64	-240(%rbp), %zmm5
	vmovsd	-144(%rbp), %xmm3
	vmovsd	-128(%rbp), %xmm1
	jmp	.L181
	.p2align 4,,10
	.p2align 3
.L233:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L196:
	vmovsd	(%rcx,%rax), %xmm0
	vsubsd	(%rdi,%rax), %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%rax)
	addq	$8, %rax
	cmpq	%r15, %rax
	jne	.L196
	addq	$8, %r10
	cmpq	%r15, %r10
	jne	.L194
	jmp	.L272
	.p2align 4,,10
	.p2align 3
.L193:
	movq	-128(%rbp), %rax
	addq	%rsi, %rax
	.p2align 4,,10
	.p2align 3
.L186:
	vmulsd	(%rsi), %xmm1, %xmm0
	addq	$16, %rsi
	addq	$8, %rdi
	vmovsd	%xmm0, -8(%rdi)
	cmpq	%rax, %rsi
	jne	.L186
	jmp	.L185
	.p2align 4,,10
	.p2align 3
.L225:
	movl	$1, %r9d
	jmp	.L199
	.p2align 4,,10
	.p2align 3
.L226:
	movl	$2, %r9d
	jmp	.L199
	.p2align 4,,10
	.p2align 3
.L224:
	xorl	%r9d, %r9d
	jmp	.L199
	.p2align 4,,10
	.p2align 3
.L198:
	vmovsd	(%rcx), %xmm0
	movl	$1, %r9d
	vsubsd	(%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx)
	jmp	.L219
	.p2align 4,,10
	.p2align 3
.L187:
	vmulsd	(%rsi), %xmm1, %xmm0
	movl	$1, %eax
	xorl	%edx, %edx
	vmovsd	%xmm0, (%rdi)
	jmp	.L218
	.p2align 4,,10
	.p2align 3
.L227:
	movl	$3, %r9d
	jmp	.L199
	.p2align 4,,10
	.p2align 3
.L267:
	movq	-504(%rbp), %rbx
	movq	-168(%rbp), %r12
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L212:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%r12, %rbx
	jne	.L212
	movq	-80(%rbp), %rdi
	call	free@PLT
	movq	-496(%rbp), %rbx
	movq	-528(%rbp), %r12
	.p2align 4,,10
	.p2align 3
.L215:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%r12, %rbx
	jne	.L215
	movq	-120(%rbp), %rdi
	call	free@PLT
	movq	-488(%rbp), %rbx
	movq	-520(%rbp), %r12
	.p2align 4,,10
	.p2align 3
.L216:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%r12, %rbx
	jne	.L216
	movq	-112(%rbp), %rdi
	call	free@PLT
	movq	-480(%rbp), %rbx
	movq	-512(%rbp), %r12
	.p2align 4,,10
	.p2align 3
.L217:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%r12, %rbx
	jne	.L217
	movq	-104(%rbp), %rdi
	addq	$520, %rsp
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
.L228:
	.cfi_restore_state
	movl	$4, %r9d
	jmp	.L199
.L229:
	movl	$5, %r9d
	jmp	.L199
.L230:
	movl	$6, %r9d
	jmp	.L199
.L220:
	movl	$2, %r13d
	movl	$1, -52(%rbp)
.L168:
	cmpl	$1, %edi
	jne	.L223
	vmulsd	%xmm0, %xmm0, %xmm0
	movq	8(%rdx), %rdx
	movq	8(%rsi), %rax
	vmulsd	8(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%rax)
	addq	$520, %rsp
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
.L222:
	.cfi_restore_state
	movl	$1, %ecx
	movl	$1, %eax
	jmp	.L172
.L221:
	movl	$1, %eax
	movl	$1, -52(%rbp)
	jmp	.L169
.L269:
	vzeroupper
	jmp	.L168
.L223:
	movl	$2, %r15d
	jmp	.L175
	.cfi_endproc
.LFE42:
	.size	multigrid_vcycle, .-multigrid_vcycle
	.p2align 4,,15
	.globl	u_update
	.type	u_update, @function
u_update:
.LFB56:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L304
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
.L275:
	movq	(%rsi,%r12), %r10
	movq	(%rdi,%r12), %r8
	leaq	64(%r10), %rax
	cmpq	%rax, %r8
	leaq	64(%r8), %rax
	setnb	%cl
	cmpq	%rax, %r10
	setnb	%al
	orb	%al, %cl
	je	.L294
	cmpl	$11, %edx
	jbe	.L294
	movq	%r8, %rcx
	shrq	$3, %rcx
	negq	%rcx
	andl	$7, %ecx
	leal	7(%rcx), %eax
	cmpl	-52(%rbp), %eax
	ja	.L279
	testl	%ecx, %ecx
	je	.L287
	vmovsd	(%r8), %xmm0
	cmpl	$1, %ecx
	vsubsd	(%r10), %xmm0, %xmm0
	vmovsd	%xmm0, (%r8)
	je	.L288
	vmovsd	8(%r8), %xmm0
	cmpl	$2, %ecx
	vsubsd	8(%r10), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%r8)
	je	.L289
	vmovsd	16(%r8), %xmm0
	cmpl	$3, %ecx
	vsubsd	16(%r10), %xmm0, %xmm0
	vmovsd	%xmm0, 16(%r8)
	je	.L290
	vmovsd	24(%r8), %xmm0
	cmpl	$4, %ecx
	vsubsd	24(%r10), %xmm0, %xmm0
	vmovsd	%xmm0, 24(%r8)
	je	.L291
	vmovsd	32(%r8), %xmm0
	cmpl	$5, %ecx
	vsubsd	32(%r10), %xmm0, %xmm0
	vmovsd	%xmm0, 32(%r8)
	je	.L292
	vmovsd	40(%r8), %xmm0
	cmpl	$7, %ecx
	vsubsd	40(%r10), %xmm0, %xmm0
	vmovsd	%xmm0, 40(%r8)
	jne	.L293
	vmovsd	48(%r8), %xmm0
	movl	$7, %ebx
	vsubsd	48(%r10), %xmm0, %xmm0
	vmovsd	%xmm0, 48(%r8)
.L280:
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
.L282:
	vmovapd	(%r11,%rax), %zmm0
	addl	$1, %r9d
	vsubpd	(%rcx,%rax), %zmm0, %zmm0
	vmovapd	%zmm0, (%r11,%rax)
	addq	$64, %rax
	cmpl	%r9d, %r13d
	ja	.L282
	movl	%r14d, %eax
	andl	$-8, %eax
	addl	%eax, %ebx
	cmpl	%eax, %r14d
	je	.L278
	movslq	%ebx, %rcx
	addl	$1, %ebx
	leaq	(%r8,%rcx,8), %rax
	cmpl	%ebx, %edx
	vmovsd	(%rax), %xmm0
	vsubsd	(%r10,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
	jle	.L278
.L286:
	movslq	%ebx, %rcx
	leaq	(%r8,%rcx,8), %rax
	vmovsd	(%rax), %xmm0
	vsubsd	(%r10,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
	leal	1(%rbx), %eax
	cmpl	%eax, %edx
	jle	.L278
	cltq
	leaq	(%r8,%rax,8), %rcx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	leal	2(%rbx), %eax
	cmpl	%eax, %edx
	vmovsd	%xmm0, (%rcx)
	jle	.L278
	cltq
	leaq	(%r8,%rax,8), %rcx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	leal	3(%rbx), %eax
	cmpl	%eax, %edx
	vmovsd	%xmm0, (%rcx)
	jle	.L278
	cltq
	leaq	(%r8,%rax,8), %rcx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	leal	4(%rbx), %eax
	cmpl	%eax, %edx
	vmovsd	%xmm0, (%rcx)
	jle	.L278
	cltq
	leaq	(%r8,%rax,8), %rcx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	leal	5(%rbx), %eax
	cmpl	%eax, %edx
	vmovsd	%xmm0, (%rcx)
	jle	.L278
	cltq
	leaq	(%r8,%rax,8), %rcx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	leal	6(%rbx), %eax
	cmpl	%eax, %edx
	vmovsd	%xmm0, (%rcx)
	jle	.L278
	cltq
	leaq	(%r8,%rax,8), %rcx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	leal	7(%rbx), %eax
	cmpl	%eax, %edx
	vmovsd	%xmm0, (%rcx)
	jle	.L278
	cltq
	leaq	(%r8,%rax,8), %rcx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	leal	8(%rbx), %eax
	cmpl	%eax, %edx
	vmovsd	%xmm0, (%rcx)
	jle	.L278
	cltq
	leaq	(%r8,%rax,8), %rcx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	leal	9(%rbx), %eax
	cmpl	%eax, %edx
	vmovsd	%xmm0, (%rcx)
	jle	.L278
	cltq
	leaq	(%r8,%rax,8), %rcx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	leal	10(%rbx), %eax
	cmpl	%eax, %edx
	vmovsd	%xmm0, (%rcx)
	jle	.L278
	cltq
	leaq	(%r8,%rax,8), %rcx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	leal	11(%rbx), %eax
	cmpl	%eax, %edx
	vmovsd	%xmm0, (%rcx)
	jle	.L278
	cltq
	addl	$12, %ebx
	leaq	(%r8,%rax,8), %rcx
	cmpl	%ebx, %edx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx)
	jle	.L278
	movslq	%ebx, %rbx
	leaq	(%r8,%rbx,8), %rax
	vmovsd	(%rax), %xmm0
	vsubsd	(%r10,%rbx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
	.p2align 4,,10
	.p2align 3
.L278:
	addq	$8, %r12
	cmpq	%r12, %r15
	jne	.L275
.L301:
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
.L294:
	.cfi_restore_state
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L277:
	vmovsd	(%r8,%rax), %xmm0
	vsubsd	(%r10,%rax), %xmm0, %xmm0
	vmovsd	%xmm0, (%r8,%rax)
	addq	$8, %rax
	cmpq	%r15, %rax
	jne	.L277
	addq	$8, %r12
	cmpq	%r12, %r15
	jne	.L275
	jmp	.L301
	.p2align 4,,10
	.p2align 3
.L288:
	movl	$1, %ebx
	jmp	.L280
	.p2align 4,,10
	.p2align 3
.L287:
	xorl	%ebx, %ebx
	jmp	.L280
	.p2align 4,,10
	.p2align 3
.L289:
	movl	$2, %ebx
	jmp	.L280
	.p2align 4,,10
	.p2align 3
.L279:
	vmovsd	(%r8), %xmm0
	movl	$1, %ebx
	vsubsd	(%r10), %xmm0, %xmm0
	vmovsd	%xmm0, (%r8)
	jmp	.L286
	.p2align 4,,10
	.p2align 3
.L290:
	movl	$3, %ebx
	jmp	.L280
	.p2align 4,,10
	.p2align 3
.L291:
	movl	$4, %ebx
	jmp	.L280
	.p2align 4,,10
	.p2align 3
.L292:
	movl	$5, %ebx
	jmp	.L280
.L293:
	movl	$6, %ebx
	jmp	.L280
.L304:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	rep ret
	.cfi_endproc
.LFE56:
	.size	u_update, .-u_update
	.p2align 4,,15
	.globl	set_zeros
	.type	set_zeros, @function
set_zeros:
.LFB57:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L313
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
.L309:
	movq	(%rbx), %rdi
	xorl	%esi, %esi
	movq	%rbp, %rdx
	addq	$8, %rbx
	call	memset@PLT
	cmpq	%r12, %rbx
	jne	.L309
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L313:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	rep ret
	.cfi_endproc
.LFE57:
	.size	set_zeros, .-set_zeros
	.p2align 4,,15
	.globl	verify
	.type	verify, @function
verify:
.LFB58:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L324
	leal	-1(%rdx), %eax
	vmovq	.LC11(%rip), %xmm2
	vmovsd	.LC21(%rip), %xmm1
	xorl	%r9d, %r9d
	leaq	8(,%rax,8), %r8
.L318:
	movq	(%rdi,%r9), %rcx
	movq	(%rsi,%r9), %rdx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%rdx), %xmm0, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vucomisd	%xmm1, %xmm0
	ja	.L323
	movl	$8, %eax
	jmp	.L320
	.p2align 4,,10
	.p2align 3
.L319:
	vmovsd	(%rcx,%rax), %xmm0
	vsubsd	(%rdx,%rax), %xmm0, %xmm0
	addq	$8, %rax
	vandpd	%xmm2, %xmm0, %xmm0
	vucomisd	%xmm1, %xmm0
	ja	.L323
.L320:
	cmpq	%rax, %r8
	jne	.L319
	addq	$8, %r9
	cmpq	%r8, %r9
	jne	.L318
.L324:
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L323:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE58:
	.size	verify, .-verify
	.section	.rodata.str1.1
.LC23:
	.string	"\nResult OK!"
.LC24:
	.string	"\nResult not OK!"
.LC26:
	.string	"time = %lf s\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB41:
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
	vmovsd	.LC22(%rip), %xmm0
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
	vmovsd	.LC22(%rip), %xmm0
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
	jne	.L335
	leaq	.LC24(%rip), %rdi
	call	puts@PLT
.L331:
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	.LC26(%rip), %rsi
	vmovsd	.LC25(%rip), %xmm2
	movl	$1, %edi
	vxorpd	%xmm1, %xmm1, %xmm1
	movl	$1, %eax
	vcvtsi2sdq	40(%rsp), %xmm0, %xmm0
	vdivsd	%xmm2, %xmm0, %xmm0
	vcvtsi2sdq	32(%rsp), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	24(%rsp), %xmm1, %xmm1
	vdivsd	%xmm2, %xmm1, %xmm1
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	16(%rsp), %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vsubsd	%xmm1, %xmm0, %xmm0
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
	jne	.L336
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
.L335:
	.cfi_restore_state
	leaq	.LC23(%rip), %rdi
	call	puts@PLT
	jmp	.L331
.L336:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.section	.rodata.str1.1
.LC27:
	.string	"%lf "
	.text
	.p2align 4,,15
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB59:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L344
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
	leaq	.LC27(%rip), %r12
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
.L339:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L340:
	movq	0(%rbp), %rax
	movq	%r12, %rsi
	movl	$1, %edi
	vmovsd	(%rax,%rbx), %xmm0
	movl	$1, %eax
	addq	$8, %rbx
	call	__printf_chk@PLT
	cmpq	%rbx, %r13
	jne	.L340
	movl	$10, %edi
	addq	$8, %rbp
	call	putchar@PLT
	cmpq	%r14, %rbp
	jne	.L339
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
.L344:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	rep ret
	.cfi_endproc
.LFE59:
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
.LC7:
	.long	1413754136
	.long	1074340347
	.align 8
.LC8:
	.long	3700601565
	.long	1075168253
	.align 8
.LC9:
	.long	450716388
	.long	1074906499
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC11:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC12:
	.long	0
	.long	1074790400
	.section	.rodata
	.align 64
.LC13:
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
.LC14:
	.long	0
	.long	1070596096
	.section	.rodata
	.align 64
.LC15:
	.quad	0
	.quad	2
	.quad	4
	.quad	6
	.quad	8
	.quad	10
	.quad	12
	.quad	14
	.align 64
.LC16:
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
.LC17:
	.quad	0
	.quad	8
	.quad	1
	.quad	9
	.quad	2
	.quad	10
	.quad	3
	.quad	11
	.align 64
.LC18:
	.quad	4
	.quad	12
	.quad	5
	.quad	13
	.quad	6
	.quad	14
	.quad	7
	.quad	15
	.align 64
.LC19:
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
.LC20:
	.long	0
	.long	1071644672
	.align 8
.LC21:
	.long	2296604913
	.long	1055193269
	.align 8
.LC22:
	.long	0
	.long	1063256064
	.align 8
.LC25:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
