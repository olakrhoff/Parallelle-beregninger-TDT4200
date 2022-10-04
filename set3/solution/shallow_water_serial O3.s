# GNU C17 (Homebrew GCC 12.2.0) version 12.2.0 (x86_64-apple-darwin21)
#	compiled by GNU C version 12.2.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.25-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -fPIC -mmacosx-version-min=12.0.0 -mtune=core2 -O3 -fopenmp
	.text
	.p2align 4
	.globl _swap
_swap:
LFB27:
# src/shallow_water_serial.c:72:     tmp = *t1;
	movq	(%rdi), %rax	# *t1_3(D), tmp
# src/shallow_water_serial.c:73:     *t1 = *t2;
	movq	(%rsi), %rdx	# *t2_5(D), _1
# src/shallow_water_serial.c:73:     *t1 = *t2;
	movq	%rdx, (%rdi)	# _1, *t1_3(D)
# src/shallow_water_serial.c:74:     *t2 = tmp;
	movq	%rax, (%rsi)	# tmp, *t2_5(D)
# src/shallow_water_serial.c:75: }
	ret	
LFE27:
	.p2align 4
	.globl _time_step
_time_step:
LFB29:
	pushq	%r15	#
LCFI0:
	pushq	%r14	#
LCFI1:
	pushq	%r13	#
LCFI2:
	pushq	%r12	#
LCFI3:
	pushq	%rbp	#
LCFI4:
	pushq	%rbx	#
LCFI5:
	subq	$112, %rsp	#,
LCFI6:
# src/shallow_water_serial.c:136:     for (int_t y = 1; y <= N; y++)
	movq	_N(%rip), %rax	# N, N.15_265
	testq	%rax, %rax	# N.15_265
	movq	%rax, -120(%rsp)	# N.15_265, %sfp
	jle	L129	#,
# src/shallow_water_serial.c:139:             U(y, x) = PNU(y, x) / PN(y, x);
	movq	_mass_velocity_x(%rip), %rbx	# mass_velocity_x[0], _1
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	leaq	2(%rax), %r14	#, _124
# src/shallow_water_serial.c:136:     for (int_t y = 1; y <= N; y++)
	movq	$1, -56(%rsp)	#, %sfp
# src/shallow_water_serial.c:139:             U(y, x) = PNU(y, x) / PN(y, x);
	movq	_mass(%rip), %rbp	# mass[0], _42
	leaq	(%rax,%r14), %rdx	#, tmp838
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movq	%r14, -112(%rsp)	# _124, %sfp
# src/shallow_water_serial.c:140:             V(y, x) = PNV(y, x) / PN(y, x);
	movq	_velocity_y(%rip), %rsi	# velocity_y, velocity_y.35_62
	salq	$3, %rdx	#, ivtmp.687
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movq	%r14, -88(%rsp)	# _124, %sfp
	leaq	0(,%r14,8), %r9	#, _259
# src/shallow_water_serial.c:139:             U(y, x) = PNU(y, x) / PN(y, x);
	movq	_velocity_x(%rip), %rcx	# velocity_x, velocity_x.26_50
# src/shallow_water_serial.c:136:     for (int_t y = 1; y <= N; y++)
	movq	%rdx, -8(%rsp)	# ivtmp.687, %sfp
	leaq	16(%r9), %r11	#, ivtmp.701
# src/shallow_water_serial.c:140:             V(y, x) = PNV(y, x) / PN(y, x);
	movq	_mass_velocity_y(%rip), %r10	# mass_velocity_y[0], _15
	leaq	(%rbx,%r11), %rdi	#, ivtmp.742
# src/shallow_water_serial.c:139:             U(y, x) = PNU(y, x) / PN(y, x);
	movq	%rbp, 64(%rsp)	# _42, %sfp
	movq	%rdi, -64(%rsp)	# ivtmp.742, %sfp
	leaq	24(%r9), %rdi	#, ivtmp.760
	movq	%rdi, -80(%rsp)	# ivtmp.760, %sfp
	leaq	1(%rax), %rdi	#, _1486
	movq	%rdi, -40(%rsp)	# _1486, %sfp
	leaq	8(%r9), %r15	#, ivtmp.700
	movq	%rax, %rdi	# N.15_265, bnd.354
	leaq	(%rsi,%r15), %r8	#, ivtmp.744
	shrq	%rdi	# bnd.354
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movq	%r15, %r13	# ivtmp.700, ivtmp.758
# src/shallow_water_serial.c:136:     for (int_t y = 1; y <= N; y++)
	movq	%r15, -16(%rsp)	# ivtmp.700, %sfp
	salq	$4, %rdi	#, bnd.354
	movq	%rdx, %r15	# ivtmp.739, ivtmp.739
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movq	%r11, -96(%rsp)	# ivtmp.701, %sfp
# src/shallow_water_serial.c:136:     for (int_t y = 1; y <= N; y++)
	movq	%rbp, %rdx	# _42, _42
	movq	%rdi, -72(%rsp)	# bnd.354, %sfp
	movq	%rax, %rdi	# N.15_265, niters_vector_mult_vf.355
	orq	$1, %rax	#, tmp.356
	andq	$-2, %rdi	#, niters_vector_mult_vf.355
	movq	%rax, -104(%rsp)	# tmp.356, %sfp
	movq	%rdi, -32(%rsp)	# niters_vector_mult_vf.355, %sfp
	movq	%r11, -24(%rsp)	# ivtmp.701, %sfp
	.p2align 4,,10
	.p2align 3
L11:
	cmpq	$1, -120(%rsp)	#, %sfp
	je	L13	#,
	movq	-80(%rsp), %rax	# %sfp, ivtmp.760
	leaq	(%rcx,%r13), %r11	#, _1268
	leaq	(%rdx,%r13), %rdi	#, _1301
	leaq	0(%r13,%r10), %rbp	#, _1322
	leaq	(%rcx,%rax), %r14	#, _1502
	movq	-96(%rsp), %rax	# %sfp, ivtmp.759
	addq	%rdx, %rax	# _42, tmp840
	cmpq	%rax, %r8	# tmp840, ivtmp.744
	movq	-64(%rsp), %rax	# %sfp, ivtmp.742
	setne	%r12b	#, tmp842
	cmpq	%rax, %r11	# ivtmp.742, _1268
	setne	%al	#, tmp844
	andl	%r12d, %eax	# tmp842, tmp845
	movq	-64(%rsp), %r12	# %sfp, ivtmp.742
	cmpq	%r12, %r8	# ivtmp.742, ivtmp.744
	setne	%r12b	#, tmp847
	andl	%r12d, %eax	# tmp847, tmp848
	movq	-96(%rsp), %r12	# %sfp, ivtmp.759
	addq	%rcx, %r12	# velocity_x.26_50, tmp849
	cmpq	%r12, %r8	# tmp849, ivtmp.744
	setne	%r12b	#, tmp851
	andl	%r12d, %eax	# tmp851, tmp852
	movq	-96(%rsp), %r12	# %sfp, ivtmp.759
	addq	%r10, %r12	# _15, tmp853
	cmpq	%r12, %r8	# tmp853, ivtmp.744
	setne	%r12b	#, tmp855
	andl	%r12d, %eax	# tmp855, tmp856
	movq	-80(%rsp), %r12	# %sfp, ivtmp.760
	addq	%rdx, %r12	# _42, tmp857
	cmpq	%r12, %r11	# tmp857, _1268
	setnb	%r12b	#, tmp859
	cmpq	%r14, %rdi	# _1502, _1301
	setnb	-48(%rsp)	#, %sfp
	orb	-48(%rsp), %r12b	# %sfp, tmp862
	testb	%r12b, %al	# tmp862, tmp856
	je	L13	#,
	movq	-80(%rsp), %r12	# %sfp, ivtmp.760
	leaq	(%r12,%r10), %rax	#, tmp864
	leaq	(%rbx,%r13), %r12	#, vectp.358
	cmpq	%rax, %r11	# tmp864, _1268
	setnb	-48(%rsp)	#, %sfp
	cmpq	%r14, %rbp	# _1502, _1322
	setnb	%r14b	#, tmp868
# src/shallow_water_serial.c:139:             U(y, x) = PNU(y, x) / PN(y, x);
	xorl	%eax, %eax	# ivtmp.722
	orb	-48(%rsp), %r14b	# %sfp, tmp1307
	je	L13	#,
	movq	-72(%rsp), %r14	# %sfp, _571
	.p2align 4,,10
	.p2align 3
L9:
# src/shallow_water_serial.c:139:             U(y, x) = PNU(y, x) / PN(y, x);
	movq	(%r12,%rax), %xmm0	# MEM <vector(2) double> [(real_t *)vectp.358_1402 + ivtmp.722_576 * 1], vect__8.359
# src/shallow_water_serial.c:139:             U(y, x) = PNU(y, x) / PN(y, x);
	movq	(%rdi,%rax), %xmm1	# MEM <vector(2) double> [(real_t *)_1301 + ivtmp.722_576 * 1], vect__11.362
# src/shallow_water_serial.c:139:             U(y, x) = PNU(y, x) / PN(y, x);
	movhpd	8(%r12,%rax), %xmm0	# MEM <vector(2) double> [(real_t *)vectp.358_1402 + ivtmp.722_576 * 1], vect__8.359
# src/shallow_water_serial.c:139:             U(y, x) = PNU(y, x) / PN(y, x);
	movhpd	8(%rdi,%rax), %xmm1	# MEM <vector(2) double> [(real_t *)_1301 + ivtmp.722_576 * 1], vect__11.362
# src/shallow_water_serial.c:139:             U(y, x) = PNU(y, x) / PN(y, x);
	divpd	%xmm1, %xmm0	# vect__11.362, vect__14.363
# src/shallow_water_serial.c:139:             U(y, x) = PNU(y, x) / PN(y, x);
	movlpd	%xmm0, (%r11,%rax)	# vect__14.363, MEM <vector(2) double> [(real_t *)_1268 + ivtmp.722_576 * 1]
	movhpd	%xmm0, 8(%r11,%rax)	# vect__14.363, MEM <vector(2) double> [(real_t *)_1268 + ivtmp.722_576 * 1]
# src/shallow_water_serial.c:140:             V(y, x) = PNV(y, x) / PN(y, x);
	movq	0(%rbp,%rax), %xmm0	# MEM <vector(2) double> [(real_t *)_1322 + ivtmp.722_576 * 1], vect__17.368
# src/shallow_water_serial.c:140:             V(y, x) = PNV(y, x) / PN(y, x);
	movq	(%rdi,%rax), %xmm1	# MEM <vector(2) double> [(real_t *)_1301 + ivtmp.722_576 * 1], vect__18.371
# src/shallow_water_serial.c:140:             V(y, x) = PNV(y, x) / PN(y, x);
	movhpd	8(%rbp,%rax), %xmm0	# MEM <vector(2) double> [(real_t *)_1322 + ivtmp.722_576 * 1], vect__17.368
# src/shallow_water_serial.c:140:             V(y, x) = PNV(y, x) / PN(y, x);
	movhpd	8(%rdi,%rax), %xmm1	# MEM <vector(2) double> [(real_t *)_1301 + ivtmp.722_576 * 1], vect__18.371
# src/shallow_water_serial.c:140:             V(y, x) = PNV(y, x) / PN(y, x);
	divpd	%xmm1, %xmm0	# vect__18.371, vect__21.372
# src/shallow_water_serial.c:140:             V(y, x) = PNV(y, x) / PN(y, x);
	movlpd	%xmm0, (%r8,%rax)	# vect__21.372, MEM <vector(2) double> [(real_t *)_1278 + ivtmp.722_576 * 1]
	movhpd	%xmm0, 8(%r8,%rax)	# vect__21.372, MEM <vector(2) double> [(real_t *)_1278 + ivtmp.722_576 * 1]
	addq	$16, %rax	#, ivtmp.722
	cmpq	%rax, %r14	# ivtmp.722, _571
	jne	L9	#,
	movq	-32(%rsp), %rdi	# %sfp, niters_vector_mult_vf.355
	cmpq	%rdi, -120(%rsp)	# niters_vector_mult_vf.355, %sfp
	je	L8	#,
# src/shallow_water_serial.c:139:             U(y, x) = PNU(y, x) / PN(y, x);
	movq	-104(%rsp), %rdi	# %sfp, tmp.356
	movq	-88(%rsp), %rax	# %sfp, ivtmp.738
	addq	%rdi, %rax	# tmp.356, tmp820
# src/shallow_water_serial.c:139:             U(y, x) = PNU(y, x) / PN(y, x);
	leaq	(%rdx,%rax,8), %rdi	#, _1384
# src/shallow_water_serial.c:139:             U(y, x) = PNU(y, x) / PN(y, x);
	movsd	(%rbx,%rax,8), %xmm0	# *_1382, *_1382
	divsd	(%rdi), %xmm0	# *_1384, tmp821
# src/shallow_water_serial.c:139:             U(y, x) = PNU(y, x) / PN(y, x);
	movsd	%xmm0, (%rcx,%rax,8)	# tmp821, *_1386
# src/shallow_water_serial.c:140:             V(y, x) = PNV(y, x) / PN(y, x);
	movsd	(%r10,%rax,8), %xmm0	# *_1389, *_1389
	divsd	(%rdi), %xmm0	# *_1384, tmp823
# src/shallow_water_serial.c:140:             V(y, x) = PNV(y, x) / PN(y, x);
	movsd	%xmm0, (%rsi,%rax,8)	# tmp823, *_1392
L8:
# src/shallow_water_serial.c:136:     for (int_t y = 1; y <= N; y++)
	addq	$1, -56(%rsp)	#, %sfp
# src/shallow_water_serial.c:136:     for (int_t y = 1; y <= N; y++)
	addq	%r9, %r15	# _259, ivtmp.739
	addq	%r9, %r8	# _259, ivtmp.744
	addq	%r9, %r13	# _259, ivtmp.758
# src/shallow_water_serial.c:136:     for (int_t y = 1; y <= N; y++)
	movq	-56(%rsp), %rax	# %sfp, y
# src/shallow_water_serial.c:136:     for (int_t y = 1; y <= N; y++)
	movq	-40(%rsp), %rdi	# %sfp, _1486
	movq	-112(%rsp), %r11	# %sfp, _124
	addq	%r9, -64(%rsp)	# _259, %sfp
	addq	%r11, -88(%rsp)	# _124, %sfp
	addq	%r9, -96(%rsp)	# _259, %sfp
	addq	%r9, -80(%rsp)	# _259, %sfp
	cmpq	%rdi, %rax	# _1486, y
	jne	L11	#,
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	movq	-16(%rsp), %r15	# %sfp, ivtmp.700
	movq	%r11, %r13	# _124, ivtmp.686
# src/shallow_water_serial.c:143:     for (int_t y = 1; y <= N; y++)
	movl	$1, %r14d	#, y
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	movq	_mass_velocity(%rip), %r10	# mass_velocity, mass_velocity.21_38
	movq	-24(%rsp), %r11	# %sfp, ivtmp.701
	movq	-8(%rsp), %rdx	# %sfp, ivtmp.687
	movq	64(%rsp), %rdi	# %sfp, _42
	leaq	(%r10,%r15), %r8	#, ivtmp.688
	.p2align 4,,10
	.p2align 3
L12:
	cmpq	$1, -120(%rsp)	#, %sfp
	je	L22	#,
	leaq	(%rdi,%r11), %rax	#, tmp882
	cmpq	%rax, %r8	# tmp882, ivtmp.688
	leaq	(%rcx,%r11), %rax	#, tmp885
	setne	%bl	#, tmp884
	cmpq	%rax, %r8	# tmp885, ivtmp.688
	setne	%al	#, tmp887
	testb	%al, %bl	# tmp887, tmp884
	je	L22	#,
	leaq	(%rsi,%r11), %rax	#, tmp889
	cmpq	%rax, %r8	# tmp889, ivtmp.688
	je	L22	#,
	leaq	(%rdi,%r15), %r12	#, vectp.341
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	xorl	%eax, %eax	# ivtmp.672
	leaq	(%rcx,%r15), %rbp	#, vectp.344
	leaq	(%rsi,%r15), %rbx	#, vectp.348
	.p2align 4,,10
	.p2align 3
L19:
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	movq	(%r12,%rax), %xmm0	# MEM <vector(2) double> [(real_t *)vectp.341_1232 + ivtmp.672_1434 * 1], vect__30.342
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	movq	0(%rbp,%rax), %xmm1	# MEM <vector(2) double> [(real_t *)vectp.344_1239 + ivtmp.672_1434 * 1], vect__33.345
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	movhpd	8(%r12,%rax), %xmm0	# MEM <vector(2) double> [(real_t *)vectp.341_1232 + ivtmp.672_1434 * 1], vect__30.342
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	movhpd	8(%rbp,%rax), %xmm1	# MEM <vector(2) double> [(real_t *)vectp.344_1239 + ivtmp.672_1434 * 1], vect__33.345
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	mulpd	%xmm1, %xmm0	# vect__33.345, vect__34.346
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	movq	(%rbx,%rax), %xmm1	# MEM <vector(2) double> [(real_t *)vectp.348_1247 + ivtmp.672_1434 * 1], vect__37.349
	movhpd	8(%rbx,%rax), %xmm1	# MEM <vector(2) double> [(real_t *)vectp.348_1247 + ivtmp.672_1434 * 1], vect__37.349
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	mulpd	%xmm1, %xmm0	# vect__37.349, vect__40.350
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	movlpd	%xmm0, (%r8,%rax)	# vect__40.350, MEM <vector(2) double> [(real_t *)_1164 + ivtmp.672_1434 * 1]
	movhpd	%xmm0, 8(%r8,%rax)	# vect__40.350, MEM <vector(2) double> [(real_t *)_1164 + ivtmp.672_1434 * 1]
	addq	$16, %rax	#, ivtmp.672
	cmpq	%rax, -72(%rsp)	# ivtmp.672, %sfp
	jne	L19	#,
	movq	-32(%rsp), %rbx	# %sfp, niters_vector_mult_vf.355
	cmpq	%rbx, -120(%rsp)	# niters_vector_mult_vf.355, %sfp
	je	L18	#,
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	movq	-104(%rsp), %rax	# %sfp, tmp.356
	addq	%r13, %rax	# ivtmp.686, tmp870
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	movsd	(%rdi,%rax,8), %xmm0	# *_1215, *_1215
	mulsd	(%rcx,%rax,8), %xmm0	# *_1217, tmp871
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	mulsd	(%rsi,%rax,8), %xmm0	# *_1220, tmp873
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	movsd	%xmm0, (%r10,%rax,8)	# tmp873, *_1222
L18:
# src/shallow_water_serial.c:143:     for (int_t y = 1; y <= N; y++)
	movq	-112(%rsp), %rax	# %sfp, _124
# src/shallow_water_serial.c:143:     for (int_t y = 1; y <= N; y++)
	addq	$1, %r14	#, y
# src/shallow_water_serial.c:143:     for (int_t y = 1; y <= N; y++)
	addq	%r9, %rdx	# _259, ivtmp.687
	addq	%r9, %r8	# _259, ivtmp.688
	addq	%r9, %r15	# _259, ivtmp.700
	addq	%r9, %r11	# _259, ivtmp.701
	addq	%rax, %r13	# _124, ivtmp.686
	movq	-40(%rsp), %rax	# %sfp, _1486
	cmpq	%rax, %r14	# _1486, y
	jne	L12	#,
L21:
	movq	-112(%rsp), %rax	# %sfp, _124
	leaq	8(%rcx), %rdx	#, ivtmp.646
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	xorl	%r12d, %r12d	# ivtmp.636
	xorl	%r14d, %r14d	# ivtmp.637
	movq	%rdx, -64(%rsp)	# ivtmp.646, %sfp
	movq	_acceleration_y(%rip), %rbx	# acceleration_y, acceleration_y.41_70
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	movq	_acceleration_x(%rip), %rdi	# acceleration_x, acceleration_x.32_58
	movq	%r14, -96(%rsp)	# ivtmp.637, %sfp
	movsd	lC0(%rip), %xmm3	#, tmp1300
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	movq	$16, -80(%rsp)	#, %sfp
	movq	%rax, %rdx	# _124, bnd.305
	movsd	lC1(%rip), %xmm2	#, tmp1301
# src/shallow_water_serial.c:149:     for (int_t y = 0; y <= N + 1; y++)
	movq	$0, -88(%rsp)	#, %sfp
	shrq	%rdx	# bnd.305
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	movq	%rbx, -40(%rsp)	# acceleration_y.41_70, %sfp
	movq	%rbx, %r9	# acceleration_y.41_70, ivtmp.644
	movddup	%xmm3, %xmm5	#, tmp1302
	salq	$4, %rdx	#, bnd.305
	movq	%rbx, 16(%rsp)	# acceleration_y.41_70, %sfp
	movq	%rdi, %r10	# acceleration_x.32_58, ivtmp.642
	movddup	%xmm2, %xmm4	#, tmp1303
	movq	%rdx, -48(%rsp)	# bnd.305, %sfp
	leaq	0(,%rax,8), %r15	#, _128
	movq	%rax, %rdx	# _124, tmp.307
	andl	$1, %eax	#, tmp1304
	andq	$-2, %rdx	#, tmp.307
	movq	%r15, %rbp	# _128, _128
	movq	%r15, 72(%rsp)	# _128, %sfp
	movq	%rdx, -72(%rsp)	# tmp.307, %sfp
	movq	%rbx, %rdx	# acceleration_y.41_70, acceleration_y.41_70
	movq	%r15, %rbx	# _128, ivtmp.638
	movl	$8, %r15d	#, ivtmp.652
	movq	%r15, -104(%rsp)	# ivtmp.652, %sfp
	movq	%r12, %r15	# ivtmp.636, ivtmp.636
	movq	%rdx, %r12	# acceleration_y.41_70, acceleration_y.41_70
	movq	64(%rsp), %rdx	# %sfp, _42
	movq	%rax, -32(%rsp)	# tmp1304, %sfp
	.p2align 4,,10
	.p2align 3
L26:
	cmpq	$-1, -120(%rsp)	#, %sfp
	je	L65	#,
	movq	-64(%rsp), %r13	# %sfp, ivtmp.646
	leaq	(%rdx,%r15), %r8	#, _972
	leaq	16(%r10), %r14	#, _188
	leaq	(%rsi,%r15), %r11	#, _1009
	cmpq	%r10, %r13	# ivtmp.642, ivtmp.646
	setne	%al	#, tmp953
	cmpq	%r9, %r13	# ivtmp.644, ivtmp.646
	setne	%r13b	#, tmp955
	andl	%r13d, %eax	# tmp955, tmp956
	movq	-104(%rsp), %r13	# %sfp, ivtmp.652
	addq	%rdx, %r13	# _42, tmp957
	cmpq	%r13, %r9	# tmp957, ivtmp.644
	setne	%r13b	#, tmp959
	andl	%r13d, %eax	# tmp959, tmp960
	movq	-104(%rsp), %r13	# %sfp, ivtmp.652
	addq	%rdi, %r13	# acceleration_x.32_58, tmp961
	cmpq	%r13, %r9	# tmp961, ivtmp.644
	setne	%r13b	#, tmp963
	andl	%r13d, %eax	# tmp963, tmp964
	movq	-104(%rsp), %r13	# %sfp, ivtmp.652
	addq	%rsi, %r13	# velocity_y.35_62, tmp965
	cmpq	%r13, %r9	# tmp965, ivtmp.644
	setne	%r13b	#, tmp967
	andl	%r13d, %eax	# tmp967, tmp968
	movq	-80(%rsp), %r13	# %sfp, ivtmp.653
	addq	%rdx, %r13	# _42, tmp969
	cmpq	%r13, %r10	# tmp969, ivtmp.642
	setnb	%r13b	#, tmp971
	cmpq	%r14, %r8	# _188, _972
	setnb	-56(%rsp)	#, %sfp
	orb	-56(%rsp), %r13b	# %sfp, tmp974
	testb	%r13b, %al	# tmp974, tmp968
	je	L65	#,
	movq	-80(%rsp), %r13	# %sfp, ivtmp.653
	leaq	(%rsi,%r13), %rax	#, tmp976
	leaq	(%rcx,%r15), %r13	#, vectp.312
	cmpq	%rax, %r10	# tmp976, ivtmp.642
	setnb	-56(%rsp)	#, %sfp
	cmpq	%r14, %r11	# _188, _1009
	setnb	%r14b	#, tmp980
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	xorl	%eax, %eax	# ivtmp.622
	orb	-56(%rsp), %r14b	# %sfp, tmp1308
	je	L65	#,
	movq	-48(%rsp), %r14	# %sfp, _121
	.p2align 4,,10
	.p2align 3
L30:
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	movq	(%r8,%rax), %xmm0	# MEM <vector(2) double> [(real_t *)_972 + ivtmp.622_298 * 1], tmp928
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	movq	0(%r13,%rax), %xmm6	# MEM <vector(2) double> [(real_t *)vectp.312_1112 + ivtmp.622_298 * 1], tmp929
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	movhpd	8(%r8,%rax), %xmm0	# MEM <vector(2) double> [(real_t *)_972 + ivtmp.622_298 * 1], tmp928
# src/shallow_water_serial.c:153:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	movapd	%xmm0, %xmm1	# tmp928, vect__55.316
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	movhpd	8(%r13,%rax), %xmm6	# MEM <vector(2) double> [(real_t *)vectp.312_1112 + ivtmp.622_298 * 1], tmp929
# src/shallow_water_serial.c:153:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	mulpd	%xmm0, %xmm1	# tmp928, vect__55.316
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	mulpd	%xmm6, %xmm0	# tmp929, vect__53.314
# src/shallow_water_serial.c:153:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	divpd	%xmm5, %xmm1	# tmp1302, vect__56.317
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	mulpd	%xmm6, %xmm0	# tmp929, vect__54.315
# src/shallow_water_serial.c:153:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	mulpd	%xmm4, %xmm1	# tmp1303, vect__57.318
# src/shallow_water_serial.c:153:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	addpd	%xmm1, %xmm0	# vect__57.318, vect__60.319
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	movlpd	%xmm0, (%r10,%rax)	# vect__60.319, MEM <vector(2) double> [(real_t *)_964 + ivtmp.622_298 * 1]
	movhpd	%xmm0, 8(%r10,%rax)	# vect__60.319, MEM <vector(2) double> [(real_t *)_964 + ivtmp.622_298 * 1]
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	movq	(%r8,%rax), %xmm0	# MEM <vector(2) double> [(real_t *)_972 + ivtmp.622_298 * 1], tmp940
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	movq	(%r11,%rax), %xmm6	# MEM <vector(2) double> [(real_t *)_1009 + ivtmp.622_298 * 1], tmp941
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	movhpd	8(%r8,%rax), %xmm0	# MEM <vector(2) double> [(real_t *)_972 + ivtmp.622_298 * 1], tmp940
# src/shallow_water_serial.c:155:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	movapd	%xmm0, %xmm1	# tmp940, vect__67.330
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	movhpd	8(%r11,%rax), %xmm6	# MEM <vector(2) double> [(real_t *)_1009 + ivtmp.622_298 * 1], tmp941
# src/shallow_water_serial.c:155:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	mulpd	%xmm0, %xmm1	# tmp940, vect__67.330
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	mulpd	%xmm6, %xmm0	# tmp941, vect__65.328
# src/shallow_water_serial.c:155:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	divpd	%xmm5, %xmm1	# tmp1302, vect__68.331
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	mulpd	%xmm6, %xmm0	# tmp941, vect__66.329
# src/shallow_water_serial.c:155:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	mulpd	%xmm4, %xmm1	# tmp1303, vect__69.332
# src/shallow_water_serial.c:155:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	addpd	%xmm1, %xmm0	# vect__69.332, vect__72.333
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	movlpd	%xmm0, (%r9,%rax)	# vect__72.333, MEM <vector(2) double> [(real_t *)_978 + ivtmp.622_298 * 1]
	movhpd	%xmm0, 8(%r9,%rax)	# vect__72.333, MEM <vector(2) double> [(real_t *)_978 + ivtmp.622_298 * 1]
	addq	$16, %rax	#, ivtmp.622
	cmpq	%r14, %rax	# _121, ivtmp.622
	jne	L30	#,
	cmpq	$0, -32(%rsp)	#, %sfp
	je	L29	#,
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	movq	-96(%rsp), %rax	# %sfp, ivtmp.637
	movq	-72(%rsp), %r14	# %sfp, tmp.307
	addq	%r14, %rax	# tmp.307, tmp895
	leaq	(%rdx,%rax,8), %r8	#, _1077
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	movsd	(%rcx,%rax,8), %xmm6	# *_1079, _1080
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	movsd	(%r8), %xmm1	# *_1077, _1078
# src/shallow_water_serial.c:153:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	movapd	%xmm1, %xmm0	# _1078, tmp896
	mulsd	%xmm1, %xmm0	# _1078, tmp896
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	mulsd	%xmm6, %xmm1	# _1080, tmp901
# src/shallow_water_serial.c:153:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	divsd	%xmm3, %xmm0	# tmp1300, tmp897
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	mulsd	%xmm6, %xmm1	# _1080, tmp902
# src/shallow_water_serial.c:153:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	mulsd	%xmm2, %xmm0	# tmp1301, tmp899
# src/shallow_water_serial.c:153:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	addsd	%xmm1, %xmm0	# tmp902, tmp903
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	movsd	%xmm0, (%rdi,%rax,8)	# tmp903, *_1086
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	movsd	(%r8), %xmm1	# *_1077, _1089
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	movsd	(%rsi,%rax,8), %xmm6	# *_1090, _1091
# src/shallow_water_serial.c:155:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	movapd	%xmm1, %xmm0	# _1089, tmp904
	mulsd	%xmm1, %xmm0	# _1089, tmp904
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	mulsd	%xmm6, %xmm1	# _1091, tmp909
# src/shallow_water_serial.c:155:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	divsd	%xmm3, %xmm0	# tmp1300, tmp905
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	mulsd	%xmm6, %xmm1	# _1091, tmp910
# src/shallow_water_serial.c:155:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	mulsd	%xmm2, %xmm0	# tmp1301, tmp907
# src/shallow_water_serial.c:155:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	addsd	%xmm1, %xmm0	# tmp910, tmp911
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	movsd	%xmm0, (%r12,%rax,8)	# tmp911, *_1097
L29:
# src/shallow_water_serial.c:149:     for (int_t y = 0; y <= N + 1; y++)
	addq	$1, -88(%rsp)	#, %sfp
# src/shallow_water_serial.c:149:     for (int_t y = 0; y <= N + 1; y++)
	addq	%rbp, %r15	# _128, ivtmp.636
	addq	%rbp, %rbx	# _128, ivtmp.638
	addq	%rbp, %r10	# _128, ivtmp.642
	movq	-112(%rsp), %r11	# %sfp, _124
	addq	%rbp, %r9	# _128, ivtmp.644
# src/shallow_water_serial.c:149:     for (int_t y = 0; y <= N + 1; y++)
	movq	-88(%rsp), %rax	# %sfp, y
# src/shallow_water_serial.c:149:     for (int_t y = 0; y <= N + 1; y++)
	addq	%r11, -96(%rsp)	# _124, %sfp
	addq	%rbp, -64(%rsp)	# _128, %sfp
	addq	%rbp, -104(%rsp)	# _128, %sfp
	addq	%rbp, -80(%rsp)	# _128, %sfp
	cmpq	%rax, %r11	# y, _124
	jne	L26	#,
# src/shallow_water_serial.c:158:     for (int_t y = 1; y <= N; y++)
	movq	-120(%rsp), %rcx	# %sfp, N.15_265
	testq	%rcx, %rcx	# N.15_265
	jle	L3	#,
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movq	8+_mass_velocity_x(%rip), %r10	# mass_velocity_x[1], _110
	leaq	1(%rcx), %rax	#, _507
	movq	%r11, %r8	# _124, _124
# src/shallow_water_serial.c:158:     for (int_t y = 1; y <= N; y++)
	movq	$1, -88(%rsp)	#, %sfp
	movq	72(%rsp), %r15	# %sfp, _128
	leaq	(%r11,%rcx), %rdx	#, tmp984
	movq	%rax, -16(%rsp)	# _507, %sfp
	leaq	0(,%rdx,8), %r11	#, ivtmp.446
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movq	_mass_velocity_x(%rip), %r14	# mass_velocity_x[0], _74
	leaq	(%r8,%rax), %rdx	#, tmp985
# src/shallow_water_serial.c:163:                     + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
	movq	_mass_velocity(%rip), %rsi	# mass_velocity, mass_velocity.52_100
	movq	%r11, -8(%rsp)	# ivtmp.446, %sfp
	leaq	0(,%rdx,8), %rax	#, _1226
	movsd	lC4(%rip), %xmm2	#, tmp1290
	leaq	(%r10,%rax), %rdx	#, ivtmp.597
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movq	%r15, -80(%rsp)	# _128, %sfp
	movq	%rdx, -72(%rsp)	# ivtmp.597, %sfp
	leaq	16(%r15), %rdx	#, ivtmp.607
	movddup	%xmm2, %xmm3	#, tmp1298
	movq	%rdx, -64(%rsp)	# ivtmp.607, %sfp
	leaq	8(%r15), %rbx	#, _28
	movq	%rcx, %rdx	# N.15_265, bnd.271
	movq	%r14, 80(%rsp)	# _74, %sfp
	leaq	(%r10,%rbx), %r9	#, ivtmp.595
	shrq	%rdx	# bnd.271
	salq	$4, %rdx	#, bnd.271
	movq	%rbx, 24(%rsp)	# _28, %sfp
	movq	%rdx, -104(%rsp)	# bnd.271, %sfp
	movq	%rcx, %rdx	# N.15_265, _680
	orq	$1, %rcx	#, tmp.273
	movq	%rcx, -48(%rsp)	# tmp.273, %sfp
	movq	%r10, %rcx	# _110, tmp1291
	andq	$-2, %rdx	#, _680
	subq	%r14, %rcx	# _74, tmp1291
	movq	%rdx, 8(%rsp)	# _680, %sfp
	addq	$2, %rdx	#, _850
	movq	%rcx, -56(%rsp)	# tmp1291, %sfp
	movq	%r10, %rcx	# _110, tmp1292
	subq	%rdi, %rcx	# acceleration_x.32_58, tmp1292
	movq	%rdx, -96(%rsp)	# _850, %sfp
	movq	%r14, %rdx	# _74, _74
	movq	%rcx, -32(%rsp)	# tmp1292, %sfp
	movq	%r10, %rcx	# _110, tmp1293
	subq	%rsi, %rcx	# mass_velocity.52_100, tmp1293
	cmpq	$1, -120(%rsp)	#, %sfp
	movq	%rax, 32(%rsp)	# _1226, %sfp
	movq	%rcx, -24(%rsp)	# tmp1293, %sfp
	je	L66	#,
	.p2align 4,,10
	.p2align 3
L130:
	cmpq	$16, -56(%rsp)	#, %sfp
	leaq	8+_dx(%rip), %rbx	#, tmp1687
	movq	-72(%rsp), %r14	# %sfp, ivtmp.597
	seta	%cl	#, tmp1039
	cmpq	$16, -32(%rsp)	#, %sfp
	seta	%al	#, tmp1042
	andl	%ecx, %eax	# tmp1039, tmp1043
	cmpq	$16, -24(%rsp)	#, %sfp
	seta	%cl	#, tmp1046
	andl	%ecx, %eax	# tmp1046, tmp1047
	leaq	_dx(%rip), %rcx	#, tmp1685
	cmpq	%r14, %rcx	# ivtmp.597, tmp1685
	setnb	%cl	#, tmp1050
	cmpq	%rbx, %r9	# tmp1687, ivtmp.595
	setnb	%bl	#, tmp1053
	orl	%ebx, %ecx	# tmp1053, tmp1054
	testb	%cl, %al	# tmp1054, tmp1047
	je	L66	#,
	leaq	8+_dt(%rip), %rax	#, tmp1688
	cmpq	%rax, %r9	# tmp1688, ivtmp.595
	setnb	%cl	#, tmp1058
	subq	$8, %rax	#, tmp1689
	cmpq	%r14, %rax	# ivtmp.597, tmp1689
	setnb	%al	#, tmp1061
	orb	%cl, %al	# tmp1058, tmp1309
	je	L66	#,
	movq	-64(%rsp), %rax	# %sfp, ivtmp.607
# src/shallow_water_serial.c:162:                     (DU(y, x + 1) - DU(y, x - 1)) / (2 * dx)
	movq	%r8, (%rsp)	# ivtmp.593, %sfp
	movq	-80(%rsp), %rcx	# %sfp, ivtmp.592
	movsd	_dx(%rip), %xmm5	# dx, dx
	movq	-104(%rsp), %r8	# %sfp, _49
	addsd	%xmm5, %xmm5	# dx, _508
	movsd	_dt(%rip), %xmm4	# dt, dt.57_944
	leaq	(%rax,%rdx), %r14	#, vectp.275
	leaq	(%rcx,%rdx), %r13	#, vectp.278
	leaq	(%rdi,%rax), %r12	#, vectp.283
	movddup	%xmm4, %xmm7	# dt.57_944, vect_cst__945
	leaq	(%rdi,%rcx), %rbp	#, vectp.286
	addq	%rsi, %rcx	# mass_velocity.52_100, vectp.295
	movddup	%xmm5, %xmm6	# _508, vect__98.289
	leaq	(%rax,%rsi), %rbx	#, vectp.292
	xorl	%eax, %eax	# ivtmp.573
	.p2align 4,,10
	.p2align 3
L40:
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movq	(%r14,%rax), %xmm0	# MEM <vector(2) double> [(real_t *)vectp.275_893 + ivtmp.573_47 * 1], vect__82.276
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movq	0(%r13,%rax), %xmm1	# MEM <vector(2) double> [(real_t *)vectp.278_900 + ivtmp.573_47 * 1], vect__88.279
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movhpd	8(%r14,%rax), %xmm0	# MEM <vector(2) double> [(real_t *)vectp.275_893 + ivtmp.573_47 * 1], vect__82.276
# src/shallow_water_serial.c:163:                     + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
	movq	(%rcx,%rax), %xmm9	# MEM <vector(2) double> [(real_t *)vectp.295_935 + ivtmp.573_47 * 1], vect__104.296
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movhpd	8(%r13,%rax), %xmm1	# MEM <vector(2) double> [(real_t *)vectp.278_900 + ivtmp.573_47 * 1], vect__88.279
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	addpd	%xmm1, %xmm0	# vect__88.279, vect__89.280
# src/shallow_water_serial.c:162:                     (DU(y, x + 1) - DU(y, x - 1)) / (2 * dx)
	movq	0(%rbp,%rax), %xmm1	# MEM <vector(2) double> [(real_t *)vectp.286_916 + ivtmp.573_47 * 1], vect__95.287
# src/shallow_water_serial.c:163:                     + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
	movhpd	8(%rcx,%rax), %xmm9	# MEM <vector(2) double> [(real_t *)vectp.295_935 + ivtmp.573_47 * 1], vect__104.296
# src/shallow_water_serial.c:162:                     (DU(y, x + 1) - DU(y, x - 1)) / (2 * dx)
	movhpd	8(%rbp,%rax), %xmm1	# MEM <vector(2) double> [(real_t *)vectp.286_916 + ivtmp.573_47 * 1], vect__95.287
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	mulpd	%xmm3, %xmm0	# tmp1298, vect__89.280
	movapd	%xmm0, %xmm8	# vect__89.280, vect__90.281
# src/shallow_water_serial.c:162:                     (DU(y, x + 1) - DU(y, x - 1)) / (2 * dx)
	movq	(%r12,%rax), %xmm0	# MEM <vector(2) double> [(real_t *)vectp.283_909 + ivtmp.573_47 * 1], vect__93.284
	movhpd	8(%r12,%rax), %xmm0	# MEM <vector(2) double> [(real_t *)vectp.283_909 + ivtmp.573_47 * 1], vect__93.284
# src/shallow_water_serial.c:162:                     (DU(y, x + 1) - DU(y, x - 1)) / (2 * dx)
	subpd	%xmm1, %xmm0	# vect__95.287, vect__96.288
# src/shallow_water_serial.c:163:                     + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
	movq	(%rbx,%rax), %xmm1	# MEM <vector(2) double> [(real_t *)vectp.292_928 + ivtmp.573_47 * 1], vect__102.293
	movhpd	8(%rbx,%rax), %xmm1	# MEM <vector(2) double> [(real_t *)vectp.292_928 + ivtmp.573_47 * 1], vect__102.293
# src/shallow_water_serial.c:163:                     + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
	subpd	%xmm9, %xmm1	# vect__104.296, vect__105.297
# src/shallow_water_serial.c:162:                     (DU(y, x + 1) - DU(y, x - 1)) / (2 * dx)
	divpd	%xmm6, %xmm0	# vect__98.289, vect__99.290
# src/shallow_water_serial.c:163:                     + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
	divpd	%xmm6, %xmm1	# vect__98.289, vect__106.298
# src/shallow_water_serial.c:163:                     + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
	addpd	%xmm1, %xmm0	# vect__106.298, vect__107.299
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movapd	%xmm8, %xmm1	# vect__90.281, vect__90.281
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	mulpd	%xmm7, %xmm0	# vect_cst__945, vect__109.300
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	subpd	%xmm0, %xmm1	# vect__109.300, vect__90.281
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movlpd	%xmm1, (%r9,%rax)	# vect__115.301, MEM <vector(2) double> [(real_t *)_236 + ivtmp.573_47 * 1]
	movhpd	%xmm1, 8(%r9,%rax)	# vect__115.301, MEM <vector(2) double> [(real_t *)_236 + ivtmp.573_47 * 1]
	addq	$16, %rax	#, ivtmp.573
	cmpq	%r8, %rax	# _49, ivtmp.573
	jne	L40	#,
	movq	8(%rsp), %rbx	# %sfp, _680
	cmpq	%rbx, -120(%rsp)	# _680, %sfp
	movq	(%rsp), %r8	# %sfp, ivtmp.593
	je	L39	#,
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movq	-96(%rsp), %rax	# %sfp, _850
	leaq	(%r8,%rax), %rcx	#, tmp987
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	leaq	(%r8,%rbx), %rax	#, tmp988
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movsd	(%rdx,%rcx,8), %xmm0	# *_854, *_854
	addsd	(%rdx,%rax,8), %xmm0	# *_860, tmp990
# src/shallow_water_serial.c:163:                     + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
	movsd	(%rsi,%rcx,8), %xmm6	# *_872, *_872
	subsd	(%rsi,%rax,8), %xmm6	# *_874, tmp997
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movapd	%xmm0, %xmm1	# tmp990, tmp990
# src/shallow_water_serial.c:162:                     (DU(y, x + 1) - DU(y, x - 1)) / (2 * dx)
	movsd	(%rdi,%rcx,8), %xmm0	# *_864, *_864
	subsd	(%rdi,%rax,8), %xmm0	# *_866, tmp994
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	mulsd	%xmm2, %xmm1	# tmp1290, tmp990
# src/shallow_water_serial.c:163:                     + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
	divsd	%xmm5, %xmm6	# _508, tmp999
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movq	-48(%rsp), %rbx	# %sfp, tmp.273
	addq	%r8, %rbx	# ivtmp.593, tmp989
# src/shallow_water_serial.c:162:                     (DU(y, x + 1) - DU(y, x - 1)) / (2 * dx)
	divsd	%xmm5, %xmm0	# _508, tmp996
# src/shallow_water_serial.c:163:                     + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
	addsd	%xmm6, %xmm0	# tmp999, tmp1000
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	mulsd	%xmm4, %xmm0	# dt.57_944, tmp1001
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	subsd	%xmm0, %xmm1	# tmp1001, tmp1002
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movsd	%xmm1, (%r10,%rbx,8)	# tmp1002, *_884
L39:
# src/shallow_water_serial.c:158:     for (int_t y = 1; y <= N; y++)
	movq	-88(%rsp), %rax	# %sfp, y
# src/shallow_water_serial.c:158:     for (int_t y = 1; y <= N; y++)
	addq	%r15, %r11	# _128, ivtmp.594
	addq	%r15, %r9	# _128, ivtmp.595
	movq	-112(%rsp), %rcx	# %sfp, _124
	addq	%r15, -80(%rsp)	# _128, %sfp
	addq	%r15, -72(%rsp)	# _128, %sfp
	addq	%r15, -64(%rsp)	# _128, %sfp
# src/shallow_water_serial.c:158:     for (int_t y = 1; y <= N; y++)
	addq	$1, %rax	#, y
# src/shallow_water_serial.c:158:     for (int_t y = 1; y <= N; y++)
	addq	%rcx, %r8	# _124, ivtmp.593
	cmpq	%rax, -16(%rsp)	# y, %sfp
	je	L42	#,
	cmpq	$1, -120(%rsp)	#, %sfp
# src/shallow_water_serial.c:158:     for (int_t y = 1; y <= N; y++)
	movq	%rax, -88(%rsp)	# y, %sfp
	jne	L130	#,
L66:
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movq	-80(%rsp), %rax	# %sfp, ivtmp.568
	.p2align 4,,10
	.p2align 3
L38:
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movsd	16(%rdx,%rax), %xmm0	# MEM[(real_t *)_74 + 16B + ivtmp.568_17 * 1], MEM[(real_t *)_74 + 16B + ivtmp.568_17 * 1]
	addsd	(%rdx,%rax), %xmm0	# MEM[(real_t *)_74 + ivtmp.568_17 * 1], tmp1004
# src/shallow_water_serial.c:162:                     (DU(y, x + 1) - DU(y, x - 1)) / (2 * dx)
	movsd	_dx(%rip), %xmm5	# dx, dx
# src/shallow_water_serial.c:163:                     + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
	movsd	16(%rsi,%rax), %xmm4	# MEM[(real_t *)mass_velocity.52_100 + 16B + ivtmp.568_17 * 1], MEM[(real_t *)mass_velocity.52_100 + 16B + ivtmp.568_17 * 1]
# src/shallow_water_serial.c:162:                     (DU(y, x + 1) - DU(y, x - 1)) / (2 * dx)
	addsd	%xmm5, %xmm5	# dx, _828
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movapd	%xmm0, %xmm1	# tmp1004, tmp1004
# src/shallow_water_serial.c:162:                     (DU(y, x + 1) - DU(y, x - 1)) / (2 * dx)
	movsd	16(%rdi,%rax), %xmm0	# MEM[(real_t *)acceleration_x.32_58 + 16B + ivtmp.568_17 * 1], MEM[(real_t *)acceleration_x.32_58 + 16B + ivtmp.568_17 * 1]
# src/shallow_water_serial.c:163:                     + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
	subsd	(%rsi,%rax), %xmm4	# MEM[(real_t *)mass_velocity.52_100 + ivtmp.568_17 * 1], tmp1011
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	mulsd	%xmm2, %xmm1	# tmp1290, tmp1004
# src/shallow_water_serial.c:162:                     (DU(y, x + 1) - DU(y, x - 1)) / (2 * dx)
	subsd	(%rdi,%rax), %xmm0	# MEM[(real_t *)acceleration_x.32_58 + ivtmp.568_17 * 1], tmp1008
# src/shallow_water_serial.c:163:                     + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
	divsd	%xmm5, %xmm4	# _828, tmp1013
# src/shallow_water_serial.c:162:                     (DU(y, x + 1) - DU(y, x - 1)) / (2 * dx)
	divsd	%xmm5, %xmm0	# _828, tmp1010
# src/shallow_water_serial.c:163:                     + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
	addsd	%xmm4, %xmm0	# tmp1013, tmp1014
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	mulsd	_dt(%rip), %xmm0	# dt, tmp1015
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	subsd	%xmm0, %xmm1	# tmp1015, tmp1016
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movsd	%xmm1, 8(%r10,%rax)	# tmp1016, MEM[(real_t *)_110 + 8B + ivtmp.568_17 * 1]
# src/shallow_water_serial.c:159:         for (int_t x = 1; x <= N; x++)
	addq	$8, %rax	#, ivtmp.568
	cmpq	%r11, %rax	# ivtmp.594, ivtmp.568
	jne	L38	#,
	jmp	L39	#
	.p2align 4,,10
	.p2align 3
L65:
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	movq	%r15, %rax	# ivtmp.636, ivtmp.618
	.p2align 4,,10
	.p2align 3
L28:
	movsd	(%rdx,%rax), %xmm1	# MEM[(real_t *)_42 + ivtmp.618_106 * 1], _1045
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	movsd	(%rcx,%rax), %xmm6	# MEM[(real_t *)velocity_x.26_50 + ivtmp.618_106 * 1], _1047
# src/shallow_water_serial.c:153:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	movapd	%xmm1, %xmm0	# _1045, tmp912
	mulsd	%xmm1, %xmm0	# _1045, tmp912
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	mulsd	%xmm6, %xmm1	# _1047, tmp917
# src/shallow_water_serial.c:153:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	divsd	%xmm3, %xmm0	# tmp1300, tmp913
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	mulsd	%xmm6, %xmm1	# _1047, tmp918
# src/shallow_water_serial.c:153:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	mulsd	%xmm2, %xmm0	# tmp1301, tmp915
# src/shallow_water_serial.c:153:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	addsd	%xmm1, %xmm0	# tmp918, tmp919
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	movsd	%xmm0, (%rdi,%rax)	# tmp919, MEM[(real_t *)acceleration_x.32_58 + ivtmp.618_106 * 1]
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	movsd	(%rdx,%rax), %xmm1	# MEM[(real_t *)_42 + ivtmp.618_106 * 1], _1056
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	movsd	(%rsi,%rax), %xmm6	# MEM[(real_t *)velocity_y.35_62 + ivtmp.618_106 * 1], _1058
# src/shallow_water_serial.c:155:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	movapd	%xmm1, %xmm0	# _1056, tmp920
	mulsd	%xmm1, %xmm0	# _1056, tmp920
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	mulsd	%xmm6, %xmm1	# _1058, tmp925
# src/shallow_water_serial.c:155:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	divsd	%xmm3, %xmm0	# tmp1300, tmp921
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	mulsd	%xmm6, %xmm1	# _1058, tmp926
# src/shallow_water_serial.c:155:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	mulsd	%xmm2, %xmm0	# tmp1301, tmp923
# src/shallow_water_serial.c:155:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	addsd	%xmm1, %xmm0	# tmp926, tmp927
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	movsd	%xmm0, (%r12,%rax)	# tmp927, MEM[(real_t *)acceleration_y.41_70 + ivtmp.618_106 * 1]
# src/shallow_water_serial.c:150:         for (int_t x = 0; x <= N + 1; x++)
	addq	$8, %rax	#, ivtmp.618
	cmpq	%rbx, %rax	# ivtmp.638, ivtmp.618
	jne	L28	#,
	jmp	L29	#
	.p2align 4,,10
	.p2align 3
L22:
	leaq	0(,%r13,8), %rax	#, ivtmp.668
	.p2align 4,,10
	.p2align 3
L17:
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	movsd	8(%rdi,%rax), %xmm0	# MEM[(real_t *)_9 + 8B + ivtmp.668_1418 * 1], MEM[(real_t *)_9 + 8B + ivtmp.668_1418 * 1]
	mulsd	8(%rcx,%rax), %xmm0	# MEM[(real_t *)velocity_x.8_12 + 8B + ivtmp.668_1418 * 1], tmp874
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	mulsd	8(%rsi,%rax), %xmm0	# MEM[(real_t *)velocity_y.12_19 + 8B + ivtmp.668_1418 * 1], tmp876
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	movsd	%xmm0, 8(%r10,%rax)	# tmp876, MEM[(real_t *)mass_velocity.21_38 + 8B + ivtmp.668_1418 * 1]
# src/shallow_water_serial.c:144:         for (int_t x = 1; x <= N; x++)
	addq	$8, %rax	#, ivtmp.668
	cmpq	%rax, %rdx	# ivtmp.668, ivtmp.687
	jne	L17	#,
	jmp	L18	#
	.p2align 4,,10
	.p2align 3
L13:
	movq	-88(%rsp), %rax	# %sfp, ivtmp.738
	salq	$3, %rax	#, ivtmp.718
	.p2align 4,,10
	.p2align 3
L7:
# src/shallow_water_serial.c:139:             U(y, x) = PNU(y, x) / PN(y, x);
	movsd	8(%rbx,%rax), %xmm0	# MEM[(real_t *)_1 + 8B + ivtmp.718_151 * 1], MEM[(real_t *)_1 + 8B + ivtmp.718_151 * 1]
	divsd	8(%rdx,%rax), %xmm0	# MEM[(real_t *)_9 + 8B + ivtmp.718_151 * 1], tmp825
# src/shallow_water_serial.c:139:             U(y, x) = PNU(y, x) / PN(y, x);
	movsd	%xmm0, 8(%rcx,%rax)	# tmp825, MEM[(real_t *)velocity_x.8_12 + 8B + ivtmp.718_151 * 1]
# src/shallow_water_serial.c:140:             V(y, x) = PNV(y, x) / PN(y, x);
	movsd	8(%r10,%rax), %xmm0	# MEM[(real_t *)_15 + 8B + ivtmp.718_151 * 1], MEM[(real_t *)_15 + 8B + ivtmp.718_151 * 1]
	divsd	8(%rdx,%rax), %xmm0	# MEM[(real_t *)_9 + 8B + ivtmp.718_151 * 1], tmp827
# src/shallow_water_serial.c:140:             V(y, x) = PNV(y, x) / PN(y, x);
	movsd	%xmm0, 8(%rsi,%rax)	# tmp827, MEM[(real_t *)velocity_y.12_19 + 8B + ivtmp.718_151 * 1]
# src/shallow_water_serial.c:137:         for (int_t x = 1; x <= N; x++)
	addq	$8, %rax	#, ivtmp.718
	cmpq	%rax, %r15	# ivtmp.718, ivtmp.739
	jne	L7	#,
	jmp	L8	#
L42:
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movq	8+_mass_velocity_y(%rip), %r15	# mass_velocity_y[1], _153
	movq	%rcx, %rdx	# _124, _124
	movq	%rcx, %rdi	# _124, ivtmp.443
	movq	%rsi, %r9	# mass_velocity.52_100, mass_velocity.52_100
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movq	32(%rsp), %rax	# %sfp, _1226
	salq	$4, %rdi	#, ivtmp.443
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movq	%rdx, -80(%rsp)	# _124, %sfp
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movq	24(%rsp), %rbx	# %sfp, _28
	movq	%rdi, -56(%rsp)	# ivtmp.443, %sfp
	leaq	(%rsi,%rdi), %r10	#, ivtmp.526
	movq	_mass_velocity_y(%rip), %r12	# mass_velocity_y[0], _116
# src/shallow_water_serial.c:167:     for (int_t y = 1; y <= N; y++)
	movq	$1, -24(%rsp)	#, %sfp
	movq	-40(%rsp), %rcx	# %sfp, acceleration_y.41_70
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movq	%r15, -32(%rsp)	# _153, %sfp
	leaq	(%r15,%rax), %r11	#, ivtmp.537
	movq	16(%rsp), %rdx	# %sfp, ivtmp.525
	movq	%rax, 96(%rsp)	# _1226, %sfp
	movq	%r11, -16(%rsp)	# ivtmp.537, %sfp
	movq	72(%rsp), %r11	# %sfp, _128
	leaq	(%r12,%rdi), %rbp	#, ivtmp.521
	movq	%rbx, 88(%rsp)	# _28, %sfp
	movsd	lC4(%rip), %xmm2	#, tmp1283
	leaq	(%rcx,%rdi), %r14	#, ivtmp.524
	movq	%rsi, %rcx	# mass_velocity.52_100, ivtmp.527
	leaq	(%r15,%rbx), %rdi	#, ivtmp.531
	movq	-48(%rsp), %rbx	# %sfp, tmp.273
	movq	%r12, %r15	# _116, ivtmp.523
	movddup	%xmm2, %xmm3	#, tmp1288
	.p2align 4,,10
	.p2align 3
L51:
	movq	-24(%rsp), %rax	# %sfp, _117
	movq	-80(%rsp), %rsi	# %sfp, ivtmp.528
	movq	-112(%rsp), %r8	# %sfp, _124
	movq	%rax, (%rsp)	# _117, %sfp
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	addq	$1, %rax	#, _117
	movq	%rax, -24(%rsp)	# _117, %sfp
	movq	%rsi, %rax	# ivtmp.528, ivtmp.528
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	subq	%r8, %rax	# _124, _126
	movq	%rsi, -64(%rsp)	# ivtmp.528, %sfp
	addq	%r8, %rsi	# _124, ivtmp.528
	cmpq	$1, -120(%rsp)	#, %sfp
	movq	%rsi, -80(%rsp)	# ivtmp.528, %sfp
	movq	%rax, -72(%rsp)	# _126, %sfp
	je	L67	#,
	leaq	16(%r10), %rax	#, tmp1117
	movq	-16(%rsp), %r13	# %sfp, ivtmp.537
	leaq	16(%r14), %rsi	#, tmp1120
	cmpq	%rax, %rdi	# tmp1117, ivtmp.531
	leaq	8+_dx(%rip), %r8	#, tmp1745
	setne	%al	#, tmp1119
	cmpq	%rsi, %rdi	# tmp1120, ivtmp.531
	setne	%sil	#, tmp1122
	andl	%esi, %eax	# tmp1122, tmp1123
	leaq	16(%rbp), %rsi	#, tmp1124
	cmpq	%rsi, %rdi	# tmp1124, ivtmp.531
	setne	%sil	#, tmp1126
	andl	%esi, %eax	# tmp1126, tmp1127
	leaq	16(%rdx), %rsi	#, tmp1128
	cmpq	%rsi, %rdi	# tmp1128, ivtmp.531
	setne	%sil	#, tmp1130
	andl	%esi, %eax	# tmp1130, tmp1131
	leaq	16(%rcx), %rsi	#, tmp1132
	cmpq	%rsi, %rdi	# tmp1132, ivtmp.531
	setne	%sil	#, tmp1134
	andl	%esi, %eax	# tmp1134, tmp1135
	leaq	16(%r15), %rsi	#, tmp1136
	cmpq	%rsi, %rdi	# tmp1136, ivtmp.531
	setne	%sil	#, tmp1138
	andl	%esi, %eax	# tmp1138, tmp1139
	leaq	_dx(%rip), %rsi	#, tmp1743
	cmpq	%r13, %rsi	# ivtmp.537, tmp1743
	setnb	%sil	#, tmp1142
	cmpq	%r8, %rdi	# tmp1745, ivtmp.531
	setnb	%r8b	#, tmp1145
	orl	%r8d, %esi	# tmp1145, tmp1146
	testb	%sil, %al	# tmp1146, tmp1139
	je	L67	#,
	leaq	_dt(%rip), %rax	#, tmp1746
	cmpq	%r13, %rax	# ivtmp.537, tmp1746
	setnb	%sil	#, tmp1150
	addq	$8, %rax	#, tmp1748
	cmpq	%rax, %rdi	# tmp1748, ivtmp.531
	setnb	%al	#, tmp1153
	orb	%sil, %al	# tmp1150, tmp1310
	je	L67	#,
	leaq	8(%r15), %rax	#, vectp.244
# src/shallow_water_serial.c:171:                     (DV(y + 1, x) - DV(y - 1, x)) / (2 * dx)
	movsd	_dx(%rip), %xmm5	# dx, dx
	movq	%r9, 40(%rsp)	# mass_velocity.52_100, %sfp
	leaq	8(%r14), %rsi	#, vectp.249
	movq	%rax, 32(%rsp)	# vectp.244, %sfp
	xorl	%eax, %eax	# ivtmp.502
	movsd	_dt(%rip), %xmm4	# dt, dt.73_286
	leaq	8(%rdx), %r8	#, vectp.252
	movq	%rsi, 24(%rsp)	# vectp.249, %sfp
	addsd	%xmm5, %xmm5	# dx, _538
	movq	%r8, 16(%rsp)	# vectp.252, %sfp
	movq	16(%rsp), %r9	# %sfp, vectp.252
	leaq	8(%rbp), %r13	#, vectp.241
	movddup	%xmm4, %xmm7	# dt.73_286, vect_cst__285
	movq	%r12, 48(%rsp)	# _116, %sfp
	movq	32(%rsp), %r12	# %sfp, vectp.244
	leaq	8(%r10), %r8	#, vectp.258
	movq	%r11, 56(%rsp)	# _128, %sfp
	movq	24(%rsp), %r11	# %sfp, vectp.249
	leaq	8(%rcx), %rsi	#, vectp.261
	movddup	%xmm5, %xmm6	# _538, vect__141.255
	.p2align 4,,10
	.p2align 3
L49:
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movq	(%r12,%rax), %xmm0	# MEM <vector(2) double> [(real_t *)vectp.244_360 + ivtmp.502_1035 * 1], vect__131.245
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movq	0(%r13,%rax), %xmm1	# MEM <vector(2) double> [(real_t *)vectp.241_367 + ivtmp.502_1035 * 1], vect__124.242
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movhpd	8(%r12,%rax), %xmm0	# MEM <vector(2) double> [(real_t *)vectp.244_360 + ivtmp.502_1035 * 1], vect__131.245
# src/shallow_water_serial.c:171:                     (DV(y + 1, x) - DV(y - 1, x)) / (2 * dx)
	movq	(%r9,%rax), %xmm9	# MEM <vector(2) double> [(real_t *)vectp.252_343 + ivtmp.502_1035 * 1], vect__138.253
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movhpd	8(%r13,%rax), %xmm1	# MEM <vector(2) double> [(real_t *)vectp.241_367 + ivtmp.502_1035 * 1], vect__124.242
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	addpd	%xmm1, %xmm0	# vect__124.242, vect__132.246
# src/shallow_water_serial.c:172:                     + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx)
	movq	(%rsi,%rax), %xmm1	# MEM <vector(2) double> [(real_t *)vectp.261_319 + ivtmp.502_1035 * 1], vect__147.262
# src/shallow_water_serial.c:171:                     (DV(y + 1, x) - DV(y - 1, x)) / (2 * dx)
	movhpd	8(%r9,%rax), %xmm9	# MEM <vector(2) double> [(real_t *)vectp.252_343 + ivtmp.502_1035 * 1], vect__138.253
# src/shallow_water_serial.c:172:                     + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx)
	movhpd	8(%rsi,%rax), %xmm1	# MEM <vector(2) double> [(real_t *)vectp.261_319 + ivtmp.502_1035 * 1], vect__147.262
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	mulpd	%xmm3, %xmm0	# tmp1288, vect__132.246
	movapd	%xmm0, %xmm8	# vect__132.246, vect__133.247
# src/shallow_water_serial.c:172:                     + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx)
	movq	(%r8,%rax), %xmm0	# MEM <vector(2) double> [(real_t *)vectp.258_330 + ivtmp.502_1035 * 1], vect__145.259
	movhpd	8(%r8,%rax), %xmm0	# MEM <vector(2) double> [(real_t *)vectp.258_330 + ivtmp.502_1035 * 1], vect__145.259
# src/shallow_water_serial.c:172:                     + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx)
	subpd	%xmm1, %xmm0	# vect__147.262, vect__148.263
# src/shallow_water_serial.c:171:                     (DV(y + 1, x) - DV(y - 1, x)) / (2 * dx)
	movq	(%r11,%rax), %xmm1	# MEM <vector(2) double> [(real_t *)vectp.249_350 + ivtmp.502_1035 * 1], vect__136.250
	movhpd	8(%r11,%rax), %xmm1	# MEM <vector(2) double> [(real_t *)vectp.249_350 + ivtmp.502_1035 * 1], vect__136.250
# src/shallow_water_serial.c:171:                     (DV(y + 1, x) - DV(y - 1, x)) / (2 * dx)
	subpd	%xmm9, %xmm1	# vect__138.253, vect__139.254
# src/shallow_water_serial.c:172:                     + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx)
	divpd	%xmm6, %xmm0	# vect__141.255, vect__149.264
# src/shallow_water_serial.c:171:                     (DV(y + 1, x) - DV(y - 1, x)) / (2 * dx)
	divpd	%xmm6, %xmm1	# vect__141.255, vect__142.256
# src/shallow_water_serial.c:172:                     + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx)
	addpd	%xmm1, %xmm0	# vect__142.256, vect__150.265
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movapd	%xmm8, %xmm1	# vect__133.247, vect__133.247
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	mulpd	%xmm7, %xmm0	# vect_cst__285, vect__152.266
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	subpd	%xmm0, %xmm1	# vect__152.266, vect__133.247
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movlpd	%xmm1, (%rdi,%rax)	# vect__159.267, MEM <vector(2) double> [(real_t *)_539 + ivtmp.502_1035 * 1]
	movhpd	%xmm1, 8(%rdi,%rax)	# vect__159.267, MEM <vector(2) double> [(real_t *)_539 + ivtmp.502_1035 * 1]
	addq	$16, %rax	#, ivtmp.502
	cmpq	%rax, -104(%rsp)	# ivtmp.502, %sfp
	jne	L49	#,
	movq	8(%rsp), %rsi	# %sfp, _680
	cmpq	%rsi, -120(%rsp)	# _680, %sfp
	movq	40(%rsp), %r9	# %sfp, mass_velocity.52_100
	movq	48(%rsp), %r12	# %sfp, _116
	movq	56(%rsp), %r11	# %sfp, _128
	je	L48	#,
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movq	-80(%rsp), %rax	# %sfp, ivtmp.528
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movq	-72(%rsp), %rsi	# %sfp, _126
# src/shallow_water_serial.c:171:                     (DV(y + 1, x) - DV(y - 1, x)) / (2 * dx)
	movq	-40(%rsp), %r13	# %sfp, acceleration_y.41_70
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movq	-64(%rsp), %r8	# %sfp, ivtmp.528
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	addq	%rbx, %rax	# tmp.273, tmp1063
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	addq	%rbx, %rsi	# tmp.273, _126
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movsd	(%r12,%rsi,8), %xmm0	# *_401, *_401
	addsd	(%r12,%rax,8), %xmm0	# *_406, tmp1066
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	addq	%rbx, %r8	# tmp.273, ivtmp.528
# src/shallow_water_serial.c:171:                     (DV(y + 1, x) - DV(y - 1, x)) / (2 * dx)
	movsd	0(%r13,%rax,8), %xmm6	# *_397, *_397
	subsd	0(%r13,%rsi,8), %xmm6	# *_395, tmp1073
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movapd	%xmm0, %xmm1	# tmp1066, tmp1066
# src/shallow_water_serial.c:172:                     + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx)
	movsd	(%r9,%rax,8), %xmm0	# *_389, *_389
	subsd	(%r9,%rsi,8), %xmm0	# *_387, tmp1070
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	mulsd	%xmm2, %xmm1	# tmp1283, tmp1066
# src/shallow_water_serial.c:171:                     (DV(y + 1, x) - DV(y - 1, x)) / (2 * dx)
	divsd	%xmm5, %xmm6	# _538, tmp1075
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movq	-32(%rsp), %rax	# %sfp, _153
# src/shallow_water_serial.c:172:                     + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx)
	divsd	%xmm5, %xmm0	# _538, tmp1072
# src/shallow_water_serial.c:172:                     + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx)
	addsd	%xmm6, %xmm0	# tmp1075, tmp1076
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	mulsd	%xmm4, %xmm0	# dt.73_286, tmp1077
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	subsd	%xmm0, %xmm1	# tmp1077, tmp1078
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movsd	%xmm1, (%rax,%r8,8)	# tmp1078, *_377
L48:
# src/shallow_water_serial.c:167:     for (int_t y = 1; y <= N; y++)
	addq	%r11, -16(%rsp)	# _128, %sfp
	addq	%r11, %rbp	# _128, ivtmp.521
	addq	%r11, %r15	# _128, ivtmp.523
	addq	%r11, %r14	# _128, ivtmp.524
	movq	(%rsp), %rsi	# %sfp, y
	addq	%r11, %rdx	# _128, ivtmp.525
	addq	%r11, %r10	# _128, ivtmp.526
	addq	%r11, %rcx	# _128, ivtmp.527
	addq	%r11, %rdi	# _128, ivtmp.531
	cmpq	%rsi, -88(%rsp)	# y, %sfp
	jne	L51	#,
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movq	8+_mass(%rip), %r15	# mass[1], _212
	xorl	%r11d, %r11d	# ivtmp.444
	movq	$0, -80(%rsp)	#, %sfp
	movq	96(%rsp), %rax	# %sfp, _1226
# src/shallow_water_serial.c:176:     for (int_t y = 1; y <= N; y++)
	movq	$1, -32(%rsp)	#, %sfp
	movq	72(%rsp), %rdx	# %sfp, _128
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movq	88(%rsp), %rbx	# %sfp, _28
	movsd	lC6(%rip), %xmm2	#, tmp1273
	movq	%r15, %r13	# _212, _212
	addq	%r15, %rax	# _212, ivtmp.457
	movq	%rax, -24(%rsp)	# ivtmp.457, %sfp
	movq	-112(%rsp), %rax	# %sfp, _124
	movq	%rdx, %rbp	# _128, ivtmp.442
	movq	%rdx, -40(%rsp)	# _128, %sfp
	leaq	(%r15,%rbx), %rsi	#, ivtmp.449
	negq	%rbp	# ivtmp.442
	movq	%rbp, -16(%rsp)	# ivtmp.442, %sfp
	movq	%rdx, %rbp	# _128, _128
	addq	%rax, %rax	# _458
	movq	%rax, 16(%rsp)	# _458, %sfp
	movq	80(%rsp), %rax	# %sfp, _74
	leaq	(%rdx,%rax), %rdi	#, _970
	movq	64(%rsp), %rdx	# %sfp, _42
	movq	%rax, %rcx	# _74, _74
	movq	%rdi, 80(%rsp)	# _970, %sfp
	leaq	16(%rdx), %rdi	#, _444
	movq	%rdi, (%rsp)	# _444, %sfp
	leaq	16(%r12), %rdi	#, _420
	movq	%rdi, 24(%rsp)	# _420, %sfp
	movq	%r15, %rdi	# _212, tmp1276
	subq	%rdx, %rdi	# _42, tmp1276
	movq	%rdi, 32(%rsp)	# tmp1276, %sfp
	movq	%r15, %rdi	# _212, tmp1277
	subq	%rax, %rdi	# _74, tmp1277
	movq	%rdi, 40(%rsp)	# tmp1277, %sfp
	movq	-48(%rsp), %rdi	# %sfp, tmp.273
	.p2align 4,,10
	.p2align 3
L52:
	movq	-112(%rsp), %rax	# %sfp, _124
	movq	%r11, %rbx	# ivtmp.444, ivtmp.444
	movq	%r11, -64(%rsp)	# ivtmp.444, %sfp
	addq	%rax, %r11	# _124, ivtmp.444
	movq	-32(%rsp), %rax	# %sfp, _176
	movq	%rax, -48(%rsp)	# _176, %sfp
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	addq	$1, %rax	#, _176
	movq	%rax, -32(%rsp)	# _176, %sfp
	movq	16(%rsp), %rax	# %sfp, _458
	addq	%rbx, %rax	# ivtmp.444, _177
	cmpq	$1, -120(%rsp)	#, %sfp
	movq	%rax, -72(%rsp)	# _177, %sfp
	je	L68	#,
	cmpq	$16, 32(%rsp)	#, %sfp
	leaq	_dx(%rip), %r15	#, tmp1788
	movq	-24(%rsp), %rbx	# %sfp, ivtmp.457
	movq	24(%rsp), %r14	# %sfp, _420
	seta	%al	#, tmp1222
	cmpq	$16, 40(%rsp)	#, %sfp
	seta	%r8b	#, tmp1225
	andl	%r8d, %eax	# tmp1225, tmp1226
	cmpq	%rbx, %r15	# ivtmp.457, tmp1788
	setnb	%r8b	#, tmp1229
	addq	$8, %r15	#, tmp1790
	cmpq	%r15, %rsi	# tmp1790, ivtmp.449
	movq	-56(%rsp), %r15	# %sfp, ivtmp.443
	setnb	%r9b	#, tmp1232
	orl	%r9d, %r8d	# tmp1232, tmp1233
	andl	%eax, %r8d	# tmp1226, tmp1234
	leaq	_dt(%rip), %rax	#, tmp1791
	cmpq	%rbx, %rax	# ivtmp.457, tmp1791
	leaq	8+_dt(%rip), %rbx	#, tmp1793
	setnb	%al	#, tmp1237
	cmpq	%rbx, %rsi	# tmp1793, ivtmp.449
	movq	(%rsp), %rbx	# %sfp, _444
	setnb	%r9b	#, tmp1240
	orl	%r9d, %eax	# tmp1240, tmp1241
	andl	%r8d, %eax	# tmp1234, tmp1242
	leaq	(%rbx,%r15), %r8	#, tmp1243
	cmpq	%r8, %rsi	# tmp1243, ivtmp.449
	setne	%r8b	#, tmp1245
	andl	%r8d, %eax	# tmp1245, tmp1246
	leaq	(%r14,%r15), %r8	#, tmp1247
	movq	-80(%rsp), %r15	# %sfp, ivtmp.445
	cmpq	%r8, %rsi	# tmp1247, ivtmp.449
	setne	%r8b	#, tmp1249
	andl	%r8d, %eax	# tmp1249, tmp1250
	leaq	(%rbx,%r15), %r8	#, tmp1251
	cmpq	%r8, %rsi	# tmp1251, ivtmp.449
	setne	%r8b	#, tmp1253
	testb	%r8b, %al	# tmp1253, tmp1250
	je	L68	#,
	leaq	(%r14,%r15), %rax	#, tmp1255
	cmpq	%rax, %rsi	# tmp1255, ivtmp.449
	je	L68	#,
	movq	-40(%rsp), %rax	# %sfp, ivtmp.439
	leaq	8(%rdx), %r9	#, _719
	movq	%rcx, 64(%rsp)	# _74, %sfp
	movddup	lC6(%rip), %xmm6	#, tmp1272
	movq	-56(%rsp), %r10	# %sfp, ivtmp.443
	movq	%r12, 72(%rsp)	# _116, %sfp
	movq	80(%rsp), %r8	# %sfp, _970
# src/shallow_water_serial.c:180:                     (PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx)
	movsd	_dx(%rip), %xmm1	# dx, dx
	leaq	(%rbx,%rax), %r15	#, vectp.199
	movsd	_dt(%rip), %xmm3	# dt, dt.87_556
	leaq	(%r10,%r9), %rbx	#, vectp.206
	addsd	%xmm1, %xmm1	# dx, _690
	movq	%rbx, 56(%rsp)	# vectp.206, %sfp
	movq	-80(%rsp), %rbx	# %sfp, ivtmp.445
	leaq	(%rdx,%rax), %r14	#, vectp.202
	movddup	%xmm3, %xmm7	# dt.87_556, vect_cst__555
	movddup	%xmm1, %xmm5	# _690, vect__200.221
	addq	%rbx, %r9	# ivtmp.445, vectp.210
	movq	%r9, 48(%rsp)	# vectp.210, %sfp
	leaq	16(%rbx,%r8), %r9	#, vectp.215
	leaq	(%rcx,%rax), %rbx	#, vectp.218
	movq	-80(%rsp), %rax	# %sfp, ivtmp.445
	leaq	8(%r12), %r8	#, _590
	movq	48(%rsp), %rcx	# %sfp, vectp.210
	movq	56(%rsp), %r12	# %sfp, vectp.206
	addq	%r8, %r10	# _590, vectp.224
	addq	%rax, %r8	# ivtmp.445, vectp.227
	xorl	%eax, %eax	# ivtmp.417
	.p2align 4,,10
	.p2align 3
L59:
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movq	(%r14,%rax), %xmm0	# MEM <vector(2) double> [(real_t *)vectp.202_617 + ivtmp.417_742 * 1], vect__174.203
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movq	(%r15,%rax), %xmm4	# MEM <vector(2) double> [(real_t *)vectp.199_624 + ivtmp.417_742 * 1], vect__168.200
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movhpd	8(%r14,%rax), %xmm0	# MEM <vector(2) double> [(real_t *)vectp.202_617 + ivtmp.417_742 * 1], vect__174.203
# src/shallow_water_serial.c:180:                     (PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx)
	movq	(%rbx,%rax), %xmm9	# MEM <vector(2) double> [(real_t *)vectp.218_585 + ivtmp.417_742 * 1], vect__197.219
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movhpd	8(%r15,%rax), %xmm4	# MEM <vector(2) double> [(real_t *)vectp.199_624 + ivtmp.417_742 * 1], vect__168.200
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	addpd	%xmm4, %xmm0	# vect__168.200, vect__175.204
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movq	(%r12,%rax), %xmm4	# MEM <vector(2) double> [(real_t *)vectp.206_610 + ivtmp.417_742 * 1], vect__182.207
# src/shallow_water_serial.c:180:                     (PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx)
	movhpd	8(%rbx,%rax), %xmm9	# MEM <vector(2) double> [(real_t *)vectp.218_585 + ivtmp.417_742 * 1], vect__197.219
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movhpd	8(%r12,%rax), %xmm4	# MEM <vector(2) double> [(real_t *)vectp.206_610 + ivtmp.417_742 * 1], vect__182.207
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	addpd	%xmm4, %xmm0	# vect__182.207, vect__183.208
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movq	(%rcx,%rax), %xmm4	# MEM <vector(2) double> [(real_t *)vectp.210_602 + ivtmp.417_742 * 1], vect__190.211
	movhpd	8(%rcx,%rax), %xmm4	# MEM <vector(2) double> [(real_t *)vectp.210_602 + ivtmp.417_742 * 1], vect__190.211
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	addpd	%xmm4, %xmm0	# vect__190.211, vect__191.212
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	movq	(%r8,%rax), %xmm4	# MEM <vector(2) double> [(real_t *)vectp.227_566 + ivtmp.417_742 * 1], vect__206.228
	movhpd	8(%r8,%rax), %xmm4	# MEM <vector(2) double> [(real_t *)vectp.227_566 + ivtmp.417_742 * 1], vect__206.228
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	mulpd	%xmm6, %xmm0	# tmp1272, vect__191.212
	movapd	%xmm0, %xmm8	# vect__191.212, vect__192.213
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	movq	(%r10,%rax), %xmm0	# MEM <vector(2) double> [(real_t *)vectp.224_573 + ivtmp.417_742 * 1], vect__204.225
	movhpd	8(%r10,%rax), %xmm0	# MEM <vector(2) double> [(real_t *)vectp.224_573 + ivtmp.417_742 * 1], vect__204.225
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	subpd	%xmm4, %xmm0	# vect__206.228, vect__207.229
# src/shallow_water_serial.c:180:                     (PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx)
	movq	(%r9,%rax), %xmm4	# MEM <vector(2) double> [(real_t *)vectp.215_592 + ivtmp.417_742 * 1], vect__195.216
	movhpd	8(%r9,%rax), %xmm4	# MEM <vector(2) double> [(real_t *)vectp.215_592 + ivtmp.417_742 * 1], vect__195.216
# src/shallow_water_serial.c:180:                     (PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx)
	subpd	%xmm9, %xmm4	# vect__197.219, vect__198.220
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	divpd	%xmm5, %xmm0	# vect__200.221, vect__208.230
# src/shallow_water_serial.c:180:                     (PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx)
	divpd	%xmm5, %xmm4	# vect__200.221, vect__201.222
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	addpd	%xmm4, %xmm0	# vect__201.222, vect__209.231
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movapd	%xmm8, %xmm4	# vect__192.213, vect__192.213
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	mulpd	%xmm7, %xmm0	# vect_cst__555, vect__211.232
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	subpd	%xmm0, %xmm4	# vect__211.232, vect__192.213
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movlpd	%xmm4, (%rsi,%rax)	# vect__217.233, MEM <vector(2) double> [(real_t *)_811 + ivtmp.417_742 * 1]
	movhpd	%xmm4, 8(%rsi,%rax)	# vect__217.233, MEM <vector(2) double> [(real_t *)_811 + ivtmp.417_742 * 1]
	addq	$16, %rax	#, ivtmp.417
	cmpq	%rax, -104(%rsp)	# ivtmp.417, %sfp
	jne	L59	#,
	movq	8(%rsp), %rbx	# %sfp, _680
	cmpq	%rbx, -120(%rsp)	# _680, %sfp
	movq	64(%rsp), %rcx	# %sfp, _74
	movq	72(%rsp), %r12	# %sfp, _116
	je	L58	#,
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movq	-96(%rsp), %rax	# %sfp, _850
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movq	-72(%rsp), %r10	# %sfp, _177
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movq	-64(%rsp), %r9	# %sfp, ivtmp.444
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	leaq	(%r11,%rax), %r8	#, tmp1155
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	leaq	(%r11,%rbx), %rax	#, tmp1156
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	addq	%rdi, %r10	# tmp.273, _177
# src/shallow_water_serial.c:180:                     (PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx)
	movsd	(%rcx,%r8,8), %xmm5	# *_653, *_653
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	movsd	(%r12,%r10,8), %xmm4	# *_645, *_645
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	leaq	(%r11,%rdi), %rbx	#, tmp1159
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	addq	%rdi, %r9	# tmp.273, ivtmp.444
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	subsd	(%r12,%r9,8), %xmm4	# *_643, tmp1166
# src/shallow_water_serial.c:180:                     (PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx)
	subsd	(%rcx,%rax,8), %xmm5	# *_651, tmp1169
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movsd	(%rdx,%rax,8), %xmm0	# *_669, *_669
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	divsd	%xmm1, %xmm4	# _690, tmp1168
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	addsd	(%rdx,%r8,8), %xmm0	# *_675, tmp1160
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	addsd	(%rdx,%r10,8), %xmm0	# *_663, tmp1162
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	addsd	(%rdx,%r9,8), %xmm0	# *_657, tmp1163
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	mulsd	%xmm2, %xmm0	# tmp1273, tmp1164
# src/shallow_water_serial.c:180:                     (PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx)
	divsd	%xmm1, %xmm5	# _690, tmp1171
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	addsd	%xmm5, %xmm4	# tmp1171, tmp1168
	movapd	%xmm4, %xmm1	# tmp1168, tmp1172
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	mulsd	%xmm3, %xmm1	# dt.87_556, tmp1173
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	subsd	%xmm1, %xmm0	# tmp1173, tmp1174
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movsd	%xmm0, 0(%r13,%rbx,8)	# tmp1174, *_633
L58:
# src/shallow_water_serial.c:176:     for (int_t y = 1; y <= N; y++)
	addq	%rbp, -40(%rsp)	# _128, %sfp
	addq	%rbp, %rsi	# _128, ivtmp.449
	subq	%rbp, -16(%rsp)	# _128, %sfp
	addq	%rbp, -56(%rsp)	# _128, %sfp
	addq	%rbp, -80(%rsp)	# _128, %sfp
	addq	%rbp, -8(%rsp)	# _128, %sfp
	addq	%rbp, -24(%rsp)	# _128, %sfp
	movq	-48(%rsp), %rbx	# %sfp, y
	cmpq	%rbx, -88(%rsp)	# y, %sfp
	jne	L52	#,
L3:
# src/shallow_water_serial.c:184: }
	addq	$112, %rsp	#,
LCFI7:
	popq	%rbx	#
LCFI8:
	popq	%rbp	#
LCFI9:
	popq	%r12	#
LCFI10:
	popq	%r13	#
LCFI11:
	popq	%r14	#
LCFI12:
	popq	%r15	#
LCFI13:
	ret	
L129:
LCFI14:
# src/shallow_water_serial.c:149:     for (int_t y = 0; y <= N + 1; y++)
	cmpq	$-1, %rax	#, N.15_265
	jl	L3	#,
	movq	_mass(%rip), %rdx	# mass[0], _42
	addq	$2, %rax	#, _124
	movq	_velocity_x(%rip), %rcx	# velocity_x, velocity_x.26_50
	movq	%rax, -112(%rsp)	# _124, %sfp
	movq	_velocity_y(%rip), %rsi	# velocity_y, velocity_y.35_62
	movq	%rdx, 64(%rsp)	# _42, %sfp
	jmp	L21	#
	.p2align 4,,10
	.p2align 3
L68:
	movq	-16(%rsp), %rbx	# %sfp, ivtmp.442
	movq	-56(%rsp), %r15	# %sfp, ivtmp.443
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movq	-40(%rsp), %rax	# %sfp, ivtmp.406
	movq	-8(%rsp), %r14	# %sfp, ivtmp.446
	leaq	(%r15,%rbx), %r9	#, _763
	movq	-80(%rsp), %r15	# %sfp, ivtmp.445
	leaq	(%r15,%rbx), %r8	#, _772
	leaq	(%rdx,%r8), %r10	#, tmp1180
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	addq	%r12, %r8	# _116, tmp1185
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	leaq	(%rdx,%r9), %rbx	#, tmp1178
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	addq	%r12, %r9	# _116, tmp1184
	.p2align 4,,10
	.p2align 3
L57:
# src/shallow_water_serial.c:180:                     (PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx)
	movsd	_dx(%rip), %xmm4	# dx, dx
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	movsd	8(%r9,%rax), %xmm1	# MEM[(real_t *)_789 + 8B + ivtmp.406_743 * 1], MEM[(real_t *)_789 + 8B + ivtmp.406_743 * 1]
# src/shallow_water_serial.c:180:                     (PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx)
	movsd	16(%rcx,%rax), %xmm3	# MEM[(real_t *)_74 + 16B + ivtmp.406_743 * 1], MEM[(real_t *)_74 + 16B + ivtmp.406_743 * 1]
# src/shallow_water_serial.c:180:                     (PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx)
	addsd	%xmm4, %xmm4	# dx, _701
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	subsd	8(%r8,%rax), %xmm1	# MEM[(real_t *)_798 + 8B + ivtmp.406_743 * 1], tmp1186
# src/shallow_water_serial.c:180:                     (PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx)
	subsd	(%rcx,%rax), %xmm3	# MEM[(real_t *)_74 + ivtmp.406_743 * 1], tmp1189
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movsd	(%rdx,%rax), %xmm0	# MEM[(real_t *)_42 + ivtmp.406_743 * 1], MEM[(real_t *)_42 + ivtmp.406_743 * 1]
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	divsd	%xmm4, %xmm1	# _701, tmp1188
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	addsd	16(%rdx,%rax), %xmm0	# MEM[(real_t *)_42 + 16B + ivtmp.406_743 * 1], tmp1176
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	addsd	8(%rbx,%rax), %xmm0	# MEM[(real_t *)_764 + 8B + ivtmp.406_743 * 1], tmp1179
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	addsd	8(%r10,%rax), %xmm0	# MEM[(real_t *)_773 + 8B + ivtmp.406_743 * 1], tmp1181
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	mulsd	%xmm2, %xmm0	# tmp1273, tmp1182
# src/shallow_water_serial.c:180:                     (PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx)
	divsd	%xmm4, %xmm3	# _701, tmp1191
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	addsd	%xmm3, %xmm1	# tmp1191, tmp1192
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	mulsd	_dt(%rip), %xmm1	# dt, tmp1193
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	subsd	%xmm1, %xmm0	# tmp1193, tmp1194
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movsd	%xmm0, 8(%r13,%rax)	# tmp1194, MEM[(real_t *)_212 + 8B + ivtmp.406_743 * 1]
# src/shallow_water_serial.c:177:         for (int_t x = 1; x <= N; x++)
	addq	$8, %rax	#, ivtmp.406
	cmpq	%rax, %r14	# ivtmp.406, ivtmp.446
	jne	L57	#,
	jmp	L58	#
	.p2align 4,,10
	.p2align 3
L67:
	movq	-88(%rsp), %r13	# %sfp, y
	leaq	-8(%rdi), %r8	#, tmp1264
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movl	$1, %eax	#, x
	.p2align 4,,10
	.p2align 3
L47:
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movsd	(%r15,%rax,8), %xmm0	# MEM[(real_t *)_999 + _996 * 8], MEM[(real_t *)_999 + _996 * 8]
	movq	%rax, %rsi	# x, _996
	addsd	0(%rbp,%rax,8), %xmm0	# MEM[(real_t *)_995 + _996 * 8], tmp1081
# src/shallow_water_serial.c:171:                     (DV(y + 1, x) - DV(y - 1, x)) / (2 * dx)
	movsd	_dx(%rip), %xmm5	# dx, dx
# src/shallow_water_serial.c:171:                     (DV(y + 1, x) - DV(y - 1, x)) / (2 * dx)
	movsd	(%r14,%rax,8), %xmm4	# MEM[(real_t *)_1005 + _996 * 8], MEM[(real_t *)_1005 + _996 * 8]
# src/shallow_water_serial.c:171:                     (DV(y + 1, x) - DV(y - 1, x)) / (2 * dx)
	addsd	%xmm5, %xmm5	# dx, _432
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movapd	%xmm0, %xmm1	# tmp1081, tmp1081
# src/shallow_water_serial.c:172:                     + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx)
	movsd	(%r10,%rax,8), %xmm0	# MEM[(real_t *)_1016 + _996 * 8], MEM[(real_t *)_1016 + _996 * 8]
# src/shallow_water_serial.c:171:                     (DV(y + 1, x) - DV(y - 1, x)) / (2 * dx)
	subsd	(%rdx,%rax,8), %xmm4	# MEM[(real_t *)_1011 + _996 * 8], tmp1088
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	mulsd	%xmm2, %xmm1	# tmp1283, tmp1081
# src/shallow_water_serial.c:172:                     + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx)
	subsd	(%rcx,%rax,8), %xmm0	# MEM[(real_t *)_1023 + _996 * 8], tmp1085
# src/shallow_water_serial.c:171:                     (DV(y + 1, x) - DV(y - 1, x)) / (2 * dx)
	divsd	%xmm5, %xmm4	# _432, tmp1090
# src/shallow_water_serial.c:172:                     + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx)
	divsd	%xmm5, %xmm0	# _432, tmp1087
# src/shallow_water_serial.c:172:                     + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx)
	addsd	%xmm4, %xmm0	# tmp1090, tmp1091
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	mulsd	_dt(%rip), %xmm0	# dt, tmp1092
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	subsd	%xmm0, %xmm1	# tmp1092, tmp1093
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movsd	%xmm1, (%r8,%rax,8)	# tmp1093, MEM[(real_t *)_1030 + _996 * 8]
# src/shallow_water_serial.c:168:         for (int_t x = 1; x <= N; x++)
	addq	$1, %rax	#, x
# src/shallow_water_serial.c:168:         for (int_t x = 1; x <= N; x++)
	cmpq	%rsi, %r13	# _996, y
	jne	L47	#,
	jmp	L48	#
LFE29:
	.p2align 4
	.globl _boundary_condition
_boundary_condition:
LFB30:
	movq	%rdi, %rcx	# tmp253, domain_variable
# src/shallow_water_serial.c:191:     VAR(0, 0) = sign * VAR(2, 2);
	movq	_N(%rip), %rdi	# N, N.91_2
# src/shallow_water_serial.c:189: {
	pushq	%r15	#
LCFI15:
# src/shallow_water_serial.c:191:     VAR(0, 0) = sign * VAR(2, 2);
	pxor	%xmm0, %xmm0	# _1
	cvtsi2sdl	%esi, %xmm0	# tmp254, _1
# src/shallow_water_serial.c:189: {
	pushq	%r14	#
LCFI16:
	pushq	%r13	#
LCFI17:
	pushq	%r12	#
LCFI18:
# src/shallow_water_serial.c:191:     VAR(0, 0) = sign * VAR(2, 2);
	leaq	3(%rdi), %r13	#, tmp207
# src/shallow_water_serial.c:189: {
	pushq	%rbp	#
LCFI19:
# src/shallow_water_serial.c:192:     VAR(N + 1, 0) = sign * VAR(N - 1, 2);
	leaq	-1(%rdi), %r12	#, tmp251
# src/shallow_water_serial.c:191:     VAR(0, 0) = sign * VAR(2, 2);
	salq	$4, %r13	#, _5
# src/shallow_water_serial.c:189: {
	pushq	%rbx	#
LCFI20:
# src/shallow_water_serial.c:191:     VAR(0, 0) = sign * VAR(2, 2);
	movsd	(%rcx,%r13), %xmm1	# *_6, tmp208
# src/shallow_water_serial.c:192:     VAR(N + 1, 0) = sign * VAR(N - 1, 2);
	leaq	2(%rdi), %r15	#, _10
	movq	%r12, %rbx	# tmp251, _11
	imulq	%r15, %rbx	# _10, _11
# src/shallow_water_serial.c:191:     VAR(0, 0) = sign * VAR(2, 2);
	mulsd	%xmm0, %xmm1	# _1, tmp208
# src/shallow_water_serial.c:192:     VAR(N + 1, 0) = sign * VAR(N - 1, 2);
	leaq	(%r15,%r15), %r9	#, slsr_70
	leaq	1(%rdi), %rax	#, _17
# src/shallow_water_serial.c:193:     VAR(0, N + 1) = sign * VAR(2, N - 1);
	leaq	0(,%rax,8), %rbp	#, _30
# src/shallow_water_serial.c:192:     VAR(N + 1, 0) = sign * VAR(N - 1, 2);
	leaq	2(%rbx), %rdx	#, tmp210
# src/shallow_water_serial.c:191:     VAR(0, 0) = sign * VAR(2, 2);
	movsd	%xmm1, (%rcx)	# tmp208, *domain_variable_92(D)
# src/shallow_water_serial.c:192:     VAR(N + 1, 0) = sign * VAR(N - 1, 2);
	movsd	(%rcx,%rdx,8), %xmm1	# *_15, tmp211
# src/shallow_water_serial.c:192:     VAR(N + 1, 0) = sign * VAR(N - 1, 2);
	leaq	(%rbx,%r9), %r10	#, _18
# src/shallow_water_serial.c:192:     VAR(N + 1, 0) = sign * VAR(N - 1, 2);
	leaq	0(,%rdx,8), %r14	#, _14
# src/shallow_water_serial.c:192:     VAR(N + 1, 0) = sign * VAR(N - 1, 2);
	mulsd	%xmm0, %xmm1	# _1, tmp211
# src/shallow_water_serial.c:193:     VAR(0, N + 1) = sign * VAR(2, N - 1);
	leaq	(%r12,%r9), %rdx	#, tmp213
# src/shallow_water_serial.c:192:     VAR(N + 1, 0) = sign * VAR(N - 1, 2);
	movsd	%xmm1, (%rcx,%r10,8)	# tmp211, *_21
# src/shallow_water_serial.c:193:     VAR(0, N + 1) = sign * VAR(2, N - 1);
	movsd	(%rcx,%rdx,8), %xmm1	# *_27, tmp214
# src/shallow_water_serial.c:194:     VAR(N + 1, N + 1) = sign * VAR(N - 1, N - 1);
	leaq	(%r12,%rbx), %rdx	#, tmp217
# src/shallow_water_serial.c:193:     VAR(0, N + 1) = sign * VAR(2, N - 1);
	mulsd	%xmm0, %xmm1	# _1, tmp214
# src/shallow_water_serial.c:193:     VAR(0, N + 1) = sign * VAR(2, N - 1);
	movsd	%xmm1, (%rcx,%rax,8)	# tmp214, *_31
# src/shallow_water_serial.c:194:     VAR(N + 1, N + 1) = sign * VAR(N - 1, N - 1);
	movsd	(%rcx,%rdx,8), %xmm1	# *_36, tmp218
# src/shallow_water_serial.c:194:     VAR(N + 1, N + 1) = sign * VAR(N - 1, N - 1);
	addq	%r10, %rax	# _18, tmp216
# src/shallow_water_serial.c:196:     for (int_t y = 1; y <= N; y++) VAR(y, 0) = sign * VAR(y, 2);
	testq	%rdi, %rdi	# N.91_2
# src/shallow_water_serial.c:194:     VAR(N + 1, N + 1) = sign * VAR(N - 1, N - 1);
	mulsd	%xmm0, %xmm1	# _1, tmp218
# src/shallow_water_serial.c:194:     VAR(N + 1, N + 1) = sign * VAR(N - 1, N - 1);
	movsd	%xmm1, (%rcx,%rax,8)	# tmp218, *_41
# src/shallow_water_serial.c:196:     for (int_t y = 1; y <= N; y++) VAR(y, 0) = sign * VAR(y, 2);
	jle	L131	#,
	leaq	8(%rbp), %r8	#, _99
# src/shallow_water_serial.c:196:     for (int_t y = 1; y <= N; y++) VAR(y, 0) = sign * VAR(y, 2);
	movl	$1, %esi	#, y
	leaq	0(,%r10,8), %r11	#, _20
	leaq	(%rcx,%r8), %rax	#, ivtmp.839
	.p2align 4,,10
	.p2align 3
L133:
# src/shallow_water_serial.c:196:     for (int_t y = 1; y <= N; y++) VAR(y, 0) = sign * VAR(y, 2);
	movsd	16(%rax), %xmm1	# MEM[(real_t *)_237 + 16B], tmp220
	movq	%rsi, %rdx	# y, y
# src/shallow_water_serial.c:196:     for (int_t y = 1; y <= N; y++) VAR(y, 0) = sign * VAR(y, 2);
	leaq	1(%rsi), %rsi	#, y
# src/shallow_water_serial.c:196:     for (int_t y = 1; y <= N; y++) VAR(y, 0) = sign * VAR(y, 2);
	mulsd	%xmm0, %xmm1	# _1, tmp220
# src/shallow_water_serial.c:196:     for (int_t y = 1; y <= N; y++) VAR(y, 0) = sign * VAR(y, 2);
	movsd	%xmm1, (%rax)	# tmp220, MEM[(real_t *)_237]
# src/shallow_water_serial.c:196:     for (int_t y = 1; y <= N; y++) VAR(y, 0) = sign * VAR(y, 2);
	addq	%r8, %rax	# _99, ivtmp.839
	cmpq	%rdx, %rdi	# y, N.91_2
	jne	L133	#,
	addq	%rdi, %r15	# N.91_2, tmp222
# src/shallow_water_serial.c:197:     for (int_t y = 1; y <= N; y++) VAR(y, N + 1) = sign * VAR(y, N - 1);
	movl	$1, %esi	#, y
	leaq	(%rcx,%r15,8), %rax	#, ivtmp.831
	.p2align 4,,10
	.p2align 3
L134:
# src/shallow_water_serial.c:197:     for (int_t y = 1; y <= N; y++) VAR(y, N + 1) = sign * VAR(y, N - 1);
	movsd	-8(%rax), %xmm1	# MEM[(real_t *)_209 + -8B], tmp224
	movq	%rsi, %r15	# y, y
# src/shallow_water_serial.c:197:     for (int_t y = 1; y <= N; y++) VAR(y, N + 1) = sign * VAR(y, N - 1);
	addq	$1, %rsi	#, y
# src/shallow_water_serial.c:197:     for (int_t y = 1; y <= N; y++) VAR(y, N + 1) = sign * VAR(y, N - 1);
	mulsd	%xmm0, %xmm1	# _1, tmp224
# src/shallow_water_serial.c:197:     for (int_t y = 1; y <= N; y++) VAR(y, N + 1) = sign * VAR(y, N - 1);
	movsd	%xmm1, 8(%rax)	# tmp224, MEM[(real_t *)_209 + 8B]
# src/shallow_water_serial.c:197:     for (int_t y = 1; y <= N; y++) VAR(y, N + 1) = sign * VAR(y, N - 1);
	addq	%r8, %rax	# _99, ivtmp.831
	cmpq	%r15, %rdx	# y, y
	jne	L134	#,
	cmpq	$1, %r12	#, tmp251
	jbe	L135	#,
	leaq	-8(%rcx,%r13), %rdx	#, vectp.783
	movq	%rdi, %rsi	# N.91_2, bnd.779
# src/shallow_water_serial.c:197:     for (int_t y = 1; y <= N; y++) VAR(y, N + 1) = sign * VAR(y, N - 1);
	xorl	%eax, %eax	# ivtmp.811
	movddup	%xmm0, %xmm2	# _1, vect_cst__137
	shrq	%rsi	# bnd.779
	salq	$4, %rsi	#, _133
	.p2align 4,,10
	.p2align 3
L136:
# src/shallow_water_serial.c:198:     for (int_t x = 1; x <= N; x++) VAR(0, x) = sign * VAR(2, x);
	movq	(%rdx,%rax), %xmm1	# MEM <vector(2) double> [(real_t *)vectp.783_215 + ivtmp.811_143 * 1], vect__67.784
	movhpd	8(%rdx,%rax), %xmm1	# MEM <vector(2) double> [(real_t *)vectp.783_215 + ivtmp.811_143 * 1], vect__67.784
# src/shallow_water_serial.c:198:     for (int_t x = 1; x <= N; x++) VAR(0, x) = sign * VAR(2, x);
	mulpd	%xmm2, %xmm1	# vect_cst__137, vect__71.785
# src/shallow_water_serial.c:198:     for (int_t x = 1; x <= N; x++) VAR(0, x) = sign * VAR(2, x);
	movlpd	%xmm1, 8(%rcx,%rax)	# vect__71.785, MEM <vector(2) double> [(real_t *)domain_variable_92(D) + 8B + ivtmp.811_143 * 1]
	movhpd	%xmm1, 16(%rcx,%rax)	# vect__71.785, MEM <vector(2) double> [(real_t *)domain_variable_92(D) + 8B + ivtmp.811_143 * 1]
	addq	$16, %rax	#, ivtmp.811
	cmpq	%rax, %rsi	# ivtmp.811, _133
	jne	L136	#,
	movq	%rdi, %rax	# N.91_2, tmp.781
	orq	$1, %rax	#, tmp.781
	testb	$1, %dil	#, N.91_2
	je	L137	#,
# src/shallow_water_serial.c:198:     for (int_t x = 1; x <= N; x++) VAR(0, x) = sign * VAR(2, x);
	leaq	(%r9,%rax), %rdx	#, tmp232
# src/shallow_water_serial.c:198:     for (int_t x = 1; x <= N; x++) VAR(0, x) = sign * VAR(2, x);
	movsd	(%rcx,%rdx,8), %xmm1	# *_201, tmp233
	mulsd	%xmm0, %xmm1	# _1, tmp233
# src/shallow_water_serial.c:198:     for (int_t x = 1; x <= N; x++) VAR(0, x) = sign * VAR(2, x);
	movsd	%xmm1, (%rcx,%rax,8)	# tmp233, *_205
L137:
	addq	$8, %r11	#, _187
	cmpq	%r11, %r14	# _187, _14
	jne	L152	#,
L139:
	leaq	(%rcx,%rbx,8), %rax	#, ivtmp.796
	addq	%rbx, %rdi	# _11, tmp247
	leaq	(%rcx,%rdi,8), %rdx	#, _185
	.p2align 4,,10
	.p2align 3
L143:
# src/shallow_water_serial.c:199:     for (int_t x = 1; x <= N; x++) VAR(N + 1, x) = sign * VAR(N - 1, x);
	movsd	8(%rax), %xmm1	# MEM[(real_t *)_111 + 8B], tmp249
	mulsd	%xmm0, %xmm1	# _1, tmp249
# src/shallow_water_serial.c:199:     for (int_t x = 1; x <= N; x++) VAR(N + 1, x) = sign * VAR(N - 1, x);
	movsd	%xmm1, 8(%rax,%r9,8)	# tmp249, MEM[(real_t *)_111 + 8B + _196 * 8]
# src/shallow_water_serial.c:199:     for (int_t x = 1; x <= N; x++) VAR(N + 1, x) = sign * VAR(N - 1, x);
	addq	$8, %rax	#, ivtmp.796
	cmpq	%rdx, %rax	# _185, ivtmp.796
	jne	L143	#,
L131:
# src/shallow_water_serial.c:201: }
	popq	%rbx	#
LCFI21:
	popq	%rbp	#
LCFI22:
	popq	%r12	#
LCFI23:
	popq	%r13	#
LCFI24:
	popq	%r14	#
LCFI25:
	popq	%r15	#
LCFI26:
	ret	
	.p2align 4,,10
	.p2align 3
L135:
LCFI27:
	leaq	8(%rcx), %rax	#, ivtmp.823
	addq	%rcx, %rbp	# domain_variable, _71
	.p2align 4,,10
	.p2align 3
L138:
# src/shallow_water_serial.c:198:     for (int_t x = 1; x <= N; x++) VAR(0, x) = sign * VAR(2, x);
	movsd	(%rax,%r9,8), %xmm1	# MEM[(real_t *)_64 + _65 * 8], tmp235
# src/shallow_water_serial.c:198:     for (int_t x = 1; x <= N; x++) VAR(0, x) = sign * VAR(2, x);
	addq	$8, %rax	#, ivtmp.823
# src/shallow_water_serial.c:198:     for (int_t x = 1; x <= N; x++) VAR(0, x) = sign * VAR(2, x);
	mulsd	%xmm0, %xmm1	# _1, tmp235
# src/shallow_water_serial.c:198:     for (int_t x = 1; x <= N; x++) VAR(0, x) = sign * VAR(2, x);
	movsd	%xmm1, -8(%rax)	# tmp235, MEM[(real_t *)_64]
# src/shallow_water_serial.c:198:     for (int_t x = 1; x <= N; x++) VAR(0, x) = sign * VAR(2, x);
	cmpq	%rax, %rbp	# ivtmp.823, _71
	jne	L138	#,
	jmp	L139	#
	.p2align 4,,10
	.p2align 3
L152:
	movq	%rdi, %rsi	# N.91_2, bnd.769
	addq	%rcx, %r11	# domain_variable, vectp.777
# src/shallow_water_serial.c:197:     for (int_t y = 1; y <= N; y++) VAR(y, N + 1) = sign * VAR(y, N - 1);
	xorl	%eax, %eax	# ivtmp.804
	leaq	-8(%rcx,%r14), %rdx	#, vectp.773
	shrq	%rsi	# bnd.769
	salq	$4, %rsi	#, _166
	.p2align 4,,10
	.p2align 3
L140:
# src/shallow_water_serial.c:199:     for (int_t x = 1; x <= N; x++) VAR(N + 1, x) = sign * VAR(N - 1, x);
	movq	(%rdx,%rax), %xmm1	# MEM <vector(2) double> [(real_t *)vectp.773_144 + ivtmp.804_184 * 1], vect__76.774
	movhpd	8(%rdx,%rax), %xmm1	# MEM <vector(2) double> [(real_t *)vectp.773_144 + ivtmp.804_184 * 1], vect__76.774
# src/shallow_water_serial.c:199:     for (int_t x = 1; x <= N; x++) VAR(N + 1, x) = sign * VAR(N - 1, x);
	mulpd	%xmm2, %xmm1	# vect_cst__137, vect__81.775
# src/shallow_water_serial.c:199:     for (int_t x = 1; x <= N; x++) VAR(N + 1, x) = sign * VAR(N - 1, x);
	movlpd	%xmm1, (%r11,%rax)	# vect__81.775, MEM <vector(2) double> [(real_t *)vectp.777_135 + ivtmp.804_184 * 1]
	movhpd	%xmm1, 8(%r11,%rax)	# vect__81.775, MEM <vector(2) double> [(real_t *)vectp.777_135 + ivtmp.804_184 * 1]
	addq	$16, %rax	#, ivtmp.804
	cmpq	%rax, %rsi	# ivtmp.804, _166
	jne	L140	#,
	movq	%rdi, %rax	# N.91_2, tmp.771
	orq	$1, %rax	#, tmp.771
	andl	$1, %edi	#, N.91_2
	je	L131	#,
# src/shallow_water_serial.c:199:     for (int_t x = 1; x <= N; x++) VAR(N + 1, x) = sign * VAR(N - 1, x);
	addq	%rax, %r10	# tmp.771, tmp242
# src/shallow_water_serial.c:199:     for (int_t x = 1; x <= N; x++) VAR(N + 1, x) = sign * VAR(N - 1, x);
	addq	%rbx, %rax	# _11, tmp243
# src/shallow_water_serial.c:201: }
	popq	%rbx	#
LCFI28:
	popq	%rbp	#
LCFI29:
	popq	%r12	#
LCFI30:
	popq	%r13	#
LCFI31:
	popq	%r14	#
LCFI32:
	popq	%r15	#
LCFI33:
# src/shallow_water_serial.c:199:     for (int_t x = 1; x <= N; x++) VAR(N + 1, x) = sign * VAR(N - 1, x);
	mulsd	(%rcx,%rax,8), %xmm0	# *_159, tmp244
# src/shallow_water_serial.c:199:     for (int_t x = 1; x <= N; x++) VAR(N + 1, x) = sign * VAR(N - 1, x);
	movsd	%xmm0, (%rcx,%r10,8)	# tmp244, *_154
# src/shallow_water_serial.c:201: }
	ret	
LFE30:
	.p2align 4
	.globl _domain_init
_domain_init:
LFB31:
	pushq	%r15	#
LCFI34:
# src/shallow_water_serial.c:207:     mass[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
# src/shallow_water_serial.c:206: {
	pushq	%r14	#
LCFI35:
	pushq	%r13	#
LCFI36:
	pushq	%r12	#
LCFI37:
	pushq	%rbp	#
LCFI38:
	pushq	%rbx	#
LCFI39:
	subq	$56, %rsp	#,
LCFI40:
# src/shallow_water_serial.c:207:     mass[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	_N(%rip), %r14	# N, N.122_1
	leaq	2(%r14), %r12	#, _2
# src/shallow_water_serial.c:207:     mass[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%r12, %rbx	# _2, _4
	imulq	%r12, %rbx	# _2, _4
# src/shallow_water_serial.c:207:     mass[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rbx, %rdi	# _4,
	call	_calloc	#
# src/shallow_water_serial.c:208:     mass[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rbx, %rdi	# _4,
# src/shallow_water_serial.c:207:     mass[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, %rbp	# tmp190, tmp140
# src/shallow_water_serial.c:207:     mass[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, _mass(%rip)	# tmp140, mass[0]
# src/shallow_water_serial.c:208:     mass[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	call	_calloc	#
# src/shallow_water_serial.c:210:     mass_velocity_x[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rbx, %rdi	# _4,
# src/shallow_water_serial.c:208:     mass[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, 8+_mass(%rip)	# tmp191, mass[1]
# src/shallow_water_serial.c:210:     mass_velocity_x[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	call	_calloc	#
# src/shallow_water_serial.c:211:     mass_velocity_x[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rbx, %rdi	# _4,
# src/shallow_water_serial.c:210:     mass_velocity_x[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, _mass_velocity_x(%rip)	# tmp144, mass_velocity_x[0]
	movq	%rax, (%rsp)	# tmp144, %sfp
# src/shallow_water_serial.c:211:     mass_velocity_x[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	call	_calloc	#
# src/shallow_water_serial.c:212:     mass_velocity_y[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rbx, %rdi	# _4,
# src/shallow_water_serial.c:211:     mass_velocity_x[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, 8+_mass_velocity_x(%rip)	# tmp193, mass_velocity_x[1]
# src/shallow_water_serial.c:212:     mass_velocity_y[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	call	_calloc	#
# src/shallow_water_serial.c:213:     mass_velocity_y[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rbx, %rdi	# _4,
# src/shallow_water_serial.c:212:     mass_velocity_y[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, %r15	# tmp194, tmp148
# src/shallow_water_serial.c:212:     mass_velocity_y[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, _mass_velocity_y(%rip)	# tmp148, mass_velocity_y[0]
# src/shallow_water_serial.c:213:     mass_velocity_y[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	call	_calloc	#
# src/shallow_water_serial.c:215:     mass_velocity = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rbx, %rdi	# _4,
# src/shallow_water_serial.c:213:     mass_velocity_y[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, 8+_mass_velocity_y(%rip)	# tmp195, mass_velocity_y[1]
# src/shallow_water_serial.c:215:     mass_velocity = calloc((N + 2) * (N + 2), sizeof(real_t));
	call	_calloc	#
# src/shallow_water_serial.c:217:     velocity_x = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rbx, %rdi	# _4,
# src/shallow_water_serial.c:215:     mass_velocity = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, _mass_velocity(%rip)	# tmp196, mass_velocity
# src/shallow_water_serial.c:217:     velocity_x = calloc((N + 2) * (N + 2), sizeof(real_t));
	call	_calloc	#
# src/shallow_water_serial.c:218:     velocity_y = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rbx, %rdi	# _4,
# src/shallow_water_serial.c:217:     velocity_x = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, _velocity_x(%rip)	# tmp197, velocity_x
# src/shallow_water_serial.c:218:     velocity_y = calloc((N + 2) * (N + 2), sizeof(real_t));
	call	_calloc	#
# src/shallow_water_serial.c:219:     acceleration_x = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rbx, %rdi	# _4,
# src/shallow_water_serial.c:218:     velocity_y = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, _velocity_y(%rip)	# tmp198, velocity_y
# src/shallow_water_serial.c:219:     acceleration_x = calloc((N + 2) * (N + 2), sizeof(real_t));
	call	_calloc	#
# src/shallow_water_serial.c:220:     acceleration_y = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rbx, %rdi	# _4,
# src/shallow_water_serial.c:219:     acceleration_x = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, _acceleration_x(%rip)	# tmp199, acceleration_x
# src/shallow_water_serial.c:220:     acceleration_y = calloc((N + 2) * (N + 2), sizeof(real_t));
	call	_calloc	#
# src/shallow_water_serial.c:222:     for (int_t y = 1; y <= N; y++)
	testq	%r14, %r14	# N.122_1
# src/shallow_water_serial.c:220:     acceleration_y = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, _acceleration_y(%rip)	# tmp200, acceleration_y
# src/shallow_water_serial.c:222:     for (int_t y = 1; y <= N; y++)
	jle	L154	#,
	movq	(%rsp), %rdx	# %sfp, tmp144
	pxor	%xmm2, %xmm2	# _30
	leaq	1(%r14), %rbx	#, _77
# src/shallow_water_serial.c:230:             real_t cx = x - N / 2;
	movq	%r14, %rcx	# N.122_1, tmp157
	shrq	$63, %rcx	#, tmp157
	movsd	lC9(%rip), %xmm5	#, tmp184
	cvtsi2sdq	%r14, %xmm2	# N.122_1, _30
	addq	%r14, %rcx	# N.122_1, tmp158
# src/shallow_water_serial.c:240:             PN(y, x) *= density;
	movsd	lC14(%rip), %xmm6	#, tmp185
# src/shallow_water_serial.c:230:             real_t cx = x - N / 2;
	sarq	%rcx	# tmp158
	movq	%rcx, %r13	# tmp158, tmp159
	negq	%r13	# tmp159
	leaq	1(%r13), %rax	#, ivtmp.869
	movq	%rax, 24(%rsp)	# ivtmp.869, %sfp
	leaq	0(,%r12,8), %rax	#, _94
	movq	%rax, 32(%rsp)	# _94, %sfp
	leaq	(%rdx,%rax), %r12	#, ivtmp.873
	addq	%rax, %rbp	# _94, ivtmp.871
	addq	%rax, %r15	# _94, ivtmp.874
	leaq	(%rbx,%r13), %rax	#, _143
	movq	%rax, 40(%rsp)	# _143, %sfp
	.p2align 4,,10
	.p2align 3
L155:
# src/shallow_water_serial.c:231:             real_t cy = y - N / 2;
	pxor	%xmm4, %xmm4	# cy
	cvtsi2sdq	24(%rsp), %xmm4	# %sfp, cy
# src/shallow_water_serial.c:224:         for (int_t x = 1; x <= N; x++)
	movl	$1, %r14d	#, x
# src/shallow_water_serial.c:232:             if (sqrt(cx * cx + cy * cy) < N / 20.0)
	mulsd	%xmm4, %xmm4	# cy, _27
	.p2align 4,,10
	.p2align 3
L164:
# src/shallow_water_serial.c:230:             real_t cx = x - N / 2;
	leaq	(%r14,%r13), %rsi	#, tmp162
# src/shallow_water_serial.c:230:             real_t cx = x - N / 2;
	pxor	%xmm0, %xmm0	# cx
	pxor	%xmm3, %xmm3	# tmp160
# src/shallow_water_serial.c:227:             PNU(y, x) = 0.0;
	movq	$0x000000000, (%r12,%r14,8)	#, MEM[(real_t *)_114 + _113 * 8]
# src/shallow_water_serial.c:230:             real_t cx = x - N / 2;
	cvtsi2sdq	%rsi, %xmm0	# tmp162, cx
# src/shallow_water_serial.c:228:             PNV(y, x) = 0.0;
	movq	$0x000000000, (%r15,%r14,8)	#, MEM[(real_t *)_110 + _113 * 8]
# src/shallow_water_serial.c:232:             if (sqrt(cx * cx + cy * cy) < N / 20.0)
	movapd	%xmm0, %xmm1	# cx, cx
	mulsd	%xmm0, %xmm1	# cx, cx
# src/shallow_water_serial.c:232:             if (sqrt(cx * cx + cy * cy) < N / 20.0)
	movapd	%xmm1, %xmm0	# _26, _28
	addsd	%xmm4, %xmm0	# _27, _28
	ucomisd	%xmm0, %xmm3	# _28, tmp160
	ja	L167	#,
	sqrtsd	%xmm0, %xmm0	# _28, _29
L158:
# src/shallow_water_serial.c:232:             if (sqrt(cx * cx + cy * cy) < N / 20.0)
	movapd	%xmm2, %xmm3	# _30, tmp164
	movapd	%xmm2, %xmm7	# _30, _30
	divsd	%xmm5, %xmm3	# tmp184, tmp164
# src/shallow_water_serial.c:232:             if (sqrt(cx * cx + cy * cy) < N / 20.0)
	comisd	%xmm0, %xmm3	# _29, tmp164
	ja	L170	#,
# src/shallow_water_serial.c:240:             PN(y, x) *= density;
	movsd	%xmm6, 0(%rbp,%r14,8)	# tmp185, MEM[(real_t *)_103 + _113 * 8]
# src/shallow_water_serial.c:224:         for (int_t x = 1; x <= N; x++)
	addq	$1, %r14	#, x
# src/shallow_water_serial.c:224:         for (int_t x = 1; x <= N; x++)
	cmpq	%r14, %rbx	# x, _77
	jne	L164	#,
L162:
# src/shallow_water_serial.c:222:     for (int_t y = 1; y <= N; y++)
	movq	32(%rsp), %rcx	# %sfp, _94
	addq	$1, 24(%rsp)	#, %sfp
	movq	40(%rsp), %rdx	# %sfp, _143
	movq	24(%rsp), %rax	# %sfp, ivtmp.869
	addq	%rcx, %rbp	# _94, ivtmp.871
	addq	%rcx, %r12	# _94, ivtmp.873
	addq	%rcx, %r15	# _94, ivtmp.874
	cmpq	%rdx, %rax	# _143, ivtmp.869
	jne	L155	#,
L163:
# src/shallow_water_serial.c:244:     dx = domain_size / (real_t) N;
	movsd	lC15(%rip), %xmm0	#, tmp181
# src/shallow_water_serial.c:245:     dt = 5e-2;
	movq	lC16(%rip), %rax	#, tmp224
# src/shallow_water_serial.c:244:     dx = domain_size / (real_t) N;
	divsd	%xmm7, %xmm0	# _30, tmp180
# src/shallow_water_serial.c:245:     dt = 5e-2;
	movq	%rax, _dt(%rip)	# tmp224, dt
# src/shallow_water_serial.c:244:     dx = domain_size / (real_t) N;
	movsd	%xmm0, _dx(%rip)	# tmp180, dx
# src/shallow_water_serial.c:246: }
	addq	$56, %rsp	#,
LCFI41:
	popq	%rbx	#
LCFI42:
	popq	%rbp	#
LCFI43:
	popq	%r12	#
LCFI44:
	popq	%r13	#
LCFI45:
	popq	%r14	#
LCFI46:
	popq	%r15	#
LCFI47:
	ret	
	.p2align 4,,10
	.p2align 3
L170:
LCFI48:
# src/shallow_water_serial.c:235:                         -4 * pow(cx, 2.0) / (real_t) (N)
	movsd	lC10(%rip), %xmm0	#, tmp166
	movsd	%xmm2, 16(%rsp)	# _30, %sfp
# src/shallow_water_serial.c:236:                         - 4 * pow(cy, 2.0) / (real_t) (N)
	movsd	%xmm4, 8(%rsp)	# _27, %sfp
# src/shallow_water_serial.c:235:                         -4 * pow(cx, 2.0) / (real_t) (N)
	mulsd	%xmm1, %xmm0	# _26, tmp166
# src/shallow_water_serial.c:236:                         - 4 * pow(cy, 2.0) / (real_t) (N)
	movsd	lC11(%rip), %xmm1	#, tmp169
# src/shallow_water_serial.c:236:                         - 4 * pow(cy, 2.0) / (real_t) (N)
	movsd	%xmm2, (%rsp)	# _30, %sfp
# src/shallow_water_serial.c:236:                         - 4 * pow(cy, 2.0) / (real_t) (N)
	mulsd	%xmm4, %xmm1	# _27, tmp169
# src/shallow_water_serial.c:235:                         -4 * pow(cx, 2.0) / (real_t) (N)
	divsd	%xmm2, %xmm0	# _30, tmp168
# src/shallow_water_serial.c:236:                         - 4 * pow(cy, 2.0) / (real_t) (N)
	divsd	%xmm2, %xmm1	# _30, tmp171
# src/shallow_water_serial.c:234:                 PN(y, x) -= 5e-4 * exp(
	subsd	%xmm1, %xmm0	# tmp171, tmp172
	call	_exp	#
# src/shallow_water_serial.c:234:                 PN(y, x) -= 5e-4 * exp(
	mulsd	lC12(%rip), %xmm0	#, tmp173
# src/shallow_water_serial.c:234:                 PN(y, x) -= 5e-4 * exp(
	movsd	lC13(%rip), %xmm1	#, tmp176
# src/shallow_water_serial.c:224:         for (int_t x = 1; x <= N; x++)
	movq	lC9(%rip), %rax	#, tmp244
	movsd	(%rsp), %xmm2	# %sfp, _30
	movsd	8(%rsp), %xmm4	# %sfp, _27
# src/shallow_water_serial.c:234:                 PN(y, x) -= 5e-4 * exp(
	subsd	%xmm0, %xmm1	# tmp173, tmp175
# src/shallow_water_serial.c:240:             PN(y, x) *= density;
	mulsd	lC0(%rip), %xmm1	#, tmp177
# src/shallow_water_serial.c:224:         for (int_t x = 1; x <= N; x++)
	movq	%rax, %xmm5	# tmp244, tmp184
	movq	lC14(%rip), %rax	#, tmp243
	movsd	16(%rsp), %xmm7	# %sfp, _30
# src/shallow_water_serial.c:240:             PN(y, x) *= density;
	movsd	%xmm1, 0(%rbp,%r14,8)	# tmp177, MEM[(real_t *)_97 + _113 * 8]
# src/shallow_water_serial.c:224:         for (int_t x = 1; x <= N; x++)
	addq	$1, %r14	#, x
# src/shallow_water_serial.c:224:         for (int_t x = 1; x <= N; x++)
	movq	%rax, %xmm6	# tmp243, tmp185
	cmpq	%r14, %rbx	# x, _77
	jne	L164	#,
	jmp	L162	#
L154:
# src/shallow_water_serial.c:244:     dx = domain_size / (real_t) N;
	pxor	%xmm7, %xmm7	# _30
	cvtsi2sdq	%r14, %xmm7	# N.122_1, _30
	jmp	L163	#
L167:
	movsd	%xmm2, 16(%rsp)	# _30, %sfp
	movsd	%xmm4, 8(%rsp)	# _27, %sfp
	movsd	%xmm1, (%rsp)	# _26, %sfp
# src/shallow_water_serial.c:232:             if (sqrt(cx * cx + cy * cy) < N / 20.0)
	call	_sqrt	#
	movq	lC14(%rip), %rax	#, tmp245
	movsd	16(%rsp), %xmm2	# %sfp, _30
	movsd	8(%rsp), %xmm4	# %sfp, _27
	movsd	(%rsp), %xmm1	# %sfp, _26
	movq	%rax, %xmm6	# tmp245, tmp185
	movq	lC9(%rip), %rax	#, tmp246
	movq	%rax, %xmm5	# tmp246, tmp184
	jmp	L158	#
LFE31:
	.cstring
lC17:
	.ascii "data/%.5lld.bin\0"
lC18:
	.ascii "wb\0"
lC19:
	.ascii "Failed to open file %s\12\0"
	.text
	.p2align 4
	.globl _domain_save
_domain_save:
LFB32:
	pushq	%r12	#
LCFI49:
# src/shallow_water_serial.c:252:     int_t index = iteration / snapshot_frequency;
	movq	%rdi, %rax	# tmp118, tmp118
# src/shallow_water_serial.c:254:     memset(filename, 0, 256 * sizeof(char));
	movl	$32, %ecx	#, tmp102
# src/shallow_water_serial.c:255:     sprintf(filename, "data/%.5lld.bin", index);
	xorl	%esi, %esi	#
# src/shallow_water_serial.c:251: {
	pushq	%rbp	#
LCFI50:
# src/shallow_water_serial.c:252:     int_t index = iteration / snapshot_frequency;
	cqto
# src/shallow_water_serial.c:251: {
	pushq	%rbx	#
LCFI51:
	subq	$256, %rsp	#,
LCFI52:
# src/shallow_water_serial.c:254:     memset(filename, 0, 256 * sizeof(char));
	movq	%rsp, %rbx	#, tmp99
# src/shallow_water_serial.c:252:     int_t index = iteration / snapshot_frequency;
	idivq	_snapshot_frequency(%rip)	# snapshot_frequency
	movq	%rax, %r8	# tmp118, tmp97
# src/shallow_water_serial.c:254:     memset(filename, 0, 256 * sizeof(char));
	xorl	%eax, %eax	# tmp101
	movq	%rbx, %rdi	# tmp99, tmp100
# src/shallow_water_serial.c:255:     sprintf(filename, "data/%.5lld.bin", index);
	movl	$256, %edx	#,
# src/shallow_water_serial.c:254:     memset(filename, 0, 256 * sizeof(char));
	rep stosq
# src/shallow_water_serial.c:255:     sprintf(filename, "data/%.5lld.bin", index);
	leaq	lC17(%rip), %rcx	#, tmp104
	movq	%rbx, %rdi	# tmp99,
	call	___sprintf_chk	#
# src/shallow_water_serial.c:257:     FILE *out = fopen(filename, "wb");
	leaq	lC18(%rip), %rsi	#, tmp106
	movq	%rbx, %rdi	# tmp99,
	call	_fopen	#
# src/shallow_water_serial.c:258:     if (!out)
	testq	%rax, %rax	# out
	je	L172	#,
# src/shallow_water_serial.c:263:     for (int_t y = 1; y <= N; y++)
	movq	_N(%rip), %rsi	# N, N.164_11
	movq	%rax, %rbp	# tmp119, out
# src/shallow_water_serial.c:263:     for (int_t y = 1; y <= N; y++)
	movl	$1, %ebx	#, y
	leaq	_mass(%rip), %r12	#, tmp117
# src/shallow_water_serial.c:263:     for (int_t y = 1; y <= N; y++)
	testq	%rsi, %rsi	# N.164_11
	jle	L174	#,
	.p2align 4,,10
	.p2align 3
L173:
# src/shallow_water_serial.c:265:         fwrite(&mass[0][y * (N + 2) + 1], N, sizeof(real_t), out);
	leaq	2(%rsi), %rax	#, tmp111
# src/shallow_water_serial.c:265:         fwrite(&mass[0][y * (N + 2) + 1], N, sizeof(real_t), out);
	movq	(%r12), %rdx	# mass[0], mass[0]
# src/shallow_water_serial.c:265:         fwrite(&mass[0][y * (N + 2) + 1], N, sizeof(real_t), out);
	movq	%rbp, %rcx	# out,
# src/shallow_water_serial.c:265:         fwrite(&mass[0][y * (N + 2) + 1], N, sizeof(real_t), out);
	imulq	%rbx, %rax	# y, tmp112
# src/shallow_water_serial.c:263:     for (int_t y = 1; y <= N; y++)
	addq	$1, %rbx	#, y
# src/shallow_water_serial.c:265:         fwrite(&mass[0][y * (N + 2) + 1], N, sizeof(real_t), out);
	leaq	8(%rdx,%rax,8), %rdi	#, tmp115
# src/shallow_water_serial.c:265:         fwrite(&mass[0][y * (N + 2) + 1], N, sizeof(real_t), out);
	movl	$8, %edx	#,
	call	_fwrite	#
# src/shallow_water_serial.c:263:     for (int_t y = 1; y <= N; y++)
	movq	_N(%rip), %rsi	# N, N.164_11
	cmpq	%rbx, %rsi	# y, N.164_11
	jge	L173	#,
L174:
# src/shallow_water_serial.c:267:     fclose(out);
	movq	%rbp, %rdi	# out,
	call	_fclose	#
# src/shallow_water_serial.c:268: }
	addq	$256, %rsp	#,
LCFI53:
	popq	%rbx	#
LCFI54:
	popq	%rbp	#
LCFI55:
	popq	%r12	#
LCFI56:
	ret	
L172:
LCFI57:
# src/shallow_water_serial.c:260:         fprintf(stderr, "Failed to open file %s\n", filename);
	movq	___stderrp@GOTPCREL(%rip), %rax	#, tmp108
	movq	%rbx, %rdx	# tmp99,
	leaq	lC19(%rip), %rsi	#, tmp109
	movq	(%rax), %rdi	# __stderrp,
	xorl	%eax, %eax	#
	call	_fprintf	#
# src/shallow_water_serial.c:261:         exit(1);
	movl	$1, %edi	#,
	call	_exit	#
LFE32:
	.p2align 4
	.globl _domain_finalize
_domain_finalize:
LFB33:
	subq	$8, %rsp	#,
LCFI58:
# src/shallow_water_serial.c:274:     free(mass[0]);
	movq	_mass(%rip), %rdi	# mass[0],
	call	_free	#
# src/shallow_water_serial.c:275:     free(mass[1]);
	movq	8+_mass(%rip), %rdi	# mass[1],
	call	_free	#
# src/shallow_water_serial.c:276:     free(mass_velocity_x[0]);
	movq	_mass_velocity_x(%rip), %rdi	# mass_velocity_x[0],
	call	_free	#
# src/shallow_water_serial.c:277:     free(mass_velocity_x[1]);
	movq	8+_mass_velocity_x(%rip), %rdi	# mass_velocity_x[1],
	call	_free	#
# src/shallow_water_serial.c:278:     free(mass_velocity_y[0]);
	movq	_mass_velocity_y(%rip), %rdi	# mass_velocity_y[0],
	call	_free	#
# src/shallow_water_serial.c:279:     free(mass_velocity_y[1]);
	movq	8+_mass_velocity_y(%rip), %rdi	# mass_velocity_y[1],
	call	_free	#
# src/shallow_water_serial.c:280:     free(mass_velocity);
	movq	_mass_velocity(%rip), %rdi	# mass_velocity,
	call	_free	#
# src/shallow_water_serial.c:281:     free(velocity_x);
	movq	_velocity_x(%rip), %rdi	# velocity_x,
	call	_free	#
# src/shallow_water_serial.c:282:     free(velocity_y);
	movq	_velocity_y(%rip), %rdi	# velocity_y,
	call	_free	#
# src/shallow_water_serial.c:283:     free(acceleration_x);
	movq	_acceleration_x(%rip), %rdi	# acceleration_x,
	call	_free	#
# src/shallow_water_serial.c:284:     free(acceleration_y);
	movq	_acceleration_y(%rip), %rdi	# acceleration_y,
# src/shallow_water_serial.c:285: }
	addq	$8, %rsp	#,
LCFI59:
# src/shallow_water_serial.c:284:     free(acceleration_y);
	jmp	_free	#
LFE33:
	.cstring
lC20:
	.ascii "Argument parsing failed\12\0"
lC22:
	.ascii "%.2lf seconds total runtime\12\0"
	.align 3
lC24:
	.ascii "Iteration %lld of %lld, (%.2lf%% complete)\12\0"
	.section __TEXT,__text_startup,regular,pure_instructions
	.p2align 4
	.globl _main
_main:
LFB28:
	pushq	%r15	#
LCFI60:
	pushq	%r14	#
LCFI61:
	pushq	%r13	#
LCFI62:
	pushq	%r12	#
LCFI63:
	pushq	%rbp	#
LCFI64:
	pushq	%rbx	#
LCFI65:
	subq	$40, %rsp	#,
LCFI66:
# src/shallow_water_serial.c:82:     OPTIONS *options = parse_args(argc, argv);
	call	_parse_args	#
# src/shallow_water_serial.c:83:     if (!options)
	testq	%rax, %rax	# options
	je	L190	#,
# src/shallow_water_serial.c:89:     N = options->N;
	movq	(%rax), %rdx	# options_35->N, options_35->N
	movq	%rdx, _N(%rip)	# options_35->N, N
# src/shallow_water_serial.c:90:     max_iteration = options->max_iteration;
	movq	8(%rax), %rdx	# options_35->max_iteration, options_35->max_iteration
# src/shallow_water_serial.c:91:     snapshot_frequency = options->snapshot_frequency;
	movq	16(%rax), %rax	# options_35->snapshot_frequency, options_35->snapshot_frequency
# src/shallow_water_serial.c:90:     max_iteration = options->max_iteration;
	movq	%rdx, _max_iteration(%rip)	# options_35->max_iteration, max_iteration
# src/shallow_water_serial.c:91:     snapshot_frequency = options->snapshot_frequency;
	movq	%rax, _snapshot_frequency(%rip)	# options_35->snapshot_frequency, snapshot_frequency
# src/shallow_water_serial.c:93:     domain_init();
	call	_domain_init	#
# src/shallow_water_serial.c:95:     gettimeofday(&t_start, NULL);
	leaq	_t_start(%rip), %rdi	#, tmp131
	xorl	%esi, %esi	#
	call	_gettimeofday	#
# src/shallow_water_serial.c:97:     for (int_t iteration = 0; iteration <= max_iteration; iteration++)
	movq	_max_iteration(%rip), %r13	# max_iteration, max_iteration.4_70
	testq	%r13, %r13	# max_iteration.4_70
	js	L186	#,
# src/shallow_water_serial.c:99:         boundary_condition(mass[0], 1);
	movq	_mass(%rip), %r14	# mass[0], prephitmp_28
	leaq	_mass_velocity_y(%rip), %r15	#, tmp174
# src/shallow_water_serial.c:97:     for (int_t iteration = 0; iteration <= max_iteration; iteration++)
	xorl	%ebx, %ebx	# iteration
# src/shallow_water_serial.c:100:         boundary_condition(mass_velocity_x[0], -1);
	movq	_mass_velocity_x(%rip), %r12	# mass_velocity_x[0], _58
# src/shallow_water_serial.c:101:         boundary_condition(mass_velocity_y[0], -1);
	movq	_mass_velocity_y(%rip), %rbp	# mass_velocity_y[0], _56
	jmp	L185	#
	.p2align 4,,10
	.p2align 3
L187:
	movq	%r14, 24(%rsp)	# prephitmp_28, %sfp
	movq	%r12, 16(%rsp)	# _58, %sfp
	movq	%rbp, 8(%rsp)	# _56, %sfp
L184:
# src/shallow_water_serial.c:73:     *t1 = *t2;
	movq	8+_mass(%rip), %r14	# MEM[(real_t * *)&mass + 8B], prephitmp_28
# src/shallow_water_serial.c:73:     *t1 = *t2;
	leaq	_mass(%rip), %rax	#, tmp188
# src/shallow_water_serial.c:97:     for (int_t iteration = 0; iteration <= max_iteration; iteration++)
	addq	$1, %rbx	#, iteration
# src/shallow_water_serial.c:73:     *t1 = *t2;
	movq	8+_mass_velocity_x(%rip), %r12	# MEM[(real_t * *)&mass_velocity_x + 8B], _58
# src/shallow_water_serial.c:97:     for (int_t iteration = 0; iteration <= max_iteration; iteration++)
	cmpq	%r13, %rbx	# max_iteration.4_70, iteration
# src/shallow_water_serial.c:73:     *t1 = *t2;
	movq	8+_mass_velocity_y(%rip), %rbp	# MEM[(real_t * *)&mass_velocity_y + 8B], _56
# src/shallow_water_serial.c:73:     *t1 = *t2;
	movq	%r14, %xmm0	# prephitmp_28, tmp165
	movhps	24(%rsp), %xmm0	# %sfp, tmp165
	movaps	%xmm0, (%rax)	# tmp165, MEM <vector(2) long unsigned int> [(real_t * *)&mass]
	leaq	_mass_velocity_x(%rip), %rax	#, tmp190
	movq	%r12, %xmm0	# _58, tmp168
	movhps	16(%rsp), %xmm0	# %sfp, tmp168
	movaps	%xmm0, (%rax)	# tmp168, MEM <vector(2) long unsigned int> [(real_t * *)&mass_velocity_x]
	movq	%rbp, %xmm0	# _56, tmp171
	movhps	8(%rsp), %xmm0	# %sfp, tmp171
	movaps	%xmm0, (%r15)	# tmp171, MEM <vector(2) long unsigned int> [(real_t * *)&mass_velocity_y]
# src/shallow_water_serial.c:97:     for (int_t iteration = 0; iteration <= max_iteration; iteration++)
	jg	L186	#,
L185:
# src/shallow_water_serial.c:99:         boundary_condition(mass[0], 1);
	movl	$1, %esi	#,
	movq	%r14, %rdi	# prephitmp_28,
	call	_boundary_condition	#
# src/shallow_water_serial.c:100:         boundary_condition(mass_velocity_x[0], -1);
	movl	$-1, %esi	#,
	movq	%r12, %rdi	# _58,
	call	_boundary_condition	#
# src/shallow_water_serial.c:101:         boundary_condition(mass_velocity_y[0], -1);
	movl	$-1, %esi	#,
	movq	%rbp, %rdi	# _56,
	call	_boundary_condition	#
# src/shallow_water_serial.c:103:         time_step();
	call	_time_step	#
# src/shallow_water_serial.c:105:         if (iteration % snapshot_frequency == 0)
	movq	%rbx, %rax	# iteration, tmp153
	cqto
	idivq	_snapshot_frequency(%rip)	# snapshot_frequency
# src/shallow_water_serial.c:105:         if (iteration % snapshot_frequency == 0)
	testq	%rdx, %rdx	# tmp152
	jne	L187	#,
# src/shallow_water_serial.c:111:                     100.0 * (real_t) iteration / (real_t) max_iteration
	pxor	%xmm0, %xmm0	# tmp154
	cvtsi2sdq	%rbx, %xmm0	# iteration, tmp154
# src/shallow_water_serial.c:111:                     100.0 * (real_t) iteration / (real_t) max_iteration
	pxor	%xmm1, %xmm1	# tmp157
# src/shallow_water_serial.c:107:             printf(
	movq	%r13, %rdx	# max_iteration.4_70,
# src/shallow_water_serial.c:111:                     100.0 * (real_t) iteration / (real_t) max_iteration
	mulsd	lC23(%rip), %xmm0	#, tmp155
# src/shallow_water_serial.c:107:             printf(
	movq	%rbx, %rsi	# iteration,
	movl	$1, %eax	#,
# src/shallow_water_serial.c:111:                     100.0 * (real_t) iteration / (real_t) max_iteration
	cvtsi2sdq	%r13, %xmm1	# max_iteration.4_70, tmp157
# src/shallow_water_serial.c:107:             printf(
	leaq	lC24(%rip), %rdi	#,
	divsd	%xmm1, %xmm0	# tmp157, tmp158
	call	_printf	#
# src/shallow_water_serial.c:113:             domain_save(iteration);
	movq	%rbx, %rdi	# iteration,
	call	_domain_save	#
# src/shallow_water_serial.c:72:     tmp = *t1;
	movq	(%r15), %rax	# mass_velocity_y, pretmp_79
# src/shallow_water_serial.c:97:     for (int_t iteration = 0; iteration <= max_iteration; iteration++)
	movq	_max_iteration(%rip), %r13	# max_iteration, max_iteration.4_70
# src/shallow_water_serial.c:72:     tmp = *t1;
	movq	%rax, 8(%rsp)	# pretmp_79, %sfp
	leaq	_mass_velocity_x(%rip), %rax	#, tmp183
	movq	(%rax), %rax	# mass_velocity_x, pretmp_81
	movq	%rax, 16(%rsp)	# pretmp_81, %sfp
	leaq	_mass(%rip), %rax	#, tmp185
	movq	(%rax), %rax	# mass, pretmp_83
	movq	%rax, 24(%rsp)	# pretmp_83, %sfp
	jmp	L184	#
	.p2align 4,,10
	.p2align 3
L186:
# src/shallow_water_serial.c:121:     domain_finalize();
	call	_domain_finalize	#
# src/shallow_water_serial.c:124:     gettimeofday(&t_stop, NULL);
	leaq	_t_stop(%rip), %rdi	#, tmp132
	xorl	%esi, %esi	#
	call	_gettimeofday	#
# src/shallow_water_serial.c:125:     t_total = WALLTIME(t_stop) - WALLTIME(t_start);
	pxor	%xmm0, %xmm0	# tmp134
	pxor	%xmm1, %xmm1	# tmp138
	movsd	lC21(%rip), %xmm2	#, tmp136
	cvtsi2sdl	8+_t_stop(%rip), %xmm0	# t_stop.tv_usec, tmp134
# src/shallow_water_serial.c:127:     printf("%.2lf seconds total runtime\n", t_total);
	movl	$1, %eax	#,
# src/shallow_water_serial.c:125:     t_total = WALLTIME(t_stop) - WALLTIME(t_start);
	cvtsi2sdq	_t_stop(%rip), %xmm1	# t_stop.tv_sec, tmp138
# src/shallow_water_serial.c:127:     printf("%.2lf seconds total runtime\n", t_total);
	leaq	lC22(%rip), %rdi	#, tmp147
# src/shallow_water_serial.c:125:     t_total = WALLTIME(t_stop) - WALLTIME(t_start);
	mulsd	%xmm2, %xmm0	# tmp136, tmp135
	addsd	%xmm1, %xmm0	# tmp138, tmp139
# src/shallow_water_serial.c:125:     t_total = WALLTIME(t_stop) - WALLTIME(t_start);
	pxor	%xmm1, %xmm1	# tmp141
	cvtsi2sdl	8+_t_start(%rip), %xmm1	# t_start.tv_usec, tmp141
	mulsd	%xmm2, %xmm1	# tmp136, tmp142
	pxor	%xmm2, %xmm2	# tmp145
	cvtsi2sdq	_t_start(%rip), %xmm2	# t_start.tv_sec, tmp145
	addsd	%xmm2, %xmm1	# tmp145, tmp146
# src/shallow_water_serial.c:125:     t_total = WALLTIME(t_stop) - WALLTIME(t_start);
	subsd	%xmm1, %xmm0	# tmp146, _27
# src/shallow_water_serial.c:125:     t_total = WALLTIME(t_stop) - WALLTIME(t_start);
	movsd	%xmm0, _t_total(%rip)	# _27, t_total
# src/shallow_water_serial.c:127:     printf("%.2lf seconds total runtime\n", t_total);
	call	_printf	#
# src/shallow_water_serial.c:129:     exit(EXIT_SUCCESS);
	xorl	%edi, %edi	#
	call	_exit	#
L190:
# src/shallow_water_serial.c:85:         fprintf(stderr, "Argument parsing failed\n");
	movq	___stderrp@GOTPCREL(%rip), %rax	#, tmp126
	movl	$24, %edx	#,
	movl	$1, %esi	#,
	leaq	lC20(%rip), %rdi	#, tmp127
	movq	(%rax), %rcx	# __stderrp,
	call	_fwrite	#
# src/shallow_water_serial.c:86:         exit(1);
	movl	$1, %edi	#,
	call	_exit	#
LFE28:
	.globl _dt
	.zerofill __DATA,__common,_dt,8,4
	.globl _dx
	.zerofill __DATA,__common,_dx,8,4
	.globl _acceleration_y
	.zerofill __DATA,__common,_acceleration_y,8,3
	.globl _acceleration_x
	.zerofill __DATA,__common,_acceleration_x,8,3
	.globl _velocity_y
	.zerofill __DATA,__common,_velocity_y,8,3
	.globl _velocity_x
	.zerofill __DATA,__common,_velocity_x,8,3
	.globl _mass_velocity
	.zerofill __DATA,__common,_mass_velocity,8,3
	.globl _mass_velocity_y
	.zerofill __DATA,__common,_mass_velocity_y,16,4
	.globl _mass_velocity_x
	.zerofill __DATA,__common,_mass_velocity_x,16,4
	.globl _mass
	.zerofill __DATA,__common,_mass,16,4
	.globl _density
	.const
	.align 3
_density:
	.long	0
	.long	1083123712
	.globl _gravity
	.align 3
_gravity:
	.long	1374389535
	.long	1076076216
	.globl _domain_size
	.align 3
_domain_size:
	.long	0
	.long	1076101120
	.globl _snapshot_frequency
	.zerofill __DATA,__common,_snapshot_frequency,8,3
	.globl _max_iteration
	.zerofill __DATA,__common,_max_iteration,8,3
	.globl _N
	.zerofill __DATA,__common,_N,8,3
	.globl _t_total
	.zerofill __DATA,__common,_t_total,8,3
	.globl _t_stop
	.zerofill __DATA,__common,_t_stop,16,4
	.globl _t_start
	.zerofill __DATA,__common,_t_start,16,4
	.literal8
	.align 3
lC0:
	.long	0
	.long	1083123712
	.align 3
lC1:
	.long	1374389535
	.long	1075027640
	.align 3
lC4:
	.long	0
	.long	1071644672
	.align 3
lC6:
	.long	0
	.long	1070596096
	.align 3
lC9:
	.long	0
	.long	1077149696
	.align 3
lC10:
	.long	0
	.long	-1072693248
	.align 3
lC11:
	.long	0
	.long	1074790400
	.align 3
lC12:
	.long	-755914244
	.long	1061184077
	.align 3
lC13:
	.long	-755914244
	.long	1062232653
	.align 3
lC14:
	.long	-1958505087
	.long	1072686956
	.align 3
lC15:
	.long	0
	.long	1076101120
	.align 3
lC16:
	.long	-1717986918
	.long	1068079513
	.align 3
lC21:
	.long	-1598689907
	.long	1051772663
	.align 3
lC23:
	.long	0
	.long	1079574528
	.section __TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame1:
	.set L$set$0,LECIE1-LSCIE1
	.long L$set$0
LSCIE1:
	.long	0
	.byte	0x1
	.ascii "zR\0"
	.uleb128 0x1
	.sleb128 -8
	.byte	0x10
	.uleb128 0x1
	.byte	0x10
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x8
	.byte	0x90
	.uleb128 0x1
	.align 3
LECIE1:
LSFDE1:
	.set L$set$1,LEFDE1-LASFDE1
	.long L$set$1
LASFDE1:
	.long	LASFDE1-EH_frame1
	.quad	LFB27-.
	.set L$set$2,LFE27-LFB27
	.quad L$set$2
	.uleb128 0
	.align 3
LEFDE1:
LSFDE3:
	.set L$set$3,LEFDE3-LASFDE3
	.long L$set$3
LASFDE3:
	.long	LASFDE3-EH_frame1
	.quad	LFB29-.
	.set L$set$4,LFE29-LFB29
	.quad L$set$4
	.uleb128 0
	.byte	0x4
	.set L$set$5,LCFI0-LFB29
	.long L$set$5
	.byte	0xe
	.uleb128 0x10
	.byte	0x8f
	.uleb128 0x2
	.byte	0x4
	.set L$set$6,LCFI1-LCFI0
	.long L$set$6
	.byte	0xe
	.uleb128 0x18
	.byte	0x8e
	.uleb128 0x3
	.byte	0x4
	.set L$set$7,LCFI2-LCFI1
	.long L$set$7
	.byte	0xe
	.uleb128 0x20
	.byte	0x8d
	.uleb128 0x4
	.byte	0x4
	.set L$set$8,LCFI3-LCFI2
	.long L$set$8
	.byte	0xe
	.uleb128 0x28
	.byte	0x8c
	.uleb128 0x5
	.byte	0x4
	.set L$set$9,LCFI4-LCFI3
	.long L$set$9
	.byte	0xe
	.uleb128 0x30
	.byte	0x86
	.uleb128 0x6
	.byte	0x4
	.set L$set$10,LCFI5-LCFI4
	.long L$set$10
	.byte	0xe
	.uleb128 0x38
	.byte	0x83
	.uleb128 0x7
	.byte	0x4
	.set L$set$11,LCFI6-LCFI5
	.long L$set$11
	.byte	0xe
	.uleb128 0xa8
	.byte	0x4
	.set L$set$12,LCFI7-LCFI6
	.long L$set$12
	.byte	0xa
	.byte	0xe
	.uleb128 0x38
	.byte	0x4
	.set L$set$13,LCFI8-LCFI7
	.long L$set$13
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.set L$set$14,LCFI9-LCFI8
	.long L$set$14
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.set L$set$15,LCFI10-LCFI9
	.long L$set$15
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.set L$set$16,LCFI11-LCFI10
	.long L$set$16
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.set L$set$17,LCFI12-LCFI11
	.long L$set$17
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.set L$set$18,LCFI13-LCFI12
	.long L$set$18
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.set L$set$19,LCFI14-LCFI13
	.long L$set$19
	.byte	0xb
	.align 3
LEFDE3:
LSFDE5:
	.set L$set$20,LEFDE5-LASFDE5
	.long L$set$20
LASFDE5:
	.long	LASFDE5-EH_frame1
	.quad	LFB30-.
	.set L$set$21,LFE30-LFB30
	.quad L$set$21
	.uleb128 0
	.byte	0x4
	.set L$set$22,LCFI15-LFB30
	.long L$set$22
	.byte	0xe
	.uleb128 0x10
	.byte	0x8f
	.uleb128 0x2
	.byte	0x4
	.set L$set$23,LCFI16-LCFI15
	.long L$set$23
	.byte	0xe
	.uleb128 0x18
	.byte	0x8e
	.uleb128 0x3
	.byte	0x4
	.set L$set$24,LCFI17-LCFI16
	.long L$set$24
	.byte	0xe
	.uleb128 0x20
	.byte	0x8d
	.uleb128 0x4
	.byte	0x4
	.set L$set$25,LCFI18-LCFI17
	.long L$set$25
	.byte	0xe
	.uleb128 0x28
	.byte	0x8c
	.uleb128 0x5
	.byte	0x4
	.set L$set$26,LCFI19-LCFI18
	.long L$set$26
	.byte	0xe
	.uleb128 0x30
	.byte	0x86
	.uleb128 0x6
	.byte	0x4
	.set L$set$27,LCFI20-LCFI19
	.long L$set$27
	.byte	0xe
	.uleb128 0x38
	.byte	0x83
	.uleb128 0x7
	.byte	0x4
	.set L$set$28,LCFI21-LCFI20
	.long L$set$28
	.byte	0xa
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.set L$set$29,LCFI22-LCFI21
	.long L$set$29
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.set L$set$30,LCFI23-LCFI22
	.long L$set$30
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.set L$set$31,LCFI24-LCFI23
	.long L$set$31
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.set L$set$32,LCFI25-LCFI24
	.long L$set$32
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.set L$set$33,LCFI26-LCFI25
	.long L$set$33
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.set L$set$34,LCFI27-LCFI26
	.long L$set$34
	.byte	0xb
	.byte	0x4
	.set L$set$35,LCFI28-LCFI27
	.long L$set$35
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.set L$set$36,LCFI29-LCFI28
	.long L$set$36
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.set L$set$37,LCFI30-LCFI29
	.long L$set$37
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.set L$set$38,LCFI31-LCFI30
	.long L$set$38
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.set L$set$39,LCFI32-LCFI31
	.long L$set$39
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.set L$set$40,LCFI33-LCFI32
	.long L$set$40
	.byte	0xe
	.uleb128 0x8
	.align 3
LEFDE5:
LSFDE7:
	.set L$set$41,LEFDE7-LASFDE7
	.long L$set$41
LASFDE7:
	.long	LASFDE7-EH_frame1
	.quad	LFB31-.
	.set L$set$42,LFE31-LFB31
	.quad L$set$42
	.uleb128 0
	.byte	0x4
	.set L$set$43,LCFI34-LFB31
	.long L$set$43
	.byte	0xe
	.uleb128 0x10
	.byte	0x8f
	.uleb128 0x2
	.byte	0x4
	.set L$set$44,LCFI35-LCFI34
	.long L$set$44
	.byte	0xe
	.uleb128 0x18
	.byte	0x8e
	.uleb128 0x3
	.byte	0x4
	.set L$set$45,LCFI36-LCFI35
	.long L$set$45
	.byte	0xe
	.uleb128 0x20
	.byte	0x8d
	.uleb128 0x4
	.byte	0x4
	.set L$set$46,LCFI37-LCFI36
	.long L$set$46
	.byte	0xe
	.uleb128 0x28
	.byte	0x8c
	.uleb128 0x5
	.byte	0x4
	.set L$set$47,LCFI38-LCFI37
	.long L$set$47
	.byte	0xe
	.uleb128 0x30
	.byte	0x86
	.uleb128 0x6
	.byte	0x4
	.set L$set$48,LCFI39-LCFI38
	.long L$set$48
	.byte	0xe
	.uleb128 0x38
	.byte	0x83
	.uleb128 0x7
	.byte	0x4
	.set L$set$49,LCFI40-LCFI39
	.long L$set$49
	.byte	0xe
	.uleb128 0x70
	.byte	0x4
	.set L$set$50,LCFI41-LCFI40
	.long L$set$50
	.byte	0xa
	.byte	0xe
	.uleb128 0x38
	.byte	0x4
	.set L$set$51,LCFI42-LCFI41
	.long L$set$51
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.set L$set$52,LCFI43-LCFI42
	.long L$set$52
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.set L$set$53,LCFI44-LCFI43
	.long L$set$53
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.set L$set$54,LCFI45-LCFI44
	.long L$set$54
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.set L$set$55,LCFI46-LCFI45
	.long L$set$55
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.set L$set$56,LCFI47-LCFI46
	.long L$set$56
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.set L$set$57,LCFI48-LCFI47
	.long L$set$57
	.byte	0xb
	.align 3
LEFDE7:
LSFDE9:
	.set L$set$58,LEFDE9-LASFDE9
	.long L$set$58
LASFDE9:
	.long	LASFDE9-EH_frame1
	.quad	LFB32-.
	.set L$set$59,LFE32-LFB32
	.quad L$set$59
	.uleb128 0
	.byte	0x4
	.set L$set$60,LCFI49-LFB32
	.long L$set$60
	.byte	0xe
	.uleb128 0x10
	.byte	0x8c
	.uleb128 0x2
	.byte	0x4
	.set L$set$61,LCFI50-LCFI49
	.long L$set$61
	.byte	0xe
	.uleb128 0x18
	.byte	0x86
	.uleb128 0x3
	.byte	0x4
	.set L$set$62,LCFI51-LCFI50
	.long L$set$62
	.byte	0xe
	.uleb128 0x20
	.byte	0x83
	.uleb128 0x4
	.byte	0x4
	.set L$set$63,LCFI52-LCFI51
	.long L$set$63
	.byte	0xe
	.uleb128 0x120
	.byte	0x4
	.set L$set$64,LCFI53-LCFI52
	.long L$set$64
	.byte	0xa
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.set L$set$65,LCFI54-LCFI53
	.long L$set$65
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.set L$set$66,LCFI55-LCFI54
	.long L$set$66
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.set L$set$67,LCFI56-LCFI55
	.long L$set$67
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.set L$set$68,LCFI57-LCFI56
	.long L$set$68
	.byte	0xb
	.align 3
LEFDE9:
LSFDE11:
	.set L$set$69,LEFDE11-LASFDE11
	.long L$set$69
LASFDE11:
	.long	LASFDE11-EH_frame1
	.quad	LFB33-.
	.set L$set$70,LFE33-LFB33
	.quad L$set$70
	.uleb128 0
	.byte	0x4
	.set L$set$71,LCFI58-LFB33
	.long L$set$71
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.set L$set$72,LCFI59-LCFI58
	.long L$set$72
	.byte	0xe
	.uleb128 0x8
	.align 3
LEFDE11:
LSFDE13:
	.set L$set$73,LEFDE13-LASFDE13
	.long L$set$73
LASFDE13:
	.long	LASFDE13-EH_frame1
	.quad	LFB28-.
	.set L$set$74,LFE28-LFB28
	.quad L$set$74
	.uleb128 0
	.byte	0x4
	.set L$set$75,LCFI60-LFB28
	.long L$set$75
	.byte	0xe
	.uleb128 0x10
	.byte	0x8f
	.uleb128 0x2
	.byte	0x4
	.set L$set$76,LCFI61-LCFI60
	.long L$set$76
	.byte	0xe
	.uleb128 0x18
	.byte	0x8e
	.uleb128 0x3
	.byte	0x4
	.set L$set$77,LCFI62-LCFI61
	.long L$set$77
	.byte	0xe
	.uleb128 0x20
	.byte	0x8d
	.uleb128 0x4
	.byte	0x4
	.set L$set$78,LCFI63-LCFI62
	.long L$set$78
	.byte	0xe
	.uleb128 0x28
	.byte	0x8c
	.uleb128 0x5
	.byte	0x4
	.set L$set$79,LCFI64-LCFI63
	.long L$set$79
	.byte	0xe
	.uleb128 0x30
	.byte	0x86
	.uleb128 0x6
	.byte	0x4
	.set L$set$80,LCFI65-LCFI64
	.long L$set$80
	.byte	0xe
	.uleb128 0x38
	.byte	0x83
	.uleb128 0x7
	.byte	0x4
	.set L$set$81,LCFI66-LCFI65
	.long L$set$81
	.byte	0xe
	.uleb128 0x60
	.align 3
LEFDE13:
	.ident	"GCC: (Homebrew GCC 12.2.0) 12.2.0"
	.subsections_via_symbols
