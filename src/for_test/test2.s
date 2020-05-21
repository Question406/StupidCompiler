	.section	.data

	.globl	n
n:
	.zero	4

	.globl	m
m:
	.zero	4

	.globl	g
g:
	.zero	4

	.globl	INF
INF:
	.zero	4

	.globl	unnamed_352
unnamed_352:
	.string	"-1"

	.globl	unnamed_358
unnamed_358:
	.string	" "

	.globl	unnamed_359
unnamed_359:
	.string	""

	.text

	.globl	main
main:
.unnamed_1_0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	li	a0, 4
	call	malloc
	li	a0, 4
	call	malloc
	li	a0, 4
	call	malloc
	li	a0, 4
	call	malloc
	li	t0, 10000000
	sw	t0, INF, ra
	call	_main
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret

	.globl	Heap_Node.maxHeapify
Heap_Node.maxHeapify:
.entry_1:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	li	ra, 2
	mul	ra, a1, ra
	addi	t0, ra, 1
	li	ra, 2
	mul	ra, a1, ra
	addi	t1, ra, 2
	addi	t2, a0, 0
	lw	ra, 0(t2)
	lw	ra, 4(ra)
	slt	ra, t0, ra
	bne	ra, zero, .splitting_2
	j	.splitting_3
.splitting_3:
	li	ra, 0
	j	.unnamed_22_4
.unnamed_22_4:
	bne	ra, zero, .splitting_5
	j	.splitting_6
.splitting_6:
	mv	t0, a1
	j	.if_exit_7
.if_exit_7:
	lw	ra, 0(t2)
	lw	ra, 4(ra)
	slt	ra, t1, ra
	bne	ra, zero, .splitting_8
	j	.splitting_9
.splitting_9:
	li	ra, 0
	j	.unnamed_25_10
.unnamed_25_10:
	bne	ra, zero, .splitting_11
	j	.splitting_12
.splitting_12:
	j	.if_exit_13
.if_exit_13:
	sub	ra, t0, a1
	sltiu	ra, ra, 1
	bne	ra, zero, .func_exit_14
	j	.splitting_15
.splitting_15:
	lw	t1, 0(a0)
	lw	a2, 0(t1)
	addi	t2, a1, 1
	li	ra, 8
	mul	ra, t2, ra
	add	ra, a2, ra
	lw	ra, 0(ra)
	lw	a2, 0(t1)
	addi	a1, a1, 1
	li	t2, 8
	mul	t2, a1, t2
	add	a3, a2, t2
	lw	a2, 0(t1)
	addi	a1, t0, 1
	li	t2, 8
	mul	t2, a1, t2
	add	t2, a2, t2
	lw	t2, 0(t2)
	sw	t2, 0(a3)
	lw	a1, 0(t1)
	addi	t2, t0, 1
	li	t1, 8
	mul	t1, t2, t1
	add	t1, a1, t1
	sw	ra, 0(t1)
	mv	a1, t0
	call	Heap_Node.maxHeapify
	j	.func_exit_14
.func_exit_14:
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.splitting_11:
	mv	t0, t1
	j	.if_exit_13
.splitting_8:
	lw	ra, 0(a0)
	lw	a2, 0(ra)
	addi	t2, t1, 1
	li	ra, 8
	mul	ra, t2, ra
	add	ra, a2, ra
	lw	ra, 0(ra)
	lw	ra, 4(ra)
	sub	a3, zero, ra
	lw	ra, 0(a0)
	lw	a2, 0(ra)
	addi	t2, t0, 1
	li	ra, 8
	mul	ra, t2, ra
	add	ra, a2, ra
	lw	ra, 0(ra)
	lw	ra, 4(ra)
	sub	ra, zero, ra
	slt	ra, ra, a3
	j	.unnamed_25_10
.splitting_5:
	j	.if_exit_7
.splitting_2:
	lw	ra, 0(a0)
	lw	a3, 0(ra)
	addi	a2, t0, 1
	li	ra, 8
	mul	ra, a2, ra
	add	ra, a3, ra
	lw	ra, 0(ra)
	lw	ra, 4(ra)
	sub	ra, zero, ra
	lw	a2, 0(a0)
	lw	a4, 0(a2)
	addi	a3, a1, 1
	li	a2, 8
	mul	a2, a3, a2
	add	a2, a4, a2
	lw	a2, 0(a2)
	lw	a2, 4(a2)
	sub	a2, zero, a2
	slt	ra, a2, ra
	j	.unnamed_22_4

	.globl	_main
_main:
.entry_16:
	addi	sp, sp, -80
	sw	s0, 8(sp)
	sw	s1, 12(sp)
	sw	s2, 16(sp)
	sw	s3, 20(sp)
	sw	s4, 24(sp)
	sw	s5, 28(sp)
	sw	s6, 32(sp)
	sw	s7, 36(sp)
	sw	s8, 40(sp)
	sw	s9, 44(sp)
	sw	s10, 48(sp)
	sw	s11, 52(sp)
	sw	ra, 56(sp)
	lw	s0, INF
	sw	s0, 72(sp)
	call	getInt
	sw	a0, 68(sp)
	call	getInt
	sw	a0, 60(sp)
	li	a0, 16
	call	malloc
	mv	s8, a0
	li	s1, 12
	lw	s0, 60(sp)
	mul	s0, s0, s1
	addi	a0, s0, 4
	call	malloc
	lw	s0, 60(sp)
	sw	s0, 0(a0)
	sw	a0, 0(s8)
	li	s1, 4
	lw	s0, 60(sp)
	mul	s0, s0, s1
	addi	a0, s0, 4
	call	malloc
	lw	s0, 60(sp)
	sw	s0, 0(a0)
	sw	a0, 4(s8)
	li	s1, 4
	lw	s0, 68(sp)
	mul	s0, s0, s1
	addi	a0, s0, 4
	call	malloc
	lw	s0, 68(sp)
	sw	s0, 0(a0)
	sw	a0, 8(s8)
	li	s0, 0
	j	.unnamed_2_17
.unnamed_2_17:
	lw	s1, 60(sp)
	slt	s1, s0, s1
	bne	s1, zero, .splitting_18
	j	.splitting_19
.splitting_19:
	li	s0, 0
	j	.unnamed_6_20
.unnamed_6_20:
	lw	s1, 68(sp)
	slt	s1, s0, s1
	bne	s1, zero, .splitting_21
	j	.splitting_22
.splitting_22:
	li	s0, 0
	sw	s0, 12(s8)
	li	s3, 0
	j	.unnamed_26_23
.unnamed_26_23:
	lw	s0, 60(sp)
	slt	s0, s3, s0
	bne	s0, zero, .splitting_24
	j	.splitting_25
.splitting_25:
	li	s0, 0
	sw	s0, 64(sp)
	j	.unnamed_41_26
.unnamed_41_26:
	lw	s1, 64(sp)
	lw	s0, 68(sp)
	slt	s0, s1, s0
	bne	s0, zero, .splitting_27
	j	.splitting_28
.splitting_28:
	lw	s1, 68(sp)
	sw	s1, n, s0
	lw	s1, 60(sp)
	sw	s1, m, s0
	sw	s8, g, s0
	lw	s1, 72(sp)
	sw	s1, INF, s0
	li	a0, 0
	lw	s0, 8(sp)
	lw	s1, 12(sp)
	lw	s2, 16(sp)
	lw	s3, 20(sp)
	lw	s4, 24(sp)
	lw	s5, 28(sp)
	lw	s6, 32(sp)
	lw	s7, 36(sp)
	lw	s8, 40(sp)
	lw	s9, 44(sp)
	lw	s10, 48(sp)
	lw	s11, 52(sp)
	lw	ra, 56(sp)
	addi	sp, sp, 80
	ret
.splitting_27:
	li	s1, 4
	lw	s0, 68(sp)
	mul	s0, s0, s1
	addi	a0, s0, 4
	call	malloc
	sw	a0, 76(sp)
	lw	s1, 68(sp)
	lw	s0, 76(sp)
	sw	s1, 0(s0)
	li	s1, 4
	lw	s0, 68(sp)
	mul	s0, s0, s1
	addi	a0, s0, 4
	call	malloc
	mv	s9, a0
	lw	s0, 68(sp)
	sw	s0, 0(s9)
	li	s0, 0
	j	.unnamed_30_29
.unnamed_30_29:
	lw	s1, 68(sp)
	slt	s1, s0, s1
	bne	s1, zero, .splitting_30
	j	.splitting_31
.splitting_31:
	lw	s0, 64(sp)
	addi	s1, s0, 1
	li	s0, 4
	mul	s0, s1, s0
	add	s1, s9, s0
	li	s0, 0
	sw	s0, 0(s1)
	li	a0, 4
	call	malloc
	mv	s7, a0
	li	a0, 8
	call	malloc
	mv	s0, a0
	li	s1, 0
	sw	s1, 4(s0)
	li	a0, 132
	call	malloc
	li	s1, 16
	sw	s1, 0(a0)
	sw	a0, 0(s0)
	sw	s0, 0(s7)
	li	a0, 8
	call	malloc
	mv	s3, a0
	li	s0, 0
	sw	s0, 4(s3)
	lw	s0, 64(sp)
	sw	s0, 0(s3)
	addi	s11, s7, 0
	lw	s4, 0(s11)
	lw	s1, 4(s4)
	lw	s0, 0(s4)
	lw	s0, 0(s0)
	sub	s0, s1, s0
	sltiu	s0, s0, 1
	bne	s0, zero, .splitting_32
	j	.if_exit_33
.if_exit_33:
	lw	s2, 0(s4)
	lw	s0, 4(s4)
	addi	s1, s0, 1
	li	s0, 8
	mul	s0, s1, s0
	add	s0, s2, s0
	sw	s3, 0(s0)
	addi	s1, s4, 4
	lw	s0, 0(s1)
	addi	s0, s0, 1
	sw	s0, 0(s1)
	addi	s10, s7, 0
	lw	s0, 0(s10)
	lw	s1, 4(s0)
	li	s0, 1
	sub	s0, s1, s0
	j	.unnamed_17_34
.unnamed_17_34:
	li	s1, 0
	slt	s1, s1, s0
	bne	s1, zero, .splitting_35
	j	.unnamed_34_36
.unnamed_34_36:
	lw	s0, 0(s10)
	lw	s1, 4(s0)
	li	s0, 0
	sub	s0, s1, s0
	sltu	s0, zero, s0
	bne	s0, zero, .splitting_37
	j	.splitting_38
.splitting_38:
	li	s0, 0
	j	.unnamed_45_39
.unnamed_45_39:
	lw	s1, 68(sp)
	slt	s1, s0, s1
	bne	s1, zero, .splitting_40
	j	.splitting_41
.splitting_41:
	la	a0, unnamed_359
	call	println
	lw	s0, 64(sp)
	addi	s0, s0, 1
	sw	s0, 64(sp)
	j	.unnamed_41_26
.splitting_40:
	addi	s2, s0, 1
	li	s1, 4
	mul	s1, s2, s1
	add	s1, s9, s1
	lw	s2, 0(s1)
	lw	s1, 72(sp)
	sub	s1, s2, s1
	sltiu	s1, s1, 1
	bne	s1, zero, .splitting_42
	j	.splitting_43
.splitting_43:
	addi	s2, s0, 1
	li	s1, 4
	mul	s1, s2, s1
	add	s1, s9, s1
	lw	a0, 0(s1)
	call	toString
	call	print
	j	.if_exit_44
.if_exit_44:
	la	a0, unnamed_358
	call	print
	addi	s0, s0, 1
	j	.unnamed_45_39
.splitting_42:
	la	a0, unnamed_352
	call	print
	j	.if_exit_44
.splitting_37:
	lw	s0, 0(s7)
	lw	s0, 0(s0)
	lw	s0, 8(s0)
	lw	s1, 0(s10)
	lw	s2, 4(s1)
	li	s1, 1
	sub	ra, s2, s1
	lw	s6, 0(s7)
	lw	s1, 0(s6)
	lw	s5, 8(s1)
	lw	s4, 0(s6)
	lw	s3, 0(s6)
	addi	s2, ra, 1
	li	s1, 8
	mul	s1, s2, s1
	add	s1, s3, s1
	lw	s1, 0(s1)
	sw	s1, 8(s4)
	lw	s3, 0(s6)
	addi	s2, ra, 1
	li	s1, 8
	mul	s1, s2, s1
	add	s1, s3, s1
	sw	s5, 0(s1)
	lw	s1, 0(s7)
	addi	s3, s1, 4
	lw	s2, 0(s3)
	li	s1, 1
	sub	s1, s2, s1
	sw	s1, 0(s3)
	mv	a0, s7
	li	a1, 0
	call	Heap_Node.maxHeapify
	lw	s6, 0(s0)
	addi	s1, s6, 1
	li	s0, 4
	mul	s1, s1, s0
	lw	s0, 76(sp)
	add	s0, s0, s1
	lw	s1, 0(s0)
	li	s0, 1
	sub	s0, s1, s0
	sltiu	s0, s0, 1
	bne	s0, zero, .unnamed_34_36
	j	.splitting_45
.splitting_45:
	addi	s1, s6, 1
	li	s0, 4
	mul	s1, s1, s0
	lw	s0, 76(sp)
	add	s1, s0, s1
	li	s0, 1
	sw	s0, 0(s1)
	lw	s2, 8(s8)
	addi	s1, s6, 1
	li	s0, 4
	mul	s0, s1, s0
	add	s0, s2, s0
	lw	s0, 0(s0)
	mv	s5, s0
	j	.unnamed_37_46
.unnamed_37_46:
	li	s0, -1
	sub	s0, s5, s0
	sltu	s0, zero, s0
	bne	s0, zero, .splitting_47
	j	.unnamed_34_36
.splitting_47:
	lw	s2, 0(s8)
	addi	s1, s5, 1
	li	s0, 12
	mul	s0, s1, s0
	add	s0, s2, s0
	lw	s0, 0(s0)
	lw	s0, 4(s0)
	lw	s3, 0(s8)
	addi	s2, s5, 1
	li	s1, 12
	mul	s1, s2, s1
	add	s1, s3, s1
	lw	s1, 0(s1)
	lw	s3, 8(s1)
	addi	s2, s6, 1
	li	s1, 4
	mul	s1, s2, s1
	add	s1, s9, s1
	lw	s1, 0(s1)
	add	s3, s1, s3
	addi	s2, s0, 1
	li	s1, 4
	mul	s1, s2, s1
	add	s1, s9, s1
	lw	s1, 0(s1)
	slt	s1, s3, s1
	xori	s1, s1, 1
	bne	s1, zero, .unnamed_40_48
	j	.splitting_49
.splitting_49:
	addi	s2, s0, 1
	li	s1, 4
	mul	s1, s2, s1
	add	s1, s9, s1
	sw	s3, 0(s1)
	li	a0, 8
	call	malloc
	mv	s3, a0
	sw	s0, 0(s3)
	addi	s1, s0, 1
	li	s0, 4
	mul	s0, s1, s0
	add	s0, s9, s0
	lw	s0, 0(s0)
	sw	s0, 4(s3)
	lw	s4, 0(s11)
	lw	s1, 4(s4)
	lw	s0, 0(s4)
	lw	s0, 0(s0)
	sub	s0, s1, s0
	sltiu	s0, s0, 1
	bne	s0, zero, .splitting_50
	j	.if_exit_51
.if_exit_51:
	lw	s2, 0(s4)
	lw	s0, 4(s4)
	addi	s1, s0, 1
	li	s0, 8
	mul	s0, s1, s0
	add	s0, s2, s0
	sw	s3, 0(s0)
	addi	s1, s4, 4
	lw	s0, 0(s1)
	addi	s0, s0, 1
	sw	s0, 0(s1)
	lw	s0, 0(s10)
	lw	s1, 4(s0)
	li	s0, 1
	sub	s0, s1, s0
	j	.unnamed_17_52
.unnamed_17_52:
	li	s1, 0
	slt	s1, s1, s0
	bne	s1, zero, .splitting_53
	j	.unnamed_40_48
.unnamed_40_48:
	lw	s2, 4(s8)
	addi	s1, s5, 1
	li	s0, 4
	mul	s0, s1, s0
	add	s0, s2, s0
	lw	s0, 0(s0)
	mv	s5, s0
	j	.unnamed_37_46
.splitting_53:
	li	s1, 1
	sub	s2, s0, s1
	li	s1, 2
	div	s1, s2, s1
	lw	s2, 0(s7)
	lw	s4, 0(s2)
	addi	s3, s1, 1
	li	s2, 8
	mul	s2, s3, s2
	add	s2, s4, s2
	lw	s2, 0(s2)
	lw	s2, 4(s2)
	sub	ra, zero, s2
	lw	s2, 0(s7)
	lw	s4, 0(s2)
	addi	s3, s0, 1
	li	s2, 8
	mul	s2, s3, s2
	add	s2, s4, s2
	lw	s2, 0(s2)
	lw	s2, 4(s2)
	sub	s2, zero, s2
	slt	s2, ra, s2
	xori	s2, s2, 1
	bne	s2, zero, .unnamed_40_48
	j	.splitting_54
.splitting_54:
	lw	s3, 0(s7)
	lw	ra, 0(s3)
	addi	s4, s1, 1
	li	s2, 8
	mul	s2, s4, s2
	add	s2, ra, s2
	lw	s2, 0(s2)
	lw	t0, 0(s3)
	addi	ra, s1, 1
	li	s4, 8
	mul	s4, ra, s4
	add	t1, t0, s4
	lw	t0, 0(s3)
	addi	ra, s0, 1
	li	s4, 8
	mul	s4, ra, s4
	add	s4, t0, s4
	lw	s4, 0(s4)
	sw	s4, 0(t1)
	lw	s4, 0(s3)
	addi	s3, s0, 1
	li	s0, 8
	mul	s0, s3, s0
	add	s0, s4, s0
	sw	s2, 0(s0)
	mv	s0, s1
	j	.unnamed_17_52
.splitting_50:
	lw	s0, 0(s4)
	lw	s1, 4(s4)
	lw	ra, 0(s0)
	li	s2, 2
	mul	s2, ra, s2
	li	ra, 8
	mul	ra, s2, ra
	addi	a0, ra, 4
	call	malloc
	sw	s2, 0(a0)
	sw	a0, 0(s4)
	li	s2, 0
	sw	s2, 4(s4)
	j	.unnamed_13_55
.unnamed_13_55:
	lw	s2, 4(s4)
	sub	s2, s2, s1
	sltu	s2, zero, s2
	bne	s2, zero, .splitting_56
	j	.if_exit_51
.splitting_56:
	lw	t0, 0(s4)
	lw	s2, 4(s4)
	addi	ra, s2, 1
	li	s2, 8
	mul	s2, ra, s2
	add	t0, t0, s2
	lw	s2, 4(s4)
	addi	ra, s2, 1
	li	s2, 8
	mul	s2, ra, s2
	add	s2, s0, s2
	lw	s2, 0(s2)
	sw	s2, 0(t0)
	addi	ra, s4, 4
	lw	s2, 0(ra)
	addi	s2, s2, 1
	sw	s2, 0(ra)
	j	.unnamed_13_55
.splitting_35:
	li	s1, 1
	sub	s2, s0, s1
	li	s1, 2
	div	s1, s2, s1
	lw	s2, 0(s7)
	lw	s4, 0(s2)
	addi	s3, s1, 1
	li	s2, 8
	mul	s2, s3, s2
	add	s2, s4, s2
	lw	s2, 0(s2)
	lw	s2, 4(s2)
	sub	s5, zero, s2
	lw	s2, 0(s7)
	lw	s4, 0(s2)
	addi	s3, s0, 1
	li	s2, 8
	mul	s2, s3, s2
	add	s2, s4, s2
	lw	s2, 0(s2)
	lw	s2, 4(s2)
	sub	s2, zero, s2
	slt	s2, s5, s2
	xori	s2, s2, 1
	bne	s2, zero, .unnamed_34_36
	j	.splitting_57
.splitting_57:
	lw	ra, 0(s7)
	lw	s4, 0(ra)
	addi	s3, s1, 1
	li	s2, 8
	mul	s2, s3, s2
	add	s2, s4, s2
	lw	s6, 0(s2)
	lw	s4, 0(ra)
	addi	s3, s1, 1
	li	s2, 8
	mul	s2, s3, s2
	add	s5, s4, s2
	lw	s4, 0(ra)
	addi	s3, s0, 1
	li	s2, 8
	mul	s2, s3, s2
	add	s2, s4, s2
	lw	s2, 0(s2)
	sw	s2, 0(s5)
	lw	s3, 0(ra)
	addi	s2, s0, 1
	li	s0, 8
	mul	s0, s2, s0
	add	s0, s3, s0
	sw	s6, 0(s0)
	mv	s0, s1
	j	.unnamed_17_34
.splitting_32:
	lw	s2, 0(s4)
	lw	s1, 4(s4)
	lw	s5, 0(s2)
	li	s0, 2
	mul	s0, s5, s0
	li	s5, 8
	mul	s5, s0, s5
	addi	a0, s5, 4
	call	malloc
	sw	s0, 0(a0)
	sw	a0, 0(s4)
	li	s0, 0
	sw	s0, 4(s4)
	j	.unnamed_13_58
.unnamed_13_58:
	lw	s0, 4(s4)
	sub	s0, s0, s1
	sltu	s0, zero, s0
	bne	s0, zero, .splitting_59
	j	.if_exit_33
.splitting_59:
	lw	s6, 0(s4)
	lw	s0, 4(s4)
	addi	s5, s0, 1
	li	s0, 8
	mul	s0, s5, s0
	add	s6, s6, s0
	lw	s0, 4(s4)
	addi	s5, s0, 1
	li	s0, 8
	mul	s0, s5, s0
	add	s0, s2, s0
	lw	s0, 0(s0)
	sw	s0, 0(s6)
	addi	s5, s4, 4
	lw	s0, 0(s5)
	addi	s0, s0, 1
	sw	s0, 0(s5)
	j	.unnamed_13_58
.splitting_30:
	addi	s2, s0, 1
	li	s1, 4
	mul	s1, s2, s1
	add	s2, s9, s1
	lw	s1, 72(sp)
	sw	s1, 0(s2)
	addi	s2, s0, 1
	li	s1, 4
	mul	s2, s2, s1
	lw	s1, 76(sp)
	add	s2, s1, s2
	li	s1, 0
	sw	s1, 0(s2)
	addi	s0, s0, 1
	j	.unnamed_30_29
.splitting_24:
	call	getInt
	mv	s0, a0
	call	getInt
	mv	s1, a0
	call	getInt
	mv	s2, a0
	li	a0, 12
	call	malloc
	sw	s0, 0(a0)
	sw	s1, 4(a0)
	sw	s2, 8(a0)
	lw	s4, 0(s8)
	lw	s1, 12(s8)
	addi	s2, s1, 1
	li	s1, 12
	mul	s1, s2, s1
	add	s1, s4, s1
	sw	a0, 0(s1)
	lw	s4, 4(s8)
	lw	s1, 12(s8)
	addi	s2, s1, 1
	li	s1, 4
	mul	s1, s2, s1
	add	s5, s4, s1
	lw	s4, 8(s8)
	addi	s2, s0, 1
	li	s1, 4
	mul	s1, s2, s1
	add	s1, s4, s1
	lw	s1, 0(s1)
	sw	s1, 0(s5)
	lw	s2, 8(s8)
	addi	s1, s0, 1
	li	s0, 4
	mul	s0, s1, s0
	add	s1, s2, s0
	lw	s0, 12(s8)
	sw	s0, 0(s1)
	addi	s1, s8, 12
	lw	s0, 0(s1)
	addi	s0, s0, 1
	sw	s0, 0(s1)
	addi	s3, s3, 1
	j	.unnamed_26_23
.splitting_21:
	lw	s3, 8(s8)
	addi	s2, s0, 1
	li	s1, 4
	mul	s1, s2, s1
	add	s2, s3, s1
	li	s1, -1
	sw	s1, 0(s2)
	addi	s0, s0, 1
	j	.unnamed_6_20
.splitting_18:
	lw	s3, 4(s8)
	addi	s2, s0, 1
	li	s1, 4
	mul	s1, s2, s1
	add	s2, s3, s1
	li	s1, -1
	sw	s1, 0(s2)
	addi	s0, s0, 1
	j	.unnamed_2_17

