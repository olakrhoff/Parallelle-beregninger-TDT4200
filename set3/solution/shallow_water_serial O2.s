# GNU C17 (Homebrew GCC 12.2.0) version 12.2.0 (x86_64-apple-darwin21)
#	compiled by GNU C version 12.2.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.25-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -fPIC -mmacosx-version-min=12.0.0 -mtune=core2 -O2 -fopenmp
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
# src/shallow_water_serial.c:136:     for (int_t y = 1; y <= N; y++)
	movq	_N(%rip), %r8	# N, N.15_265
# src/shallow_water_serial.c:135: {
	pushq	%r15	#
LCFI0:
	pushq	%r14	#
LCFI1:
	pushq	%r13	#
LCFI2:
	pushq	%r12	#
LCFI3:
# src/shallow_water_serial.c:136:     for (int_t y = 1; y <= N; y++)
	testq	%r8, %r8	# N.15_265
# src/shallow_water_serial.c:135: {
	pushq	%rbp	#
LCFI4:
	pushq	%rbx	#
LCFI5:
# src/shallow_water_serial.c:136:     for (int_t y = 1; y <= N; y++)
	jle	L34	#,
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	leaq	2(%r8), %r12	#, _555
# src/shallow_water_serial.c:139:             U(y, x) = PNU(y, x) / PN(y, x);
	movq	_mass_velocity_x(%rip), %rbp	# mass_velocity_x[0], _1
# src/shallow_water_serial.c:136:     for (int_t y = 1; y <= N; y++)
	movl	$1, %r13d	#, y
# src/shallow_water_serial.c:139:             U(y, x) = PNU(y, x) / PN(y, x);
	movq	_mass(%rip), %rdx	# mass[0], _42
	leaq	(%r8,%r12), %rdi	#, tmp257
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movq	%r12, %r14	# _555, ivtmp.357
# src/shallow_water_serial.c:139:             U(y, x) = PNU(y, x) / PN(y, x);
	movq	_velocity_x(%rip), %rcx	# velocity_x, velocity_x.26_50
	leaq	0(,%r12,8), %rbx	#, _502
	salq	$3, %rdi	#, ivtmp.333
# src/shallow_water_serial.c:140:             V(y, x) = PNV(y, x) / PN(y, x);
	movq	_mass_velocity_y(%rip), %r10	# mass_velocity_y[0], _15
	leaq	1(%r8), %r11	#, _495
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movq	%rdi, %r9	# ivtmp.333, ivtmp.358
# src/shallow_water_serial.c:140:             V(y, x) = PNV(y, x) / PN(y, x);
	movq	_velocity_y(%rip), %rsi	# velocity_y, velocity_y.35_62
	.p2align 4,,10
	.p2align 3
L7:
	leaq	0(,%r14,8), %rax	#, ivtmp.351
	.p2align 4,,10
	.p2align 3
L6:
# src/shallow_water_serial.c:139:             U(y, x) = PNU(y, x) / PN(y, x);
	movsd	8(%rbp,%rax), %xmm0	# MEM[(real_t *)_1 + 8B + ivtmp.351_517 * 1], MEM[(real_t *)_1 + 8B + ivtmp.351_517 * 1]
	divsd	8(%rdx,%rax), %xmm0	# MEM[(real_t *)_9 + 8B + ivtmp.351_517 * 1], tmp250
# src/shallow_water_serial.c:139:             U(y, x) = PNU(y, x) / PN(y, x);
	movsd	%xmm0, 8(%rcx,%rax)	# tmp250, MEM[(real_t *)velocity_x.8_12 + 8B + ivtmp.351_517 * 1]
# src/shallow_water_serial.c:140:             V(y, x) = PNV(y, x) / PN(y, x);
	movsd	8(%r10,%rax), %xmm0	# MEM[(real_t *)_15 + 8B + ivtmp.351_517 * 1], MEM[(real_t *)_15 + 8B + ivtmp.351_517 * 1]
	divsd	8(%rdx,%rax), %xmm0	# MEM[(real_t *)_9 + 8B + ivtmp.351_517 * 1], tmp252
# src/shallow_water_serial.c:140:             V(y, x) = PNV(y, x) / PN(y, x);
	movsd	%xmm0, 8(%rsi,%rax)	# tmp252, MEM[(real_t *)velocity_y.12_19 + 8B + ivtmp.351_517 * 1]
# src/shallow_water_serial.c:137:         for (int_t x = 1; x <= N; x++)
	addq	$8, %rax	#, ivtmp.351
	cmpq	%rax, %r9	# ivtmp.351, ivtmp.358
	jne	L6	#,
# src/shallow_water_serial.c:136:     for (int_t y = 1; y <= N; y++)
	addq	$1, %r13	#, y
# src/shallow_water_serial.c:136:     for (int_t y = 1; y <= N; y++)
	addq	%r12, %r14	# _555, ivtmp.357
	addq	%rbx, %r9	# _502, ivtmp.358
	cmpq	%r11, %r13	# _495, y
	jne	L7	#,
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	movq	_mass_velocity(%rip), %r9	# mass_velocity, mass_velocity.21_38
	movq	%r12, %r10	# _555, ivtmp.332
# src/shallow_water_serial.c:143:     for (int_t y = 1; y <= N; y++)
	movl	$1, %ebp	#, y
	.p2align 4,,10
	.p2align 3
L8:
	leaq	0(,%r10,8), %rax	#, ivtmp.326
	.p2align 4,,10
	.p2align 3
L9:
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	movsd	8(%rdx,%rax), %xmm0	# MEM[(real_t *)_9 + 8B + ivtmp.326_541 * 1], MEM[(real_t *)_9 + 8B + ivtmp.326_541 * 1]
	mulsd	8(%rcx,%rax), %xmm0	# MEM[(real_t *)velocity_x.8_12 + 8B + ivtmp.326_541 * 1], tmp258
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	mulsd	8(%rsi,%rax), %xmm0	# MEM[(real_t *)velocity_y.12_19 + 8B + ivtmp.326_541 * 1], tmp260
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	movsd	%xmm0, 8(%r9,%rax)	# tmp260, MEM[(real_t *)mass_velocity.21_38 + 8B + ivtmp.326_541 * 1]
# src/shallow_water_serial.c:144:         for (int_t x = 1; x <= N; x++)
	addq	$8, %rax	#, ivtmp.326
	cmpq	%rax, %rdi	# ivtmp.326, ivtmp.333
	jne	L9	#,
# src/shallow_water_serial.c:143:     for (int_t y = 1; y <= N; y++)
	addq	$1, %rbp	#, y
# src/shallow_water_serial.c:143:     for (int_t y = 1; y <= N; y++)
	addq	%r12, %r10	# _555, ivtmp.332
	addq	%rbx, %rdi	# _502, ivtmp.333
	cmpq	%r11, %rbp	# _495, y
	jne	L8	#,
L10:
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	movq	_acceleration_x(%rip), %r11	# acceleration_x, acceleration_x.32_58
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	xorl	%ebp, %ebp	# ivtmp.309
# src/shallow_water_serial.c:149:     for (int_t y = 0; y <= N + 1; y++)
	xorl	%ebx, %ebx	# y
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	movq	_acceleration_y(%rip), %rdi	# acceleration_y, acceleration_y.41_70
	leaq	0(,%r12,8), %r9	#, _549
	movsd	lC0(%rip), %xmm3	#, tmp336
	movq	%r9, %r10	# _549, ivtmp.310
	movsd	lC1(%rip), %xmm2	#, tmp337
	.p2align 4,,10
	.p2align 3
L12:
	leaq	0(,%rbp,8), %rax	#, ivtmp.304
	.p2align 4,,10
	.p2align 3
L13:
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	movsd	(%rdx,%rax), %xmm1	# MEM[(real_t *)_42 + ivtmp.304_566 * 1], _49
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	movsd	(%rcx,%rax), %xmm4	# MEM[(real_t *)velocity_x.26_50 + ivtmp.304_566 * 1], _52
# src/shallow_water_serial.c:153:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	movapd	%xmm1, %xmm0	# _49, tmp262
	mulsd	%xmm1, %xmm0	# _49, tmp262
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	mulsd	%xmm4, %xmm1	# _52, tmp267
# src/shallow_water_serial.c:153:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	divsd	%xmm3, %xmm0	# tmp336, tmp263
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	mulsd	%xmm4, %xmm1	# _52, tmp268
# src/shallow_water_serial.c:153:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	mulsd	%xmm2, %xmm0	# tmp337, tmp265
# src/shallow_water_serial.c:153:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	addsd	%xmm1, %xmm0	# tmp268, tmp269
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	movsd	%xmm0, (%r11,%rax)	# tmp269, MEM[(real_t *)acceleration_x.32_58 + ivtmp.304_566 * 1]
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	movsd	(%rdx,%rax), %xmm1	# MEM[(real_t *)_42 + ivtmp.304_566 * 1], _61
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	movsd	(%rsi,%rax), %xmm4	# MEM[(real_t *)velocity_y.35_62 + ivtmp.304_566 * 1], _64
# src/shallow_water_serial.c:155:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	movapd	%xmm1, %xmm0	# _61, tmp270
	mulsd	%xmm1, %xmm0	# _61, tmp270
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	mulsd	%xmm4, %xmm1	# _64, tmp275
# src/shallow_water_serial.c:155:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	divsd	%xmm3, %xmm0	# tmp336, tmp271
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	mulsd	%xmm4, %xmm1	# _64, tmp276
# src/shallow_water_serial.c:155:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	mulsd	%xmm2, %xmm0	# tmp337, tmp273
# src/shallow_water_serial.c:155:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	addsd	%xmm1, %xmm0	# tmp276, tmp277
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	movsd	%xmm0, (%rdi,%rax)	# tmp277, MEM[(real_t *)acceleration_y.41_70 + ivtmp.304_566 * 1]
# src/shallow_water_serial.c:150:         for (int_t x = 0; x <= N + 1; x++)
	addq	$8, %rax	#, ivtmp.304
	cmpq	%rax, %r10	# ivtmp.304, ivtmp.310
	jne	L13	#,
# src/shallow_water_serial.c:149:     for (int_t y = 0; y <= N + 1; y++)
	addq	$1, %rbx	#, y
# src/shallow_water_serial.c:149:     for (int_t y = 0; y <= N + 1; y++)
	addq	%r12, %rbp	# _555, ivtmp.309
	addq	%r9, %r10	# _549, ivtmp.310
	cmpq	%r12, %rbx	# _555, y
	jne	L12	#,
# src/shallow_water_serial.c:158:     for (int_t y = 1; y <= N; y++)
	testq	%r8, %r8	# N.15_265
	jle	L3	#,
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movq	_mass_velocity_x(%rip), %rcx	# mass_velocity_x[0], _74
	leaq	(%r8,%r12), %r10	#, tmp280
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movq	%r12, %r13	# _555, ivtmp.292
	addq	$1, %r8	#, _568
# src/shallow_water_serial.c:163:                     + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
	movq	_mass_velocity(%rip), %rsi	# mass_velocity, mass_velocity.52_100
	salq	$3, %r10	#, ivtmp.231
# src/shallow_water_serial.c:158:     for (int_t y = 1; y <= N; y++)
	movl	$1, %r14d	#, y
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movq	8+_mass_velocity_x(%rip), %rbp	# mass_velocity_x[1], _110
	movq	%r10, %rbx	# ivtmp.231, ivtmp.293
	movsd	lC2(%rip), %xmm2	#, tmp338
	.p2align 4,,10
	.p2align 3
L15:
	leaq	0(,%r13,8), %rax	#, ivtmp.285
	.p2align 4,,10
	.p2align 3
L16:
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movsd	16(%rcx,%rax), %xmm0	# MEM[(real_t *)_74 + 16B + ivtmp.285_590 * 1], MEM[(real_t *)_74 + 16B + ivtmp.285_590 * 1]
	addsd	(%rcx,%rax), %xmm0	# MEM[(real_t *)_74 + ivtmp.285_590 * 1], tmp282
# src/shallow_water_serial.c:162:                     (DU(y, x + 1) - DU(y, x - 1)) / (2 * dx)
	movsd	_dx(%rip), %xmm4	# dx, dx
# src/shallow_water_serial.c:163:                     + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
	movsd	16(%rsi,%rax), %xmm3	# MEM[(real_t *)mass_velocity.52_100 + 16B + ivtmp.285_590 * 1], MEM[(real_t *)mass_velocity.52_100 + 16B + ivtmp.285_590 * 1]
# src/shallow_water_serial.c:162:                     (DU(y, x + 1) - DU(y, x - 1)) / (2 * dx)
	addsd	%xmm4, %xmm4	# dx, _98
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movapd	%xmm0, %xmm1	# tmp282, tmp282
# src/shallow_water_serial.c:162:                     (DU(y, x + 1) - DU(y, x - 1)) / (2 * dx)
	movsd	16(%r11,%rax), %xmm0	# MEM[(real_t *)acceleration_x.32_58 + 16B + ivtmp.285_590 * 1], MEM[(real_t *)acceleration_x.32_58 + 16B + ivtmp.285_590 * 1]
# src/shallow_water_serial.c:163:                     + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
	subsd	(%rsi,%rax), %xmm3	# MEM[(real_t *)mass_velocity.52_100 + ivtmp.285_590 * 1], tmp289
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	mulsd	%xmm2, %xmm1	# tmp338, tmp282
# src/shallow_water_serial.c:162:                     (DU(y, x + 1) - DU(y, x - 1)) / (2 * dx)
	subsd	(%r11,%rax), %xmm0	# MEM[(real_t *)acceleration_x.32_58 + ivtmp.285_590 * 1], tmp286
# src/shallow_water_serial.c:163:                     + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
	divsd	%xmm4, %xmm3	# _98, tmp291
# src/shallow_water_serial.c:162:                     (DU(y, x + 1) - DU(y, x - 1)) / (2 * dx)
	divsd	%xmm4, %xmm0	# _98, tmp288
# src/shallow_water_serial.c:163:                     + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
	addsd	%xmm3, %xmm0	# tmp291, tmp292
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	mulsd	_dt(%rip), %xmm0	# dt, tmp293
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	subsd	%xmm0, %xmm1	# tmp293, tmp294
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movsd	%xmm1, 8(%rbp,%rax)	# tmp294, MEM[(real_t *)_110 + 8B + ivtmp.285_590 * 1]
# src/shallow_water_serial.c:159:         for (int_t x = 1; x <= N; x++)
	addq	$8, %rax	#, ivtmp.285
	cmpq	%rax, %rbx	# ivtmp.285, ivtmp.293
	jne	L16	#,
# src/shallow_water_serial.c:158:     for (int_t y = 1; y <= N; y++)
	addq	$1, %r14	#, y
# src/shallow_water_serial.c:158:     for (int_t y = 1; y <= N; y++)
	addq	%r12, %r13	# _555, ivtmp.292
	addq	%r9, %rbx	# _549, ivtmp.293
	cmpq	%r8, %r14	# _568, y
	jne	L15	#,
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movq	_mass_velocity_y(%rip), %r13	# mass_velocity_y[0], _116
	movq	%r12, %rax	# _555, ivtmp.227
# src/shallow_water_serial.c:167:     for (int_t y = 1; y <= N; y++)
	movl	$1, %r15d	#, y
	movq	8+_mass_velocity_y(%rip), %r11	# mass_velocity_y[1], ivtmp.269
	salq	$4, %rax	#, ivtmp.227
	movq	%rax, -8(%rsp)	# ivtmp.227, %sfp
	leaq	(%rdi,%rax), %rbp	#, ivtmp.264
	leaq	(%rsi,%rax), %rbx	#, ivtmp.266
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movq	%r13, -32(%rsp)	# _116, %sfp
	leaq	0(%r13,%rax), %r14	#, ivtmp.261
	addq	%r9, %r11	# _549, ivtmp.269
	.p2align 4,,10
	.p2align 3
L19:
	addq	$1, %r15	#, y
# src/shallow_water_serial.c:168:         for (int_t x = 1; x <= N; x++)
	movl	$1, %eax	#, x
	.p2align 4,,10
	.p2align 3
L18:
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movsd	(%r14,%rax,8), %xmm0	# MEM[(real_t *)_678 + _677 * 8], MEM[(real_t *)_678 + _677 * 8]
	addsd	0(%r13,%rax,8), %xmm0	# MEM[(real_t *)_674 + _677 * 8], tmp296
# src/shallow_water_serial.c:171:                     (DV(y + 1, x) - DV(y - 1, x)) / (2 * dx)
	movsd	_dx(%rip), %xmm4	# dx, dx
# src/shallow_water_serial.c:172:                     + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx)
	movsd	(%rbx,%rax,8), %xmm3	# MEM[(real_t *)_662 + _677 * 8], MEM[(real_t *)_662 + _677 * 8]
# src/shallow_water_serial.c:171:                     (DV(y + 1, x) - DV(y - 1, x)) / (2 * dx)
	addsd	%xmm4, %xmm4	# dx, _141
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movapd	%xmm0, %xmm1	# tmp296, tmp296
# src/shallow_water_serial.c:171:                     (DV(y + 1, x) - DV(y - 1, x)) / (2 * dx)
	movsd	0(%rbp,%rax,8), %xmm0	# MEM[(real_t *)_670 + _677 * 8], MEM[(real_t *)_670 + _677 * 8]
# src/shallow_water_serial.c:172:                     + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx)
	subsd	(%rsi,%rax,8), %xmm3	# MEM[(real_t *)_658 + _677 * 8], tmp303
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	mulsd	%xmm2, %xmm1	# tmp338, tmp296
# src/shallow_water_serial.c:171:                     (DV(y + 1, x) - DV(y - 1, x)) / (2 * dx)
	subsd	(%rdi,%rax,8), %xmm0	# MEM[(real_t *)_666 + _677 * 8], tmp300
# src/shallow_water_serial.c:172:                     + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx)
	divsd	%xmm4, %xmm3	# _141, tmp305
# src/shallow_water_serial.c:171:                     (DV(y + 1, x) - DV(y - 1, x)) / (2 * dx)
	divsd	%xmm4, %xmm0	# _141, tmp302
# src/shallow_water_serial.c:172:                     + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx)
	addsd	%xmm3, %xmm0	# tmp305, tmp306
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	mulsd	_dt(%rip), %xmm0	# dt, tmp307
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	subsd	%xmm0, %xmm1	# tmp307, tmp308
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movsd	%xmm1, (%r11,%rax,8)	# tmp308, MEM[(real_t *)_654 + _677 * 8]
# src/shallow_water_serial.c:168:         for (int_t x = 1; x <= N; x++)
	addq	$1, %rax	#, x
# src/shallow_water_serial.c:168:         for (int_t x = 1; x <= N; x++)
	cmpq	%r8, %rax	# _568, x
	jne	L18	#,
# src/shallow_water_serial.c:167:     for (int_t y = 1; y <= N; y++)
	addq	%r9, %r14	# _549, ivtmp.261
	addq	%r9, %r13	# _549, ivtmp.263
	addq	%r9, %rbp	# _549, ivtmp.264
	addq	%r9, %rdi	# _549, ivtmp.265
	addq	%r9, %rbx	# _549, ivtmp.266
	addq	%r9, %rsi	# _549, ivtmp.267
	addq	%r9, %r11	# _549, ivtmp.269
	cmpq	%r8, %r15	# _568, y
	jne	L19	#,
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movq	%r12, %r14	# _555, ivtmp.225
	movq	%r12, -24(%rsp)	# _555, %sfp
	movq	-8(%rsp), %r12	# %sfp, ivtmp.227
	movq	%r9, %r13	# _549, ivtmp.228
	negq	%r13	# ivtmp.228
	xorl	%r15d, %r15d	# ivtmp.230
# src/shallow_water_serial.c:176:     for (int_t y = 1; y <= N; y++)
	movl	$1, %ebx	#, y
	movq	%rcx, -40(%rsp)	# _74, %sfp
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movq	8+_mass(%rip), %rbp	# mass[1], _212
	movq	%r8, -16(%rsp)	# _568, %sfp
	movsd	lC3(%rip), %xmm4	#, tmp339
	.p2align 4,,10
	.p2align 3
L20:
	movq	-24(%rsp), %rdi	# %sfp, _555
	leaq	(%r15,%r13), %rsi	#, _735
	movq	%r14, %rax	# ivtmp.225, ivtmp.225
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	addq	$1, %rbx	#, y
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	movq	-32(%rsp), %rcx	# %sfp, _116
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	leaq	(%rdx,%rsi), %r8	#, tmp318
	salq	$3, %rax	#, ivtmp.213
	addq	%rdi, %r14	# _555, ivtmp.225
	leaq	0(%r13,%r12), %rdi	#, _741
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	addq	%rcx, %rsi	# _116, tmp323
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	leaq	(%rdx,%rdi), %r11	#, tmp316
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	addq	%rcx, %rdi	# _116, tmp322
	movq	-40(%rsp), %rcx	# %sfp, _74
	.p2align 4,,10
	.p2align 3
L21:
# src/shallow_water_serial.c:180:                     (PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx)
	movsd	_dx(%rip), %xmm3	# dx, dx
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	movsd	8(%rdi,%rax), %xmm1	# MEM[(real_t *)_728 + 8B + ivtmp.213_310 * 1], MEM[(real_t *)_728 + 8B + ivtmp.213_310 * 1]
# src/shallow_water_serial.c:180:                     (PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx)
	movsd	16(%rcx,%rax), %xmm2	# MEM[(real_t *)_74 + 16B + ivtmp.213_310 * 1], MEM[(real_t *)_74 + 16B + ivtmp.213_310 * 1]
# src/shallow_water_serial.c:180:                     (PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx)
	addsd	%xmm3, %xmm3	# dx, _200
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	subsd	8(%rsi,%rax), %xmm1	# MEM[(real_t *)_722 + 8B + ivtmp.213_310 * 1], tmp324
# src/shallow_water_serial.c:180:                     (PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx)
	subsd	(%rcx,%rax), %xmm2	# MEM[(real_t *)_74 + ivtmp.213_310 * 1], tmp327
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movsd	16(%rdx,%rax), %xmm0	# MEM[(real_t *)_42 + 16B + ivtmp.213_310 * 1], MEM[(real_t *)_42 + 16B + ivtmp.213_310 * 1]
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	divsd	%xmm3, %xmm1	# _200, tmp326
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	addsd	(%rdx,%rax), %xmm0	# MEM[(real_t *)_42 + ivtmp.213_310 * 1], tmp314
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	addsd	8(%r11,%rax), %xmm0	# MEM[(real_t *)_740 + 8B + ivtmp.213_310 * 1], tmp317
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	addsd	8(%r8,%rax), %xmm0	# MEM[(real_t *)_734 + 8B + ivtmp.213_310 * 1], tmp319
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	mulsd	%xmm4, %xmm0	# tmp339, tmp320
# src/shallow_water_serial.c:180:                     (PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx)
	divsd	%xmm3, %xmm2	# _200, tmp329
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	addsd	%xmm2, %xmm1	# tmp329, tmp330
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	mulsd	_dt(%rip), %xmm1	# dt, tmp331
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	subsd	%xmm1, %xmm0	# tmp331, tmp332
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movsd	%xmm0, 8(%rbp,%rax)	# tmp332, MEM[(real_t *)_212 + 8B + ivtmp.213_310 * 1]
# src/shallow_water_serial.c:177:         for (int_t x = 1; x <= N; x++)
	addq	$8, %rax	#, ivtmp.213
	cmpq	%r10, %rax	# ivtmp.231, ivtmp.213
	jne	L21	#,
# src/shallow_water_serial.c:176:     for (int_t y = 1; y <= N; y++)
	movq	-16(%rsp), %rax	# %sfp, _568
	addq	%r9, %r12	# _549, ivtmp.227
	subq	%r9, %r13	# _549, ivtmp.228
	addq	%r9, %r15	# _549, ivtmp.230
	addq	%r9, %r10	# _549, ivtmp.231
	movq	%rcx, -40(%rsp)	# _74, %sfp
	cmpq	%rax, %rbx	# _568, y
	jne	L20	#,
L3:
# src/shallow_water_serial.c:184: }
	popq	%rbx	#
LCFI6:
	popq	%rbp	#
LCFI7:
	popq	%r12	#
LCFI8:
	popq	%r13	#
LCFI9:
	popq	%r14	#
LCFI10:
	popq	%r15	#
LCFI11:
	ret	
L34:
LCFI12:
# src/shallow_water_serial.c:149:     for (int_t y = 0; y <= N + 1; y++)
	cmpq	$-1, %r8	#, N.15_265
	jl	L3	#,
	movq	_mass(%rip), %rdx	# mass[0], _42
	leaq	2(%r8), %r12	#, _555
	movq	_velocity_x(%rip), %rcx	# velocity_x, velocity_x.26_50
	movq	_velocity_y(%rip), %rsi	# velocity_y, velocity_y.35_62
	jmp	L10	#
LFE29:
	.p2align 4
	.globl _boundary_condition
_boundary_condition:
LFB30:
# src/shallow_water_serial.c:191:     VAR(0, 0) = sign * VAR(2, 2);
	movq	_N(%rip), %r8	# N, N.91_2
# src/shallow_water_serial.c:191:     VAR(0, 0) = sign * VAR(2, 2);
	pxor	%xmm0, %xmm0	# _1
# src/shallow_water_serial.c:189: {
	pushq	%rbx	#
LCFI13:
# src/shallow_water_serial.c:189: {
	movq	%rdi, %r9	# tmp189, domain_variable
# src/shallow_water_serial.c:191:     VAR(0, 0) = sign * VAR(2, 2);
	cvtsi2sdl	%esi, %xmm0	# tmp190, _1
# src/shallow_water_serial.c:192:     VAR(N + 1, 0) = sign * VAR(N - 1, 2);
	leaq	-1(%r8), %rdx	#, _9
# src/shallow_water_serial.c:191:     VAR(0, 0) = sign * VAR(2, 2);
	movq	%r8, %rax	# N.91_2, tmp162
# src/shallow_water_serial.c:192:     VAR(N + 1, 0) = sign * VAR(N - 1, 2);
	leaq	2(%r8), %r10	#, _10
# src/shallow_water_serial.c:191:     VAR(0, 0) = sign * VAR(2, 2);
	salq	$4, %rax	#, tmp162
# src/shallow_water_serial.c:192:     VAR(N + 1, 0) = sign * VAR(N - 1, 2);
	movq	%rdx, %r11	# _9, _11
# src/shallow_water_serial.c:191:     VAR(0, 0) = sign * VAR(2, 2);
	movsd	48(%rdi,%rax), %xmm1	# *_6, tmp164
# src/shallow_water_serial.c:192:     VAR(N + 1, 0) = sign * VAR(N - 1, 2);
	imulq	%r10, %r11	# _10, _11
# src/shallow_water_serial.c:192:     VAR(N + 1, 0) = sign * VAR(N - 1, 2);
	leaq	(%r10,%r10), %rsi	#, slsr_138
# src/shallow_water_serial.c:191:     VAR(0, 0) = sign * VAR(2, 2);
	mulsd	%xmm0, %xmm1	# _1, tmp164
# src/shallow_water_serial.c:192:     VAR(N + 1, 0) = sign * VAR(N - 1, 2);
	leaq	1(%r8), %rax	#, _17
# src/shallow_water_serial.c:193:     VAR(0, N + 1) = sign * VAR(2, N - 1);
	leaq	0(,%rax,8), %rbx	#, _30
# src/shallow_water_serial.c:192:     VAR(N + 1, 0) = sign * VAR(N - 1, 2);
	leaq	(%r11,%rsi), %rcx	#, _18
# src/shallow_water_serial.c:191:     VAR(0, 0) = sign * VAR(2, 2);
	movsd	%xmm1, (%rdi)	# tmp164, *domain_variable_92(D)
# src/shallow_water_serial.c:192:     VAR(N + 1, 0) = sign * VAR(N - 1, 2);
	movsd	16(%rdi,%r11,8), %xmm1	# *_15, tmp167
	mulsd	%xmm0, %xmm1	# _1, tmp167
# src/shallow_water_serial.c:192:     VAR(N + 1, 0) = sign * VAR(N - 1, 2);
	movsd	%xmm1, (%rdi,%rcx,8)	# tmp167, *_21
# src/shallow_water_serial.c:193:     VAR(0, N + 1) = sign * VAR(2, N - 1);
	leaq	(%rdx,%rsi), %rdi	#, tmp169
# src/shallow_water_serial.c:194:     VAR(N + 1, N + 1) = sign * VAR(N - 1, N - 1);
	addq	%r11, %rdx	# _11, tmp173
# src/shallow_water_serial.c:193:     VAR(0, N + 1) = sign * VAR(2, N - 1);
	movsd	(%r9,%rdi,8), %xmm1	# *_27, tmp170
	mulsd	%xmm0, %xmm1	# _1, tmp170
# src/shallow_water_serial.c:193:     VAR(0, N + 1) = sign * VAR(2, N - 1);
	movsd	%xmm1, (%r9,%rax,8)	# tmp170, *_31
# src/shallow_water_serial.c:194:     VAR(N + 1, N + 1) = sign * VAR(N - 1, N - 1);
	movsd	(%r9,%rdx,8), %xmm1	# *_36, tmp174
# src/shallow_water_serial.c:194:     VAR(N + 1, N + 1) = sign * VAR(N - 1, N - 1);
	addq	%rcx, %rax	# _18, tmp172
# src/shallow_water_serial.c:196:     for (int_t y = 1; y <= N; y++) VAR(y, 0) = sign * VAR(y, 2);
	testq	%r8, %r8	# N.91_2
# src/shallow_water_serial.c:194:     VAR(N + 1, N + 1) = sign * VAR(N - 1, N - 1);
	mulsd	%xmm0, %xmm1	# _1, tmp174
# src/shallow_water_serial.c:194:     VAR(N + 1, N + 1) = sign * VAR(N - 1, N - 1);
	movsd	%xmm1, (%r9,%rax,8)	# tmp174, *_41
# src/shallow_water_serial.c:196:     for (int_t y = 1; y <= N; y++) VAR(y, 0) = sign * VAR(y, 2);
	jle	L35	#,
	leaq	8(%rbx), %rdi	#, _110
# src/shallow_water_serial.c:196:     for (int_t y = 1; y <= N; y++) VAR(y, 0) = sign * VAR(y, 2);
	movl	$1, %ecx	#, y
	leaq	(%r9,%rdi), %rax	#, ivtmp.398
	.p2align 4,,10
	.p2align 3
L37:
# src/shallow_water_serial.c:196:     for (int_t y = 1; y <= N; y++) VAR(y, 0) = sign * VAR(y, 2);
	movsd	16(%rax), %xmm1	# MEM[(real_t *)_86 + 16B], tmp176
	movq	%rcx, %rdx	# y, y
# src/shallow_water_serial.c:196:     for (int_t y = 1; y <= N; y++) VAR(y, 0) = sign * VAR(y, 2);
	leaq	1(%rcx), %rcx	#, y
# src/shallow_water_serial.c:196:     for (int_t y = 1; y <= N; y++) VAR(y, 0) = sign * VAR(y, 2);
	mulsd	%xmm0, %xmm1	# _1, tmp176
# src/shallow_water_serial.c:196:     for (int_t y = 1; y <= N; y++) VAR(y, 0) = sign * VAR(y, 2);
	movsd	%xmm1, (%rax)	# tmp176, MEM[(real_t *)_86]
# src/shallow_water_serial.c:196:     for (int_t y = 1; y <= N; y++) VAR(y, 0) = sign * VAR(y, 2);
	addq	%rdi, %rax	# _110, ivtmp.398
	cmpq	%rdx, %r8	# y, N.91_2
	jne	L37	#,
	addq	%r8, %r10	# N.91_2, tmp178
# src/shallow_water_serial.c:197:     for (int_t y = 1; y <= N; y++) VAR(y, N + 1) = sign * VAR(y, N - 1);
	movl	$1, %ecx	#, y
	leaq	(%r9,%r10,8), %rax	#, ivtmp.390
	.p2align 4,,10
	.p2align 3
L38:
# src/shallow_water_serial.c:197:     for (int_t y = 1; y <= N; y++) VAR(y, N + 1) = sign * VAR(y, N - 1);
	movsd	-8(%rax), %xmm1	# MEM[(real_t *)_120 + -8B], tmp180
	movq	%rcx, %r10	# y, y
# src/shallow_water_serial.c:197:     for (int_t y = 1; y <= N; y++) VAR(y, N + 1) = sign * VAR(y, N - 1);
	addq	$1, %rcx	#, y
# src/shallow_water_serial.c:197:     for (int_t y = 1; y <= N; y++) VAR(y, N + 1) = sign * VAR(y, N - 1);
	mulsd	%xmm0, %xmm1	# _1, tmp180
# src/shallow_water_serial.c:197:     for (int_t y = 1; y <= N; y++) VAR(y, N + 1) = sign * VAR(y, N - 1);
	movsd	%xmm1, 8(%rax)	# tmp180, MEM[(real_t *)_120 + 8B]
# src/shallow_water_serial.c:197:     for (int_t y = 1; y <= N; y++) VAR(y, N + 1) = sign * VAR(y, N - 1);
	addq	%rdi, %rax	# _110, ivtmp.390
	cmpq	%r10, %rdx	# y, y
	jne	L38	#,
	leaq	8(%r9), %rax	#, ivtmp.382
	addq	%r9, %rbx	# domain_variable, _137
	.p2align 4,,10
	.p2align 3
L39:
# src/shallow_water_serial.c:198:     for (int_t x = 1; x <= N; x++) VAR(0, x) = sign * VAR(2, x);
	movsd	(%rax,%rsi,8), %xmm1	# MEM[(real_t *)_144 + _143 * 8], tmp182
# src/shallow_water_serial.c:198:     for (int_t x = 1; x <= N; x++) VAR(0, x) = sign * VAR(2, x);
	addq	$8, %rax	#, ivtmp.382
# src/shallow_water_serial.c:198:     for (int_t x = 1; x <= N; x++) VAR(0, x) = sign * VAR(2, x);
	mulsd	%xmm0, %xmm1	# _1, tmp182
# src/shallow_water_serial.c:198:     for (int_t x = 1; x <= N; x++) VAR(0, x) = sign * VAR(2, x);
	movsd	%xmm1, -8(%rax)	# tmp182, MEM[(real_t *)_144]
# src/shallow_water_serial.c:198:     for (int_t x = 1; x <= N; x++) VAR(0, x) = sign * VAR(2, x);
	cmpq	%rax, %rbx	# ivtmp.382, _137
	jne	L39	#,
	leaq	(%r9,%r11,8), %rax	#, ivtmp.372
	addq	%r11, %r8	# _11, tmp185
	leaq	(%r9,%r8,8), %rdx	#, _149
	.p2align 4,,10
	.p2align 3
L41:
# src/shallow_water_serial.c:199:     for (int_t x = 1; x <= N; x++) VAR(N + 1, x) = sign * VAR(N - 1, x);
	movsd	8(%rax), %xmm1	# MEM[(real_t *)_159 + 8B], tmp187
	mulsd	%xmm0, %xmm1	# _1, tmp187
# src/shallow_water_serial.c:199:     for (int_t x = 1; x <= N; x++) VAR(N + 1, x) = sign * VAR(N - 1, x);
	movsd	%xmm1, 8(%rax,%rsi,8)	# tmp187, MEM[(real_t *)_159 + 8B + _143 * 8]
# src/shallow_water_serial.c:199:     for (int_t x = 1; x <= N; x++) VAR(N + 1, x) = sign * VAR(N - 1, x);
	addq	$8, %rax	#, ivtmp.372
	cmpq	%rax, %rdx	# ivtmp.372, _149
	jne	L41	#,
L35:
# src/shallow_water_serial.c:201: }
	popq	%rbx	#
LCFI14:
	ret	
LFE30:
	.p2align 4
	.globl _domain_init
_domain_init:
LFB31:
	pushq	%r15	#
LCFI15:
# src/shallow_water_serial.c:207:     mass[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
# src/shallow_water_serial.c:206: {
	pushq	%r14	#
LCFI16:
	pushq	%r13	#
LCFI17:
	pushq	%r12	#
LCFI18:
	pushq	%rbp	#
LCFI19:
	pushq	%rbx	#
LCFI20:
	subq	$56, %rsp	#,
LCFI21:
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
	movq	%rax, %rbp	# tmp188, tmp139
# src/shallow_water_serial.c:207:     mass[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, _mass(%rip)	# tmp139, mass[0]
# src/shallow_water_serial.c:208:     mass[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	call	_calloc	#
# src/shallow_water_serial.c:210:     mass_velocity_x[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rbx, %rdi	# _4,
# src/shallow_water_serial.c:208:     mass[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, 8+_mass(%rip)	# tmp189, mass[1]
# src/shallow_water_serial.c:210:     mass_velocity_x[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	call	_calloc	#
# src/shallow_water_serial.c:211:     mass_velocity_x[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rbx, %rdi	# _4,
# src/shallow_water_serial.c:210:     mass_velocity_x[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, _mass_velocity_x(%rip)	# tmp143, mass_velocity_x[0]
	movq	%rax, (%rsp)	# tmp143, %sfp
# src/shallow_water_serial.c:211:     mass_velocity_x[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	call	_calloc	#
# src/shallow_water_serial.c:212:     mass_velocity_y[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rbx, %rdi	# _4,
# src/shallow_water_serial.c:211:     mass_velocity_x[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, 8+_mass_velocity_x(%rip)	# tmp191, mass_velocity_x[1]
# src/shallow_water_serial.c:212:     mass_velocity_y[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	call	_calloc	#
# src/shallow_water_serial.c:213:     mass_velocity_y[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rbx, %rdi	# _4,
# src/shallow_water_serial.c:212:     mass_velocity_y[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, %r15	# tmp192, tmp147
# src/shallow_water_serial.c:212:     mass_velocity_y[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, _mass_velocity_y(%rip)	# tmp147, mass_velocity_y[0]
# src/shallow_water_serial.c:213:     mass_velocity_y[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	call	_calloc	#
# src/shallow_water_serial.c:215:     mass_velocity = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rbx, %rdi	# _4,
# src/shallow_water_serial.c:213:     mass_velocity_y[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, 8+_mass_velocity_y(%rip)	# tmp193, mass_velocity_y[1]
# src/shallow_water_serial.c:215:     mass_velocity = calloc((N + 2) * (N + 2), sizeof(real_t));
	call	_calloc	#
# src/shallow_water_serial.c:217:     velocity_x = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rbx, %rdi	# _4,
# src/shallow_water_serial.c:215:     mass_velocity = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, _mass_velocity(%rip)	# tmp194, mass_velocity
# src/shallow_water_serial.c:217:     velocity_x = calloc((N + 2) * (N + 2), sizeof(real_t));
	call	_calloc	#
# src/shallow_water_serial.c:218:     velocity_y = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rbx, %rdi	# _4,
# src/shallow_water_serial.c:217:     velocity_x = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, _velocity_x(%rip)	# tmp195, velocity_x
# src/shallow_water_serial.c:218:     velocity_y = calloc((N + 2) * (N + 2), sizeof(real_t));
	call	_calloc	#
# src/shallow_water_serial.c:219:     acceleration_x = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rbx, %rdi	# _4,
# src/shallow_water_serial.c:218:     velocity_y = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, _velocity_y(%rip)	# tmp196, velocity_y
# src/shallow_water_serial.c:219:     acceleration_x = calloc((N + 2) * (N + 2), sizeof(real_t));
	call	_calloc	#
# src/shallow_water_serial.c:220:     acceleration_y = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rbx, %rdi	# _4,
# src/shallow_water_serial.c:219:     acceleration_x = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, _acceleration_x(%rip)	# tmp197, acceleration_x
# src/shallow_water_serial.c:220:     acceleration_y = calloc((N + 2) * (N + 2), sizeof(real_t));
	call	_calloc	#
# src/shallow_water_serial.c:222:     for (int_t y = 1; y <= N; y++)
	testq	%r14, %r14	# N.122_1
# src/shallow_water_serial.c:220:     acceleration_y = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, _acceleration_y(%rip)	# tmp198, acceleration_y
# src/shallow_water_serial.c:222:     for (int_t y = 1; y <= N; y++)
	jle	L48	#,
	movq	(%rsp), %rdx	# %sfp, tmp143
	pxor	%xmm2, %xmm2	# _30
	leaq	1(%r14), %rbx	#, _77
# src/shallow_water_serial.c:230:             real_t cx = x - N / 2;
	movq	%r14, %rcx	# N.122_1, tmp156
	shrq	$63, %rcx	#, tmp156
	movsd	lC6(%rip), %xmm4	#, tmp180
	cvtsi2sdq	%r14, %xmm2	# N.122_1, _30
	addq	%r14, %rcx	# N.122_1, tmp157
	movsd	lC4(%rip), %xmm5	#, _117
	sarq	%rcx	# tmp157
	movq	%rcx, %r13	# tmp157, tmp158
	negq	%r13	# tmp158
	leaq	1(%r13), %rax	#, ivtmp.428
	movq	%rax, 24(%rsp)	# ivtmp.428, %sfp
	leaq	0(,%r12,8), %rax	#, _32
	movq	%rax, 32(%rsp)	# _32, %sfp
	leaq	(%rdx,%rax), %r12	#, ivtmp.432
	addq	%rax, %rbp	# _32, ivtmp.430
	addq	%rax, %r15	# _32, ivtmp.433
	leaq	(%rbx,%r13), %rax	#, _143
	movq	%rax, 40(%rsp)	# _143, %sfp
	.p2align 4,,10
	.p2align 3
L49:
# src/shallow_water_serial.c:231:             real_t cy = y - N / 2;
	pxor	%xmm3, %xmm3	# cy
	cvtsi2sdq	24(%rsp), %xmm3	# %sfp, cy
# src/shallow_water_serial.c:224:         for (int_t x = 1; x <= N; x++)
	movl	$1, %r14d	#, x
# src/shallow_water_serial.c:232:             if (sqrt(cx * cx + cy * cy) < N / 20.0)
	mulsd	%xmm3, %xmm3	# cy, _27
	jmp	L55	#
	.p2align 4,,10
	.p2align 3
L62:
	movapd	%xmm5, %xmm0	# _117, _117
# src/shallow_water_serial.c:240:             PN(y, x) *= density;
	movsd	%xmm0, 0(%rbp,%r14,8)	# _117, MEM[(real_t *)_100 + _112 * 8]
# src/shallow_water_serial.c:224:         for (int_t x = 1; x <= N; x++)
	addq	$1, %r14	#, x
# src/shallow_water_serial.c:224:         for (int_t x = 1; x <= N; x++)
	cmpq	%r14, %rbx	# x, _77
	je	L64	#,
L55:
# src/shallow_water_serial.c:230:             real_t cx = x - N / 2;
	leaq	(%r14,%r13), %rsi	#, tmp161
# src/shallow_water_serial.c:230:             real_t cx = x - N / 2;
	pxor	%xmm0, %xmm0	# cx
	pxor	%xmm6, %xmm6	# tmp159
# src/shallow_water_serial.c:227:             PNU(y, x) = 0.0;
	movq	$0x000000000, (%r12,%r14,8)	#, MEM[(real_t *)_113 + _112 * 8]
# src/shallow_water_serial.c:230:             real_t cx = x - N / 2;
	cvtsi2sdq	%rsi, %xmm0	# tmp161, cx
# src/shallow_water_serial.c:228:             PNV(y, x) = 0.0;
	movq	$0x000000000, (%r15,%r14,8)	#, MEM[(real_t *)_109 + _112 * 8]
# src/shallow_water_serial.c:232:             if (sqrt(cx * cx + cy * cy) < N / 20.0)
	movapd	%xmm0, %xmm1	# cx, cx
	mulsd	%xmm0, %xmm1	# cx, cx
# src/shallow_water_serial.c:232:             if (sqrt(cx * cx + cy * cy) < N / 20.0)
	movapd	%xmm1, %xmm0	# _26, _28
	addsd	%xmm3, %xmm0	# _27, _28
	ucomisd	%xmm0, %xmm6	# _28, tmp159
	ja	L61	#,
	sqrtsd	%xmm0, %xmm0	# _28, _29
L52:
# src/shallow_water_serial.c:232:             if (sqrt(cx * cx + cy * cy) < N / 20.0)
	movapd	%xmm2, %xmm6	# _30, tmp163
	movapd	%xmm2, %xmm7	# _30, _30
	divsd	%xmm4, %xmm6	# tmp180, tmp163
# src/shallow_water_serial.c:232:             if (sqrt(cx * cx + cy * cy) < N / 20.0)
	comisd	%xmm0, %xmm6	# _29, tmp163
	jbe	L62	#,
# src/shallow_water_serial.c:235:                         -4 * pow(cx, 2.0) / (real_t) (N)
	movsd	lC7(%rip), %xmm0	#, tmp165
	movsd	%xmm2, 16(%rsp)	# _30, %sfp
# src/shallow_water_serial.c:236:                         - 4 * pow(cy, 2.0) / (real_t) (N)
	movsd	%xmm3, 8(%rsp)	# _27, %sfp
# src/shallow_water_serial.c:235:                         -4 * pow(cx, 2.0) / (real_t) (N)
	mulsd	%xmm1, %xmm0	# _26, tmp165
# src/shallow_water_serial.c:236:                         - 4 * pow(cy, 2.0) / (real_t) (N)
	movsd	lC8(%rip), %xmm1	#, tmp168
# src/shallow_water_serial.c:236:                         - 4 * pow(cy, 2.0) / (real_t) (N)
	movsd	%xmm2, (%rsp)	# _30, %sfp
# src/shallow_water_serial.c:236:                         - 4 * pow(cy, 2.0) / (real_t) (N)
	mulsd	%xmm3, %xmm1	# _27, tmp168
# src/shallow_water_serial.c:235:                         -4 * pow(cx, 2.0) / (real_t) (N)
	divsd	%xmm2, %xmm0	# _30, tmp167
# src/shallow_water_serial.c:236:                         - 4 * pow(cy, 2.0) / (real_t) (N)
	divsd	%xmm2, %xmm1	# _30, tmp170
# src/shallow_water_serial.c:234:                 PN(y, x) -= 5e-4 * exp(
	subsd	%xmm1, %xmm0	# tmp170, tmp171
	call	_exp	#
# src/shallow_water_serial.c:234:                 PN(y, x) -= 5e-4 * exp(
	movsd	lC9(%rip), %xmm1	#, tmp172
	movq	lC6(%rip), %rax	#, tmp243
	mulsd	%xmm0, %xmm1	# tmp200, tmp172
# src/shallow_water_serial.c:234:                 PN(y, x) -= 5e-4 * exp(
	movsd	lC10(%rip), %xmm0	#, tmp175
	movsd	(%rsp), %xmm2	# %sfp, _30
	movsd	8(%rsp), %xmm3	# %sfp, _27
	movq	%rax, %xmm4	# tmp243, tmp180
	movq	lC4(%rip), %rax	#, tmp242
	movsd	16(%rsp), %xmm7	# %sfp, _30
	subsd	%xmm1, %xmm0	# tmp172, tmp174
# src/shallow_water_serial.c:240:             PN(y, x) *= density;
	mulsd	lC0(%rip), %xmm0	#, _117
	movq	%rax, %xmm5	# tmp242, _117
	movsd	%xmm0, 0(%rbp,%r14,8)	# _117, MEM[(real_t *)_100 + _112 * 8]
# src/shallow_water_serial.c:224:         for (int_t x = 1; x <= N; x++)
	addq	$1, %r14	#, x
# src/shallow_water_serial.c:224:         for (int_t x = 1; x <= N; x++)
	cmpq	%r14, %rbx	# x, _77
	jne	L55	#,
L64:
# src/shallow_water_serial.c:222:     for (int_t y = 1; y <= N; y++)
	movq	32(%rsp), %rcx	# %sfp, _32
	addq	$1, 24(%rsp)	#, %sfp
	movq	40(%rsp), %rdx	# %sfp, _143
	movq	24(%rsp), %rax	# %sfp, ivtmp.428
	addq	%rcx, %rbp	# _32, ivtmp.430
	addq	%rcx, %r12	# _32, ivtmp.432
	addq	%rcx, %r15	# _32, ivtmp.433
	cmpq	%rdx, %rax	# _143, ivtmp.428
	jne	L49	#,
L56:
# src/shallow_water_serial.c:244:     dx = domain_size / (real_t) N;
	movsd	lC11(%rip), %xmm0	#, tmp178
# src/shallow_water_serial.c:245:     dt = 5e-2;
	movq	lC12(%rip), %rax	#, tmp223
# src/shallow_water_serial.c:244:     dx = domain_size / (real_t) N;
	divsd	%xmm7, %xmm0	# _30, tmp177
# src/shallow_water_serial.c:245:     dt = 5e-2;
	movq	%rax, _dt(%rip)	# tmp223, dt
# src/shallow_water_serial.c:244:     dx = domain_size / (real_t) N;
	movsd	%xmm0, _dx(%rip)	# tmp177, dx
# src/shallow_water_serial.c:246: }
	addq	$56, %rsp	#,
LCFI22:
	popq	%rbx	#
LCFI23:
	popq	%rbp	#
LCFI24:
	popq	%r12	#
LCFI25:
	popq	%r13	#
LCFI26:
	popq	%r14	#
LCFI27:
	popq	%r15	#
LCFI28:
	ret	
L48:
LCFI29:
# src/shallow_water_serial.c:244:     dx = domain_size / (real_t) N;
	pxor	%xmm7, %xmm7	# _30
	cvtsi2sdq	%r14, %xmm7	# N.122_1, _30
	jmp	L56	#
L61:
	movsd	%xmm2, 16(%rsp)	# _30, %sfp
	movsd	%xmm3, 8(%rsp)	# _27, %sfp
	movsd	%xmm1, (%rsp)	# _26, %sfp
# src/shallow_water_serial.c:232:             if (sqrt(cx * cx + cy * cy) < N / 20.0)
	call	_sqrt	#
	movq	lC4(%rip), %rax	#, tmp244
	movsd	16(%rsp), %xmm2	# %sfp, _30
	movsd	8(%rsp), %xmm3	# %sfp, _27
	movsd	(%rsp), %xmm1	# %sfp, _26
	movq	%rax, %xmm5	# tmp244, _117
	movq	lC6(%rip), %rax	#, tmp245
	movq	%rax, %xmm4	# tmp245, tmp180
	jmp	L52	#
LFE31:
	.cstring
lC13:
	.ascii "data/%.5lld.bin\0"
lC14:
	.ascii "wb\0"
lC15:
	.ascii "Failed to open file %s\12\0"
	.text
	.p2align 4
	.globl _domain_save
_domain_save:
LFB32:
	pushq	%r12	#
LCFI30:
# src/shallow_water_serial.c:252:     int_t index = iteration / snapshot_frequency;
	movq	%rdi, %rax	# tmp118, tmp118
# src/shallow_water_serial.c:254:     memset(filename, 0, 256 * sizeof(char));
	movl	$32, %ecx	#, tmp102
# src/shallow_water_serial.c:255:     sprintf(filename, "data/%.5lld.bin", index);
	xorl	%esi, %esi	#
# src/shallow_water_serial.c:251: {
	pushq	%rbp	#
LCFI31:
# src/shallow_water_serial.c:252:     int_t index = iteration / snapshot_frequency;
	cqto
# src/shallow_water_serial.c:251: {
	pushq	%rbx	#
LCFI32:
	subq	$256, %rsp	#,
LCFI33:
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
	leaq	lC13(%rip), %rcx	#, tmp104
	movq	%rbx, %rdi	# tmp99,
	call	___sprintf_chk	#
# src/shallow_water_serial.c:257:     FILE *out = fopen(filename, "wb");
	leaq	lC14(%rip), %rsi	#, tmp106
	movq	%rbx, %rdi	# tmp99,
	call	_fopen	#
# src/shallow_water_serial.c:258:     if (!out)
	testq	%rax, %rax	# out
	je	L66	#,
# src/shallow_water_serial.c:263:     for (int_t y = 1; y <= N; y++)
	movq	_N(%rip), %rsi	# N, N.164_11
	movq	%rax, %rbp	# tmp119, out
# src/shallow_water_serial.c:263:     for (int_t y = 1; y <= N; y++)
	movl	$1, %ebx	#, y
	leaq	_mass(%rip), %r12	#, tmp117
# src/shallow_water_serial.c:263:     for (int_t y = 1; y <= N; y++)
	testq	%rsi, %rsi	# N.164_11
	jle	L68	#,
	.p2align 4,,10
	.p2align 3
L67:
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
	jge	L67	#,
L68:
# src/shallow_water_serial.c:267:     fclose(out);
	movq	%rbp, %rdi	# out,
	call	_fclose	#
# src/shallow_water_serial.c:268: }
	addq	$256, %rsp	#,
LCFI34:
	popq	%rbx	#
LCFI35:
	popq	%rbp	#
LCFI36:
	popq	%r12	#
LCFI37:
	ret	
L66:
LCFI38:
# src/shallow_water_serial.c:260:         fprintf(stderr, "Failed to open file %s\n", filename);
	movq	___stderrp@GOTPCREL(%rip), %rax	#, tmp108
	movq	%rbx, %rdx	# tmp99,
	leaq	lC15(%rip), %rsi	#, tmp109
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
LCFI39:
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
LCFI40:
# src/shallow_water_serial.c:284:     free(acceleration_y);
	jmp	_free	#
LFE33:
	.cstring
lC16:
	.ascii "Argument parsing failed\12\0"
lC18:
	.ascii "%.2lf seconds total runtime\12\0"
	.align 3
lC20:
	.ascii "Iteration %lld of %lld, (%.2lf%% complete)\12\0"
	.section __TEXT,__text_startup,regular,pure_instructions
	.p2align 4
	.globl _main
_main:
LFB28:
	pushq	%r15	#
LCFI41:
	pushq	%r14	#
LCFI42:
	pushq	%r13	#
LCFI43:
	pushq	%r12	#
LCFI44:
	pushq	%rbp	#
LCFI45:
	pushq	%rbx	#
LCFI46:
	subq	$40, %rsp	#,
LCFI47:
# src/shallow_water_serial.c:82:     OPTIONS *options = parse_args(argc, argv);
	call	_parse_args	#
# src/shallow_water_serial.c:83:     if (!options)
	testq	%rax, %rax	# options
	je	L84	#,
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
	movq	_max_iteration(%rip), %r13	# max_iteration, max_iteration.4_14
	testq	%r13, %r13	# max_iteration.4_14
	js	L80	#,
# src/shallow_water_serial.c:99:         boundary_condition(mass[0], 1);
	movq	_mass(%rip), %r12	# mass[0], prephitmp_28
	leaq	_mass_velocity_y(%rip), %r14	#, tmp174
# src/shallow_water_serial.c:97:     for (int_t iteration = 0; iteration <= max_iteration; iteration++)
	xorl	%r15d, %r15d	# iteration
# src/shallow_water_serial.c:100:         boundary_condition(mass_velocity_x[0], -1);
	movq	_mass_velocity_x(%rip), %rbp	# mass_velocity_x[0], _58
# src/shallow_water_serial.c:101:         boundary_condition(mass_velocity_y[0], -1);
	movq	_mass_velocity_y(%rip), %rbx	# mass_velocity_y[0], _56
	jmp	L79	#
	.p2align 4,,10
	.p2align 3
L81:
	movq	%r12, 24(%rsp)	# prephitmp_28, %sfp
	movq	%rbp, 16(%rsp)	# _58, %sfp
	movq	%rbx, 8(%rsp)	# _56, %sfp
L78:
# src/shallow_water_serial.c:73:     *t1 = *t2;
	movq	8+_mass(%rip), %r12	# MEM[(real_t * *)&mass + 8B], prephitmp_28
# src/shallow_water_serial.c:73:     *t1 = *t2;
	leaq	_mass(%rip), %rax	#, tmp188
# src/shallow_water_serial.c:97:     for (int_t iteration = 0; iteration <= max_iteration; iteration++)
	addq	$1, %r15	#, iteration
# src/shallow_water_serial.c:73:     *t1 = *t2;
	movq	8+_mass_velocity_x(%rip), %rbp	# MEM[(real_t * *)&mass_velocity_x + 8B], _58
	movq	8+_mass_velocity_y(%rip), %rbx	# MEM[(real_t * *)&mass_velocity_y + 8B], _56
# src/shallow_water_serial.c:97:     for (int_t iteration = 0; iteration <= max_iteration; iteration++)
	movq	_max_iteration(%rip), %r13	# max_iteration, max_iteration.4_14
# src/shallow_water_serial.c:73:     *t1 = *t2;
	movq	%r12, %xmm0	# prephitmp_28, tmp165
	movhps	24(%rsp), %xmm0	# %sfp, tmp165
	movaps	%xmm0, (%rax)	# tmp165, MEM <vector(2) long unsigned int> [(real_t * *)&mass]
	leaq	_mass_velocity_x(%rip), %rax	#, tmp190
	movq	%rbp, %xmm0	# _58, tmp168
	movhps	16(%rsp), %xmm0	# %sfp, tmp168
# src/shallow_water_serial.c:97:     for (int_t iteration = 0; iteration <= max_iteration; iteration++)
	cmpq	%r15, %r13	# iteration, max_iteration.4_14
# src/shallow_water_serial.c:73:     *t1 = *t2;
	movaps	%xmm0, (%rax)	# tmp168, MEM <vector(2) long unsigned int> [(real_t * *)&mass_velocity_x]
	movq	%rbx, %xmm0	# _56, tmp171
	movhps	8(%rsp), %xmm0	# %sfp, tmp171
	movaps	%xmm0, (%r14)	# tmp171, MEM <vector(2) long unsigned int> [(real_t * *)&mass_velocity_y]
# src/shallow_water_serial.c:97:     for (int_t iteration = 0; iteration <= max_iteration; iteration++)
	jl	L80	#,
L79:
# src/shallow_water_serial.c:99:         boundary_condition(mass[0], 1);
	movl	$1, %esi	#,
	movq	%r12, %rdi	# prephitmp_28,
	call	_boundary_condition	#
# src/shallow_water_serial.c:100:         boundary_condition(mass_velocity_x[0], -1);
	movl	$-1, %esi	#,
	movq	%rbp, %rdi	# _58,
	call	_boundary_condition	#
# src/shallow_water_serial.c:101:         boundary_condition(mass_velocity_y[0], -1);
	movl	$-1, %esi	#,
	movq	%rbx, %rdi	# _56,
	call	_boundary_condition	#
# src/shallow_water_serial.c:103:         time_step();
	call	_time_step	#
# src/shallow_water_serial.c:105:         if (iteration % snapshot_frequency == 0)
	movq	%r15, %rax	# iteration, tmp153
	cqto
	idivq	_snapshot_frequency(%rip)	# snapshot_frequency
# src/shallow_water_serial.c:105:         if (iteration % snapshot_frequency == 0)
	testq	%rdx, %rdx	# tmp152
	jne	L81	#,
# src/shallow_water_serial.c:111:                     100.0 * (real_t) iteration / (real_t) max_iteration
	pxor	%xmm0, %xmm0	# tmp154
	cvtsi2sdq	%r15, %xmm0	# iteration, tmp154
# src/shallow_water_serial.c:111:                     100.0 * (real_t) iteration / (real_t) max_iteration
	pxor	%xmm1, %xmm1	# tmp157
# src/shallow_water_serial.c:107:             printf(
	movq	%r13, %rdx	# max_iteration.4_14,
# src/shallow_water_serial.c:111:                     100.0 * (real_t) iteration / (real_t) max_iteration
	mulsd	lC19(%rip), %xmm0	#, tmp155
# src/shallow_water_serial.c:107:             printf(
	movq	%r15, %rsi	# iteration,
	movl	$1, %eax	#,
# src/shallow_water_serial.c:111:                     100.0 * (real_t) iteration / (real_t) max_iteration
	cvtsi2sdq	%r13, %xmm1	# max_iteration.4_14, tmp157
# src/shallow_water_serial.c:107:             printf(
	leaq	lC20(%rip), %rdi	#,
	divsd	%xmm1, %xmm0	# tmp157, tmp158
	call	_printf	#
# src/shallow_water_serial.c:113:             domain_save(iteration);
	movq	%r15, %rdi	# iteration,
	call	_domain_save	#
# src/shallow_water_serial.c:72:     tmp = *t1;
	movq	(%r14), %rax	# mass_velocity_y, pretmp_76
	movq	%rax, 8(%rsp)	# pretmp_76, %sfp
	leaq	_mass_velocity_x(%rip), %rax	#, tmp183
	movq	(%rax), %rax	# mass_velocity_x, pretmp_78
	movq	%rax, 16(%rsp)	# pretmp_78, %sfp
	leaq	_mass(%rip), %rax	#, tmp185
	movq	(%rax), %rax	# mass, pretmp_80
	movq	%rax, 24(%rsp)	# pretmp_80, %sfp
	jmp	L78	#
	.p2align 4,,10
	.p2align 3
L80:
# src/shallow_water_serial.c:121:     domain_finalize();
	call	_domain_finalize	#
# src/shallow_water_serial.c:124:     gettimeofday(&t_stop, NULL);
	leaq	_t_stop(%rip), %rdi	#, tmp132
	xorl	%esi, %esi	#
	call	_gettimeofday	#
# src/shallow_water_serial.c:125:     t_total = WALLTIME(t_stop) - WALLTIME(t_start);
	pxor	%xmm0, %xmm0	# tmp134
	pxor	%xmm1, %xmm1	# tmp138
	movsd	lC17(%rip), %xmm2	#, tmp136
	cvtsi2sdl	8+_t_stop(%rip), %xmm0	# t_stop.tv_usec, tmp134
# src/shallow_water_serial.c:127:     printf("%.2lf seconds total runtime\n", t_total);
	movl	$1, %eax	#,
# src/shallow_water_serial.c:125:     t_total = WALLTIME(t_stop) - WALLTIME(t_start);
	cvtsi2sdq	_t_stop(%rip), %xmm1	# t_stop.tv_sec, tmp138
# src/shallow_water_serial.c:127:     printf("%.2lf seconds total runtime\n", t_total);
	leaq	lC18(%rip), %rdi	#, tmp147
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
L84:
# src/shallow_water_serial.c:85:         fprintf(stderr, "Argument parsing failed\n");
	movq	___stderrp@GOTPCREL(%rip), %rax	#, tmp126
	movl	$24, %edx	#,
	movl	$1, %esi	#,
	leaq	lC16(%rip), %rdi	#, tmp127
	movq	(%rax), %rcx	# __stderrp,
	call	_fwrite	#
# src/shallow_water_serial.c:86:         exit(1);
	movl	$1, %edi	#,
	call	_exit	#
LFE28:
	.globl _dt
	.zerofill __DATA,__common,_dt,8,3
	.globl _dx
	.zerofill __DATA,__common,_dx,8,3
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
lC2:
	.long	0
	.long	1071644672
	.align 3
lC3:
	.long	0
	.long	1070596096
	.align 3
lC4:
	.long	-1958505087
	.long	1072686956
	.align 3
lC6:
	.long	0
	.long	1077149696
	.align 3
lC7:
	.long	0
	.long	-1072693248
	.align 3
lC8:
	.long	0
	.long	1074790400
	.align 3
lC9:
	.long	-755914244
	.long	1061184077
	.align 3
lC10:
	.long	-755914244
	.long	1062232653
	.align 3
lC11:
	.long	0
	.long	1076101120
	.align 3
lC12:
	.long	-1717986918
	.long	1068079513
	.align 3
lC17:
	.long	-1598689907
	.long	1051772663
	.align 3
lC19:
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
	.byte	0xa
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.set L$set$12,LCFI7-LCFI6
	.long L$set$12
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.set L$set$13,LCFI8-LCFI7
	.long L$set$13
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.set L$set$14,LCFI9-LCFI8
	.long L$set$14
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.set L$set$15,LCFI10-LCFI9
	.long L$set$15
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.set L$set$16,LCFI11-LCFI10
	.long L$set$16
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.set L$set$17,LCFI12-LCFI11
	.long L$set$17
	.byte	0xb
	.align 3
LEFDE3:
LSFDE5:
	.set L$set$18,LEFDE5-LASFDE5
	.long L$set$18
LASFDE5:
	.long	LASFDE5-EH_frame1
	.quad	LFB30-.
	.set L$set$19,LFE30-LFB30
	.quad L$set$19
	.uleb128 0
	.byte	0x4
	.set L$set$20,LCFI13-LFB30
	.long L$set$20
	.byte	0xe
	.uleb128 0x10
	.byte	0x83
	.uleb128 0x2
	.byte	0x4
	.set L$set$21,LCFI14-LCFI13
	.long L$set$21
	.byte	0xe
	.uleb128 0x8
	.align 3
LEFDE5:
LSFDE7:
	.set L$set$22,LEFDE7-LASFDE7
	.long L$set$22
LASFDE7:
	.long	LASFDE7-EH_frame1
	.quad	LFB31-.
	.set L$set$23,LFE31-LFB31
	.quad L$set$23
	.uleb128 0
	.byte	0x4
	.set L$set$24,LCFI15-LFB31
	.long L$set$24
	.byte	0xe
	.uleb128 0x10
	.byte	0x8f
	.uleb128 0x2
	.byte	0x4
	.set L$set$25,LCFI16-LCFI15
	.long L$set$25
	.byte	0xe
	.uleb128 0x18
	.byte	0x8e
	.uleb128 0x3
	.byte	0x4
	.set L$set$26,LCFI17-LCFI16
	.long L$set$26
	.byte	0xe
	.uleb128 0x20
	.byte	0x8d
	.uleb128 0x4
	.byte	0x4
	.set L$set$27,LCFI18-LCFI17
	.long L$set$27
	.byte	0xe
	.uleb128 0x28
	.byte	0x8c
	.uleb128 0x5
	.byte	0x4
	.set L$set$28,LCFI19-LCFI18
	.long L$set$28
	.byte	0xe
	.uleb128 0x30
	.byte	0x86
	.uleb128 0x6
	.byte	0x4
	.set L$set$29,LCFI20-LCFI19
	.long L$set$29
	.byte	0xe
	.uleb128 0x38
	.byte	0x83
	.uleb128 0x7
	.byte	0x4
	.set L$set$30,LCFI21-LCFI20
	.long L$set$30
	.byte	0xe
	.uleb128 0x70
	.byte	0x4
	.set L$set$31,LCFI22-LCFI21
	.long L$set$31
	.byte	0xa
	.byte	0xe
	.uleb128 0x38
	.byte	0x4
	.set L$set$32,LCFI23-LCFI22
	.long L$set$32
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.set L$set$33,LCFI24-LCFI23
	.long L$set$33
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.set L$set$34,LCFI25-LCFI24
	.long L$set$34
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.set L$set$35,LCFI26-LCFI25
	.long L$set$35
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.set L$set$36,LCFI27-LCFI26
	.long L$set$36
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.set L$set$37,LCFI28-LCFI27
	.long L$set$37
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.set L$set$38,LCFI29-LCFI28
	.long L$set$38
	.byte	0xb
	.align 3
LEFDE7:
LSFDE9:
	.set L$set$39,LEFDE9-LASFDE9
	.long L$set$39
LASFDE9:
	.long	LASFDE9-EH_frame1
	.quad	LFB32-.
	.set L$set$40,LFE32-LFB32
	.quad L$set$40
	.uleb128 0
	.byte	0x4
	.set L$set$41,LCFI30-LFB32
	.long L$set$41
	.byte	0xe
	.uleb128 0x10
	.byte	0x8c
	.uleb128 0x2
	.byte	0x4
	.set L$set$42,LCFI31-LCFI30
	.long L$set$42
	.byte	0xe
	.uleb128 0x18
	.byte	0x86
	.uleb128 0x3
	.byte	0x4
	.set L$set$43,LCFI32-LCFI31
	.long L$set$43
	.byte	0xe
	.uleb128 0x20
	.byte	0x83
	.uleb128 0x4
	.byte	0x4
	.set L$set$44,LCFI33-LCFI32
	.long L$set$44
	.byte	0xe
	.uleb128 0x120
	.byte	0x4
	.set L$set$45,LCFI34-LCFI33
	.long L$set$45
	.byte	0xa
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.set L$set$46,LCFI35-LCFI34
	.long L$set$46
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.set L$set$47,LCFI36-LCFI35
	.long L$set$47
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.set L$set$48,LCFI37-LCFI36
	.long L$set$48
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.set L$set$49,LCFI38-LCFI37
	.long L$set$49
	.byte	0xb
	.align 3
LEFDE9:
LSFDE11:
	.set L$set$50,LEFDE11-LASFDE11
	.long L$set$50
LASFDE11:
	.long	LASFDE11-EH_frame1
	.quad	LFB33-.
	.set L$set$51,LFE33-LFB33
	.quad L$set$51
	.uleb128 0
	.byte	0x4
	.set L$set$52,LCFI39-LFB33
	.long L$set$52
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.set L$set$53,LCFI40-LCFI39
	.long L$set$53
	.byte	0xe
	.uleb128 0x8
	.align 3
LEFDE11:
LSFDE13:
	.set L$set$54,LEFDE13-LASFDE13
	.long L$set$54
LASFDE13:
	.long	LASFDE13-EH_frame1
	.quad	LFB28-.
	.set L$set$55,LFE28-LFB28
	.quad L$set$55
	.uleb128 0
	.byte	0x4
	.set L$set$56,LCFI41-LFB28
	.long L$set$56
	.byte	0xe
	.uleb128 0x10
	.byte	0x8f
	.uleb128 0x2
	.byte	0x4
	.set L$set$57,LCFI42-LCFI41
	.long L$set$57
	.byte	0xe
	.uleb128 0x18
	.byte	0x8e
	.uleb128 0x3
	.byte	0x4
	.set L$set$58,LCFI43-LCFI42
	.long L$set$58
	.byte	0xe
	.uleb128 0x20
	.byte	0x8d
	.uleb128 0x4
	.byte	0x4
	.set L$set$59,LCFI44-LCFI43
	.long L$set$59
	.byte	0xe
	.uleb128 0x28
	.byte	0x8c
	.uleb128 0x5
	.byte	0x4
	.set L$set$60,LCFI45-LCFI44
	.long L$set$60
	.byte	0xe
	.uleb128 0x30
	.byte	0x86
	.uleb128 0x6
	.byte	0x4
	.set L$set$61,LCFI46-LCFI45
	.long L$set$61
	.byte	0xe
	.uleb128 0x38
	.byte	0x83
	.uleb128 0x7
	.byte	0x4
	.set L$set$62,LCFI47-LCFI46
	.long L$set$62
	.byte	0xe
	.uleb128 0x60
	.align 3
LEFDE13:
	.ident	"GCC: (Homebrew GCC 12.2.0) 12.2.0"
	.subsections_via_symbols
