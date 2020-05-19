    .text
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -32
    sw ra, 4(sp) 
    sw s0, 8(sp) 
    sw s1, 0(sp) 
    sw s2, 16(sp) 
    sw s3, 12(sp) 
    sw s4, 24(sp) 
    sw s5, 20(sp) 
    mv	s5,s6 
    li a0, 424
    call malloc
    li t1, 105
    sw t1,0(a0)
    mv	s4,a0 
    li a0, 424
    call malloc
    li t1, 105
    sw t1,0(a0)
    mv	s3,a0 
    li a0, 400024
    call malloc
    li t1, 100005
    sw t1,0(a0)
    mv	s0,a0 
    call	getInt
    mv	s2,a0 
    call	getInt
    mv	s6,a0 
    mv	s1,zero 
    j	_forcondBB1
_forcondBB1:
    blt	s1,s2,	_forbodyBB1
    j	_afterForBB1
_afterForBB1:
    li a0, 1
    sw a0,4(s0)
    mv	t0,zero 
    j	_whileCondBB1
_whileCondBB1:
    ble	t0,s6,	_whileBodyBB1
    j	afterCallBB1
_whileBodyBB1:
    mv	t1,zero 
    li a6, 2139062143
    j	_forcondBB2
_forcondBB2:
    blt	t1,s2,	_whileCondBB2
    j	_afterForBB2
_whileCondBB2:
    slli a0,t0,    2
    addi a0,a0,    4
    add t6,s0,a0
    slli a0,t1,    2
    addi a0,a0,    4
    add a1,s4,a0
    slli a0,t1,    2
    addi a0,a0,    4
    add a0,s3,a0
    lw a0, 0(a0)
    slli a0,a0,    2
    addi a0,a0,    4
    add a0,s0,a0
    lw a1, 0(a1)
    lw a0, 0(a0)
    mul a0,a1,a0
    lw t6, 0(t6)
    bge	t6,a0,	_whileBodyBB2
    j	_afterWhileBB1
_whileBodyBB2:
    slli a0,t1,    2
    addi a0,a0,    4
    add a0,s3,a0
    lw t6, 0(a0)
    addi t6,t6,    1
    sw t6,0(a0)
    j	_whileCondBB2
_afterWhileBB1:
    slli a0,t1,    2
    addi a0,a0,    4
    add t6,s4,a0
    slli a0,t1,    2
    addi a0,a0,    4
    add a0,s3,a0
    lw a0, 0(a0)
    slli a0,a0,    2
    addi a0,a0,    4
    add a0,s0,a0
    lw t6, 0(t6)
    lw a0, 0(a0)
    mul a0,t6,a0
    blt	a0,a6,	_if_thenBB1
    j	paracopy1
_if_thenBB1:
    slli a0,t1,    2
    addi a0,a0,    4
    add a6,s4,a0
    slli a0,t1,    2
    addi a0,a0,    4
    add a0,s3,a0
    lw a0, 0(a0)
    slli a0,a0,    2
    addi a0,a0,    4
    add a0,s0,a0
    lw a6, 0(a6)
    lw a0, 0(a0)
    mul a6,a6,a0
    j	_forupdateBB1
_forupdateBB1:
    addi t1,t1,    1
    mv	a0,t1 
    mv	a0,a6 
    j	_forcondBB2
paracopy1:
    j	_forupdateBB1
_afterForBB2:
    addi t0,t0,    1
    slli a0,t0,    2
    addi a0,a0,    4
    add a0,s0,a0
    sw a6,0(a0)
    j	_whileCondBB1
afterCallBB1:
    slli a0,s6,    2
    addi a0,a0,    4
    add a0,s0,a0
    lw a0, 0(a0)
    call	toString
    call	print
    mv	s6,s5 
    lw s5, 20(sp) 
    lw s4, 24(sp) 
    lw s3, 12(sp) 
    lw s2, 16(sp) 
    lw s1, 0(sp) 
    lw s0, 8(sp) 
    lw ra, 4(sp) 
    mv	a0,zero 
    addi sp,sp,    32
    ret
_forbodyBB1:
    call	getInt
    slli t1,s1,    2
    addi t1,t1,    4
    add t1,s4,t1
    sw a0,0(t1)
    addi a0,s1,    1
    mv	s1,a0 
    mv	a0,s1 
    j	_forcondBB1
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	MAXK					#@MAXK
    .p2align	2
MAXK:
    .word	0
     
    .globl	MAXN					#@MAXN
    .p2align	2
MAXN:
    .word	0
     
