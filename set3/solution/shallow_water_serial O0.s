# GNU C17 (Homebrew GCC 12.2.0) version 12.2.0 (x86_64-apple-darwin21)
#	compiled by GNU C version 12.2.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.25-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -fPIC -mmacosx-version-min=12.0.0 -mtune=core2 -fopenmp
	.text
	.globl _t_start
	.zerofill __DATA,__common,_t_start,16,4
	.globl _t_stop
	.zerofill __DATA,__common,_t_stop,16,4
	.globl _t_total
	.zerofill __DATA,__common,_t_total,8,3
	.globl _N
	.zerofill __DATA,__common,_N,8,3
	.globl _max_iteration
	.zerofill __DATA,__common,_max_iteration,8,3
	.globl _snapshot_frequency
	.zerofill __DATA,__common,_snapshot_frequency,8,3
	.globl _domain_size
	.const
	.align 3
_domain_size:
	.long	0
	.long	1076101120
	.globl _gravity
	.align 3
_gravity:
	.long	1374389535
	.long	1076076216
	.globl _density
	.align 3
_density:
	.long	0
	.long	1083123712
	.globl _mass
	.zerofill __DATA,__common,_mass,16,4
	.globl _mass_velocity_x
	.zerofill __DATA,__common,_mass_velocity_x,16,4
	.globl _mass_velocity_y
	.zerofill __DATA,__common,_mass_velocity_y,16,4
	.globl _mass_velocity
	.zerofill __DATA,__common,_mass_velocity,8,3
	.globl _velocity_x
	.zerofill __DATA,__common,_velocity_x,8,3
	.globl _velocity_y
	.zerofill __DATA,__common,_velocity_y,8,3
	.globl _acceleration_x
	.zerofill __DATA,__common,_acceleration_x,8,3
	.globl _acceleration_y
	.zerofill __DATA,__common,_acceleration_y,8,3
	.globl _dx
	.zerofill __DATA,__common,_dx,8,3
	.globl _dt
	.zerofill __DATA,__common,_dt,8,3
	.text
	.globl _swap
_swap:
LFB27:
	pushq	%rbp	#
LCFI0:
	movq	%rsp, %rbp	#,
LCFI1:
	movq	%rdi, -24(%rbp)	# t1, t1
	movq	%rsi, -32(%rbp)	# t2, t2
# src/shallow_water_serial.c:72:     tmp = *t1;
	movq	-24(%rbp), %rax	# t1, tmp83
	movq	(%rax), %rax	# *t1_3(D), tmp84
	movq	%rax, -8(%rbp)	# tmp84, tmp
# src/shallow_water_serial.c:73:     *t1 = *t2;
	movq	-32(%rbp), %rax	# t2, tmp85
	movq	(%rax), %rdx	# *t2_5(D), _1
# src/shallow_water_serial.c:73:     *t1 = *t2;
	movq	-24(%rbp), %rax	# t1, tmp86
	movq	%rdx, (%rax)	# _1, *t1_3(D)
# src/shallow_water_serial.c:74:     *t2 = tmp;
	movq	-32(%rbp), %rax	# t2, tmp87
	movq	-8(%rbp), %rdx	# tmp, tmp88
	movq	%rdx, (%rax)	# tmp88, *t2_5(D)
# src/shallow_water_serial.c:75: }
	nop	
	popq	%rbp	#
LCFI2:
	ret	
LFE27:
	.cstring
lC0:
	.ascii "Argument parsing failed\12\0"
	.align 3
lC2:
	.ascii "Iteration %lld of %lld, (%.2lf%% complete)\12\0"
lC4:
	.ascii "%.2lf seconds total runtime\12\0"
	.text
	.globl _main
_main:
LFB28:
	pushq	%rbp	#
LCFI3:
	movq	%rsp, %rbp	#,
LCFI4:
	subq	$32, %rsp	#,
	movl	%edi, -20(%rbp)	# argc, argc
	movq	%rsi, -32(%rbp)	# argv, argv
# src/shallow_water_serial.c:82:     OPTIONS *options = parse_args(argc, argv);
	movq	-32(%rbp), %rdx	# argv, tmp113
	movl	-20(%rbp), %eax	# argc, tmp114
	movq	%rdx, %rsi	# tmp113,
	movl	%eax, %edi	# tmp114,
	call	_parse_args	#
	movq	%rax, -16(%rbp)	# tmp115, options
# src/shallow_water_serial.c:83:     if (!options)
	cmpq	$0, -16(%rbp)	#, options
	jne	L3	#,
# src/shallow_water_serial.c:85:         fprintf(stderr, "Argument parsing failed\n");
	movq	___stderrp@GOTPCREL(%rip), %rax	#, tmp116
	movq	(%rax), %rax	# __stderrp, __stderrp.0_1
	movq	%rax, %rcx	# __stderrp.0_1,
	movl	$24, %edx	#,
	movl	$1, %esi	#,
	leaq	lC0(%rip), %rax	#, tmp117
	movq	%rax, %rdi	# tmp117,
	call	_fwrite	#
# src/shallow_water_serial.c:86:         exit(1);
	movl	$1, %edi	#,
	call	_exit	#
L3:
# src/shallow_water_serial.c:89:     N = options->N;
	movq	-16(%rbp), %rax	# options, tmp118
	movq	(%rax), %rax	# options_38->N, _2
# src/shallow_water_serial.c:89:     N = options->N;
	movq	%rax, _N(%rip)	# _2, N
# src/shallow_water_serial.c:90:     max_iteration = options->max_iteration;
	movq	-16(%rbp), %rax	# options, tmp119
	movq	8(%rax), %rax	# options_38->max_iteration, _3
# src/shallow_water_serial.c:90:     max_iteration = options->max_iteration;
	movq	%rax, _max_iteration(%rip)	# _3, max_iteration
# src/shallow_water_serial.c:91:     snapshot_frequency = options->snapshot_frequency;
	movq	-16(%rbp), %rax	# options, tmp120
	movq	16(%rax), %rax	# options_38->snapshot_frequency, _4
# src/shallow_water_serial.c:91:     snapshot_frequency = options->snapshot_frequency;
	movq	%rax, _snapshot_frequency(%rip)	# _4, snapshot_frequency
# src/shallow_water_serial.c:93:     domain_init();
	call	_domain_init	#
# src/shallow_water_serial.c:95:     gettimeofday(&t_start, NULL);
	movl	$0, %esi	#,
	leaq	_t_start(%rip), %rax	#, tmp121
	movq	%rax, %rdi	# tmp121,
	call	_gettimeofday	#
# src/shallow_water_serial.c:97:     for (int_t iteration = 0; iteration <= max_iteration; iteration++)
	movq	$0, -8(%rbp)	#, iteration
# src/shallow_water_serial.c:97:     for (int_t iteration = 0; iteration <= max_iteration; iteration++)
	jmp	L4	#
L6:
# src/shallow_water_serial.c:99:         boundary_condition(mass[0], 1);
	movq	_mass(%rip), %rax	# mass[0], _5
	movl	$1, %esi	#,
	movq	%rax, %rdi	# _5,
	call	_boundary_condition	#
# src/shallow_water_serial.c:100:         boundary_condition(mass_velocity_x[0], -1);
	movq	_mass_velocity_x(%rip), %rax	# mass_velocity_x[0], _6
	movl	$-1, %esi	#,
	movq	%rax, %rdi	# _6,
	call	_boundary_condition	#
# src/shallow_water_serial.c:101:         boundary_condition(mass_velocity_y[0], -1);
	movq	_mass_velocity_y(%rip), %rax	# mass_velocity_y[0], _7
	movl	$-1, %esi	#,
	movq	%rax, %rdi	# _7,
	call	_boundary_condition	#
# src/shallow_water_serial.c:103:         time_step();
	call	_time_step	#
# src/shallow_water_serial.c:105:         if (iteration % snapshot_frequency == 0)
	movq	_snapshot_frequency(%rip), %rcx	# snapshot_frequency, snapshot_frequency.1_8
	movq	-8(%rbp), %rax	# iteration, tmp122
	cqto
	idivq	%rcx	# snapshot_frequency.1_8
	movq	%rdx, %rax	# tmp123, _9
# src/shallow_water_serial.c:105:         if (iteration % snapshot_frequency == 0)
	testq	%rax, %rax	# _9
	jne	L5	#,
# src/shallow_water_serial.c:111:                     100.0 * (real_t) iteration / (real_t) max_iteration
	pxor	%xmm1, %xmm1	# _10
	cvtsi2sdq	-8(%rbp), %xmm1	# iteration, _10
# src/shallow_water_serial.c:111:                     100.0 * (real_t) iteration / (real_t) max_iteration
	movsd	lC1(%rip), %xmm0	#, tmp125
	mulsd	%xmm1, %xmm0	# _10, _11
# src/shallow_water_serial.c:111:                     100.0 * (real_t) iteration / (real_t) max_iteration
	movq	_max_iteration(%rip), %rax	# max_iteration, max_iteration.2_12
	pxor	%xmm1, %xmm1	# _13
	cvtsi2sdq	%rax, %xmm1	# max_iteration.2_12, _13
# src/shallow_water_serial.c:107:             printf(
	divsd	%xmm1, %xmm0	# _13, _11
	movq	%xmm0, %rax	# _11, _14
	movq	_max_iteration(%rip), %rdx	# max_iteration, max_iteration.3_15
	movq	-8(%rbp), %rcx	# iteration, tmp126
	movq	%rax, %xmm0	# _14,
	movq	%rcx, %rsi	# tmp126,
	leaq	lC2(%rip), %rax	#, tmp127
	movq	%rax, %rdi	# tmp127,
	movl	$1, %eax	#,
	call	_printf	#
# src/shallow_water_serial.c:113:             domain_save(iteration);
	movq	-8(%rbp), %rax	# iteration, tmp128
	movq	%rax, %rdi	# tmp128,
	call	_domain_save	#
L5:
# src/shallow_water_serial.c:116:         swap(&mass[0], &mass[1]);
	leaq	8+_mass(%rip), %rax	#, tmp129
	movq	%rax, %rsi	# tmp129,
	leaq	_mass(%rip), %rax	#, tmp130
	movq	%rax, %rdi	# tmp130,
	call	_swap	#
# src/shallow_water_serial.c:117:         swap(&mass_velocity_x[0], &mass_velocity_x[1]);
	leaq	8+_mass_velocity_x(%rip), %rax	#, tmp131
	movq	%rax, %rsi	# tmp131,
	leaq	_mass_velocity_x(%rip), %rax	#, tmp132
	movq	%rax, %rdi	# tmp132,
	call	_swap	#
# src/shallow_water_serial.c:118:         swap(&mass_velocity_y[0], &mass_velocity_y[1]);
	leaq	8+_mass_velocity_y(%rip), %rax	#, tmp133
	movq	%rax, %rsi	# tmp133,
	leaq	_mass_velocity_y(%rip), %rax	#, tmp134
	movq	%rax, %rdi	# tmp134,
	call	_swap	#
# src/shallow_water_serial.c:97:     for (int_t iteration = 0; iteration <= max_iteration; iteration++)
	addq	$1, -8(%rbp)	#, iteration
L4:
# src/shallow_water_serial.c:97:     for (int_t iteration = 0; iteration <= max_iteration; iteration++)
	movq	_max_iteration(%rip), %rax	# max_iteration, max_iteration.4_16
	cmpq	%rax, -8(%rbp)	# max_iteration.4_16, iteration
	jle	L6	#,
# src/shallow_water_serial.c:121:     domain_finalize();
	call	_domain_finalize	#
# src/shallow_water_serial.c:124:     gettimeofday(&t_stop, NULL);
	movl	$0, %esi	#,
	leaq	_t_stop(%rip), %rax	#, tmp135
	movq	%rax, %rdi	# tmp135,
	call	_gettimeofday	#
# src/shallow_water_serial.c:125:     t_total = WALLTIME(t_stop) - WALLTIME(t_start);
	movq	_t_stop(%rip), %rax	# t_stop.tv_sec, _17
	pxor	%xmm1, %xmm1	# _18
	cvtsi2sdq	%rax, %xmm1	# _17, _18
	movl	8+_t_stop(%rip), %eax	# t_stop.tv_usec, _19
	pxor	%xmm2, %xmm2	# _20
	cvtsi2sdl	%eax, %xmm2	# _19, _20
	movsd	lC3(%rip), %xmm0	#, tmp136
	mulsd	%xmm2, %xmm0	# _20, _21
	addsd	%xmm1, %xmm0	# _18, _22
# src/shallow_water_serial.c:125:     t_total = WALLTIME(t_stop) - WALLTIME(t_start);
	movq	_t_start(%rip), %rax	# t_start.tv_sec, _23
	pxor	%xmm2, %xmm2	# _24
	cvtsi2sdq	%rax, %xmm2	# _23, _24
	movl	8+_t_start(%rip), %eax	# t_start.tv_usec, _25
	pxor	%xmm3, %xmm3	# _26
	cvtsi2sdl	%eax, %xmm3	# _25, _26
	movsd	lC3(%rip), %xmm1	#, tmp137
	mulsd	%xmm3, %xmm1	# _26, _27
	addsd	%xmm2, %xmm1	# _24, _28
# src/shallow_water_serial.c:125:     t_total = WALLTIME(t_stop) - WALLTIME(t_start);
	subsd	%xmm1, %xmm0	# _28, _29
# src/shallow_water_serial.c:125:     t_total = WALLTIME(t_stop) - WALLTIME(t_start);
	movsd	%xmm0, _t_total(%rip)	# _29, t_total
# src/shallow_water_serial.c:127:     printf("%.2lf seconds total runtime\n", t_total);
	movq	_t_total(%rip), %rax	# t_total, t_total.5_30
	movq	%rax, %xmm0	# t_total.5_30,
	leaq	lC4(%rip), %rax	#, tmp138
	movq	%rax, %rdi	# tmp138,
	movl	$1, %eax	#,
	call	_printf	#
# src/shallow_water_serial.c:129:     exit(EXIT_SUCCESS);
	movl	$0, %edi	#,
	call	_exit	#
LFE28:
	.globl _time_step
_time_step:
LFB29:
	pushq	%rbp	#
LCFI5:
	movq	%rsp, %rbp	#,
LCFI6:
# src/shallow_water_serial.c:136:     for (int_t y = 1; y <= N; y++)
	movq	$1, -8(%rbp)	#, y
# src/shallow_water_serial.c:136:     for (int_t y = 1; y <= N; y++)
	jmp	L8	#
L11:
# src/shallow_water_serial.c:137:         for (int_t x = 1; x <= N; x++)
	movq	$1, -16(%rbp)	#, x
# src/shallow_water_serial.c:137:         for (int_t x = 1; x <= N; x++)
	jmp	L9	#
L10:
# src/shallow_water_serial.c:139:             U(y, x) = PNU(y, x) / PN(y, x);
	movq	_mass_velocity_x(%rip), %rdx	# mass_velocity_x[0], _1
	movq	_N(%rip), %rax	# N, N.6_2
	addq	$2, %rax	#, _3
	imulq	-8(%rbp), %rax	# y, _4
	movq	-16(%rbp), %rcx	# x, tmp579
	addq	%rcx, %rax	# tmp579, _5
	salq	$3, %rax	#, _7
	addq	%rdx, %rax	# _1, _8
	movsd	(%rax), %xmm0	# *_8, _9
# src/shallow_water_serial.c:139:             U(y, x) = PNU(y, x) / PN(y, x);
	movq	_mass(%rip), %rdx	# mass[0], _10
	movq	_N(%rip), %rax	# N, N.7_11
	addq	$2, %rax	#, _12
	imulq	-8(%rbp), %rax	# y, _13
	movq	-16(%rbp), %rcx	# x, tmp580
	addq	%rcx, %rax	# tmp580, _14
	salq	$3, %rax	#, _16
	addq	%rdx, %rax	# _10, _17
	movsd	(%rax), %xmm1	# *_17, _18
# src/shallow_water_serial.c:139:             U(y, x) = PNU(y, x) / PN(y, x);
	movq	_velocity_x(%rip), %rdx	# velocity_x, velocity_x.8_19
	movq	_N(%rip), %rax	# N, N.9_20
	addq	$2, %rax	#, _21
	imulq	-8(%rbp), %rax	# y, _22
	movq	-16(%rbp), %rcx	# x, tmp581
	addq	%rcx, %rax	# tmp581, _23
	salq	$3, %rax	#, _25
	addq	%rdx, %rax	# velocity_x.8_19, _26
# src/shallow_water_serial.c:139:             U(y, x) = PNU(y, x) / PN(y, x);
	divsd	%xmm1, %xmm0	# _18, _27
# src/shallow_water_serial.c:139:             U(y, x) = PNU(y, x) / PN(y, x);
	movsd	%xmm0, (%rax)	# _27, *_26
# src/shallow_water_serial.c:140:             V(y, x) = PNV(y, x) / PN(y, x);
	movq	_mass_velocity_y(%rip), %rdx	# mass_velocity_y[0], _28
	movq	_N(%rip), %rax	# N, N.10_29
	addq	$2, %rax	#, _30
	imulq	-8(%rbp), %rax	# y, _31
	movq	-16(%rbp), %rcx	# x, tmp582
	addq	%rcx, %rax	# tmp582, _32
	salq	$3, %rax	#, _34
	addq	%rdx, %rax	# _28, _35
	movsd	(%rax), %xmm0	# *_35, _36
# src/shallow_water_serial.c:140:             V(y, x) = PNV(y, x) / PN(y, x);
	movq	_mass(%rip), %rdx	# mass[0], _37
	movq	_N(%rip), %rax	# N, N.11_38
	addq	$2, %rax	#, _39
	imulq	-8(%rbp), %rax	# y, _40
	movq	-16(%rbp), %rcx	# x, tmp583
	addq	%rcx, %rax	# tmp583, _41
	salq	$3, %rax	#, _43
	addq	%rdx, %rax	# _37, _44
	movsd	(%rax), %xmm1	# *_44, _45
# src/shallow_water_serial.c:140:             V(y, x) = PNV(y, x) / PN(y, x);
	movq	_velocity_y(%rip), %rdx	# velocity_y, velocity_y.12_46
	movq	_N(%rip), %rax	# N, N.13_47
	addq	$2, %rax	#, _48
	imulq	-8(%rbp), %rax	# y, _49
	movq	-16(%rbp), %rcx	# x, tmp584
	addq	%rcx, %rax	# tmp584, _50
	salq	$3, %rax	#, _52
	addq	%rdx, %rax	# velocity_y.12_46, _53
# src/shallow_water_serial.c:140:             V(y, x) = PNV(y, x) / PN(y, x);
	divsd	%xmm1, %xmm0	# _45, _54
# src/shallow_water_serial.c:140:             V(y, x) = PNV(y, x) / PN(y, x);
	movsd	%xmm0, (%rax)	# _54, *_53
# src/shallow_water_serial.c:137:         for (int_t x = 1; x <= N; x++)
	addq	$1, -16(%rbp)	#, x
L9:
# src/shallow_water_serial.c:137:         for (int_t x = 1; x <= N; x++)
	movq	_N(%rip), %rax	# N, N.14_55
	cmpq	%rax, -16(%rbp)	# N.14_55, x
	jle	L10	#,
# src/shallow_water_serial.c:136:     for (int_t y = 1; y <= N; y++)
	addq	$1, -8(%rbp)	#, y
L8:
# src/shallow_water_serial.c:136:     for (int_t y = 1; y <= N; y++)
	movq	_N(%rip), %rax	# N, N.15_56
	cmpq	%rax, -8(%rbp)	# N.15_56, y
	jle	L11	#,
# src/shallow_water_serial.c:143:     for (int_t y = 1; y <= N; y++)
	movq	$1, -24(%rbp)	#, y
# src/shallow_water_serial.c:143:     for (int_t y = 1; y <= N; y++)
	jmp	L12	#
L15:
# src/shallow_water_serial.c:144:         for (int_t x = 1; x <= N; x++)
	movq	$1, -32(%rbp)	#, x
# src/shallow_water_serial.c:144:         for (int_t x = 1; x <= N; x++)
	jmp	L13	#
L14:
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	movq	_mass(%rip), %rdx	# mass[0], _57
	movq	_N(%rip), %rax	# N, N.16_58
	addq	$2, %rax	#, _59
	imulq	-24(%rbp), %rax	# y, _60
	movq	-32(%rbp), %rcx	# x, tmp585
	addq	%rcx, %rax	# tmp585, _61
	salq	$3, %rax	#, _63
	addq	%rdx, %rax	# _57, _64
	movsd	(%rax), %xmm1	# *_64, _65
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	movq	_velocity_x(%rip), %rdx	# velocity_x, velocity_x.17_66
	movq	_N(%rip), %rax	# N, N.18_67
	addq	$2, %rax	#, _68
	imulq	-24(%rbp), %rax	# y, _69
	movq	-32(%rbp), %rcx	# x, tmp586
	addq	%rcx, %rax	# tmp586, _70
	salq	$3, %rax	#, _72
	addq	%rdx, %rax	# velocity_x.17_66, _73
	movsd	(%rax), %xmm0	# *_73, _74
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	mulsd	%xmm0, %xmm1	# _74, _75
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	movq	_velocity_y(%rip), %rdx	# velocity_y, velocity_y.19_76
	movq	_N(%rip), %rax	# N, N.20_77
	addq	$2, %rax	#, _78
	imulq	-24(%rbp), %rax	# y, _79
	movq	-32(%rbp), %rcx	# x, tmp587
	addq	%rcx, %rax	# tmp587, _80
	salq	$3, %rax	#, _82
	addq	%rdx, %rax	# velocity_y.19_76, _83
	movsd	(%rax), %xmm0	# *_83, _84
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	movq	_mass_velocity(%rip), %rdx	# mass_velocity, mass_velocity.21_85
	movq	_N(%rip), %rax	# N, N.22_86
	addq	$2, %rax	#, _87
	imulq	-24(%rbp), %rax	# y, _88
	movq	-32(%rbp), %rcx	# x, tmp588
	addq	%rcx, %rax	# tmp588, _89
	salq	$3, %rax	#, _91
	addq	%rdx, %rax	# mass_velocity.21_85, _92
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	mulsd	%xmm1, %xmm0	# _75, _93
# src/shallow_water_serial.c:146:             PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
	movsd	%xmm0, (%rax)	# _93, *_92
# src/shallow_water_serial.c:144:         for (int_t x = 1; x <= N; x++)
	addq	$1, -32(%rbp)	#, x
L13:
# src/shallow_water_serial.c:144:         for (int_t x = 1; x <= N; x++)
	movq	_N(%rip), %rax	# N, N.23_94
	cmpq	%rax, -32(%rbp)	# N.23_94, x
	jle	L14	#,
# src/shallow_water_serial.c:143:     for (int_t y = 1; y <= N; y++)
	addq	$1, -24(%rbp)	#, y
L12:
# src/shallow_water_serial.c:143:     for (int_t y = 1; y <= N; y++)
	movq	_N(%rip), %rax	# N, N.24_95
	cmpq	%rax, -24(%rbp)	# N.24_95, y
	jle	L15	#,
# src/shallow_water_serial.c:149:     for (int_t y = 0; y <= N + 1; y++)
	movq	$0, -40(%rbp)	#, y
# src/shallow_water_serial.c:149:     for (int_t y = 0; y <= N + 1; y++)
	jmp	L16	#
L19:
# src/shallow_water_serial.c:150:         for (int_t x = 0; x <= N + 1; x++)
	movq	$0, -48(%rbp)	#, x
# src/shallow_water_serial.c:150:         for (int_t x = 0; x <= N + 1; x++)
	jmp	L17	#
L18:
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	movq	_mass(%rip), %rdx	# mass[0], _96
	movq	_N(%rip), %rax	# N, N.25_97
	addq	$2, %rax	#, _98
	imulq	-40(%rbp), %rax	# y, _99
	movq	-48(%rbp), %rcx	# x, tmp589
	addq	%rcx, %rax	# tmp589, _100
	salq	$3, %rax	#, _102
	addq	%rdx, %rax	# _96, _103
	movsd	(%rax), %xmm1	# *_103, _104
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	movq	_velocity_x(%rip), %rdx	# velocity_x, velocity_x.26_105
	movq	_N(%rip), %rax	# N, N.27_106
	addq	$2, %rax	#, _107
	imulq	-40(%rbp), %rax	# y, _108
	movq	-48(%rbp), %rcx	# x, tmp590
	addq	%rcx, %rax	# tmp590, _109
	salq	$3, %rax	#, _111
	addq	%rdx, %rax	# velocity_x.26_105, _112
	movsd	(%rax), %xmm0	# *_112, _113
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	mulsd	%xmm0, %xmm1	# _113, _114
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	movq	_velocity_x(%rip), %rdx	# velocity_x, velocity_x.28_115
	movq	_N(%rip), %rax	# N, N.29_116
	addq	$2, %rax	#, _117
	imulq	-40(%rbp), %rax	# y, _118
	movq	-48(%rbp), %rcx	# x, tmp591
	addq	%rcx, %rax	# tmp591, _119
	salq	$3, %rax	#, _121
	addq	%rdx, %rax	# velocity_x.28_115, _122
	movsd	(%rax), %xmm0	# *_122, _123
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	mulsd	%xmm0, %xmm1	# _123, _124
# src/shallow_water_serial.c:153:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	movsd	lC5(%rip), %xmm2	#, gravity.30_125
	movsd	lC6(%rip), %xmm0	#, tmp592
	mulsd	%xmm0, %xmm2	# tmp592, _126
# src/shallow_water_serial.c:153:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	movq	_mass(%rip), %rdx	# mass[0], _127
	movq	_N(%rip), %rax	# N, N.31_128
	addq	$2, %rax	#, _129
	imulq	-40(%rbp), %rax	# y, _130
	movq	-48(%rbp), %rcx	# x, tmp593
	addq	%rcx, %rax	# tmp593, _131
	salq	$3, %rax	#, _133
	addq	%rdx, %rax	# _127, _134
	movsd	(%rax), %xmm3	# *_134, _135
# src/shallow_water_serial.c:153:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	movq	_mass(%rip), %rdx	# mass[0], _136
	movq	_N(%rip), %rax	# N, N.32_137
	addq	$2, %rax	#, _138
	imulq	-40(%rbp), %rax	# y, _139
	movq	-48(%rbp), %rcx	# x, tmp594
	addq	%rcx, %rax	# tmp594, _140
	salq	$3, %rax	#, _142
	addq	%rdx, %rax	# _136, _143
	movsd	(%rax), %xmm0	# *_143, _144
# src/shallow_water_serial.c:153:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	mulsd	%xmm3, %xmm0	# _135, _145
# src/shallow_water_serial.c:153:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	movsd	lC7(%rip), %xmm3	#, density.33_146
	divsd	%xmm3, %xmm0	# density.33_146, _147
# src/shallow_water_serial.c:153:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	mulsd	%xmm2, %xmm0	# _126, _148
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	movq	_acceleration_x(%rip), %rdx	# acceleration_x, acceleration_x.34_149
	movq	_N(%rip), %rax	# N, N.35_150
	addq	$2, %rax	#, _151
	imulq	-40(%rbp), %rax	# y, _152
	movq	-48(%rbp), %rcx	# x, tmp595
	addq	%rcx, %rax	# tmp595, _153
	salq	$3, %rax	#, _155
	addq	%rdx, %rax	# acceleration_x.34_149, _156
# src/shallow_water_serial.c:153:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	addsd	%xmm1, %xmm0	# _124, _157
# src/shallow_water_serial.c:152:             DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
	movsd	%xmm0, (%rax)	# _157, *_156
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	movq	_mass(%rip), %rdx	# mass[0], _158
	movq	_N(%rip), %rax	# N, N.36_159
	addq	$2, %rax	#, _160
	imulq	-40(%rbp), %rax	# y, _161
	movq	-48(%rbp), %rcx	# x, tmp596
	addq	%rcx, %rax	# tmp596, _162
	salq	$3, %rax	#, _164
	addq	%rdx, %rax	# _158, _165
	movsd	(%rax), %xmm1	# *_165, _166
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	movq	_velocity_y(%rip), %rdx	# velocity_y, velocity_y.37_167
	movq	_N(%rip), %rax	# N, N.38_168
	addq	$2, %rax	#, _169
	imulq	-40(%rbp), %rax	# y, _170
	movq	-48(%rbp), %rcx	# x, tmp597
	addq	%rcx, %rax	# tmp597, _171
	salq	$3, %rax	#, _173
	addq	%rdx, %rax	# velocity_y.37_167, _174
	movsd	(%rax), %xmm0	# *_174, _175
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	mulsd	%xmm0, %xmm1	# _175, _176
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	movq	_velocity_y(%rip), %rdx	# velocity_y, velocity_y.39_177
	movq	_N(%rip), %rax	# N, N.40_178
	addq	$2, %rax	#, _179
	imulq	-40(%rbp), %rax	# y, _180
	movq	-48(%rbp), %rcx	# x, tmp598
	addq	%rcx, %rax	# tmp598, _181
	salq	$3, %rax	#, _183
	addq	%rdx, %rax	# velocity_y.39_177, _184
	movsd	(%rax), %xmm0	# *_184, _185
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	mulsd	%xmm0, %xmm1	# _185, _186
# src/shallow_water_serial.c:155:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	movsd	lC5(%rip), %xmm2	#, gravity.41_187
	movsd	lC6(%rip), %xmm0	#, tmp599
	mulsd	%xmm0, %xmm2	# tmp599, _188
# src/shallow_water_serial.c:155:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	movq	_mass(%rip), %rdx	# mass[0], _189
	movq	_N(%rip), %rax	# N, N.42_190
	addq	$2, %rax	#, _191
	imulq	-40(%rbp), %rax	# y, _192
	movq	-48(%rbp), %rcx	# x, tmp600
	addq	%rcx, %rax	# tmp600, _193
	salq	$3, %rax	#, _195
	addq	%rdx, %rax	# _189, _196
	movsd	(%rax), %xmm3	# *_196, _197
# src/shallow_water_serial.c:155:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	movq	_mass(%rip), %rdx	# mass[0], _198
	movq	_N(%rip), %rax	# N, N.43_199
	addq	$2, %rax	#, _200
	imulq	-40(%rbp), %rax	# y, _201
	movq	-48(%rbp), %rcx	# x, tmp601
	addq	%rcx, %rax	# tmp601, _202
	salq	$3, %rax	#, _204
	addq	%rdx, %rax	# _198, _205
	movsd	(%rax), %xmm0	# *_205, _206
# src/shallow_water_serial.c:155:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	mulsd	%xmm3, %xmm0	# _197, _207
# src/shallow_water_serial.c:155:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	movsd	lC7(%rip), %xmm3	#, density.44_208
	divsd	%xmm3, %xmm0	# density.44_208, _209
# src/shallow_water_serial.c:155:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	mulsd	%xmm2, %xmm0	# _188, _210
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	movq	_acceleration_y(%rip), %rdx	# acceleration_y, acceleration_y.45_211
	movq	_N(%rip), %rax	# N, N.46_212
	addq	$2, %rax	#, _213
	imulq	-40(%rbp), %rax	# y, _214
	movq	-48(%rbp), %rcx	# x, tmp602
	addq	%rcx, %rax	# tmp602, _215
	salq	$3, %rax	#, _217
	addq	%rdx, %rax	# acceleration_y.45_211, _218
# src/shallow_water_serial.c:155:                        + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
	addsd	%xmm1, %xmm0	# _186, _219
# src/shallow_water_serial.c:154:             DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
	movsd	%xmm0, (%rax)	# _219, *_218
# src/shallow_water_serial.c:150:         for (int_t x = 0; x <= N + 1; x++)
	addq	$1, -48(%rbp)	#, x
L17:
# src/shallow_water_serial.c:150:         for (int_t x = 0; x <= N + 1; x++)
	movq	_N(%rip), %rax	# N, N.47_220
	addq	$1, %rax	#, _221
# src/shallow_water_serial.c:150:         for (int_t x = 0; x <= N + 1; x++)
	cmpq	%rax, -48(%rbp)	# _221, x
	jle	L18	#,
# src/shallow_water_serial.c:149:     for (int_t y = 0; y <= N + 1; y++)
	addq	$1, -40(%rbp)	#, y
L16:
# src/shallow_water_serial.c:149:     for (int_t y = 0; y <= N + 1; y++)
	movq	_N(%rip), %rax	# N, N.48_222
	addq	$1, %rax	#, _223
# src/shallow_water_serial.c:149:     for (int_t y = 0; y <= N + 1; y++)
	cmpq	%rax, -40(%rbp)	# _223, y
	jle	L19	#,
# src/shallow_water_serial.c:158:     for (int_t y = 1; y <= N; y++)
	movq	$1, -56(%rbp)	#, y
# src/shallow_water_serial.c:158:     for (int_t y = 1; y <= N; y++)
	jmp	L20	#
L23:
# src/shallow_water_serial.c:159:         for (int_t x = 1; x <= N; x++)
	movq	$1, -64(%rbp)	#, x
# src/shallow_water_serial.c:159:         for (int_t x = 1; x <= N; x++)
	jmp	L21	#
L22:
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movq	_mass_velocity_x(%rip), %rdx	# mass_velocity_x[0], _224
	movq	_N(%rip), %rax	# N, N.49_225
	addq	$2, %rax	#, _226
	imulq	-56(%rbp), %rax	# y, _227
	movq	-64(%rbp), %rcx	# x, tmp603
	addq	$1, %rcx	#, _228
	addq	%rcx, %rax	# _228, _229
	salq	$3, %rax	#, _231
	addq	%rdx, %rax	# _224, _232
	movsd	(%rax), %xmm1	# *_232, _233
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movq	_mass_velocity_x(%rip), %rdx	# mass_velocity_x[0], _234
	movq	_N(%rip), %rax	# N, N.50_235
	addq	$2, %rax	#, _236
	imulq	-56(%rbp), %rax	# y, _237
	movq	-64(%rbp), %rcx	# x, tmp604
	subq	$1, %rcx	#, _238
	addq	%rcx, %rax	# _238, _239
	salq	$3, %rax	#, _241
	addq	%rdx, %rax	# _234, _242
	movsd	(%rax), %xmm0	# *_242, _243
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	addsd	%xmm0, %xmm1	# _243, _244
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movsd	lC6(%rip), %xmm0	#, tmp605
	mulsd	%xmm0, %xmm1	# tmp605, _245
# src/shallow_water_serial.c:162:                     (DU(y, x + 1) - DU(y, x - 1)) / (2 * dx)
	movq	_acceleration_x(%rip), %rdx	# acceleration_x, acceleration_x.51_246
	movq	_N(%rip), %rax	# N, N.52_247
	addq	$2, %rax	#, _248
	imulq	-56(%rbp), %rax	# y, _249
	movq	-64(%rbp), %rcx	# x, tmp606
	addq	$1, %rcx	#, _250
	addq	%rcx, %rax	# _250, _251
	salq	$3, %rax	#, _253
	addq	%rdx, %rax	# acceleration_x.51_246, _254
	movsd	(%rax), %xmm0	# *_254, _255
# src/shallow_water_serial.c:162:                     (DU(y, x + 1) - DU(y, x - 1)) / (2 * dx)
	movq	_acceleration_x(%rip), %rdx	# acceleration_x, acceleration_x.53_256
	movq	_N(%rip), %rax	# N, N.54_257
	addq	$2, %rax	#, _258
	imulq	-56(%rbp), %rax	# y, _259
	movq	-64(%rbp), %rcx	# x, tmp607
	subq	$1, %rcx	#, _260
	addq	%rcx, %rax	# _260, _261
	salq	$3, %rax	#, _263
	addq	%rdx, %rax	# acceleration_x.53_256, _264
	movsd	(%rax), %xmm3	# *_264, _265
# src/shallow_water_serial.c:162:                     (DU(y, x + 1) - DU(y, x - 1)) / (2 * dx)
	movapd	%xmm0, %xmm2	# _255, _255
	subsd	%xmm3, %xmm2	# _265, _255
# src/shallow_water_serial.c:162:                     (DU(y, x + 1) - DU(y, x - 1)) / (2 * dx)
	movsd	_dx(%rip), %xmm0	# dx, dx.55_267
	addsd	%xmm0, %xmm0	# dx.55_267, _268
# src/shallow_water_serial.c:162:                     (DU(y, x + 1) - DU(y, x - 1)) / (2 * dx)
	movapd	%xmm2, %xmm3	# _266, _266
	divsd	%xmm0, %xmm3	# _268, _266
# src/shallow_water_serial.c:163:                     + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
	movq	_mass_velocity(%rip), %rdx	# mass_velocity, mass_velocity.56_270
	movq	_N(%rip), %rax	# N, N.57_271
	addq	$2, %rax	#, _272
	imulq	-56(%rbp), %rax	# y, _273
	movq	-64(%rbp), %rcx	# x, tmp608
	addq	$1, %rcx	#, _274
	addq	%rcx, %rax	# _274, _275
	salq	$3, %rax	#, _277
	addq	%rdx, %rax	# mass_velocity.56_270, _278
	movsd	(%rax), %xmm0	# *_278, _279
# src/shallow_water_serial.c:163:                     + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
	movq	_mass_velocity(%rip), %rdx	# mass_velocity, mass_velocity.58_280
	movq	_N(%rip), %rax	# N, N.59_281
	addq	$2, %rax	#, _282
	imulq	-56(%rbp), %rax	# y, _283
	movq	-64(%rbp), %rcx	# x, tmp609
	subq	$1, %rcx	#, _284
	addq	%rcx, %rax	# _284, _285
	salq	$3, %rax	#, _287
	addq	%rdx, %rax	# mass_velocity.58_280, _288
	movsd	(%rax), %xmm4	# *_288, _289
# src/shallow_water_serial.c:163:                     + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
	movapd	%xmm0, %xmm2	# _279, _279
	subsd	%xmm4, %xmm2	# _289, _279
# src/shallow_water_serial.c:163:                     + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
	movsd	_dx(%rip), %xmm0	# dx, dx.60_291
	movapd	%xmm0, %xmm4	# dx.60_291, dx.60_291
	addsd	%xmm0, %xmm4	# dx.60_291, dx.60_291
# src/shallow_water_serial.c:163:                     + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
	divsd	%xmm4, %xmm2	# _292, _290
	movapd	%xmm2, %xmm0	# _290, _293
# src/shallow_water_serial.c:163:                     + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
	addsd	%xmm0, %xmm3	# _293, _269
	movapd	%xmm3, %xmm2	# _269, _294
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movsd	_dt(%rip), %xmm0	# dt, dt.61_295
	mulsd	%xmm0, %xmm2	# dt.61_295, _296
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movq	8+_mass_velocity_x(%rip), %rdx	# mass_velocity_x[1], _297
	movq	_N(%rip), %rax	# N, N.62_298
	addq	$2, %rax	#, _299
	imulq	-56(%rbp), %rax	# y, _300
	movq	-64(%rbp), %rcx	# x, tmp610
	addq	%rcx, %rax	# tmp610, _301
	salq	$3, %rax	#, _303
	addq	%rdx, %rax	# _297, _304
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	subsd	%xmm2, %xmm1	# _296, _245
	movapd	%xmm1, %xmm0	# _245, _305
# src/shallow_water_serial.c:161:             PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
	movsd	%xmm0, (%rax)	# _305, *_304
# src/shallow_water_serial.c:159:         for (int_t x = 1; x <= N; x++)
	addq	$1, -64(%rbp)	#, x
L21:
# src/shallow_water_serial.c:159:         for (int_t x = 1; x <= N; x++)
	movq	_N(%rip), %rax	# N, N.63_306
	cmpq	%rax, -64(%rbp)	# N.63_306, x
	jle	L22	#,
# src/shallow_water_serial.c:158:     for (int_t y = 1; y <= N; y++)
	addq	$1, -56(%rbp)	#, y
L20:
# src/shallow_water_serial.c:158:     for (int_t y = 1; y <= N; y++)
	movq	_N(%rip), %rax	# N, N.64_307
	cmpq	%rax, -56(%rbp)	# N.64_307, y
	jle	L23	#,
# src/shallow_water_serial.c:167:     for (int_t y = 1; y <= N; y++)
	movq	$1, -72(%rbp)	#, y
# src/shallow_water_serial.c:167:     for (int_t y = 1; y <= N; y++)
	jmp	L24	#
L27:
# src/shallow_water_serial.c:168:         for (int_t x = 1; x <= N; x++)
	movq	$1, -80(%rbp)	#, x
# src/shallow_water_serial.c:168:         for (int_t x = 1; x <= N; x++)
	jmp	L25	#
L26:
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movq	_mass_velocity_y(%rip), %rcx	# mass_velocity_y[0], _308
	movq	-72(%rbp), %rax	# y, tmp611
	leaq	1(%rax), %rdx	#, _309
	movq	_N(%rip), %rax	# N, N.65_310
	addq	$2, %rax	#, _311
	imulq	%rdx, %rax	# _309, _312
	movq	-80(%rbp), %rdx	# x, tmp612
	addq	%rdx, %rax	# tmp612, _313
	salq	$3, %rax	#, _315
	addq	%rcx, %rax	# _308, _316
	movsd	(%rax), %xmm1	# *_316, _317
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movq	_mass_velocity_y(%rip), %rcx	# mass_velocity_y[0], _318
	movq	-72(%rbp), %rax	# y, tmp613
	leaq	-1(%rax), %rdx	#, _319
	movq	_N(%rip), %rax	# N, N.66_320
	addq	$2, %rax	#, _321
	imulq	%rdx, %rax	# _319, _322
	movq	-80(%rbp), %rdx	# x, tmp614
	addq	%rdx, %rax	# tmp614, _323
	salq	$3, %rax	#, _325
	addq	%rcx, %rax	# _318, _326
	movsd	(%rax), %xmm0	# *_326, _327
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	addsd	%xmm0, %xmm1	# _327, _328
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movsd	lC6(%rip), %xmm0	#, tmp615
	mulsd	%xmm0, %xmm1	# tmp615, _329
# src/shallow_water_serial.c:171:                     (DV(y + 1, x) - DV(y - 1, x)) / (2 * dx)
	movq	_acceleration_y(%rip), %rcx	# acceleration_y, acceleration_y.67_330
	movq	-72(%rbp), %rax	# y, tmp616
	leaq	1(%rax), %rdx	#, _331
	movq	_N(%rip), %rax	# N, N.68_332
	addq	$2, %rax	#, _333
	imulq	%rdx, %rax	# _331, _334
	movq	-80(%rbp), %rdx	# x, tmp617
	addq	%rdx, %rax	# tmp617, _335
	salq	$3, %rax	#, _337
	addq	%rcx, %rax	# acceleration_y.67_330, _338
	movsd	(%rax), %xmm0	# *_338, _339
# src/shallow_water_serial.c:171:                     (DV(y + 1, x) - DV(y - 1, x)) / (2 * dx)
	movq	_acceleration_y(%rip), %rcx	# acceleration_y, acceleration_y.69_340
	movq	-72(%rbp), %rax	# y, tmp618
	leaq	-1(%rax), %rdx	#, _341
	movq	_N(%rip), %rax	# N, N.70_342
	addq	$2, %rax	#, _343
	imulq	%rdx, %rax	# _341, _344
	movq	-80(%rbp), %rdx	# x, tmp619
	addq	%rdx, %rax	# tmp619, _345
	salq	$3, %rax	#, _347
	addq	%rcx, %rax	# acceleration_y.69_340, _348
	movsd	(%rax), %xmm3	# *_348, _349
# src/shallow_water_serial.c:171:                     (DV(y + 1, x) - DV(y - 1, x)) / (2 * dx)
	movapd	%xmm0, %xmm2	# _339, _339
	subsd	%xmm3, %xmm2	# _349, _339
# src/shallow_water_serial.c:171:                     (DV(y + 1, x) - DV(y - 1, x)) / (2 * dx)
	movsd	_dx(%rip), %xmm0	# dx, dx.71_351
	addsd	%xmm0, %xmm0	# dx.71_351, _352
# src/shallow_water_serial.c:171:                     (DV(y + 1, x) - DV(y - 1, x)) / (2 * dx)
	movapd	%xmm2, %xmm3	# _350, _350
	divsd	%xmm0, %xmm3	# _352, _350
# src/shallow_water_serial.c:172:                     + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx)
	movq	_mass_velocity(%rip), %rcx	# mass_velocity, mass_velocity.72_354
	movq	-72(%rbp), %rax	# y, tmp620
	leaq	1(%rax), %rdx	#, _355
	movq	_N(%rip), %rax	# N, N.73_356
	addq	$2, %rax	#, _357
	imulq	%rdx, %rax	# _355, _358
	movq	-80(%rbp), %rdx	# x, tmp621
	addq	%rdx, %rax	# tmp621, _359
	salq	$3, %rax	#, _361
	addq	%rcx, %rax	# mass_velocity.72_354, _362
	movsd	(%rax), %xmm0	# *_362, _363
# src/shallow_water_serial.c:172:                     + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx)
	movq	_mass_velocity(%rip), %rcx	# mass_velocity, mass_velocity.74_364
	movq	-72(%rbp), %rax	# y, tmp622
	leaq	-1(%rax), %rdx	#, _365
	movq	_N(%rip), %rax	# N, N.75_366
	addq	$2, %rax	#, _367
	imulq	%rdx, %rax	# _365, _368
	movq	-80(%rbp), %rdx	# x, tmp623
	addq	%rdx, %rax	# tmp623, _369
	salq	$3, %rax	#, _371
	addq	%rcx, %rax	# mass_velocity.74_364, _372
	movsd	(%rax), %xmm4	# *_372, _373
# src/shallow_water_serial.c:172:                     + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx)
	movapd	%xmm0, %xmm2	# _363, _363
	subsd	%xmm4, %xmm2	# _373, _363
# src/shallow_water_serial.c:172:                     + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx)
	movsd	_dx(%rip), %xmm0	# dx, dx.76_375
	movapd	%xmm0, %xmm4	# dx.76_375, dx.76_375
	addsd	%xmm0, %xmm4	# dx.76_375, dx.76_375
# src/shallow_water_serial.c:172:                     + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx)
	divsd	%xmm4, %xmm2	# _376, _374
	movapd	%xmm2, %xmm0	# _374, _377
# src/shallow_water_serial.c:172:                     + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx)
	addsd	%xmm0, %xmm3	# _377, _353
	movapd	%xmm3, %xmm2	# _353, _378
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movsd	_dt(%rip), %xmm0	# dt, dt.77_379
	mulsd	%xmm0, %xmm2	# dt.77_379, _380
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movq	8+_mass_velocity_y(%rip), %rdx	# mass_velocity_y[1], _381
	movq	_N(%rip), %rax	# N, N.78_382
	addq	$2, %rax	#, _383
	imulq	-72(%rbp), %rax	# y, _384
	movq	-80(%rbp), %rcx	# x, tmp624
	addq	%rcx, %rax	# tmp624, _385
	salq	$3, %rax	#, _387
	addq	%rdx, %rax	# _381, _388
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	subsd	%xmm2, %xmm1	# _380, _329
	movapd	%xmm1, %xmm0	# _329, _389
# src/shallow_water_serial.c:170:             PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
	movsd	%xmm0, (%rax)	# _389, *_388
# src/shallow_water_serial.c:168:         for (int_t x = 1; x <= N; x++)
	addq	$1, -80(%rbp)	#, x
L25:
# src/shallow_water_serial.c:168:         for (int_t x = 1; x <= N; x++)
	movq	_N(%rip), %rax	# N, N.79_390
	cmpq	%rax, -80(%rbp)	# N.79_390, x
	jle	L26	#,
# src/shallow_water_serial.c:167:     for (int_t y = 1; y <= N; y++)
	addq	$1, -72(%rbp)	#, y
L24:
# src/shallow_water_serial.c:167:     for (int_t y = 1; y <= N; y++)
	movq	_N(%rip), %rax	# N, N.80_391
	cmpq	%rax, -72(%rbp)	# N.80_391, y
	jle	L27	#,
# src/shallow_water_serial.c:176:     for (int_t y = 1; y <= N; y++)
	movq	$1, -88(%rbp)	#, y
# src/shallow_water_serial.c:176:     for (int_t y = 1; y <= N; y++)
	jmp	L28	#
L31:
# src/shallow_water_serial.c:177:         for (int_t x = 1; x <= N; x++)
	movq	$1, -96(%rbp)	#, x
# src/shallow_water_serial.c:177:         for (int_t x = 1; x <= N; x++)
	jmp	L29	#
L30:
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movq	_mass(%rip), %rdx	# mass[0], _392
	movq	_N(%rip), %rax	# N, N.81_393
	addq	$2, %rax	#, _394
	imulq	-88(%rbp), %rax	# y, _395
	movq	-96(%rbp), %rcx	# x, tmp625
	addq	$1, %rcx	#, _396
	addq	%rcx, %rax	# _396, _397
	salq	$3, %rax	#, _399
	addq	%rdx, %rax	# _392, _400
	movsd	(%rax), %xmm1	# *_400, _401
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movq	_mass(%rip), %rdx	# mass[0], _402
	movq	_N(%rip), %rax	# N, N.82_403
	addq	$2, %rax	#, _404
	imulq	-88(%rbp), %rax	# y, _405
	movq	-96(%rbp), %rcx	# x, tmp626
	subq	$1, %rcx	#, _406
	addq	%rcx, %rax	# _406, _407
	salq	$3, %rax	#, _409
	addq	%rdx, %rax	# _402, _410
	movsd	(%rax), %xmm0	# *_410, _411
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	addsd	%xmm0, %xmm1	# _411, _412
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movq	_mass(%rip), %rcx	# mass[0], _413
	movq	-88(%rbp), %rax	# y, tmp627
	leaq	1(%rax), %rdx	#, _414
	movq	_N(%rip), %rax	# N, N.83_415
	addq	$2, %rax	#, _416
	imulq	%rdx, %rax	# _414, _417
	movq	-96(%rbp), %rdx	# x, tmp628
	addq	%rdx, %rax	# tmp628, _418
	salq	$3, %rax	#, _420
	addq	%rcx, %rax	# _413, _421
	movsd	(%rax), %xmm0	# *_421, _422
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	addsd	%xmm0, %xmm1	# _422, _423
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movq	_mass(%rip), %rcx	# mass[0], _424
	movq	-88(%rbp), %rax	# y, tmp629
	leaq	-1(%rax), %rdx	#, _425
	movq	_N(%rip), %rax	# N, N.84_426
	addq	$2, %rax	#, _427
	imulq	%rdx, %rax	# _425, _428
	movq	-96(%rbp), %rdx	# x, tmp630
	addq	%rdx, %rax	# tmp630, _429
	salq	$3, %rax	#, _431
	addq	%rcx, %rax	# _424, _432
	movsd	(%rax), %xmm0	# *_432, _433
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	addsd	%xmm0, %xmm1	# _433, _434
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movsd	lC8(%rip), %xmm0	#, tmp631
	mulsd	%xmm0, %xmm1	# tmp631, _435
# src/shallow_water_serial.c:180:                     (PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx)
	movq	_mass_velocity_x(%rip), %rdx	# mass_velocity_x[0], _436
	movq	_N(%rip), %rax	# N, N.85_437
	addq	$2, %rax	#, _438
	imulq	-88(%rbp), %rax	# y, _439
	movq	-96(%rbp), %rcx	# x, tmp632
	addq	$1, %rcx	#, _440
	addq	%rcx, %rax	# _440, _441
	salq	$3, %rax	#, _443
	addq	%rdx, %rax	# _436, _444
	movsd	(%rax), %xmm0	# *_444, _445
# src/shallow_water_serial.c:180:                     (PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx)
	movq	_mass_velocity_x(%rip), %rdx	# mass_velocity_x[0], _446
	movq	_N(%rip), %rax	# N, N.86_447
	addq	$2, %rax	#, _448
	imulq	-88(%rbp), %rax	# y, _449
	movq	-96(%rbp), %rcx	# x, tmp633
	subq	$1, %rcx	#, _450
	addq	%rcx, %rax	# _450, _451
	salq	$3, %rax	#, _453
	addq	%rdx, %rax	# _446, _454
	movsd	(%rax), %xmm3	# *_454, _455
# src/shallow_water_serial.c:180:                     (PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx)
	movapd	%xmm0, %xmm2	# _445, _445
	subsd	%xmm3, %xmm2	# _455, _445
# src/shallow_water_serial.c:180:                     (PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx)
	movsd	_dx(%rip), %xmm0	# dx, dx.87_457
	addsd	%xmm0, %xmm0	# dx.87_457, _458
# src/shallow_water_serial.c:180:                     (PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx)
	movapd	%xmm2, %xmm3	# _456, _456
	divsd	%xmm0, %xmm3	# _458, _456
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	movq	_mass_velocity_y(%rip), %rcx	# mass_velocity_y[0], _460
	movq	-88(%rbp), %rax	# y, tmp634
	leaq	1(%rax), %rdx	#, _461
	movq	_N(%rip), %rax	# N, N.88_462
	addq	$2, %rax	#, _463
	imulq	%rdx, %rax	# _461, _464
	movq	-96(%rbp), %rdx	# x, tmp635
	addq	%rdx, %rax	# tmp635, _465
	salq	$3, %rax	#, _467
	addq	%rcx, %rax	# _460, _468
	movsd	(%rax), %xmm0	# *_468, _469
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	movq	_mass_velocity_y(%rip), %rcx	# mass_velocity_y[0], _470
	movq	-88(%rbp), %rax	# y, tmp636
	leaq	-1(%rax), %rdx	#, _471
	movq	_N(%rip), %rax	# N, N.89_472
	addq	$2, %rax	#, _473
	imulq	%rdx, %rax	# _471, _474
	movq	-96(%rbp), %rdx	# x, tmp637
	addq	%rdx, %rax	# tmp637, _475
	salq	$3, %rax	#, _477
	addq	%rcx, %rax	# _470, _478
	movsd	(%rax), %xmm4	# *_478, _479
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	movapd	%xmm0, %xmm2	# _469, _469
	subsd	%xmm4, %xmm2	# _479, _469
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	movsd	_dx(%rip), %xmm0	# dx, dx.90_481
	movapd	%xmm0, %xmm4	# dx.90_481, dx.90_481
	addsd	%xmm0, %xmm4	# dx.90_481, dx.90_481
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	divsd	%xmm4, %xmm2	# _482, _480
	movapd	%xmm2, %xmm0	# _480, _483
# src/shallow_water_serial.c:181:                     + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
	addsd	%xmm0, %xmm3	# _483, _459
	movapd	%xmm3, %xmm2	# _459, _484
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movsd	_dt(%rip), %xmm0	# dt, dt.91_485
	mulsd	%xmm0, %xmm2	# dt.91_485, _486
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movq	8+_mass(%rip), %rdx	# mass[1], _487
	movq	_N(%rip), %rax	# N, N.92_488
	addq	$2, %rax	#, _489
	imulq	-88(%rbp), %rax	# y, _490
	movq	-96(%rbp), %rcx	# x, tmp638
	addq	%rcx, %rax	# tmp638, _491
	salq	$3, %rax	#, _493
	addq	%rdx, %rax	# _487, _494
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	subsd	%xmm2, %xmm1	# _486, _435
	movapd	%xmm1, %xmm0	# _435, _495
# src/shallow_water_serial.c:179:             PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
	movsd	%xmm0, (%rax)	# _495, *_494
# src/shallow_water_serial.c:177:         for (int_t x = 1; x <= N; x++)
	addq	$1, -96(%rbp)	#, x
L29:
# src/shallow_water_serial.c:177:         for (int_t x = 1; x <= N; x++)
	movq	_N(%rip), %rax	# N, N.93_496
	cmpq	%rax, -96(%rbp)	# N.93_496, x
	jle	L30	#,
# src/shallow_water_serial.c:176:     for (int_t y = 1; y <= N; y++)
	addq	$1, -88(%rbp)	#, y
L28:
# src/shallow_water_serial.c:176:     for (int_t y = 1; y <= N; y++)
	movq	_N(%rip), %rax	# N, N.94_497
	cmpq	%rax, -88(%rbp)	# N.94_497, y
	jle	L31	#,
# src/shallow_water_serial.c:184: }
	nop	
	nop	
	popq	%rbp	#
LCFI7:
	ret	
LFE29:
	.globl _boundary_condition
_boundary_condition:
LFB30:
	pushq	%rbp	#
LCFI8:
	movq	%rsp, %rbp	#,
LCFI9:
	movq	%rdi, -40(%rbp)	# domain_variable, domain_variable
	movl	%esi, -44(%rbp)	# sign, sign
# src/shallow_water_serial.c:191:     VAR(0, 0) = sign * VAR(2, 2);
	pxor	%xmm1, %xmm1	# _1
	cvtsi2sdl	-44(%rbp), %xmm1	# sign, _1
# src/shallow_water_serial.c:191:     VAR(0, 0) = sign * VAR(2, 2);
	movq	_N(%rip), %rax	# N, N.95_2
	addq	$3, %rax	#, _4
	salq	$4, %rax	#, _4
	movq	%rax, %rdx	# _4, _5
	movq	-40(%rbp), %rax	# domain_variable, tmp227
	addq	%rdx, %rax	# _5, _6
	movsd	(%rax), %xmm0	# *_6, _7
# src/shallow_water_serial.c:191:     VAR(0, 0) = sign * VAR(2, 2);
	mulsd	%xmm1, %xmm0	# _1, _8
# src/shallow_water_serial.c:191:     VAR(0, 0) = sign * VAR(2, 2);
	movq	-40(%rbp), %rax	# domain_variable, tmp228
	movsd	%xmm0, (%rax)	# _8, *domain_variable_156(D)
# src/shallow_water_serial.c:192:     VAR(N + 1, 0) = sign * VAR(N - 1, 2);
	pxor	%xmm1, %xmm1	# _9
	cvtsi2sdl	-44(%rbp), %xmm1	# sign, _9
# src/shallow_water_serial.c:192:     VAR(N + 1, 0) = sign * VAR(N - 1, 2);
	movq	_N(%rip), %rax	# N, N.97_10
	leaq	-1(%rax), %rdx	#, _11
	movq	_N(%rip), %rax	# N, N.98_12
	addq	$2, %rax	#, _13
	imulq	%rdx, %rax	# _11, _14
	addq	$2, %rax	#, _16
	leaq	0(,%rax,8), %rdx	#, _17
	movq	-40(%rbp), %rax	# domain_variable, tmp229
	addq	%rdx, %rax	# _17, _18
	movsd	(%rax), %xmm0	# *_18, _19
# src/shallow_water_serial.c:192:     VAR(N + 1, 0) = sign * VAR(N - 1, 2);
	movq	_N(%rip), %rax	# N, N.99_20
	leaq	1(%rax), %rdx	#, _21
	movq	_N(%rip), %rax	# N, N.100_22
	addq	$2, %rax	#, _23
	imulq	%rdx, %rax	# _21, _24
	leaq	0(,%rax,8), %rdx	#, _26
	movq	-40(%rbp), %rax	# domain_variable, tmp230
	addq	%rdx, %rax	# _26, _27
# src/shallow_water_serial.c:192:     VAR(N + 1, 0) = sign * VAR(N - 1, 2);
	mulsd	%xmm1, %xmm0	# _9, _28
# src/shallow_water_serial.c:192:     VAR(N + 1, 0) = sign * VAR(N - 1, 2);
	movsd	%xmm0, (%rax)	# _28, *_27
# src/shallow_water_serial.c:193:     VAR(0, N + 1) = sign * VAR(2, N - 1);
	pxor	%xmm1, %xmm1	# _29
	cvtsi2sdl	-44(%rbp), %xmm1	# sign, _29
# src/shallow_water_serial.c:193:     VAR(0, N + 1) = sign * VAR(2, N - 1);
	movq	_N(%rip), %rax	# N, N.101_30
	addq	$2, %rax	#, _31
	leaq	(%rax,%rax), %rdx	#, _32
	movq	_N(%rip), %rax	# N, N.102_33
	subq	$1, %rax	#, _34
	addq	%rdx, %rax	# _32, _35
	leaq	0(,%rax,8), %rdx	#, _37
	movq	-40(%rbp), %rax	# domain_variable, tmp231
	addq	%rdx, %rax	# _37, _38
	movsd	(%rax), %xmm0	# *_38, _39
# src/shallow_water_serial.c:193:     VAR(0, N + 1) = sign * VAR(2, N - 1);
	movq	_N(%rip), %rax	# N, N.103_40
	addq	$1, %rax	#, _41
	leaq	0(,%rax,8), %rdx	#, _43
	movq	-40(%rbp), %rax	# domain_variable, tmp232
	addq	%rdx, %rax	# _43, _44
# src/shallow_water_serial.c:193:     VAR(0, N + 1) = sign * VAR(2, N - 1);
	mulsd	%xmm1, %xmm0	# _29, _45
# src/shallow_water_serial.c:193:     VAR(0, N + 1) = sign * VAR(2, N - 1);
	movsd	%xmm0, (%rax)	# _45, *_44
# src/shallow_water_serial.c:194:     VAR(N + 1, N + 1) = sign * VAR(N - 1, N - 1);
	pxor	%xmm1, %xmm1	# _46
	cvtsi2sdl	-44(%rbp), %xmm1	# sign, _46
# src/shallow_water_serial.c:194:     VAR(N + 1, N + 1) = sign * VAR(N - 1, N - 1);
	movq	_N(%rip), %rax	# N, N.104_47
	leaq	-1(%rax), %rdx	#, _48
	movq	_N(%rip), %rax	# N, N.105_49
	addq	$2, %rax	#, _50
	imulq	%rdx, %rax	# _48, _51
	movq	_N(%rip), %rdx	# N, N.106_52
	subq	$1, %rdx	#, _53
	addq	%rdx, %rax	# _53, _54
	leaq	0(,%rax,8), %rdx	#, _56
	movq	-40(%rbp), %rax	# domain_variable, tmp233
	addq	%rdx, %rax	# _56, _57
	movsd	(%rax), %xmm0	# *_57, _58
# src/shallow_water_serial.c:194:     VAR(N + 1, N + 1) = sign * VAR(N - 1, N - 1);
	movq	_N(%rip), %rax	# N, N.107_59
	leaq	1(%rax), %rdx	#, _60
	movq	_N(%rip), %rax	# N, N.108_61
	addq	$2, %rax	#, _62
	imulq	%rdx, %rax	# _60, _63
	movq	_N(%rip), %rdx	# N, N.109_64
	addq	$1, %rdx	#, _65
	addq	%rdx, %rax	# _65, _66
	leaq	0(,%rax,8), %rdx	#, _68
	movq	-40(%rbp), %rax	# domain_variable, tmp234
	addq	%rdx, %rax	# _68, _69
# src/shallow_water_serial.c:194:     VAR(N + 1, N + 1) = sign * VAR(N - 1, N - 1);
	mulsd	%xmm1, %xmm0	# _46, _70
# src/shallow_water_serial.c:194:     VAR(N + 1, N + 1) = sign * VAR(N - 1, N - 1);
	movsd	%xmm0, (%rax)	# _70, *_69
# src/shallow_water_serial.c:196:     for (int_t y = 1; y <= N; y++) VAR(y, 0) = sign * VAR(y, 2);
	movq	$1, -8(%rbp)	#, y
# src/shallow_water_serial.c:196:     for (int_t y = 1; y <= N; y++) VAR(y, 0) = sign * VAR(y, 2);
	jmp	L33	#
L34:
# src/shallow_water_serial.c:196:     for (int_t y = 1; y <= N; y++) VAR(y, 0) = sign * VAR(y, 2);
	pxor	%xmm1, %xmm1	# _71
	cvtsi2sdl	-44(%rbp), %xmm1	# sign, _71
# src/shallow_water_serial.c:196:     for (int_t y = 1; y <= N; y++) VAR(y, 0) = sign * VAR(y, 2);
	movq	_N(%rip), %rax	# N, N.110_72
	addq	$2, %rax	#, _73
	imulq	-8(%rbp), %rax	# y, _74
	addq	$2, %rax	#, _76
	leaq	0(,%rax,8), %rdx	#, _77
	movq	-40(%rbp), %rax	# domain_variable, tmp235
	addq	%rdx, %rax	# _77, _78
	movsd	(%rax), %xmm0	# *_78, _79
# src/shallow_water_serial.c:196:     for (int_t y = 1; y <= N; y++) VAR(y, 0) = sign * VAR(y, 2);
	movq	_N(%rip), %rax	# N, N.111_80
	addq	$2, %rax	#, _81
	imulq	-8(%rbp), %rax	# y, _82
	leaq	0(,%rax,8), %rdx	#, _84
	movq	-40(%rbp), %rax	# domain_variable, tmp236
	addq	%rdx, %rax	# _84, _85
# src/shallow_water_serial.c:196:     for (int_t y = 1; y <= N; y++) VAR(y, 0) = sign * VAR(y, 2);
	mulsd	%xmm1, %xmm0	# _71, _86
# src/shallow_water_serial.c:196:     for (int_t y = 1; y <= N; y++) VAR(y, 0) = sign * VAR(y, 2);
	movsd	%xmm0, (%rax)	# _86, *_85
# src/shallow_water_serial.c:196:     for (int_t y = 1; y <= N; y++) VAR(y, 0) = sign * VAR(y, 2);
	addq	$1, -8(%rbp)	#, y
L33:
# src/shallow_water_serial.c:196:     for (int_t y = 1; y <= N; y++) VAR(y, 0) = sign * VAR(y, 2);
	movq	_N(%rip), %rax	# N, N.112_87
	cmpq	%rax, -8(%rbp)	# N.112_87, y
	jle	L34	#,
# src/shallow_water_serial.c:197:     for (int_t y = 1; y <= N; y++) VAR(y, N + 1) = sign * VAR(y, N - 1);
	movq	$1, -16(%rbp)	#, y
# src/shallow_water_serial.c:197:     for (int_t y = 1; y <= N; y++) VAR(y, N + 1) = sign * VAR(y, N - 1);
	jmp	L35	#
L36:
# src/shallow_water_serial.c:197:     for (int_t y = 1; y <= N; y++) VAR(y, N + 1) = sign * VAR(y, N - 1);
	pxor	%xmm1, %xmm1	# _88
	cvtsi2sdl	-44(%rbp), %xmm1	# sign, _88
# src/shallow_water_serial.c:197:     for (int_t y = 1; y <= N; y++) VAR(y, N + 1) = sign * VAR(y, N - 1);
	movq	_N(%rip), %rax	# N, N.113_89
	addq	$2, %rax	#, _90
	imulq	-16(%rbp), %rax	# y, _91
	movq	_N(%rip), %rdx	# N, N.114_92
	subq	$1, %rdx	#, _93
	addq	%rdx, %rax	# _93, _94
	leaq	0(,%rax,8), %rdx	#, _96
	movq	-40(%rbp), %rax	# domain_variable, tmp237
	addq	%rdx, %rax	# _96, _97
	movsd	(%rax), %xmm0	# *_97, _98
# src/shallow_water_serial.c:197:     for (int_t y = 1; y <= N; y++) VAR(y, N + 1) = sign * VAR(y, N - 1);
	movq	_N(%rip), %rax	# N, N.115_99
	addq	$2, %rax	#, _100
	imulq	-16(%rbp), %rax	# y, _101
	movq	_N(%rip), %rdx	# N, N.116_102
	addq	$1, %rdx	#, _103
	addq	%rdx, %rax	# _103, _104
	leaq	0(,%rax,8), %rdx	#, _106
	movq	-40(%rbp), %rax	# domain_variable, tmp238
	addq	%rdx, %rax	# _106, _107
# src/shallow_water_serial.c:197:     for (int_t y = 1; y <= N; y++) VAR(y, N + 1) = sign * VAR(y, N - 1);
	mulsd	%xmm1, %xmm0	# _88, _108
# src/shallow_water_serial.c:197:     for (int_t y = 1; y <= N; y++) VAR(y, N + 1) = sign * VAR(y, N - 1);
	movsd	%xmm0, (%rax)	# _108, *_107
# src/shallow_water_serial.c:197:     for (int_t y = 1; y <= N; y++) VAR(y, N + 1) = sign * VAR(y, N - 1);
	addq	$1, -16(%rbp)	#, y
L35:
# src/shallow_water_serial.c:197:     for (int_t y = 1; y <= N; y++) VAR(y, N + 1) = sign * VAR(y, N - 1);
	movq	_N(%rip), %rax	# N, N.117_109
	cmpq	%rax, -16(%rbp)	# N.117_109, y
	jle	L36	#,
# src/shallow_water_serial.c:198:     for (int_t x = 1; x <= N; x++) VAR(0, x) = sign * VAR(2, x);
	movq	$1, -24(%rbp)	#, x
# src/shallow_water_serial.c:198:     for (int_t x = 1; x <= N; x++) VAR(0, x) = sign * VAR(2, x);
	jmp	L37	#
L38:
# src/shallow_water_serial.c:198:     for (int_t x = 1; x <= N; x++) VAR(0, x) = sign * VAR(2, x);
	pxor	%xmm1, %xmm1	# _110
	cvtsi2sdl	-44(%rbp), %xmm1	# sign, _110
# src/shallow_water_serial.c:198:     for (int_t x = 1; x <= N; x++) VAR(0, x) = sign * VAR(2, x);
	movq	_N(%rip), %rax	# N, N.118_111
	addq	$2, %rax	#, _112
	leaq	(%rax,%rax), %rdx	#, _113
	movq	-24(%rbp), %rax	# x, tmp239
	addq	%rdx, %rax	# _113, _114
	leaq	0(,%rax,8), %rdx	#, _116
	movq	-40(%rbp), %rax	# domain_variable, tmp240
	addq	%rdx, %rax	# _116, _117
	movsd	(%rax), %xmm0	# *_117, _118
# src/shallow_water_serial.c:198:     for (int_t x = 1; x <= N; x++) VAR(0, x) = sign * VAR(2, x);
	movq	-24(%rbp), %rax	# x, x.119_119
	leaq	0(,%rax,8), %rdx	#, _120
	movq	-40(%rbp), %rax	# domain_variable, tmp241
	addq	%rdx, %rax	# _120, _121
# src/shallow_water_serial.c:198:     for (int_t x = 1; x <= N; x++) VAR(0, x) = sign * VAR(2, x);
	mulsd	%xmm1, %xmm0	# _110, _122
# src/shallow_water_serial.c:198:     for (int_t x = 1; x <= N; x++) VAR(0, x) = sign * VAR(2, x);
	movsd	%xmm0, (%rax)	# _122, *_121
# src/shallow_water_serial.c:198:     for (int_t x = 1; x <= N; x++) VAR(0, x) = sign * VAR(2, x);
	addq	$1, -24(%rbp)	#, x
L37:
# src/shallow_water_serial.c:198:     for (int_t x = 1; x <= N; x++) VAR(0, x) = sign * VAR(2, x);
	movq	_N(%rip), %rax	# N, N.120_123
	cmpq	%rax, -24(%rbp)	# N.120_123, x
	jle	L38	#,
# src/shallow_water_serial.c:199:     for (int_t x = 1; x <= N; x++) VAR(N + 1, x) = sign * VAR(N - 1, x);
	movq	$1, -32(%rbp)	#, x
# src/shallow_water_serial.c:199:     for (int_t x = 1; x <= N; x++) VAR(N + 1, x) = sign * VAR(N - 1, x);
	jmp	L39	#
L40:
# src/shallow_water_serial.c:199:     for (int_t x = 1; x <= N; x++) VAR(N + 1, x) = sign * VAR(N - 1, x);
	pxor	%xmm1, %xmm1	# _124
	cvtsi2sdl	-44(%rbp), %xmm1	# sign, _124
# src/shallow_water_serial.c:199:     for (int_t x = 1; x <= N; x++) VAR(N + 1, x) = sign * VAR(N - 1, x);
	movq	_N(%rip), %rax	# N, N.121_125
	leaq	-1(%rax), %rdx	#, _126
	movq	_N(%rip), %rax	# N, N.122_127
	addq	$2, %rax	#, _128
	imulq	%rdx, %rax	# _126, _129
	movq	-32(%rbp), %rdx	# x, tmp242
	addq	%rdx, %rax	# tmp242, _130
	leaq	0(,%rax,8), %rdx	#, _132
	movq	-40(%rbp), %rax	# domain_variable, tmp243
	addq	%rdx, %rax	# _132, _133
	movsd	(%rax), %xmm0	# *_133, _134
# src/shallow_water_serial.c:199:     for (int_t x = 1; x <= N; x++) VAR(N + 1, x) = sign * VAR(N - 1, x);
	movq	_N(%rip), %rax	# N, N.123_135
	leaq	1(%rax), %rdx	#, _136
	movq	_N(%rip), %rax	# N, N.124_137
	addq	$2, %rax	#, _138
	imulq	%rdx, %rax	# _136, _139
	movq	-32(%rbp), %rdx	# x, tmp244
	addq	%rdx, %rax	# tmp244, _140
	leaq	0(,%rax,8), %rdx	#, _142
	movq	-40(%rbp), %rax	# domain_variable, tmp245
	addq	%rdx, %rax	# _142, _143
# src/shallow_water_serial.c:199:     for (int_t x = 1; x <= N; x++) VAR(N + 1, x) = sign * VAR(N - 1, x);
	mulsd	%xmm1, %xmm0	# _124, _144
# src/shallow_water_serial.c:199:     for (int_t x = 1; x <= N; x++) VAR(N + 1, x) = sign * VAR(N - 1, x);
	movsd	%xmm0, (%rax)	# _144, *_143
# src/shallow_water_serial.c:199:     for (int_t x = 1; x <= N; x++) VAR(N + 1, x) = sign * VAR(N - 1, x);
	addq	$1, -32(%rbp)	#, x
L39:
# src/shallow_water_serial.c:199:     for (int_t x = 1; x <= N; x++) VAR(N + 1, x) = sign * VAR(N - 1, x);
	movq	_N(%rip), %rax	# N, N.125_145
	cmpq	%rax, -32(%rbp)	# N.125_145, x
	jle	L40	#,
# src/shallow_water_serial.c:201: }
	nop	
	nop	
	popq	%rbp	#
LCFI10:
	ret	
LFE30:
	.globl _domain_init
_domain_init:
LFB31:
	pushq	%rbp	#
LCFI11:
	movq	%rsp, %rbp	#,
LCFI12:
	subq	$48, %rsp	#,
# src/shallow_water_serial.c:207:     mass[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	_N(%rip), %rax	# N, N.126_1
	leaq	2(%rax), %rdx	#, _2
# src/shallow_water_serial.c:207:     mass[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	_N(%rip), %rax	# N, N.127_3
	addq	$2, %rax	#, _4
# src/shallow_water_serial.c:207:     mass[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	imulq	%rdx, %rax	# _2, _5
# src/shallow_water_serial.c:207:     mass[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rax, %rdi	# _6,
	call	_calloc	#
# src/shallow_water_serial.c:207:     mass[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, _mass(%rip)	# _7, mass[0]
# src/shallow_water_serial.c:208:     mass[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	_N(%rip), %rax	# N, N.128_8
	leaq	2(%rax), %rdx	#, _9
# src/shallow_water_serial.c:208:     mass[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	_N(%rip), %rax	# N, N.129_10
	addq	$2, %rax	#, _11
# src/shallow_water_serial.c:208:     mass[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	imulq	%rdx, %rax	# _9, _12
# src/shallow_water_serial.c:208:     mass[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rax, %rdi	# _13,
	call	_calloc	#
# src/shallow_water_serial.c:208:     mass[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, 8+_mass(%rip)	# _14, mass[1]
# src/shallow_water_serial.c:210:     mass_velocity_x[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	_N(%rip), %rax	# N, N.130_15
	leaq	2(%rax), %rdx	#, _16
# src/shallow_water_serial.c:210:     mass_velocity_x[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	_N(%rip), %rax	# N, N.131_17
	addq	$2, %rax	#, _18
# src/shallow_water_serial.c:210:     mass_velocity_x[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	imulq	%rdx, %rax	# _16, _19
# src/shallow_water_serial.c:210:     mass_velocity_x[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rax, %rdi	# _20,
	call	_calloc	#
# src/shallow_water_serial.c:210:     mass_velocity_x[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, _mass_velocity_x(%rip)	# _21, mass_velocity_x[0]
# src/shallow_water_serial.c:211:     mass_velocity_x[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	_N(%rip), %rax	# N, N.132_22
	leaq	2(%rax), %rdx	#, _23
# src/shallow_water_serial.c:211:     mass_velocity_x[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	_N(%rip), %rax	# N, N.133_24
	addq	$2, %rax	#, _25
# src/shallow_water_serial.c:211:     mass_velocity_x[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	imulq	%rdx, %rax	# _23, _26
# src/shallow_water_serial.c:211:     mass_velocity_x[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rax, %rdi	# _27,
	call	_calloc	#
# src/shallow_water_serial.c:211:     mass_velocity_x[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, 8+_mass_velocity_x(%rip)	# _28, mass_velocity_x[1]
# src/shallow_water_serial.c:212:     mass_velocity_y[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	_N(%rip), %rax	# N, N.134_29
	leaq	2(%rax), %rdx	#, _30
# src/shallow_water_serial.c:212:     mass_velocity_y[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	_N(%rip), %rax	# N, N.135_31
	addq	$2, %rax	#, _32
# src/shallow_water_serial.c:212:     mass_velocity_y[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	imulq	%rdx, %rax	# _30, _33
# src/shallow_water_serial.c:212:     mass_velocity_y[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rax, %rdi	# _34,
	call	_calloc	#
# src/shallow_water_serial.c:212:     mass_velocity_y[0] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, _mass_velocity_y(%rip)	# _35, mass_velocity_y[0]
# src/shallow_water_serial.c:213:     mass_velocity_y[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	_N(%rip), %rax	# N, N.136_36
	leaq	2(%rax), %rdx	#, _37
# src/shallow_water_serial.c:213:     mass_velocity_y[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	_N(%rip), %rax	# N, N.137_38
	addq	$2, %rax	#, _39
# src/shallow_water_serial.c:213:     mass_velocity_y[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	imulq	%rdx, %rax	# _37, _40
# src/shallow_water_serial.c:213:     mass_velocity_y[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rax, %rdi	# _41,
	call	_calloc	#
# src/shallow_water_serial.c:213:     mass_velocity_y[1] = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, 8+_mass_velocity_y(%rip)	# _42, mass_velocity_y[1]
# src/shallow_water_serial.c:215:     mass_velocity = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	_N(%rip), %rax	# N, N.138_43
	leaq	2(%rax), %rdx	#, _44
# src/shallow_water_serial.c:215:     mass_velocity = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	_N(%rip), %rax	# N, N.139_45
	addq	$2, %rax	#, _46
# src/shallow_water_serial.c:215:     mass_velocity = calloc((N + 2) * (N + 2), sizeof(real_t));
	imulq	%rdx, %rax	# _44, _47
# src/shallow_water_serial.c:215:     mass_velocity = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rax, %rdi	# _48,
	call	_calloc	#
# src/shallow_water_serial.c:215:     mass_velocity = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, _mass_velocity(%rip)	# _49, mass_velocity
# src/shallow_water_serial.c:217:     velocity_x = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	_N(%rip), %rax	# N, N.140_50
	leaq	2(%rax), %rdx	#, _51
# src/shallow_water_serial.c:217:     velocity_x = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	_N(%rip), %rax	# N, N.141_52
	addq	$2, %rax	#, _53
# src/shallow_water_serial.c:217:     velocity_x = calloc((N + 2) * (N + 2), sizeof(real_t));
	imulq	%rdx, %rax	# _51, _54
# src/shallow_water_serial.c:217:     velocity_x = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rax, %rdi	# _55,
	call	_calloc	#
# src/shallow_water_serial.c:217:     velocity_x = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, _velocity_x(%rip)	# _56, velocity_x
# src/shallow_water_serial.c:218:     velocity_y = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	_N(%rip), %rax	# N, N.142_57
	leaq	2(%rax), %rdx	#, _58
# src/shallow_water_serial.c:218:     velocity_y = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	_N(%rip), %rax	# N, N.143_59
	addq	$2, %rax	#, _60
# src/shallow_water_serial.c:218:     velocity_y = calloc((N + 2) * (N + 2), sizeof(real_t));
	imulq	%rdx, %rax	# _58, _61
# src/shallow_water_serial.c:218:     velocity_y = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rax, %rdi	# _62,
	call	_calloc	#
# src/shallow_water_serial.c:218:     velocity_y = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, _velocity_y(%rip)	# _63, velocity_y
# src/shallow_water_serial.c:219:     acceleration_x = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	_N(%rip), %rax	# N, N.144_64
	leaq	2(%rax), %rdx	#, _65
# src/shallow_water_serial.c:219:     acceleration_x = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	_N(%rip), %rax	# N, N.145_66
	addq	$2, %rax	#, _67
# src/shallow_water_serial.c:219:     acceleration_x = calloc((N + 2) * (N + 2), sizeof(real_t));
	imulq	%rdx, %rax	# _65, _68
# src/shallow_water_serial.c:219:     acceleration_x = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rax, %rdi	# _69,
	call	_calloc	#
# src/shallow_water_serial.c:219:     acceleration_x = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, _acceleration_x(%rip)	# _70, acceleration_x
# src/shallow_water_serial.c:220:     acceleration_y = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	_N(%rip), %rax	# N, N.146_71
	leaq	2(%rax), %rdx	#, _72
# src/shallow_water_serial.c:220:     acceleration_y = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	_N(%rip), %rax	# N, N.147_73
	addq	$2, %rax	#, _74
# src/shallow_water_serial.c:220:     acceleration_y = calloc((N + 2) * (N + 2), sizeof(real_t));
	imulq	%rdx, %rax	# _72, _75
# src/shallow_water_serial.c:220:     acceleration_y = calloc((N + 2) * (N + 2), sizeof(real_t));
	movl	$8, %esi	#,
	movq	%rax, %rdi	# _76,
	call	_calloc	#
# src/shallow_water_serial.c:220:     acceleration_y = calloc((N + 2) * (N + 2), sizeof(real_t));
	movq	%rax, _acceleration_y(%rip)	# _77, acceleration_y
# src/shallow_water_serial.c:222:     for (int_t y = 1; y <= N; y++)
	movq	$1, -8(%rbp)	#, y
# src/shallow_water_serial.c:222:     for (int_t y = 1; y <= N; y++)
	jmp	L42	#
L47:
# src/shallow_water_serial.c:224:         for (int_t x = 1; x <= N; x++)
	movq	$1, -16(%rbp)	#, x
# src/shallow_water_serial.c:224:         for (int_t x = 1; x <= N; x++)
	jmp	L43	#
L46:
# src/shallow_water_serial.c:226:             PN(y, x) = 1e-3;
	movq	_mass(%rip), %rdx	# mass[0], _78
	movq	_N(%rip), %rax	# N, N.148_79
	addq	$2, %rax	#, _80
	imulq	-8(%rbp), %rax	# y, _81
	movq	-16(%rbp), %rcx	# x, tmp263
	addq	%rcx, %rax	# tmp263, _82
	salq	$3, %rax	#, _84
	addq	%rdx, %rax	# _78, _85
# src/shallow_water_serial.c:226:             PN(y, x) = 1e-3;
	movsd	lC9(%rip), %xmm0	#, tmp264
	movsd	%xmm0, (%rax)	# tmp264, *_85
# src/shallow_water_serial.c:227:             PNU(y, x) = 0.0;
	movq	_mass_velocity_x(%rip), %rdx	# mass_velocity_x[0], _86
	movq	_N(%rip), %rax	# N, N.149_87
	addq	$2, %rax	#, _88
	imulq	-8(%rbp), %rax	# y, _89
	movq	-16(%rbp), %rcx	# x, tmp265
	addq	%rcx, %rax	# tmp265, _90
	salq	$3, %rax	#, _92
	addq	%rdx, %rax	# _86, _93
# src/shallow_water_serial.c:227:             PNU(y, x) = 0.0;
	pxor	%xmm0, %xmm0	# tmp266
	movsd	%xmm0, (%rax)	# tmp266, *_93
# src/shallow_water_serial.c:228:             PNV(y, x) = 0.0;
	movq	_mass_velocity_y(%rip), %rdx	# mass_velocity_y[0], _94
	movq	_N(%rip), %rax	# N, N.150_95
	addq	$2, %rax	#, _96
	imulq	-8(%rbp), %rax	# y, _97
	movq	-16(%rbp), %rcx	# x, tmp267
	addq	%rcx, %rax	# tmp267, _98
	salq	$3, %rax	#, _100
	addq	%rdx, %rax	# _94, _101
# src/shallow_water_serial.c:228:             PNV(y, x) = 0.0;
	pxor	%xmm0, %xmm0	# tmp268
	movsd	%xmm0, (%rax)	# tmp268, *_101
# src/shallow_water_serial.c:230:             real_t cx = x - N / 2;
	movq	_N(%rip), %rax	# N, N.151_102
	movq	%rax, %rdx	# N.151_102, tmp269
	shrq	$63, %rdx	#, tmp269
	addq	%rdx, %rax	# tmp269, tmp270
	sarq	%rax	# tmp271
	negq	%rax	# tmp271
	movq	%rax, %rdx	# tmp271, _103
# src/shallow_water_serial.c:230:             real_t cx = x - N / 2;
	movq	-16(%rbp), %rax	# x, tmp272
	addq	%rdx, %rax	# _103, _104
# src/shallow_water_serial.c:230:             real_t cx = x - N / 2;
	pxor	%xmm0, %xmm0	# tmp273
	cvtsi2sdq	%rax, %xmm0	# _104, tmp273
	movsd	%xmm0, -24(%rbp)	# tmp273, cx
# src/shallow_water_serial.c:231:             real_t cy = y - N / 2;
	movq	_N(%rip), %rax	# N, N.152_105
	movq	%rax, %rdx	# N.152_105, tmp274
	shrq	$63, %rdx	#, tmp274
	addq	%rdx, %rax	# tmp274, tmp275
	sarq	%rax	# tmp276
	negq	%rax	# tmp276
	movq	%rax, %rdx	# tmp276, _106
# src/shallow_water_serial.c:231:             real_t cy = y - N / 2;
	movq	-8(%rbp), %rax	# y, tmp277
	addq	%rdx, %rax	# _106, _107
# src/shallow_water_serial.c:231:             real_t cy = y - N / 2;
	pxor	%xmm0, %xmm0	# tmp278
	cvtsi2sdq	%rax, %xmm0	# _107, tmp278
	movsd	%xmm0, -32(%rbp)	# tmp278, cy
# src/shallow_water_serial.c:232:             if (sqrt(cx * cx + cy * cy) < N / 20.0)
	movsd	-24(%rbp), %xmm0	# cx, tmp279
	movapd	%xmm0, %xmm1	# tmp279, tmp279
	mulsd	%xmm0, %xmm1	# tmp279, tmp279
# src/shallow_water_serial.c:232:             if (sqrt(cx * cx + cy * cy) < N / 20.0)
	movsd	-32(%rbp), %xmm0	# cy, tmp280
	mulsd	%xmm0, %xmm0	# tmp280, _109
# src/shallow_water_serial.c:232:             if (sqrt(cx * cx + cy * cy) < N / 20.0)
	addsd	%xmm0, %xmm1	# _109, _108
	movq	%xmm1, %rax	# _108, _110
	movq	%rax, %xmm0	# _110,
	call	_sqrt	#
# src/shallow_water_serial.c:232:             if (sqrt(cx * cx + cy * cy) < N / 20.0)
	movq	_N(%rip), %rax	# N, N.153_112
	pxor	%xmm1, %xmm1	# _113
	cvtsi2sdq	%rax, %xmm1	# N.153_112, _113
	movsd	lC11(%rip), %xmm2	#, tmp281
	divsd	%xmm2, %xmm1	# tmp281, _114
# src/shallow_water_serial.c:232:             if (sqrt(cx * cx + cy * cy) < N / 20.0)
	comisd	%xmm0, %xmm1	# _111, _114
	jbe	L44	#,
# src/shallow_water_serial.c:235:                         -4 * pow(cx, 2.0) / (real_t) (N)
	movsd	lC12(%rip), %xmm0	#, tmp282
	movq	-24(%rbp), %rax	# cx, tmp283
	movapd	%xmm0, %xmm1	# tmp282,
	movq	%rax, %xmm0	# tmp283,
	call	_pow	#
# src/shallow_water_serial.c:235:                         -4 * pow(cx, 2.0) / (real_t) (N)
	movsd	lC13(%rip), %xmm1	#, tmp284
	mulsd	%xmm1, %xmm0	# tmp284, _116
# src/shallow_water_serial.c:235:                         -4 * pow(cx, 2.0) / (real_t) (N)
	movq	_N(%rip), %rax	# N, N.154_117
	pxor	%xmm1, %xmm1	# _118
	cvtsi2sdq	%rax, %xmm1	# N.154_117, _118
# src/shallow_water_serial.c:235:                         -4 * pow(cx, 2.0) / (real_t) (N)
	divsd	%xmm1, %xmm0	# _118, _116
	movsd	%xmm0, -40(%rbp)	# _116, %sfp
# src/shallow_water_serial.c:236:                         - 4 * pow(cy, 2.0) / (real_t) (N)
	movsd	lC12(%rip), %xmm0	#, tmp285
	movq	-32(%rbp), %rax	# cy, tmp286
	movapd	%xmm0, %xmm1	# tmp285,
	movq	%rax, %xmm0	# tmp286,
	call	_pow	#
# src/shallow_water_serial.c:236:                         - 4 * pow(cy, 2.0) / (real_t) (N)
	movsd	lC14(%rip), %xmm1	#, tmp287
	mulsd	%xmm1, %xmm0	# tmp287, _121
# src/shallow_water_serial.c:236:                         - 4 * pow(cy, 2.0) / (real_t) (N)
	movq	_N(%rip), %rax	# N, N.155_122
	pxor	%xmm1, %xmm1	# _123
	cvtsi2sdq	%rax, %xmm1	# N.155_122, _123
# src/shallow_water_serial.c:236:                         - 4 * pow(cy, 2.0) / (real_t) (N)
	divsd	%xmm1, %xmm0	# _123, _124
# src/shallow_water_serial.c:234:                 PN(y, x) -= 5e-4 * exp(
	movsd	-40(%rbp), %xmm3	# %sfp, _119
	subsd	%xmm0, %xmm3	# _124, _119
	movq	%xmm3, %rax	# _119, _125
	movq	%rax, %xmm0	# _125,
	call	_exp	#
# src/shallow_water_serial.c:234:                 PN(y, x) -= 5e-4 * exp(
	movsd	lC15(%rip), %xmm1	#, tmp288
	mulsd	%xmm0, %xmm1	# _126, _212
# src/shallow_water_serial.c:234:                 PN(y, x) -= 5e-4 * exp(
	movq	_mass(%rip), %rdx	# mass[0], _127
	movq	_N(%rip), %rax	# N, N.156_128
	addq	$2, %rax	#, _129
	imulq	-8(%rbp), %rax	# y, _130
	movq	-16(%rbp), %rcx	# x, tmp289
	addq	%rcx, %rax	# tmp289, _131
	salq	$3, %rax	#, _133
	addq	%rdx, %rax	# _127, _134
	movsd	(%rax), %xmm0	# *_134, _135
	movq	_mass(%rip), %rdx	# mass[0], _136
	movq	_N(%rip), %rax	# N, N.157_137
	addq	$2, %rax	#, _138
	imulq	-8(%rbp), %rax	# y, _139
	movq	-16(%rbp), %rcx	# x, tmp290
	addq	%rcx, %rax	# tmp290, _140
	salq	$3, %rax	#, _142
	addq	%rdx, %rax	# _136, _143
# src/shallow_water_serial.c:234:                 PN(y, x) -= 5e-4 * exp(
	subsd	%xmm1, %xmm0	# _212, _144
	movsd	%xmm0, (%rax)	# _144, *_143
L44:
# src/shallow_water_serial.c:240:             PN(y, x) *= density;
	movq	_mass(%rip), %rdx	# mass[0], _145
	movq	_N(%rip), %rax	# N, N.158_146
	addq	$2, %rax	#, _147
	imulq	-8(%rbp), %rax	# y, _148
	movq	-16(%rbp), %rcx	# x, tmp291
	addq	%rcx, %rax	# tmp291, _149
	salq	$3, %rax	#, _151
	addq	%rdx, %rax	# _145, _152
	movsd	(%rax), %xmm1	# *_152, _153
# src/shallow_water_serial.c:240:             PN(y, x) *= density;
	movsd	lC7(%rip), %xmm0	#, density.159_154
# src/shallow_water_serial.c:240:             PN(y, x) *= density;
	movq	_mass(%rip), %rdx	# mass[0], _155
	movq	_N(%rip), %rax	# N, N.160_156
	addq	$2, %rax	#, _157
	imulq	-8(%rbp), %rax	# y, _158
	movq	-16(%rbp), %rcx	# x, tmp292
	addq	%rcx, %rax	# tmp292, _159
	salq	$3, %rax	#, _161
	addq	%rdx, %rax	# _155, _162
# src/shallow_water_serial.c:240:             PN(y, x) *= density;
	mulsd	%xmm1, %xmm0	# _153, _163
	movsd	%xmm0, (%rax)	# _163, *_162
# src/shallow_water_serial.c:224:         for (int_t x = 1; x <= N; x++)
	addq	$1, -16(%rbp)	#, x
L43:
# src/shallow_water_serial.c:224:         for (int_t x = 1; x <= N; x++)
	movq	_N(%rip), %rax	# N, N.161_164
	cmpq	%rax, -16(%rbp)	# N.161_164, x
	jle	L46	#,
# src/shallow_water_serial.c:222:     for (int_t y = 1; y <= N; y++)
	addq	$1, -8(%rbp)	#, y
L42:
# src/shallow_water_serial.c:222:     for (int_t y = 1; y <= N; y++)
	movq	_N(%rip), %rax	# N, N.162_165
	cmpq	%rax, -8(%rbp)	# N.162_165, y
	jle	L47	#,
# src/shallow_water_serial.c:244:     dx = domain_size / (real_t) N;
	movsd	lC16(%rip), %xmm0	#, domain_size.163_166
# src/shallow_water_serial.c:244:     dx = domain_size / (real_t) N;
	movq	_N(%rip), %rax	# N, N.164_167
	pxor	%xmm1, %xmm1	# _168
	cvtsi2sdq	%rax, %xmm1	# N.164_167, _168
# src/shallow_water_serial.c:244:     dx = domain_size / (real_t) N;
	divsd	%xmm1, %xmm0	# _168, _169
# src/shallow_water_serial.c:244:     dx = domain_size / (real_t) N;
	movsd	%xmm0, _dx(%rip)	# _169, dx
# src/shallow_water_serial.c:245:     dt = 5e-2;
	movsd	lC17(%rip), %xmm0	#, tmp293
	movsd	%xmm0, _dt(%rip)	# tmp293, dt
# src/shallow_water_serial.c:246: }
	nop	
	leave	
LCFI13:
	ret	
LFE31:
	.cstring
lC18:
	.ascii "data/%.5lld.bin\0"
lC19:
	.ascii "wb\0"
lC20:
	.ascii "Failed to open file %s\12\0"
	.text
	.globl _domain_save
_domain_save:
LFB32:
	pushq	%rbp	#
LCFI14:
	movq	%rsp, %rbp	#,
LCFI15:
	subq	$304, %rsp	#,
	movq	%rdi, -296(%rbp)	# iteration, iteration
# src/shallow_water_serial.c:252:     int_t index = iteration / snapshot_frequency;
	movq	_snapshot_frequency(%rip), %rcx	# snapshot_frequency, snapshot_frequency.165_1
# src/shallow_water_serial.c:252:     int_t index = iteration / snapshot_frequency;
	movq	-296(%rbp), %rax	# iteration, tmp97
	cqto
	idivq	%rcx	# snapshot_frequency.165_1
	movq	%rax, -16(%rbp)	# tmp95, index
# src/shallow_water_serial.c:254:     memset(filename, 0, 256 * sizeof(char));
	leaq	-288(%rbp), %rax	#, tmp98
	movq	%rax, %rsi	# tmp98, tmp99
	movl	$0, %eax	#, tmp100
	movl	$32, %edx	#, tmp101
	movq	%rsi, %rdi	# tmp99, tmp99
	movq	%rdx, %rcx	# tmp101, tmp101
	rep stosq
# src/shallow_water_serial.c:255:     sprintf(filename, "data/%.5lld.bin", index);
	movq	-16(%rbp), %rdx	# index, tmp102
	leaq	-288(%rbp), %rax	#, tmp103
	movq	%rdx, %r8	# tmp102,
	leaq	lC18(%rip), %rdx	#, tmp104
	movq	%rdx, %rcx	# tmp104,
	movl	$256, %edx	#,
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp103,
	movl	$0, %eax	#,
	call	___sprintf_chk	#
# src/shallow_water_serial.c:257:     FILE *out = fopen(filename, "wb");
	leaq	-288(%rbp), %rax	#, tmp105
	leaq	lC19(%rip), %rdx	#, tmp106
	movq	%rdx, %rsi	# tmp106,
	movq	%rax, %rdi	# tmp105,
	call	_fopen	#
	movq	%rax, -24(%rbp)	# tmp107, out
# src/shallow_water_serial.c:258:     if (!out)
	cmpq	$0, -24(%rbp)	#, out
	jne	L50	#,
# src/shallow_water_serial.c:260:         fprintf(stderr, "Failed to open file %s\n", filename);
	movq	___stderrp@GOTPCREL(%rip), %rax	#, tmp108
	movq	(%rax), %rcx	# __stderrp, __stderrp.166_2
	leaq	-288(%rbp), %rax	#, tmp109
	movq	%rax, %rdx	# tmp109,
	leaq	lC20(%rip), %rax	#, tmp110
	movq	%rax, %rsi	# tmp110,
	movq	%rcx, %rdi	# __stderrp.166_2,
	movl	$0, %eax	#,
	call	_fprintf	#
# src/shallow_water_serial.c:261:         exit(1);
	movl	$1, %edi	#,
	call	_exit	#
L50:
# src/shallow_water_serial.c:263:     for (int_t y = 1; y <= N; y++)
	movq	$1, -8(%rbp)	#, y
# src/shallow_water_serial.c:263:     for (int_t y = 1; y <= N; y++)
	jmp	L51	#
L52:
# src/shallow_water_serial.c:265:         fwrite(&mass[0][y * (N + 2) + 1], N, sizeof(real_t), out);
	movq	_N(%rip), %rax	# N, N.167_3
	movq	%rax, %rsi	# N.167_3, N.168_4
# src/shallow_water_serial.c:265:         fwrite(&mass[0][y * (N + 2) + 1], N, sizeof(real_t), out);
	movq	_mass(%rip), %rdx	# mass[0], _5
# src/shallow_water_serial.c:265:         fwrite(&mass[0][y * (N + 2) + 1], N, sizeof(real_t), out);
	movq	_N(%rip), %rax	# N, N.169_6
	addq	$2, %rax	#, _7
# src/shallow_water_serial.c:265:         fwrite(&mass[0][y * (N + 2) + 1], N, sizeof(real_t), out);
	imulq	-8(%rbp), %rax	# y, _8
# src/shallow_water_serial.c:265:         fwrite(&mass[0][y * (N + 2) + 1], N, sizeof(real_t), out);
	addq	$1, %rax	#, _10
	salq	$3, %rax	#, _11
# src/shallow_water_serial.c:265:         fwrite(&mass[0][y * (N + 2) + 1], N, sizeof(real_t), out);
	addq	%rdx, %rax	# _5, _12
# src/shallow_water_serial.c:265:         fwrite(&mass[0][y * (N + 2) + 1], N, sizeof(real_t), out);
	movq	-24(%rbp), %rdx	# out, tmp111
	movq	%rdx, %rcx	# tmp111,
	movl	$8, %edx	#,
	movq	%rax, %rdi	# _12,
	call	_fwrite	#
# src/shallow_water_serial.c:263:     for (int_t y = 1; y <= N; y++)
	addq	$1, -8(%rbp)	#, y
L51:
# src/shallow_water_serial.c:263:     for (int_t y = 1; y <= N; y++)
	movq	_N(%rip), %rax	# N, N.170_13
	cmpq	%rax, -8(%rbp)	# N.170_13, y
	jle	L52	#,
# src/shallow_water_serial.c:267:     fclose(out);
	movq	-24(%rbp), %rax	# out, tmp112
	movq	%rax, %rdi	# tmp112,
	call	_fclose	#
# src/shallow_water_serial.c:268: }
	nop	
	leave	
LCFI16:
	ret	
LFE32:
	.globl _domain_finalize
_domain_finalize:
LFB33:
	pushq	%rbp	#
LCFI17:
	movq	%rsp, %rbp	#,
LCFI18:
# src/shallow_water_serial.c:274:     free(mass[0]);
	movq	_mass(%rip), %rax	# mass[0], _1
# src/shallow_water_serial.c:274:     free(mass[0]);
	movq	%rax, %rdi	# _1,
	call	_free	#
# src/shallow_water_serial.c:275:     free(mass[1]);
	movq	8+_mass(%rip), %rax	# mass[1], _2
# src/shallow_water_serial.c:275:     free(mass[1]);
	movq	%rax, %rdi	# _2,
	call	_free	#
# src/shallow_water_serial.c:276:     free(mass_velocity_x[0]);
	movq	_mass_velocity_x(%rip), %rax	# mass_velocity_x[0], _3
# src/shallow_water_serial.c:276:     free(mass_velocity_x[0]);
	movq	%rax, %rdi	# _3,
	call	_free	#
# src/shallow_water_serial.c:277:     free(mass_velocity_x[1]);
	movq	8+_mass_velocity_x(%rip), %rax	# mass_velocity_x[1], _4
# src/shallow_water_serial.c:277:     free(mass_velocity_x[1]);
	movq	%rax, %rdi	# _4,
	call	_free	#
# src/shallow_water_serial.c:278:     free(mass_velocity_y[0]);
	movq	_mass_velocity_y(%rip), %rax	# mass_velocity_y[0], _5
# src/shallow_water_serial.c:278:     free(mass_velocity_y[0]);
	movq	%rax, %rdi	# _5,
	call	_free	#
# src/shallow_water_serial.c:279:     free(mass_velocity_y[1]);
	movq	8+_mass_velocity_y(%rip), %rax	# mass_velocity_y[1], _6
# src/shallow_water_serial.c:279:     free(mass_velocity_y[1]);
	movq	%rax, %rdi	# _6,
	call	_free	#
# src/shallow_water_serial.c:280:     free(mass_velocity);
	movq	_mass_velocity(%rip), %rax	# mass_velocity, mass_velocity.171_7
	movq	%rax, %rdi	# mass_velocity.171_7,
	call	_free	#
# src/shallow_water_serial.c:281:     free(velocity_x);
	movq	_velocity_x(%rip), %rax	# velocity_x, velocity_x.172_8
	movq	%rax, %rdi	# velocity_x.172_8,
	call	_free	#
# src/shallow_water_serial.c:282:     free(velocity_y);
	movq	_velocity_y(%rip), %rax	# velocity_y, velocity_y.173_9
	movq	%rax, %rdi	# velocity_y.173_9,
	call	_free	#
# src/shallow_water_serial.c:283:     free(acceleration_x);
	movq	_acceleration_x(%rip), %rax	# acceleration_x, acceleration_x.174_10
	movq	%rax, %rdi	# acceleration_x.174_10,
	call	_free	#
# src/shallow_water_serial.c:284:     free(acceleration_y);
	movq	_acceleration_y(%rip), %rax	# acceleration_y, acceleration_y.175_11
	movq	%rax, %rdi	# acceleration_y.175_11,
	call	_free	#
# src/shallow_water_serial.c:285: }
	nop	
	popq	%rbp	#
LCFI19:
	ret	
LFE33:
	.literal8
	.align 3
lC1:
	.long	0
	.long	1079574528
	.align 3
lC3:
	.long	-1598689907
	.long	1051772663
	.align 3
lC5:
	.long	1374389535
	.long	1076076216
	.align 3
lC6:
	.long	0
	.long	1071644672
	.align 3
lC7:
	.long	0
	.long	1083123712
	.align 3
lC8:
	.long	0
	.long	1070596096
	.align 3
lC9:
	.long	-755914244
	.long	1062232653
	.align 3
lC11:
	.long	0
	.long	1077149696
	.align 3
lC12:
	.long	0
	.long	1073741824
	.align 3
lC13:
	.long	0
	.long	-1072693248
	.align 3
lC14:
	.long	0
	.long	1074790400
	.align 3
lC15:
	.long	-755914244
	.long	1061184077
	.align 3
lC16:
	.long	0
	.long	1076101120
	.align 3
lC17:
	.long	-1717986918
	.long	1068079513
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
	.byte	0x4
	.set L$set$3,LCFI0-LFB27
	.long L$set$3
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.set L$set$4,LCFI1-LCFI0
	.long L$set$4
	.byte	0xd
	.uleb128 0x6
	.byte	0x4
	.set L$set$5,LCFI2-LCFI1
	.long L$set$5
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x8
	.align 3
LEFDE1:
LSFDE3:
	.set L$set$6,LEFDE3-LASFDE3
	.long L$set$6
LASFDE3:
	.long	LASFDE3-EH_frame1
	.quad	LFB28-.
	.set L$set$7,LFE28-LFB28
	.quad L$set$7
	.uleb128 0
	.byte	0x4
	.set L$set$8,LCFI3-LFB28
	.long L$set$8
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.set L$set$9,LCFI4-LCFI3
	.long L$set$9
	.byte	0xd
	.uleb128 0x6
	.align 3
LEFDE3:
LSFDE5:
	.set L$set$10,LEFDE5-LASFDE5
	.long L$set$10
LASFDE5:
	.long	LASFDE5-EH_frame1
	.quad	LFB29-.
	.set L$set$11,LFE29-LFB29
	.quad L$set$11
	.uleb128 0
	.byte	0x4
	.set L$set$12,LCFI5-LFB29
	.long L$set$12
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.set L$set$13,LCFI6-LCFI5
	.long L$set$13
	.byte	0xd
	.uleb128 0x6
	.byte	0x4
	.set L$set$14,LCFI7-LCFI6
	.long L$set$14
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x8
	.align 3
LEFDE5:
LSFDE7:
	.set L$set$15,LEFDE7-LASFDE7
	.long L$set$15
LASFDE7:
	.long	LASFDE7-EH_frame1
	.quad	LFB30-.
	.set L$set$16,LFE30-LFB30
	.quad L$set$16
	.uleb128 0
	.byte	0x4
	.set L$set$17,LCFI8-LFB30
	.long L$set$17
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.set L$set$18,LCFI9-LCFI8
	.long L$set$18
	.byte	0xd
	.uleb128 0x6
	.byte	0x4
	.set L$set$19,LCFI10-LCFI9
	.long L$set$19
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x8
	.align 3
LEFDE7:
LSFDE9:
	.set L$set$20,LEFDE9-LASFDE9
	.long L$set$20
LASFDE9:
	.long	LASFDE9-EH_frame1
	.quad	LFB31-.
	.set L$set$21,LFE31-LFB31
	.quad L$set$21
	.uleb128 0
	.byte	0x4
	.set L$set$22,LCFI11-LFB31
	.long L$set$22
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.set L$set$23,LCFI12-LCFI11
	.long L$set$23
	.byte	0xd
	.uleb128 0x6
	.byte	0x4
	.set L$set$24,LCFI13-LCFI12
	.long L$set$24
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x8
	.align 3
LEFDE9:
LSFDE11:
	.set L$set$25,LEFDE11-LASFDE11
	.long L$set$25
LASFDE11:
	.long	LASFDE11-EH_frame1
	.quad	LFB32-.
	.set L$set$26,LFE32-LFB32
	.quad L$set$26
	.uleb128 0
	.byte	0x4
	.set L$set$27,LCFI14-LFB32
	.long L$set$27
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.set L$set$28,LCFI15-LCFI14
	.long L$set$28
	.byte	0xd
	.uleb128 0x6
	.byte	0x4
	.set L$set$29,LCFI16-LCFI15
	.long L$set$29
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x8
	.align 3
LEFDE11:
LSFDE13:
	.set L$set$30,LEFDE13-LASFDE13
	.long L$set$30
LASFDE13:
	.long	LASFDE13-EH_frame1
	.quad	LFB33-.
	.set L$set$31,LFE33-LFB33
	.quad L$set$31
	.uleb128 0
	.byte	0x4
	.set L$set$32,LCFI17-LFB33
	.long L$set$32
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.set L$set$33,LCFI18-LCFI17
	.long L$set$33
	.byte	0xd
	.uleb128 0x6
	.byte	0x4
	.set L$set$34,LCFI19-LCFI18
	.long L$set$34
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x8
	.align 3
LEFDE13:
	.ident	"GCC: (Homebrew GCC 12.2.0) 12.2.0"
	.subsections_via_symbols
