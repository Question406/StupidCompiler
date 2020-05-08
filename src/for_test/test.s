    .text
    .globl	modifymulti						 # func begin 
    .p2align	2
    .type	modifymulti,@function
modifymulti:
modifymulti.entryBB1:
    addi sp,sp,    -48
    sw ra, 12(sp) 
    sw s2, 20(sp) 
    sw s3, 24(sp) 
    sw s5, 16(sp) 
    sw s6, 0(sp) 
    sw s8, 28(sp) 
    sw a6, 4(sp) 
    mv	s6,a5 
    sw a4, 8(sp) 
    mv	s3,a3 
    mv	s2,a1 
    mv	s5,a0 
    la a7,ltree    
    lw a5, 0(a7)
    lw a7, 8(sp) 
    bge	a2,a7,	ifTrue1
    j	if_end1
ifTrue1:
    ble	s3,s6,	if_thenBB1
    j	if_end1
if_thenBB1:
    li a7, 4
    mul a7,s5,a7
    addi a7,a7,    4
    add a7,a5,a7
    lw t3, 0(a7)
    li a7, 20
    mul a7,s2,a7
    addi a7,a7,    4
    add a7,t3,a7
    lw a7, 0(a7)
    addi t3,a7,    8
    li a7, 4
    mul a7,s5,a7
    addi a7,a7,    4
    add a7,a5,a7
    lw t0, 0(a7)
    li a7, 20
    mul a7,s2,a7
    addi a7,a7,    4
    add a7,t0,a7
    lw a7, 0(a7)
    addi a7,a7,    8
    lw a7, 0(a7)
    lw t0, 4(sp) 
    mul a7,a7,t0
    sw a7,0(t3)
    li a7, 4
    mul a7,s5,a7
    addi a7,a7,    4
    add a7,a5,a7
    lw t3, 0(a7)
    li a7, 20
    mul a7,s2,a7
    addi a7,a7,    4
    add a7,t3,a7
    lw a7, 0(a7)
    add t3,a7,zero
    li a7, 4
    mul a7,s5,a7
    addi a7,a7,    4
    add a7,a5,a7
    lw t0, 0(a7)
    li a7, 20
    mul a7,s2,a7
    addi a7,a7,    4
    add a7,t0,a7
    lw a7, 0(a7)
    add a7,a7,zero
    lw t0, 0(a7)
    lw a7, 4(sp) 
    mul a7,t0,a7
    sw a7,0(t3)
    li a7, 4
    mul a7,s5,a7
    addi a7,a7,    4
    add a7,a5,a7
    lw t3, 0(a7)
    li a7, 20
    mul a7,s2,a7
    addi a7,a7,    4
    add a7,t3,a7
    lw a7, 0(a7)
    addi t0,a7,    4
    li a7, 4
    mul a7,s5,a7
    addi a7,a7,    4
    add a7,a5,a7
    lw a7, 0(a7)
    li t3, 20
    mul t3,s2,t3
    addi t3,t3,    4
    add a7,a7,t3
    lw a7, 0(a7)
    addi a7,a7,    4
    lw a7, 0(a7)
    lw t3, 4(sp) 
    mul a7,a7,t3
    sw a7,0(t0)
    li a7, 4
    mul a7,s5,a7
    addi a7,a7,    4
    add a7,a5,a7
    lw t3, 0(a7)
    li a7, 20
    mul a7,s2,a7
    addi a7,a7,    4
    add a7,t3,a7
    lw a7, 0(a7)
    addi t3,a7,    16
    li a7, 4
    mul a7,s5,a7
    addi a7,a7,    4
    add a7,a5,a7
    lw t0, 0(a7)
    li a7, 20
    mul a7,s2,a7
    addi a7,a7,    4
    add a7,t0,a7
    lw a7, 0(a7)
    addi a7,a7,    16
    lw a7, 0(a7)
    lw t0, 4(sp) 
    mul a7,a7,t0
    sw a7,0(t3)
    li a7, 4
    mul a7,s5,a7
    addi a7,a7,    4
    add a7,a5,a7
    lw a7, 0(a7)
    li t3, 20
    mul t3,s2,t3
    addi t3,t3,    4
    add a7,a7,t3
    lw a7, 0(a7)
    addi t0,a7,    12
    li a7, 4
    mul a7,s5,a7
    addi a7,a7,    4
    add a7,a5,a7
    lw t3, 0(a7)
    li a7, 20
    mul a7,s2,a7
    addi a7,a7,    4
    add a7,t3,a7
    lw a7, 0(a7)
    addi a7,a7,    12
    lw a7, 0(a7)
    lw t3, 4(sp) 
    mul a7,a7,t3
    sw a7,0(t0)
    j	modifymulti.exitBB1
if_end1:
    add a7,a2,s3
    li t3, 2
    div s8,a7,t3
    li a7, 4
    mul a7,s5,a7
    addi a7,a7,    4
    add a7,a5,a7
    lw a7, 0(a7)
    li t3, 20
    mul t3,s2,t3
    addi t3,t3,    4
    add a7,a7,t3
    lw a7, 0(a7)
    addi a7,a7,    12
    lw a7, 0(a7)
    li t3, 4
    mul t3,s5,t3
    addi t3,t3,    4
    add t3,a5,t3
    lw t0, 0(t3)
    li t3, 20
    mul t3,s2,t3
    addi t3,t3,    4
    add t3,t0,t3
    lw t3, 0(t3)
    addi t3,t3,    16
    lw t3, 0(t3)
    add t0,a2,s3
    li a3, 2
    div t0,t0,a3
    li a3, 4
    mul a3,s5,a3
    addi a3,a3,    4
    add a1,a5,a3
    li a3, 2
    mul a3,s2,a3
    lw a1, 0(a1)
    li a6, 20
    mul a3,a3,a6
    addi a3,a3,    4
    add a3,a1,a3
    lw a3, 0(a3)
    addi a6,a3,    16
    li a3, 4
    mul a3,s5,a3
    addi a3,a3,    4
    add a1,a5,a3
    li a3, 2
    mul a3,s2,a3
    lw t2, 0(a1)
    li a1, 20
    mul a3,a3,a1
    addi a3,a3,    4
    add a3,t2,a3
    lw a3, 0(a3)
    addi a3,a3,    16
    lw a3, 0(a3)
    mul a3,a3,t3
    sw a3,0(a6)
    li a3, 4
    mul a3,s5,a3
    addi a3,a3,    4
    add a1,a5,a3
    li a3, 2
    mul a6,s2,a3
    lw a1, 0(a1)
    li a3, 20
    mul a3,a6,a3
    addi a3,a3,    4
    add a3,a1,a3
    lw a3, 0(a3)
    addi a6,a3,    12
    li a3, 4
    mul a3,s5,a3
    addi a3,a3,    4
    add a3,a5,a3
    li a1, 2
    mul t2,s2,a1
    lw a1, 0(a3)
    li a3, 20
    mul a3,t2,a3
    addi a3,a3,    4
    add a3,a1,a3
    lw a3, 0(a3)
    addi a3,a3,    12
    lw a3, 0(a3)
    mul a3,a3,t3
    add a3,a3,a7
    sw a3,0(a6)
    li a3, 4
    mul a3,s5,a3
    addi a3,a3,    4
    add a1,a5,a3
    li a3, 2
    mul a3,s2,a3
    addi a3,a3,    1
    lw a1, 0(a1)
    li a6, 20
    mul a3,a3,a6
    addi a3,a3,    4
    add a3,a1,a3
    lw a3, 0(a3)
    addi a6,a3,    16
    li a3, 4
    mul a3,s5,a3
    addi a3,a3,    4
    add a1,a5,a3
    li a3, 2
    mul a3,s2,a3
    addi a3,a3,    1
    lw a1, 0(a1)
    li t2, 20
    mul a3,a3,t2
    addi a3,a3,    4
    add a3,a1,a3
    lw a3, 0(a3)
    addi a3,a3,    16
    lw a3, 0(a3)
    mul a3,a3,t3
    sw a3,0(a6)
    li a3, 4
    mul a3,s5,a3
    addi a3,a3,    4
    add a1,a5,a3
    li a3, 2
    mul a3,s2,a3
    addi a3,a3,    1
    lw a1, 0(a1)
    li a6, 20
    mul a3,a3,a6
    addi a3,a3,    4
    add a3,a1,a3
    lw a3, 0(a3)
    addi a1,a3,    12
    li a3, 4
    mul a3,s5,a3
    addi a3,a3,    4
    add a3,a5,a3
    li a6, 2
    mul a6,s2,a6
    addi a6,a6,    1
    lw t2, 0(a3)
    li a3, 20
    mul a3,a6,a3
    addi a3,a3,    4
    add a3,t2,a3
    lw a3, 0(a3)
    addi a3,a3,    12
    lw a3, 0(a3)
    mul a3,a3,t3
    add a3,a3,a7
    sw a3,0(a1)
    li a3, 4
    mul a3,s5,a3
    addi a3,a3,    4
    add a1,a5,a3
    li a3, 2
    mul a3,s2,a3
    lw a1, 0(a1)
    li a6, 20
    mul a3,a3,a6
    addi a3,a3,    4
    add a3,a1,a3
    lw a3, 0(a3)
    add a3,a3,zero
    li a1, 4
    mul a1,s5,a1
    addi a1,a1,    4
    add a1,a5,a1
    li a6, 2
    mul t2,s2,a6
    lw a1, 0(a1)
    li a6, 20
    mul a6,t2,a6
    addi a6,a6,    4
    add a1,a1,a6
    lw a1, 0(a1)
    add a1,a1,zero
    lw a1, 0(a1)
    mul a1,a1,t3
    add a1,a1,a7
    sw a1,0(a3)
    li a3, 4
    mul a3,s5,a3
    addi a3,a3,    4
    add a1,a5,a3
    li a3, 2
    mul a3,s2,a3
    addi a6,a3,    1
    lw a3, 0(a1)
    li a1, 20
    mul a1,a6,a1
    addi a1,a1,    4
    add a3,a3,a1
    lw a3, 0(a3)
    add a1,a3,zero
    li a3, 4
    mul a3,s5,a3
    addi a3,a3,    4
    add a6,a5,a3
    li a3, 2
    mul a3,s2,a3
    addi t2,a3,    1
    lw a3, 0(a6)
    li a6, 20
    mul a6,t2,a6
    addi a6,a6,    4
    add a3,a3,a6
    lw a3, 0(a3)
    add a3,a3,zero
    lw a3, 0(a3)
    mul a3,a3,t3
    add a3,a3,a7
    sw a3,0(a1)
    li a3, 4
    mul a3,s5,a3
    addi a3,a3,    4
    add a1,a5,a3
    li a3, 2
    mul a6,s2,a3
    lw a1, 0(a1)
    li a3, 20
    mul a3,a6,a3
    addi a3,a3,    4
    add a3,a1,a3
    lw a3, 0(a3)
    addi a1,a3,    4
    li a3, 4
    mul a3,s5,a3
    addi a3,a3,    4
    add a3,a5,a3
    li a6, 2
    mul a6,s2,a6
    lw t2, 0(a3)
    li a3, 20
    mul a3,a6,a3
    addi a3,a3,    4
    add a3,t2,a3
    lw a3, 0(a3)
    addi a3,a3,    4
    lw a3, 0(a3)
    mul a3,a3,t3
    add a3,a3,a7
    sw a3,0(a1)
    li a3, 4
    mul a3,s5,a3
    addi a3,a3,    4
    add a1,a5,a3
    li a3, 2
    mul a3,s2,a3
    addi a3,a3,    1
    lw a1, 0(a1)
    li a6, 20
    mul a3,a3,a6
    addi a3,a3,    4
    add a3,a1,a3
    lw a3, 0(a3)
    addi a6,a3,    4
    li a3, 4
    mul a3,s5,a3
    addi a3,a3,    4
    add a1,a5,a3
    li a3, 2
    mul a3,s2,a3
    addi t2,a3,    1
    lw a3, 0(a1)
    li a1, 20
    mul a1,t2,a1
    addi a1,a1,    4
    add a3,a3,a1
    lw a3, 0(a3)
    addi a3,a3,    4
    lw a3, 0(a3)
    mul a3,a3,t3
    add a3,a3,a7
    sw a3,0(a6)
    li a3, 4
    mul a3,s5,a3
    addi a3,a3,    4
    add a3,a5,a3
    li a1, 2
    mul a6,s2,a1
    lw a1, 0(a3)
    li a3, 20
    mul a3,a6,a3
    addi a3,a3,    4
    add a3,a1,a3
    lw a3, 0(a3)
    addi a6,a3,    8
    li a3, 4
    mul a3,s5,a3
    addi a3,a3,    4
    add a1,a5,a3
    li a3, 2
    mul a3,s2,a3
    lw t2, 0(a1)
    li a1, 20
    mul a3,a3,a1
    addi a3,a3,    4
    add a3,t2,a3
    lw a3, 0(a3)
    addi a3,a3,    8
    lw a3, 0(a3)
    mul a1,a3,t3
    sub a3,t0,a2
    addi a3,a3,    1
    mul a3,a7,a3
    add a3,a1,a3
    sw a3,0(a6)
    li a3, 4
    mul a3,s5,a3
    addi a3,a3,    4
    add a1,a5,a3
    li a3, 2
    mul a3,s2,a3
    addi a3,a3,    1
    lw a6, 0(a1)
    li a1, 20
    mul a3,a3,a1
    addi a3,a3,    4
    add a3,a6,a3
    lw a3, 0(a3)
    addi a6,a3,    8
    li a3, 4
    mul a3,s5,a3
    addi a3,a3,    4
    add a1,a5,a3
    li a3, 2
    mul a3,s2,a3
    addi t2,a3,    1
    lw a3, 0(a1)
    li a1, 20
    mul a1,t2,a1
    addi a1,a1,    4
    add a3,a3,a1
    lw a3, 0(a3)
    addi a3,a3,    8
    lw a3, 0(a3)
    mul t3,a3,t3
    sub t0,s3,t0
    mul a7,a7,t0
    add a7,t3,a7
    sw a7,0(a6)
    lw a7, 8(sp) 
    ble	a7,s8,	if_thenBB2
    j	paracopy1
if_thenBB2:
    li a7, 2
    mul a1,s2,a7
    lui a7,%hi(ltree)
    sw a5, %lo(ltree)(a7)
    mv	a0,s5 
    mv	a3,s8 
    lw a4, 8(sp) 
    mv	a5,s6 
    lw a6, 4(sp) 
    call	modifymulti
    la a7,ltree    
    lw a5, 0(a7)
    j	if_end2
paracopy1:
    j	if_end2
if_end2:
    addi a7,s8,    1
    bge	s6,a7,	if_thenBB3
    j	paracopy2
if_thenBB3:
    li a7, 2
    mul a7,s2,a7
    addi a1,a7,    1
    addi a2,s8,    1
    lui a7,%hi(ltree)
    sw a5, %lo(ltree)(a7)
    mv	a0,s5 
    mv	a3,s3 
    lw a4, 8(sp) 
    mv	a5,s6 
    lw a6, 4(sp) 
    call	modifymulti
    la a7,ltree    
    lw a5, 0(a7)
    j	if_end3
paracopy2:
    j	if_end3
if_end3:
    li a7, 4
    mul a7,s5,a7
    addi a7,a7,    4
    add a7,a5,a7
    lw t3, 0(a7)
    li a7, 20
    mul a7,s2,a7
    addi a7,a7,    4
    add a7,t3,a7
    lw a7, 0(a7)
    addi a3,a7,    8
    li a7, 4
    mul a7,s5,a7
    addi a7,a7,    4
    add t3,a5,a7
    li a7, 2
    mul t0,s2,a7
    lw t3, 0(t3)
    li a7, 20
    mul a7,t0,a7
    addi a7,a7,    4
    add a7,t3,a7
    lw a7, 0(a7)
    addi t3,a7,    8
    li a7, 4
    mul a7,s5,a7
    addi a7,a7,    4
    add t0,a5,a7
    li a7, 2
    mul a7,s2,a7
    addi a7,a7,    1
    lw a1, 0(t0)
    li t0, 20
    mul a7,a7,t0
    addi a7,a7,    4
    add a7,a1,a7
    lw a7, 0(a7)
    addi t0,a7,    8
    lw a7, 0(t3)
    lw t3, 0(t0)
    add a7,a7,t3
    sw a7,0(a3)
    li a7, 4
    mul a7,s5,a7
    addi a7,a7,    4
    add a7,a5,a7
    lw a7, 0(a7)
    li t3, 20
    mul t3,s2,t3
    addi t3,t3,    4
    add a7,a7,t3
    lw a7, 0(a7)
    add t0,a7,zero
    li a7, 4
    mul a7,s5,a7
    addi a7,a7,    4
    add a7,a5,a7
    li t3, 2
    mul t3,s2,t3
    lw a7, 0(a7)
    li a3, 20
    mul t3,t3,a3
    addi t3,t3,    4
    add a7,a7,t3
    lw a7, 0(a7)
    add a7,a7,zero
    lw a7, 0(a7)
    li t3, 4
    mul t3,s5,t3
    addi t3,t3,    4
    add a3,a5,t3
    li t3, 2
    mul t3,s2,t3
    addi t3,t3,    1
    lw a3, 0(a3)
    li a1, 20
    mul t3,t3,a1
    addi t3,t3,    4
    add t3,a3,t3
    lw t3, 0(t3)
    add t3,t3,zero
    lw t3, 0(t3)
    blt	a7,t3,	_if_thenBB1
    j	_if_elseBB1
_if_elseBB1:
    mv	a7,t3 
    j	afterCallBB1
_if_thenBB1:
    j	afterCallBB1
afterCallBB1:
    sw a7,0(t0)
    li a7, 4
    mul a7,s5,a7
    addi a7,a7,    4
    add a7,a5,a7
    lw t3, 0(a7)
    li a7, 20
    mul a7,s2,a7
    addi a7,a7,    4
    add a7,t3,a7
    lw a7, 0(a7)
    addi t0,a7,    4
    li a7, 4
    mul a7,s5,a7
    addi a7,a7,    4
    add a7,a5,a7
    li t3, 2
    mul t3,s2,t3
    lw a3, 0(a7)
    li a7, 20
    mul a7,t3,a7
    addi a7,a7,    4
    add a7,a3,a7
    lw a7, 0(a7)
    addi a7,a7,    4
    lw a7, 0(a7)
    li t3, 4
    mul t3,s5,t3
    addi t3,t3,    4
    add t3,a5,t3
    li a3, 2
    mul a3,s2,a3
    addi a3,a3,    1
    lw a1, 0(t3)
    li t3, 20
    mul t3,a3,t3
    addi t3,t3,    4
    add t3,a1,t3
    lw t3, 0(t3)
    addi t3,t3,    4
    lw t3, 0(t3)
    blt	a7,t3,	_if_thenBB2
    j	_if_elseBB2
_if_thenBB2:
    mv	a7,t3 
    j	afterCallBB2
_if_elseBB2:
    j	afterCallBB2
afterCallBB2:
    sw a7,0(t0)
    j	modifymulti.exitBB1
modifymulti.exitBB1:
    lui a7,%hi(ltree)
    sw a5, %lo(ltree)(a7)
    lw s8, 28(sp) 
    lw s6, 0(sp) 
    lw s5, 16(sp) 
    lw s3, 24(sp) 
    lw s2, 20(sp) 
    lw ra, 12(sp) 
    addi sp,sp,    48
    ret
								 # func end
    .globl	askmax						 # func begin 
    .p2align	2
    .type	askmax,@function
askmax:
askmax.entryBB1:
    addi sp,sp,    -48
    sw ra, 12(sp) 
    sw s0, 24(sp) 
    sw s4, 16(sp) 
    sw s5, 28(sp) 
    sw s6, 8(sp) 
    sw s9, 4(sp) 
    sw s11, 0(sp) 
    mv	s9,a5 
    mv	s5,a4 
    mv	s4,a3 
    mv	s0,a1 
    sw a0, 20(sp) 
    la a7,ltree    
    lw a5, 0(a7)
    bge	a2,s5,	ifTrue2
    j	if_end4
ifTrue2:
    ble	s4,s9,	if_thenBB4
    j	if_end4
if_end4:
    lw t3, 20(sp) 
    li a7, 4
    mul a7,t3,a7
    addi a7,a7,    4
    add a7,a5,a7
    lw t0, 0(a7)
    li a7, 20
    mul a7,s0,a7
    addi a7,a7,    4
    add a7,t0,a7
    lw a7, 0(a7)
    addi a7,a7,    12
    lw a3, 0(a7)
    li a7, 4
    mul a7,t3,a7
    addi a7,a7,    4
    add a7,a5,a7
    lw a7, 0(a7)
    li t0, 20
    mul t0,s0,t0
    addi t0,t0,    4
    add a7,a7,t0
    lw a7, 0(a7)
    addi a7,a7,    16
    lw a7, 0(a7)
    add a1,a2,s4
    li t0, 2
    div t0,a1,t0
    li a1, 4
    mul a1,t3,a1
    addi a1,a1,    4
    add a1,a5,a1
    li a6, 2
    mul t2,s0,a6
    lw a6, 0(a1)
    li a1, 20
    mul a1,t2,a1
    addi a1,a1,    4
    add a1,a6,a1
    lw a1, 0(a1)
    addi t2,a1,    16
    li a1, 4
    mul a1,t3,a1
    addi a1,a1,    4
    add a6,a5,a1
    li a1, 2
    mul ra,s0,a1
    lw a1, 0(a6)
    li a6, 20
    mul a6,ra,a6
    addi a6,a6,    4
    add a1,a1,a6
    lw a1, 0(a1)
    addi a1,a1,    16
    lw a1, 0(a1)
    mul a1,a1,a7
    sw a1,0(t2)
    li a1, 4
    mul a1,t3,a1
    addi a1,a1,    4
    add a6,a5,a1
    li a1, 2
    mul a1,s0,a1
    lw a6, 0(a6)
    li t2, 20
    mul a1,a1,t2
    addi a1,a1,    4
    add a1,a6,a1
    lw a1, 0(a1)
    addi t2,a1,    12
    li a1, 4
    mul a1,t3,a1
    addi a1,a1,    4
    add a6,a5,a1
    li a1, 2
    mul ra,s0,a1
    lw a6, 0(a6)
    li a1, 20
    mul a1,ra,a1
    addi a1,a1,    4
    add a1,a6,a1
    lw a1, 0(a1)
    addi a1,a1,    12
    lw a1, 0(a1)
    mul a1,a1,a7
    add a1,a1,a3
    sw a1,0(t2)
    li a1, 4
    mul a1,t3,a1
    addi a1,a1,    4
    add a1,a5,a1
    li a6, 2
    mul a6,s0,a6
    addi t2,a6,    1
    lw a1, 0(a1)
    li a6, 20
    mul a6,t2,a6
    addi a6,a6,    4
    add a1,a1,a6
    lw a1, 0(a1)
    addi ra,a1,    16
    li a1, 4
    mul a1,t3,a1
    addi a1,a1,    4
    add a6,a5,a1
    li a1, 2
    mul a1,s0,a1
    addi a1,a1,    1
    lw a6, 0(a6)
    li t2, 20
    mul a1,a1,t2
    addi a1,a1,    4
    add a1,a6,a1
    lw a1, 0(a1)
    addi a1,a1,    16
    lw a1, 0(a1)
    mul a1,a1,a7
    sw a1,0(ra)
    li a1, 4
    mul a1,t3,a1
    addi a1,a1,    4
    add a6,a5,a1
    li a1, 2
    mul a1,s0,a1
    addi a1,a1,    1
    lw t2, 0(a6)
    li a6, 20
    mul a1,a1,a6
    addi a1,a1,    4
    add a1,t2,a1
    lw a1, 0(a1)
    addi a6,a1,    12
    li a1, 4
    mul a1,t3,a1
    addi a1,a1,    4
    add t2,a5,a1
    li a1, 2
    mul a1,s0,a1
    addi a1,a1,    1
    lw t2, 0(t2)
    li ra, 20
    mul a1,a1,ra
    addi a1,a1,    4
    add a1,t2,a1
    lw a1, 0(a1)
    addi a1,a1,    12
    lw a1, 0(a1)
    mul a1,a1,a7
    add a1,a1,a3
    sw a1,0(a6)
    li a1, 4
    mul a1,t3,a1
    addi a1,a1,    4
    add a6,a5,a1
    li a1, 2
    mul a1,s0,a1
    lw t2, 0(a6)
    li a6, 20
    mul a1,a1,a6
    addi a1,a1,    4
    add a1,t2,a1
    lw a1, 0(a1)
    add a6,a1,zero
    li a1, 4
    mul a1,t3,a1
    addi a1,a1,    4
    add ra,a5,a1
    li a1, 2
    mul t2,s0,a1
    lw ra, 0(ra)
    li a1, 20
    mul a1,t2,a1
    addi a1,a1,    4
    add a1,ra,a1
    lw a1, 0(a1)
    add a1,a1,zero
    lw a1, 0(a1)
    mul a1,a1,a7
    add a1,a1,a3
    sw a1,0(a6)
    li a1, 4
    mul a1,t3,a1
    addi a1,a1,    4
    add a6,a5,a1
    li a1, 2
    mul a1,s0,a1
    addi a1,a1,    1
    lw a6, 0(a6)
    li t2, 20
    mul a1,a1,t2
    addi a1,a1,    4
    add a1,a6,a1
    lw a1, 0(a1)
    add t2,a1,zero
    li a1, 4
    mul a1,t3,a1
    addi a1,a1,    4
    add a1,a5,a1
    li a6, 2
    mul a6,s0,a6
    addi a6,a6,    1
    lw ra, 0(a1)
    li a1, 20
    mul a1,a6,a1
    addi a1,a1,    4
    add a1,ra,a1
    lw a1, 0(a1)
    add a1,a1,zero
    lw a1, 0(a1)
    mul a1,a1,a7
    add a1,a1,a3
    sw a1,0(t2)
    li a1, 4
    mul a1,t3,a1
    addi a1,a1,    4
    add a6,a5,a1
    li a1, 2
    mul a1,s0,a1
    lw a6, 0(a6)
    li t2, 20
    mul a1,a1,t2
    addi a1,a1,    4
    add a1,a6,a1
    lw a1, 0(a1)
    addi t2,a1,    4
    li a1, 4
    mul a1,t3,a1
    addi a1,a1,    4
    add a6,a5,a1
    li a1, 2
    mul a1,s0,a1
    lw a6, 0(a6)
    li ra, 20
    mul a1,a1,ra
    addi a1,a1,    4
    add a1,a6,a1
    lw a1, 0(a1)
    addi a1,a1,    4
    lw a1, 0(a1)
    mul a1,a1,a7
    add a1,a1,a3
    sw a1,0(t2)
    li a1, 4
    mul a1,t3,a1
    addi a1,a1,    4
    add a6,a5,a1
    li a1, 2
    mul a1,s0,a1
    addi t2,a1,    1
    lw a6, 0(a6)
    li a1, 20
    mul a1,t2,a1
    addi a1,a1,    4
    add a1,a6,a1
    lw a1, 0(a1)
    addi a6,a1,    4
    li a1, 4
    mul a1,t3,a1
    addi a1,a1,    4
    add t2,a5,a1
    li a1, 2
    mul a1,s0,a1
    addi ra,a1,    1
    lw t2, 0(t2)
    li a1, 20
    mul a1,ra,a1
    addi a1,a1,    4
    add a1,t2,a1
    lw a1, 0(a1)
    addi a1,a1,    4
    lw a1, 0(a1)
    mul a1,a1,a7
    add a1,a1,a3
    sw a1,0(a6)
    li a1, 4
    mul a1,t3,a1
    addi a1,a1,    4
    add a6,a5,a1
    li a1, 2
    mul a1,s0,a1
    lw a6, 0(a6)
    li t2, 20
    mul a1,a1,t2
    addi a1,a1,    4
    add a1,a6,a1
    lw a1, 0(a1)
    addi t2,a1,    8
    li a1, 4
    mul a1,t3,a1
    addi a1,a1,    4
    add a6,a5,a1
    li a1, 2
    mul ra,s0,a1
    lw a6, 0(a6)
    li a1, 20
    mul a1,ra,a1
    addi a1,a1,    4
    add a1,a6,a1
    lw a1, 0(a1)
    addi a1,a1,    8
    lw a1, 0(a1)
    mul a6,a1,a7
    sub a1,t0,a2
    addi a1,a1,    1
    mul a1,a3,a1
    add a1,a6,a1
    sw a1,0(t2)
    li a1, 4
    mul a1,t3,a1
    addi a1,a1,    4
    add a6,a5,a1
    li a1, 2
    mul a1,s0,a1
    addi t2,a1,    1
    lw a1, 0(a6)
    li a6, 20
    mul a6,t2,a6
    addi a6,a6,    4
    add a1,a1,a6
    lw a1, 0(a1)
    addi a6,a1,    8
    li a1, 4
    mul t3,t3,a1
    addi t3,t3,    4
    add t3,a5,t3
    li a1, 2
    mul a1,s0,a1
    addi t2,a1,    1
    lw t3, 0(t3)
    li a1, 20
    mul a1,t2,a1
    addi a1,a1,    4
    add t3,t3,a1
    lw t3, 0(t3)
    addi t3,t3,    8
    lw t3, 0(t3)
    mul t3,t3,a7
    sub a7,s4,t0
    mul a7,a3,a7
    add a7,t3,a7
    sw a7,0(a6)
    add t3,a2,s4
    li a7, 2
    div s6,t3,a7
    ble	s5,s6,	if_thenBB5
    j	paracopy3
paracopy3:
    mv	s11,zero 
    j	if_end5
if_thenBB5:
    li a7, 2
    mul a1,s0,a7
    lui a7,%hi(ltree)
    sw a5, %lo(ltree)(a7)
    lw a0, 20(sp) 
    mv	a3,s6 
    mv	a4,s5 
    mv	a5,s9 
    call	askmax
    la a7,ltree    
    lw a5, 0(a7)
    blt	a0,zero,	_if_thenBB3
    j	_if_elseBB3
_if_elseBB3:
    j	afterCallBB3
_if_thenBB3:
    mv	a0,zero 
    j	afterCallBB3
afterCallBB3:
    mv	s11,a0 
    mv	a7,a5 
    mv	a7,s11 
    j	if_end5
if_end5:
    addi a7,s6,    1
    bge	s9,a7,	if_thenBB6
    j	paracopy4
if_thenBB6:
    li a7, 2
    mul a7,s0,a7
    addi a1,a7,    1
    addi a2,s6,    1
    lui a7,%hi(ltree)
    sw a5, %lo(ltree)(a7)
    lw a0, 20(sp) 
    mv	a3,s4 
    mv	a4,s5 
    mv	a5,s9 
    call	askmax
    la a7,ltree    
    lw a5, 0(a7)
    blt	a0,s11,	_if_thenBB4
    j	_if_elseBB4
_if_thenBB4:
    mv	a0,s11 
    j	afterCallBB4
_if_elseBB4:
    j	afterCallBB4
afterCallBB4:
    mv	s11,a0 
    mv	a7,a5 
    mv	a7,s11 
    j	if_end6
paracopy4:
    mv	a7,a5 
    mv	a7,s11 
    j	if_end6
if_end6:
    mv	a0,s11 
    mv	a7,a5 
    mv	a7,a0 
    j	askmax.exitBB1
if_thenBB4:
    li t3, 4
    lw a7, 20(sp) 
    mul a7,a7,t3
    addi a7,a7,    4
    add a7,a5,a7
    lw t3, 0(a7)
    li a7, 20
    mul a7,s0,a7
    addi a7,a7,    4
    add a7,t3,a7
    lw a7, 0(a7)
    addi a7,a7,    4
    lw a0, 0(a7)
    mv	a7,a5 
    mv	a7,a0 
    j	askmax.exitBB1
askmax.exitBB1:
    lui a7,%hi(ltree)
    sw a5, %lo(ltree)(a7)
    lw s11, 0(sp) 
    lw s9, 4(sp) 
    lw s6, 8(sp) 
    lw s5, 28(sp) 
    lw s4, 16(sp) 
    lw s0, 24(sp) 
    lw ra, 12(sp) 
    addi sp,sp,    48
    ret
								 # func end
    .globl	modifyadd						 # func begin 
    .p2align	2
    .type	modifyadd,@function
modifyadd:
modifyadd.entryBB1:
    addi sp,sp,    -48
    sw ra, 8(sp) 
    sw s0, 16(sp) 
    sw s4, 12(sp) 
    sw s9, 20(sp) 
    mv	s4,a6 
    sw a5, 4(sp) 
    mv	s0,a4 
    sw a3, 28(sp) 
    sw a1, 24(sp) 
    mv	s9,a0 
    la a7,ltree    
    lw t3, 0(a7)
    bge	a2,s0,	ifTrue3
    j	if_end7
ifTrue3:
    lw a5, 4(sp) 
    lw a7, 28(sp) 
    ble	a7,a5,	if_thenBB7
    j	if_end7
if_thenBB7:
    li a7, 4
    mul a7,s9,a7
    addi a7,a7,    4
    add a7,t3,a7
    lw t0, 0(a7)
    li a5, 20
    lw a7, 24(sp) 
    mul a7,a7,a5
    addi a7,a7,    4
    add a7,t0,a7
    lw a7, 0(a7)
    addi a7,a7,    8
    li a5, 4
    mul a5,s9,a5
    addi a5,a5,    4
    add a5,t3,a5
    lw t0, 0(a5)
    li a5, 20
    lw a3, 24(sp) 
    mul a5,a3,a5
    addi a5,a5,    4
    add a5,t0,a5
    lw a5, 0(a5)
    addi t0,a5,    8
    lw a5, 28(sp) 
    sub a5,a5,a2
    addi a5,a5,    1
    mul a5,a5,s4
    lw t0, 0(t0)
    add a5,t0,a5
    sw a5,0(a7)
    li a7, 4
    mul a7,s9,a7
    addi a7,a7,    4
    add a7,t3,a7
    lw t0, 0(a7)
    li a5, 20
    lw a7, 24(sp) 
    mul a7,a7,a5
    addi a7,a7,    4
    add a7,t0,a7
    lw a7, 0(a7)
    addi a5,a7,    12
    li a7, 4
    mul a7,s9,a7
    addi a7,a7,    4
    add a7,t3,a7
    lw a3, 0(a7)
    li a7, 20
    lw t0, 24(sp) 
    mul a7,t0,a7
    addi a7,a7,    4
    add a7,a3,a7
    lw a7, 0(a7)
    addi a7,a7,    12
    lw a7, 0(a7)
    add a7,a7,s4
    sw a7,0(a5)
    li a7, 4
    mul a7,s9,a7
    addi a7,a7,    4
    add a7,t3,a7
    lw a5, 0(a7)
    li a7, 20
    lw t0, 24(sp) 
    mul a7,t0,a7
    addi a7,a7,    4
    add a7,a5,a7
    lw a7, 0(a7)
    add a3,a7,zero
    li a7, 4
    mul a7,s9,a7
    addi a7,a7,    4
    add a7,t3,a7
    lw t0, 0(a7)
    li a5, 20
    lw a7, 24(sp) 
    mul a7,a7,a5
    addi a7,a7,    4
    add a7,t0,a7
    lw a7, 0(a7)
    add a7,a7,zero
    lw a7, 0(a7)
    add a7,a7,s4
    sw a7,0(a3)
    li a7, 4
    mul a7,s9,a7
    addi a7,a7,    4
    add a7,t3,a7
    lw a7, 0(a7)
    li t0, 20
    lw a5, 24(sp) 
    mul a5,a5,t0
    addi a5,a5,    4
    add a7,a7,a5
    lw a7, 0(a7)
    addi a5,a7,    4
    li a7, 4
    mul a7,s9,a7
    addi a7,a7,    4
    add a7,t3,a7
    lw t0, 0(a7)
    li a7, 20
    lw a3, 24(sp) 
    mul a7,a3,a7
    addi a7,a7,    4
    add a7,t0,a7
    lw a7, 0(a7)
    addi a7,a7,    4
    lw a7, 0(a7)
    add a7,a7,s4
    sw a7,0(a5)
    j	modifyadd.exitBB1
if_end7:
    lw a7, 28(sp) 
    add a7,a2,a7
    li a5, 2
    div a7,a7,a5
    sw a7, 0(sp) 
    lw t0, 24(sp) 
    lw a3, 28(sp) 
    li a7, 4
    mul a7,s9,a7
    addi a7,a7,    4
    add a7,t3,a7
    lw a5, 0(a7)
    li a7, 20
    mul a7,t0,a7
    addi a7,a7,    4
    add a7,a5,a7
    lw a7, 0(a7)
    addi a7,a7,    12
    lw a1, 0(a7)
    li a7, 4
    mul a7,s9,a7
    addi a7,a7,    4
    add a7,t3,a7
    lw a5, 0(a7)
    li a7, 20
    mul a7,t0,a7
    addi a7,a7,    4
    add a7,a5,a7
    lw a7, 0(a7)
    addi a7,a7,    16
    lw a5, 0(a7)
    add a6,a2,a3
    li a7, 2
    div a7,a6,a7
    li a6, 4
    mul a6,s9,a6
    addi a6,a6,    4
    add ra,t3,a6
    li a6, 2
    mul t2,t0,a6
    lw ra, 0(ra)
    li a6, 20
    mul a6,t2,a6
    addi a6,a6,    4
    add a6,ra,a6
    lw a6, 0(a6)
    addi t2,a6,    16
    li a6, 4
    mul a6,s9,a6
    addi a6,a6,    4
    add ra,t3,a6
    li a6, 2
    mul a6,t0,a6
    lw t6, 0(ra)
    li ra, 20
    mul a6,a6,ra
    addi a6,a6,    4
    add a6,t6,a6
    lw a6, 0(a6)
    addi a6,a6,    16
    lw a6, 0(a6)
    mul a6,a6,a5
    sw a6,0(t2)
    li a6, 4
    mul a6,s9,a6
    addi a6,a6,    4
    add a6,t3,a6
    li t2, 2
    mul t2,t0,t2
    lw ra, 0(a6)
    li a6, 20
    mul a6,t2,a6
    addi a6,a6,    4
    add a6,ra,a6
    lw a6, 0(a6)
    addi t2,a6,    12
    li a6, 4
    mul a6,s9,a6
    addi a6,a6,    4
    add a6,t3,a6
    li ra, 2
    mul t6,t0,ra
    lw ra, 0(a6)
    li a6, 20
    mul a6,t6,a6
    addi a6,a6,    4
    add a6,ra,a6
    lw a6, 0(a6)
    addi a6,a6,    12
    lw a6, 0(a6)
    mul a6,a6,a5
    add a6,a6,a1
    sw a6,0(t2)
    li a6, 4
    mul a6,s9,a6
    addi a6,a6,    4
    add t2,t3,a6
    li a6, 2
    mul a6,t0,a6
    addi ra,a6,    1
    lw t2, 0(t2)
    li a6, 20
    mul a6,ra,a6
    addi a6,a6,    4
    add a6,t2,a6
    lw a6, 0(a6)
    addi ra,a6,    16
    li a6, 4
    mul a6,s9,a6
    addi a6,a6,    4
    add t2,t3,a6
    li a6, 2
    mul a6,t0,a6
    addi t6,a6,    1
    lw a6, 0(t2)
    li t2, 20
    mul t2,t6,t2
    addi t2,t2,    4
    add a6,a6,t2
    lw a6, 0(a6)
    addi a6,a6,    16
    lw a6, 0(a6)
    mul a6,a6,a5
    sw a6,0(ra)
    li a6, 4
    mul a6,s9,a6
    addi a6,a6,    4
    add a6,t3,a6
    li t2, 2
    mul t2,t0,t2
    addi t2,t2,    1
    lw ra, 0(a6)
    li a6, 20
    mul a6,t2,a6
    addi a6,a6,    4
    add a6,ra,a6
    lw a6, 0(a6)
    addi t2,a6,    12
    li a6, 4
    mul a6,s9,a6
    addi a6,a6,    4
    add ra,t3,a6
    li a6, 2
    mul a6,t0,a6
    addi a6,a6,    1
    lw ra, 0(ra)
    li t6, 20
    mul a6,a6,t6
    addi a6,a6,    4
    add a6,ra,a6
    lw a6, 0(a6)
    addi a6,a6,    12
    lw a6, 0(a6)
    mul a6,a6,a5
    add a6,a6,a1
    sw a6,0(t2)
    li a6, 4
    mul a6,s9,a6
    addi a6,a6,    4
    add t2,t3,a6
    li a6, 2
    mul a6,t0,a6
    lw t2, 0(t2)
    li ra, 20
    mul a6,a6,ra
    addi a6,a6,    4
    add a6,t2,a6
    lw a6, 0(a6)
    add ra,a6,zero
    li a6, 4
    mul a6,s9,a6
    addi a6,a6,    4
    add a6,t3,a6
    li t2, 2
    mul t6,t0,t2
    lw a6, 0(a6)
    li t2, 20
    mul t2,t6,t2
    addi t2,t2,    4
    add a6,a6,t2
    lw a6, 0(a6)
    add a6,a6,zero
    lw a6, 0(a6)
    mul a6,a6,a5
    add a6,a6,a1
    sw a6,0(ra)
    li a6, 4
    mul a6,s9,a6
    addi a6,a6,    4
    add ra,t3,a6
    li a6, 2
    mul a6,t0,a6
    addi t2,a6,    1
    lw a6, 0(ra)
    li ra, 20
    mul t2,t2,ra
    addi t2,t2,    4
    add a6,a6,t2
    lw a6, 0(a6)
    add ra,a6,zero
    li a6, 4
    mul a6,s9,a6
    addi a6,a6,    4
    add a6,t3,a6
    li t2, 2
    mul t2,t0,t2
    addi t6,t2,    1
    lw t2, 0(a6)
    li a6, 20
    mul a6,t6,a6
    addi a6,a6,    4
    add a6,t2,a6
    lw a6, 0(a6)
    add a6,a6,zero
    lw a6, 0(a6)
    mul a6,a6,a5
    add a6,a6,a1
    sw a6,0(ra)
    li a6, 4
    mul a6,s9,a6
    addi a6,a6,    4
    add t2,t3,a6
    li a6, 2
    mul a6,t0,a6
    lw t2, 0(t2)
    li ra, 20
    mul a6,a6,ra
    addi a6,a6,    4
    add a6,t2,a6
    lw a6, 0(a6)
    addi ra,a6,    4
    li a6, 4
    mul a6,s9,a6
    addi a6,a6,    4
    add t2,t3,a6
    li a6, 2
    mul a6,t0,a6
    lw t6, 0(t2)
    li t2, 20
    mul a6,a6,t2
    addi a6,a6,    4
    add a6,t6,a6
    lw a6, 0(a6)
    addi a6,a6,    4
    lw a6, 0(a6)
    mul a6,a6,a5
    add a6,a6,a1
    sw a6,0(ra)
    li a6, 4
    mul a6,s9,a6
    addi a6,a6,    4
    add a6,t3,a6
    li t2, 2
    mul t2,t0,t2
    addi t2,t2,    1
    lw ra, 0(a6)
    li a6, 20
    mul a6,t2,a6
    addi a6,a6,    4
    add a6,ra,a6
    lw a6, 0(a6)
    addi ra,a6,    4
    li a6, 4
    mul a6,s9,a6
    addi a6,a6,    4
    add a6,t3,a6
    li t2, 2
    mul t2,t0,t2
    addi t2,t2,    1
    lw a6, 0(a6)
    li t6, 20
    mul t2,t2,t6
    addi t2,t2,    4
    add a6,a6,t2
    lw a6, 0(a6)
    addi a6,a6,    4
    lw a6, 0(a6)
    mul a6,a6,a5
    add a6,a6,a1
    sw a6,0(ra)
    li a6, 4
    mul a6,s9,a6
    addi a6,a6,    4
    add ra,t3,a6
    li a6, 2
    mul t2,t0,a6
    lw a6, 0(ra)
    li ra, 20
    mul t2,t2,ra
    addi t2,t2,    4
    add a6,a6,t2
    lw a6, 0(a6)
    addi ra,a6,    8
    li a6, 4
    mul a6,s9,a6
    addi a6,a6,    4
    add a6,t3,a6
    li t2, 2
    mul t6,t0,t2
    lw t2, 0(a6)
    li a6, 20
    mul a6,t6,a6
    addi a6,a6,    4
    add a6,t2,a6
    lw a6, 0(a6)
    addi a6,a6,    8
    lw a6, 0(a6)
    mul a6,a6,a5
    sub t2,a7,a2
    addi t2,t2,    1
    mul t2,a1,t2
    add a6,a6,t2
    sw a6,0(ra)
    li a6, 4
    mul a6,s9,a6
    addi a6,a6,    4
    add t2,t3,a6
    li a6, 2
    mul a6,t0,a6
    addi ra,a6,    1
    lw t2, 0(t2)
    li a6, 20
    mul a6,ra,a6
    addi a6,a6,    4
    add a6,t2,a6
    lw a6, 0(a6)
    addi t2,a6,    8
    li a6, 4
    mul a6,s9,a6
    addi a6,a6,    4
    add a6,t3,a6
    li ra, 2
    mul t0,t0,ra
    addi ra,t0,    1
    lw a6, 0(a6)
    li t0, 20
    mul t0,ra,t0
    addi t0,t0,    4
    add t0,a6,t0
    lw t0, 0(t0)
    addi t0,t0,    8
    lw t0, 0(t0)
    mul a5,t0,a5
    sub a7,a3,a7
    mul a7,a1,a7
    add a7,a5,a7
    sw a7,0(t2)
    lw a7, 0(sp) 
    ble	s0,a7,	if_thenBB8
    j	paracopy5
paracopy5:
    j	if_end8
if_thenBB8:
    li a7, 2
    lw a5, 24(sp) 
    mul a1,a5,a7
    lui a7,%hi(ltree)
    sw t3, %lo(ltree)(a7)
    mv	a0,s9 
    lw a3, 0(sp) 
    mv	a4,s0 
    lw a5, 4(sp) 
    mv	a6,s4 
    call	modifyadd
    la a7,ltree    
    lw t3, 0(a7)
    j	if_end8
if_end8:
    lw a7, 0(sp) 
    addi a7,a7,    1
    lw a5, 4(sp) 
    bge	a5,a7,	if_thenBB9
    j	paracopy6
paracopy6:
    j	if_end9
if_thenBB9:
    li a5, 2
    lw a7, 24(sp) 
    mul a7,a7,a5
    addi a1,a7,    1
    lw a7, 0(sp) 
    addi a2,a7,    1
    lui a7,%hi(ltree)
    sw t3, %lo(ltree)(a7)
    mv	a0,s9 
    lw a3, 28(sp) 
    mv	a4,s0 
    lw a5, 4(sp) 
    mv	a6,s4 
    call	modifyadd
    la a7,ltree    
    lw t3, 0(a7)
    j	if_end9
if_end9:
    li a7, 4
    mul a7,s9,a7
    addi a7,a7,    4
    add a7,t3,a7
    lw a7, 0(a7)
    li t0, 20
    lw a5, 24(sp) 
    mul a5,a5,t0
    addi a5,a5,    4
    add a7,a7,a5
    lw a7, 0(a7)
    addi a5,a7,    8
    li a7, 4
    mul a7,s9,a7
    addi a7,a7,    4
    add t0,t3,a7
    li a7, 2
    lw a3, 24(sp) 
    mul a3,a3,a7
    lw t0, 0(t0)
    li a7, 20
    mul a7,a3,a7
    addi a7,a7,    4
    add a7,t0,a7
    lw a7, 0(a7)
    addi a3,a7,    8
    li a7, 4
    mul a7,s9,a7
    addi a7,a7,    4
    add t0,t3,a7
    li a7, 2
    lw a1, 24(sp) 
    mul a7,a1,a7
    addi a7,a7,    1
    lw t0, 0(t0)
    li a1, 20
    mul a7,a7,a1
    addi a7,a7,    4
    add a7,t0,a7
    lw a7, 0(a7)
    addi t0,a7,    8
    lw a7, 0(a3)
    lw t0, 0(t0)
    add a7,a7,t0
    sw a7,0(a5)
    li a7, 4
    mul a7,s9,a7
    addi a7,a7,    4
    add a7,t3,a7
    lw t0, 0(a7)
    li a5, 20
    lw a7, 24(sp) 
    mul a7,a7,a5
    addi a7,a7,    4
    add a7,t0,a7
    lw a7, 0(a7)
    add t0,a7,zero
    li a7, 4
    mul a7,s9,a7
    addi a7,a7,    4
    add a3,t3,a7
    li a7, 2
    lw a5, 24(sp) 
    mul a5,a5,a7
    lw a7, 0(a3)
    li a3, 20
    mul a5,a5,a3
    addi a5,a5,    4
    add a7,a7,a5
    lw a7, 0(a7)
    add a7,a7,zero
    lw a5, 0(a7)
    li a7, 4
    mul a7,s9,a7
    addi a7,a7,    4
    add a1,t3,a7
    li a7, 2
    lw a3, 24(sp) 
    mul a7,a3,a7
    addi a7,a7,    1
    lw a1, 0(a1)
    li a3, 20
    mul a7,a7,a3
    addi a7,a7,    4
    add a7,a1,a7
    lw a7, 0(a7)
    add a7,a7,zero
    lw a7, 0(a7)
    blt	a5,a7,	_if_thenBB5
    j	_if_elseBB5
_if_thenBB5:
    mv	a7,a5 
    j	afterCallBB5
_if_elseBB5:
    j	afterCallBB5
afterCallBB5:
    sw a7,0(t0)
    li a7, 4
    mul a7,s9,a7
    addi a7,a7,    4
    add a7,t3,a7
    lw t0, 0(a7)
    li a5, 20
    lw a7, 24(sp) 
    mul a7,a7,a5
    addi a7,a7,    4
    add a7,t0,a7
    lw a7, 0(a7)
    addi t0,a7,    4
    li a7, 4
    mul a7,s9,a7
    addi a7,a7,    4
    add a7,t3,a7
    li a5, 2
    lw a3, 24(sp) 
    mul a3,a3,a5
    lw a5, 0(a7)
    li a7, 20
    mul a7,a3,a7
    addi a7,a7,    4
    add a7,a5,a7
    lw a7, 0(a7)
    addi a7,a7,    4
    lw a7, 0(a7)
    li a5, 4
    mul a5,s9,a5
    addi a5,a5,    4
    add a1,t3,a5
    li a5, 2
    lw a3, 24(sp) 
    mul a5,a3,a5
    addi a6,a5,    1
    lw a3, 0(a1)
    li a5, 20
    mul a5,a6,a5
    addi a5,a5,    4
    add a5,a3,a5
    lw a5, 0(a5)
    addi a5,a5,    4
    lw a5, 0(a5)
    blt	a7,a5,	_if_thenBB6
    j	_if_elseBB6
_if_elseBB6:
    j	afterCallBB6
_if_thenBB6:
    mv	a7,a5 
    j	afterCallBB6
afterCallBB6:
    sw a7,0(t0)
    j	modifyadd.exitBB1
modifyadd.exitBB1:
    lui a7,%hi(ltree)
    sw t3, %lo(ltree)(a7)
    lw s9, 20(sp) 
    lw s4, 12(sp) 
    lw s0, 16(sp) 
    lw ra, 8(sp) 
    addi sp,sp,    48
    ret
								 # func end
    .globl	askmin						 # func begin 
    .p2align	2
    .type	askmin,@function
askmin:
askmin.entryBB1:
    addi sp,sp,    -48
    sw ra, 8(sp) 
    sw s1, 4(sp) 
    sw s2, 24(sp) 
    sw s3, 0(sp) 
    sw s9, 28(sp) 
    mv	s3,a5 
    sw a4, 16(sp) 
    sw a3, 12(sp) 
    sw a1, 20(sp) 
    mv	s1,a0 
    la a7,INF    
    lw a7, 0(a7)
    la a5,ltree    
    lw t3, 0(a5)
    lw a5, 16(sp) 
    bge	a2,a5,	ifTrue4
    j	if_end10
ifTrue4:
    lw a5, 12(sp) 
    ble	a5,s3,	if_thenBB10
    j	if_end10
if_thenBB10:
    li a5, 4
    mul a5,s1,a5
    addi a5,a5,    4
    add a5,t3,a5
    lw a5, 0(a5)
    li t0, 20
    lw a3, 20(sp) 
    mul t0,a3,t0
    addi t0,t0,    4
    add a5,a5,t0
    lw a5, 0(a5)
    add a5,a5,zero
    lw a0, 0(a5)
    mv	a5,t3 
    mv	a5,a0 
    mv	a5,a7 
    j	askmin.exitBB1
if_end10:
    lw a6, 20(sp) 
    lw t0, 12(sp) 
    li a5, 4
    mul a5,s1,a5
    addi a5,a5,    4
    add a5,t3,a5
    lw a3, 0(a5)
    li a5, 20
    mul a5,a6,a5
    addi a5,a5,    4
    add a5,a3,a5
    lw a5, 0(a5)
    addi a5,a5,    12
    lw a3, 0(a5)
    li a5, 4
    mul a5,s1,a5
    addi a5,a5,    4
    add a5,t3,a5
    lw a5, 0(a5)
    li a1, 20
    mul a1,a6,a1
    addi a1,a1,    4
    add a5,a5,a1
    lw a5, 0(a5)
    addi a5,a5,    16
    lw a5, 0(a5)
    add a1,a2,t0
    li t2, 2
    div a1,a1,t2
    li t2, 4
    mul t2,s1,t2
    addi t2,t2,    4
    add ra,t3,t2
    li t2, 2
    mul t6,a6,t2
    lw ra, 0(ra)
    li t2, 20
    mul t2,t6,t2
    addi t2,t2,    4
    add t2,ra,t2
    lw t2, 0(t2)
    addi t6,t2,    16
    li t2, 4
    mul t2,s1,t2
    addi t2,t2,    4
    add t2,t3,t2
    li ra, 2
    mul ra,a6,ra
    lw t2, 0(t2)
    li a0, 20
    mul ra,ra,a0
    addi ra,ra,    4
    add t2,t2,ra
    lw t2, 0(t2)
    addi t2,t2,    16
    lw t2, 0(t2)
    mul t2,t2,a5
    sw t2,0(t6)
    li t2, 4
    mul t2,s1,t2
    addi t2,t2,    4
    add ra,t3,t2
    li t2, 2
    mul t6,a6,t2
    lw ra, 0(ra)
    li t2, 20
    mul t2,t6,t2
    addi t2,t2,    4
    add t2,ra,t2
    lw t2, 0(t2)
    addi ra,t2,    12
    li t2, 4
    mul t2,s1,t2
    addi t2,t2,    4
    add t6,t3,t2
    li t2, 2
    mul t2,a6,t2
    lw t6, 0(t6)
    li a0, 20
    mul t2,t2,a0
    addi t2,t2,    4
    add t2,t6,t2
    lw t2, 0(t2)
    addi t2,t2,    12
    lw t2, 0(t2)
    mul t2,t2,a5
    add t2,t2,a3
    sw t2,0(ra)
    li t2, 4
    mul t2,s1,t2
    addi t2,t2,    4
    add ra,t3,t2
    li t2, 2
    mul t2,a6,t2
    addi t6,t2,    1
    lw ra, 0(ra)
    li t2, 20
    mul t2,t6,t2
    addi t2,t2,    4
    add t2,ra,t2
    lw t2, 0(t2)
    addi t6,t2,    16
    li t2, 4
    mul t2,s1,t2
    addi t2,t2,    4
    add ra,t3,t2
    li t2, 2
    mul t2,a6,t2
    addi a0,t2,    1
    lw t2, 0(ra)
    li ra, 20
    mul ra,a0,ra
    addi ra,ra,    4
    add t2,t2,ra
    lw t2, 0(t2)
    addi t2,t2,    16
    lw t2, 0(t2)
    mul t2,t2,a5
    sw t2,0(t6)
    li t2, 4
    mul t2,s1,t2
    addi t2,t2,    4
    add ra,t3,t2
    li t2, 2
    mul t2,a6,t2
    addi t6,t2,    1
    lw ra, 0(ra)
    li t2, 20
    mul t2,t6,t2
    addi t2,t2,    4
    add t2,ra,t2
    lw t2, 0(t2)
    addi ra,t2,    12
    li t2, 4
    mul t2,s1,t2
    addi t2,t2,    4
    add t6,t3,t2
    li t2, 2
    mul t2,a6,t2
    addi t2,t2,    1
    lw a0, 0(t6)
    li t6, 20
    mul t2,t2,t6
    addi t2,t2,    4
    add t2,a0,t2
    lw t2, 0(t2)
    addi t2,t2,    12
    lw t2, 0(t2)
    mul t2,t2,a5
    add t2,t2,a3
    sw t2,0(ra)
    li t2, 4
    mul t2,s1,t2
    addi t2,t2,    4
    add ra,t3,t2
    li t2, 2
    mul t6,a6,t2
    lw t2, 0(ra)
    li ra, 20
    mul ra,t6,ra
    addi ra,ra,    4
    add t2,t2,ra
    lw t2, 0(t2)
    add t6,t2,zero
    li t2, 4
    mul t2,s1,t2
    addi t2,t2,    4
    add ra,t3,t2
    li t2, 2
    mul a0,a6,t2
    lw ra, 0(ra)
    li t2, 20
    mul t2,a0,t2
    addi t2,t2,    4
    add t2,ra,t2
    lw t2, 0(t2)
    add t2,t2,zero
    lw t2, 0(t2)
    mul t2,t2,a5
    add t2,t2,a3
    sw t2,0(t6)
    li t2, 4
    mul t2,s1,t2
    addi t2,t2,    4
    add t6,t3,t2
    li t2, 2
    mul t2,a6,t2
    addi ra,t2,    1
    lw t6, 0(t6)
    li t2, 20
    mul t2,ra,t2
    addi t2,t2,    4
    add t2,t6,t2
    lw t2, 0(t2)
    add ra,t2,zero
    li t2, 4
    mul t2,s1,t2
    addi t2,t2,    4
    add t6,t3,t2
    li t2, 2
    mul t2,a6,t2
    addi a0,t2,    1
    lw t6, 0(t6)
    li t2, 20
    mul t2,a0,t2
    addi t2,t2,    4
    add t2,t6,t2
    lw t2, 0(t2)
    add t2,t2,zero
    lw t2, 0(t2)
    mul t2,t2,a5
    add t2,t2,a3
    sw t2,0(ra)
    li t2, 4
    mul t2,s1,t2
    addi t2,t2,    4
    add t2,t3,t2
    li ra, 2
    mul ra,a6,ra
    lw t6, 0(t2)
    li t2, 20
    mul t2,ra,t2
    addi t2,t2,    4
    add t2,t6,t2
    lw t2, 0(t2)
    addi ra,t2,    4
    li t2, 4
    mul t2,s1,t2
    addi t2,t2,    4
    add t2,t3,t2
    li t6, 2
    mul a0,a6,t6
    lw t6, 0(t2)
    li t2, 20
    mul t2,a0,t2
    addi t2,t2,    4
    add t2,t6,t2
    lw t2, 0(t2)
    addi t2,t2,    4
    lw t2, 0(t2)
    mul t2,t2,a5
    add t2,t2,a3
    sw t2,0(ra)
    li t2, 4
    mul t2,s1,t2
    addi t2,t2,    4
    add ra,t3,t2
    li t2, 2
    mul t2,a6,t2
    addi t6,t2,    1
    lw ra, 0(ra)
    li t2, 20
    mul t2,t6,t2
    addi t2,t2,    4
    add t2,ra,t2
    lw t2, 0(t2)
    addi t6,t2,    4
    li t2, 4
    mul t2,s1,t2
    addi t2,t2,    4
    add ra,t3,t2
    li t2, 2
    mul t2,a6,t2
    addi t2,t2,    1
    lw a0, 0(ra)
    li ra, 20
    mul t2,t2,ra
    addi t2,t2,    4
    add t2,a0,t2
    lw t2, 0(t2)
    addi t2,t2,    4
    lw t2, 0(t2)
    mul t2,t2,a5
    add t2,t2,a3
    sw t2,0(t6)
    li t2, 4
    mul t2,s1,t2
    addi t2,t2,    4
    add ra,t3,t2
    li t2, 2
    mul t2,a6,t2
    lw t6, 0(ra)
    li ra, 20
    mul t2,t2,ra
    addi t2,t2,    4
    add t2,t6,t2
    lw t2, 0(t2)
    addi t6,t2,    8
    li t2, 4
    mul t2,s1,t2
    addi t2,t2,    4
    add t2,t3,t2
    li ra, 2
    mul ra,a6,ra
    lw a0, 0(t2)
    li t2, 20
    mul t2,ra,t2
    addi t2,t2,    4
    add t2,a0,t2
    lw t2, 0(t2)
    addi t2,t2,    8
    lw t2, 0(t2)
    mul ra,t2,a5
    sub t2,a1,a2
    addi t2,t2,    1
    mul t2,a3,t2
    add t2,ra,t2
    sw t2,0(t6)
    li t2, 4
    mul t2,s1,t2
    addi t2,t2,    4
    add ra,t3,t2
    li t2, 2
    mul t2,a6,t2
    addi t2,t2,    1
    lw ra, 0(ra)
    li t6, 20
    mul t2,t2,t6
    addi t2,t2,    4
    add t2,ra,t2
    lw t2, 0(t2)
    addi t6,t2,    8
    li t2, 4
    mul t2,s1,t2
    addi t2,t2,    4
    add t2,t3,t2
    li ra, 2
    mul a6,a6,ra
    addi a6,a6,    1
    lw ra, 0(t2)
    li t2, 20
    mul a6,a6,t2
    addi a6,a6,    4
    add a6,ra,a6
    lw a6, 0(a6)
    addi a6,a6,    8
    lw a6, 0(a6)
    mul a5,a6,a5
    sub t0,t0,a1
    mul t0,a3,t0
    add a5,a5,t0
    sw a5,0(t6)
    lw a5, 12(sp) 
    add a5,a2,a5
    li t0, 2
    div s2,a5,t0
    mv	s9,a7 
    lw a5, 16(sp) 
    ble	a5,s2,	if_thenBB11
    j	paracopy7
paracopy7:
    mv	a5,t3 
    mv	a5,a7 
    mv	a5,s9 
    j	if_end11
if_thenBB11:
    li t0, 2
    lw a5, 20(sp) 
    mul a1,a5,t0
    lui a5,%hi(INF)
    sw a7, %lo(INF)(a5)
    lui a7,%hi(ltree)
    sw t3, %lo(ltree)(a7)
    mv	a0,s1 
    mv	a3,s2 
    lw a4, 16(sp) 
    mv	a5,s3 
    call	askmin
    la a7,ltree    
    lw t3, 0(a7)
    la a7,INF    
    lw a7, 0(a7)
    blt	a0,s9,	_if_thenBB7
    j	_if_elseBB7
_if_thenBB7:
    mv	s9,a0 
    j	afterCallBB7
_if_elseBB7:
    j	afterCallBB7
afterCallBB7:
    mv	a5,t3 
    mv	a5,a7 
    mv	a5,s9 
    j	if_end11
if_end11:
    addi a5,s2,    1
    bge	s3,a5,	if_thenBB12
    j	paracopy8
if_thenBB12:
    li t0, 2
    lw a5, 20(sp) 
    mul a5,a5,t0
    addi a1,a5,    1
    addi a2,s2,    1
    lui a5,%hi(INF)
    sw a7, %lo(INF)(a5)
    lui a7,%hi(ltree)
    sw t3, %lo(ltree)(a7)
    mv	a0,s1 
    lw a3, 12(sp) 
    lw a4, 16(sp) 
    mv	a5,s3 
    call	askmin
    la a7,ltree    
    lw t3, 0(a7)
    la a7,INF    
    lw a7, 0(a7)
    blt	a0,s9,	_if_thenBB8
    j	_if_elseBB8
_if_elseBB8:
    mv	a0,s9 
    j	afterCallBB8
_if_thenBB8:
    j	afterCallBB8
afterCallBB8:
    mv	a5,t3 
    mv	a5,a7 
    mv	a5,a0 
    j	if_end12
paracopy8:
    mv	a0,s9 
    mv	a5,t3 
    mv	a5,a7 
    mv	a5,a0 
    j	if_end12
if_end12:
    mv	a5,t3 
    mv	a5,a0 
    mv	a5,a7 
    j	askmin.exitBB1
askmin.exitBB1:
    lui a5,%hi(INF)
    sw a7, %lo(INF)(a5)
    lui a7,%hi(ltree)
    sw t3, %lo(ltree)(a7)
    lw s9, 28(sp) 
    lw s3, 0(sp) 
    lw s2, 24(sp) 
    lw s1, 4(sp) 
    lw ra, 8(sp) 
    addi sp,sp,    48
    ret
								 # func end
    .globl	main						 # func begin 
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -64
    sw ra, 8(sp) 
    sw s0, 40(sp) 
    sw s1, 48(sp) 
    sw s4, 28(sp) 
    sw s5, 32(sp) 
    sw s7, 24(sp) 
    sw s8, 52(sp) 
    sw s10, 4(sp) 
    la a7,INF    
    lw a7, 0(a7)
    la a7,matrix    
    lw a7, 0(a7)
    la a7,r    
    lw a7, 0(a7)
    la a7,maxc    
    lw a7, 0(a7)
    la a7,c    
    lw a7, 0(a7)
    la a7,maxr    
    lw a7, 0(a7)
    la a7,m    
    lw a7, 0(a7)
    la a7,ltree    
    lw a7, 0(a7)
    li a0, 104
    call malloc
    mv	s5,a0 
    li a7, 25
    sw a7,0(s5)
    addi s0,s5,    4
    addi s4,s5,    100
    j	forcondBB1
forcondBB1:
    ble	s0,s4,	forupdateBB1
    j	afterForBB1
forupdateBB1:
    li a0, 1600404
    call malloc
    li a7, 80020
    sw a7,0(a0)
    sw a0,0(s0)
    addi s0,s0,    4
    j	forcondBB1
afterForBB1:
    li a0, 104
    call malloc
    li a7, 25
    sw a7,0(a0)
    addi s0,a0,    4
    addi s4,a0,    100
    j	forcondBB2
forcondBB2:
    ble	s0,s4,	forupdateBB2
    j	afterForBB2
forupdateBB2:
    li a0, 80024
    call malloc
    li a7, 20005
    sw a7,0(a0)
    sw a0,0(s0)
    addi s0,s0,    4
    j	forcondBB2
afterForBB2:
    call	getInt
    call	getInt
    mv	s1,a0 
    call	getInt
    sw a0, 16(sp) 
    li a5, 1
    sw a5, 36(sp) 
    li s0, -1
    j	_forcondBB1
_forcondBB1:
    lw a5, 36(sp) 
    lw a7, 16(sp) 
    ble	a5,a7,	_forbodyBB1
    j	afterCallBB9
afterCallBB9:
    lui a7,%hi(INF)
    sw s0, %lo(INF)(a7)
    lui a7,%hi(ltree)
    sw s5, %lo(ltree)(a7)
    lw s10, 4(sp) 
    lw s8, 52(sp) 
    lw s7, 24(sp) 
    lw s5, 32(sp) 
    lw s4, 28(sp) 
    lw s1, 48(sp) 
    lw s0, 40(sp) 
    lw ra, 8(sp) 
    mv	a0,zero 
    addi sp,sp,    64
    ret
_forbodyBB1:
    call	getInt
    mv	s7,a0 
    call	getInt
    mv	s4,a0 
    call	getInt
    mv	s10,a0 
    call	getInt
    mv	s8,a0 
    call	getInt
    sw a0, 20(sp) 
    li a7, 1
    beq	s7,a7,	_if_thenBB9
    j	_if_elseBB9
_if_thenBB9:
    call	getInt
    sw a0, 44(sp) 
    mv	a7,s5 
    mv	a5,a7 
    mv	a5,s4 
    j	_forcondBB2
_forcondBB2:
    ble	s4,s8,	_forbodyBB2
    j	paracopy9
paracopy9:
    mv	a5,a7 
    mv	a5,s0 
    j	_forupdateBB1
_forbodyBB2:
    lui a5,%hi(ltree)
    sw a7, %lo(ltree)(a5)
    mv	a0,s4 
    li a1, 1
    li a2, 1
    mv	a3,s1 
    mv	a4,s10 
    lw a5, 20(sp) 
    lw a6, 44(sp) 
    call	modifyadd
    la a7,ltree    
    lw a7, 0(a7)
    addi s4,s4,    1
    mv	a5,a7 
    mv	a5,s4 
    j	_forcondBB2
_if_elseBB9:
    li a7, 2
    beq	s7,a7,	_if_thenBB10
    j	_if_elseBB10
_if_elseBB10:
    li a7, 3
    beq	s7,a7,	_if_thenBB11
    j	_if_elseBB11
_if_elseBB11:
    mv	t3,s5 
    sw t3, 12(sp) 
    mv	s5,s0 
    mv	s7,s0 
    lw a7, 12(sp) 
    lw t3, 12(sp) 
    sw t3, 12(sp) 
    mv	a7,s5 
    mv	a7,s7 
    mv	a7,s4 
    mv	s0,zero 
    j	_forcondBB3
_forcondBB3:
    ble	s4,s8,	_forbodyBB3
    j	_afterForBB1
_forbodyBB3:
    lui a7,%hi(INF)
    sw s5, %lo(INF)(a7)
    lui a5,%hi(ltree)
    lw a7, 12(sp) 
    sw a7, %lo(ltree)(a5)
    mv	a0,s4 
    li a1, 1
    li a2, 1
    mv	a3,s1 
    mv	a4,s10 
    lw a5, 20(sp) 
    call	askmin
    la a7,ltree    
    lw a5, 0(a7)
    la a7,INF    
    lw s5, 0(a7)
    mv	a7,s7 
    blt	a7,a0,	__if_thenBB1
    j	__if_elseBB1
__if_thenBB1:
    j	_afterCallBB1
__if_elseBB1:
    mv	a7,a0 
    j	_afterCallBB1
_afterCallBB1:
    mv	s7,a7 
    lui a7,%hi(ltree)
    sw a5, %lo(ltree)(a7)
    mv	a0,s4 
    li a1, 1
    li a2, 1
    mv	a3,s1 
    mv	a4,s10 
    lw a5, 20(sp) 
    call	askmax
    la a7,ltree    
    lw t3, 0(a7)
    mv	a7,s0 
    blt	a7,a0,	__if_thenBB2
    j	__if_elseBB2
__if_thenBB2:
    mv	a7,a0 
    j	_afterCallBB2
__if_elseBB2:
    j	_afterCallBB2
_afterCallBB2:
    addi a5,s4,    1
    mv	s0,a7 
    sw t3, 12(sp) 
    mv	s4,a5 
    mv	a7,s0 
    lw a7, 12(sp) 
    lw t3, 12(sp) 
    sw t3, 12(sp) 
    mv	a7,s5 
    mv	a7,s7 
    mv	a7,s4 
    j	_forcondBB3
_afterForBB1:
    mv	a0,s7 
    call	toString
    la a1,_globalStr0    
    call	_stringAdd
    mv	s4,a0 
    mv	a0,s0 
    call	toString
    mv	a1,a0 
    mv	a0,s4 
    call	_stringAdd
    la a1,_globalStr1    
    call	_stringAdd
    call	println
    lw a7, 12(sp) 
    mv	s0,s5 
    mv	a5,a7 
    mv	a5,s0 
    j	_forupdateBB1
_if_thenBB11:
    sw s4, 0(sp) 
    lw a7, 0(sp) 
    lw s4, 0(sp) 
    sw s4, 0(sp) 
    mv	a7,s5 
    mv	s7,zero 
    j	_forcondBB4
_forcondBB4:
    lw a7, 0(sp) 
    ble	a7,s8,	_forbodyBB4
    j	_afterForBB2
_forbodyBB4:
    lui a7,%hi(ltree)
    sw s5, %lo(ltree)(a7)
    lw a0, 0(sp) 
    li a1, 1
    li a2, 1
    mv	a3,s1 
    mv	a4,s10 
    lw a5, 20(sp) 
    call	asksum
    la a7,ltree    
    lw s5, 0(a7)
    add s7,s7,a0
    lw a7, 0(sp) 
    addi s4,a7,    1
    sw s4, 0(sp) 
    lw a7, 0(sp) 
    lw s4, 0(sp) 
    sw s4, 0(sp) 
    mv	a7,s5 
    mv	a7,s7 
    j	_forcondBB4
_afterForBB2:
    mv	a0,s7 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	println
    mv	a7,s5 
    mv	a5,a7 
    mv	a5,s0 
    j	_forupdateBB1
_if_thenBB10:
    call	getInt
    mv	s7,a0 
    mv	a7,s5 
    mv	a5,s4 
    mv	a5,a7 
    j	_forcondBB5
_forcondBB5:
    ble	s4,s8,	_forbodyBB5
    j	paracopy10
paracopy10:
    mv	a5,a7 
    mv	a5,s0 
    j	_forupdateBB1
_forupdateBB1:
    lw a5, 36(sp) 
    addi a5,a5,    1
    mv	s5,a7 
    sw a5, 36(sp) 
    mv	a7,s5 
    lw a7, 36(sp) 
    lw a5, 36(sp) 
    sw a5, 36(sp) 
    mv	a7,s0 
    j	_forcondBB1
_forbodyBB5:
    lui a5,%hi(ltree)
    sw a7, %lo(ltree)(a5)
    mv	a0,s4 
    li a1, 1
    li a2, 1
    mv	a3,s1 
    mv	a4,s10 
    lw a5, 20(sp) 
    mv	a6,zero 
    call	modifymulti
    la a7,ltree    
    lw a7, 0(a7)
    lui a5,%hi(ltree)
    sw a7, %lo(ltree)(a5)
    mv	a0,s4 
    li a1, 1
    li a2, 1
    mv	a3,s1 
    mv	a4,s10 
    lw a5, 20(sp) 
    mv	a6,s7 
    call	modifyadd
    la a7,ltree    
    lw a7, 0(a7)
    addi s4,s4,    1
    mv	a5,s4 
    mv	a5,a7 
    j	_forcondBB5
								 # func end
    .globl	asksum						 # func begin 
    .p2align	2
    .type	asksum,@function
asksum:
asksum.entryBB1:
    addi sp,sp,    -48
    sw ra, 4(sp) 
    sw s2, 28(sp) 
    sw s5, 16(sp) 
    sw s10, 0(sp) 
    sw s11, 20(sp) 
    sw a5, 12(sp) 
    mv	s5,a4 
    sw a3, 8(sp) 
    mv	s10,a1 
    mv	s2,a0 
    la a7,ltree    
    lw a7, 0(a7)
    bge	a2,s5,	ifTrue5
    j	if_end13
ifTrue5:
    lw a5, 8(sp) 
    lw t3, 12(sp) 
    ble	a5,t3,	if_thenBB13
    j	if_end13
if_end13:
    lw t0, 8(sp) 
    li a5, 4
    mul a5,s2,a5
    addi a5,a5,    4
    add a5,a7,a5
    lw t3, 0(a5)
    li a5, 20
    mul a5,s10,a5
    addi a5,a5,    4
    add a5,t3,a5
    lw a5, 0(a5)
    addi a5,a5,    12
    lw a3, 0(a5)
    li a5, 4
    mul a5,s2,a5
    addi a5,a5,    4
    add a5,a7,a5
    lw t3, 0(a5)
    li a5, 20
    mul a5,s10,a5
    addi a5,a5,    4
    add a5,t3,a5
    lw a5, 0(a5)
    addi a5,a5,    16
    lw t3, 0(a5)
    add a1,a2,t0
    li a5, 2
    div a5,a1,a5
    li a1, 4
    mul a1,s2,a1
    addi a1,a1,    4
    add a1,a7,a1
    li a6, 2
    mul t2,s10,a6
    lw a6, 0(a1)
    li a1, 20
    mul a1,t2,a1
    addi a1,a1,    4
    add a1,a6,a1
    lw a1, 0(a1)
    addi t2,a1,    16
    li a1, 4
    mul a1,s2,a1
    addi a1,a1,    4
    add ra,a7,a1
    li a1, 2
    mul a6,s10,a1
    lw ra, 0(ra)
    li a1, 20
    mul a1,a6,a1
    addi a1,a1,    4
    add a1,ra,a1
    lw a1, 0(a1)
    addi a1,a1,    16
    lw a1, 0(a1)
    mul a1,a1,t3
    sw a1,0(t2)
    li a1, 4
    mul a1,s2,a1
    addi a1,a1,    4
    add a1,a7,a1
    li a6, 2
    mul t2,s10,a6
    lw a6, 0(a1)
    li a1, 20
    mul a1,t2,a1
    addi a1,a1,    4
    add a1,a6,a1
    lw a1, 0(a1)
    addi t2,a1,    12
    li a1, 4
    mul a1,s2,a1
    addi a1,a1,    4
    add a6,a7,a1
    li a1, 2
    mul a1,s10,a1
    lw a6, 0(a6)
    li ra, 20
    mul a1,a1,ra
    addi a1,a1,    4
    add a1,a6,a1
    lw a1, 0(a1)
    addi a1,a1,    12
    lw a1, 0(a1)
    mul a1,a1,t3
    add a1,a1,a3
    sw a1,0(t2)
    li a1, 4
    mul a1,s2,a1
    addi a1,a1,    4
    add a1,a7,a1
    li a6, 2
    mul a6,s10,a6
    addi a6,a6,    1
    lw t2, 0(a1)
    li a1, 20
    mul a1,a6,a1
    addi a1,a1,    4
    add a1,t2,a1
    lw a1, 0(a1)
    addi t2,a1,    16
    li a1, 4
    mul a1,s2,a1
    addi a1,a1,    4
    add a6,a7,a1
    li a1, 2
    mul a1,s10,a1
    addi a1,a1,    1
    lw a6, 0(a6)
    li ra, 20
    mul a1,a1,ra
    addi a1,a1,    4
    add a1,a6,a1
    lw a1, 0(a1)
    addi a1,a1,    16
    lw a1, 0(a1)
    mul a1,a1,t3
    sw a1,0(t2)
    li a1, 4
    mul a1,s2,a1
    addi a1,a1,    4
    add a1,a7,a1
    li a6, 2
    mul a6,s10,a6
    addi a6,a6,    1
    lw a1, 0(a1)
    li t2, 20
    mul a6,a6,t2
    addi a6,a6,    4
    add a1,a1,a6
    lw a1, 0(a1)
    addi a6,a1,    12
    li a1, 4
    mul a1,s2,a1
    addi a1,a1,    4
    add a1,a7,a1
    li t2, 2
    mul t2,s10,t2
    addi ra,t2,    1
    lw a1, 0(a1)
    li t2, 20
    mul t2,ra,t2
    addi t2,t2,    4
    add a1,a1,t2
    lw a1, 0(a1)
    addi a1,a1,    12
    lw a1, 0(a1)
    mul a1,a1,t3
    add a1,a1,a3
    sw a1,0(a6)
    li a1, 4
    mul a1,s2,a1
    addi a1,a1,    4
    add a6,a7,a1
    li a1, 2
    mul t2,s10,a1
    lw a6, 0(a6)
    li a1, 20
    mul a1,t2,a1
    addi a1,a1,    4
    add a1,a6,a1
    lw a1, 0(a1)
    add a6,a1,zero
    li a1, 4
    mul a1,s2,a1
    addi a1,a1,    4
    add t2,a7,a1
    li a1, 2
    mul ra,s10,a1
    lw a1, 0(t2)
    li t2, 20
    mul t2,ra,t2
    addi t2,t2,    4
    add a1,a1,t2
    lw a1, 0(a1)
    add a1,a1,zero
    lw a1, 0(a1)
    mul a1,a1,t3
    add a1,a1,a3
    sw a1,0(a6)
    li a1, 4
    mul a1,s2,a1
    addi a1,a1,    4
    add a1,a7,a1
    li a6, 2
    mul a6,s10,a6
    addi a6,a6,    1
    lw a1, 0(a1)
    li t2, 20
    mul a6,a6,t2
    addi a6,a6,    4
    add a1,a1,a6
    lw a1, 0(a1)
    add t2,a1,zero
    li a1, 4
    mul a1,s2,a1
    addi a1,a1,    4
    add a1,a7,a1
    li a6, 2
    mul a6,s10,a6
    addi a6,a6,    1
    lw ra, 0(a1)
    li a1, 20
    mul a1,a6,a1
    addi a1,a1,    4
    add a1,ra,a1
    lw a1, 0(a1)
    add a1,a1,zero
    lw a1, 0(a1)
    mul a1,a1,t3
    add a1,a1,a3
    sw a1,0(t2)
    li a1, 4
    mul a1,s2,a1
    addi a1,a1,    4
    add a6,a7,a1
    li a1, 2
    mul t2,s10,a1
    lw a6, 0(a6)
    li a1, 20
    mul a1,t2,a1
    addi a1,a1,    4
    add a1,a6,a1
    lw a1, 0(a1)
    addi a6,a1,    4
    li a1, 4
    mul a1,s2,a1
    addi a1,a1,    4
    add a1,a7,a1
    li t2, 2
    mul ra,s10,t2
    lw a1, 0(a1)
    li t2, 20
    mul t2,ra,t2
    addi t2,t2,    4
    add a1,a1,t2
    lw a1, 0(a1)
    addi a1,a1,    4
    lw a1, 0(a1)
    mul a1,a1,t3
    add a1,a1,a3
    sw a1,0(a6)
    li a1, 4
    mul a1,s2,a1
    addi a1,a1,    4
    add a6,a7,a1
    li a1, 2
    mul a1,s10,a1
    addi t2,a1,    1
    lw a6, 0(a6)
    li a1, 20
    mul a1,t2,a1
    addi a1,a1,    4
    add a1,a6,a1
    lw a1, 0(a1)
    addi t2,a1,    4
    li a1, 4
    mul a1,s2,a1
    addi a1,a1,    4
    add a6,a7,a1
    li a1, 2
    mul a1,s10,a1
    addi ra,a1,    1
    lw a6, 0(a6)
    li a1, 20
    mul a1,ra,a1
    addi a1,a1,    4
    add a1,a6,a1
    lw a1, 0(a1)
    addi a1,a1,    4
    lw a1, 0(a1)
    mul a1,a1,t3
    add a1,a1,a3
    sw a1,0(t2)
    li a1, 4
    mul a1,s2,a1
    addi a1,a1,    4
    add a1,a7,a1
    li a6, 2
    mul t2,s10,a6
    lw a6, 0(a1)
    li a1, 20
    mul a1,t2,a1
    addi a1,a1,    4
    add a1,a6,a1
    lw a1, 0(a1)
    addi t2,a1,    8
    li a1, 4
    mul a1,s2,a1
    addi a1,a1,    4
    add a6,a7,a1
    li a1, 2
    mul a1,s10,a1
    lw a6, 0(a6)
    li ra, 20
    mul a1,a1,ra
    addi a1,a1,    4
    add a1,a6,a1
    lw a1, 0(a1)
    addi a1,a1,    8
    lw a1, 0(a1)
    mul a6,a1,t3
    sub a1,a5,a2
    addi a1,a1,    1
    mul a1,a3,a1
    add a1,a6,a1
    sw a1,0(t2)
    li a1, 4
    mul a1,s2,a1
    addi a1,a1,    4
    add a6,a7,a1
    li a1, 2
    mul a1,s10,a1
    addi a1,a1,    1
    lw a6, 0(a6)
    li t2, 20
    mul a1,a1,t2
    addi a1,a1,    4
    add a1,a6,a1
    lw a1, 0(a1)
    addi a6,a1,    8
    li a1, 4
    mul a1,s2,a1
    addi a1,a1,    4
    add a1,a7,a1
    li t2, 2
    mul t2,s10,t2
    addi t2,t2,    1
    lw ra, 0(a1)
    li a1, 20
    mul a1,t2,a1
    addi a1,a1,    4
    add a1,ra,a1
    lw a1, 0(a1)
    addi a1,a1,    8
    lw a1, 0(a1)
    mul t3,a1,t3
    sub a5,t0,a5
    mul a5,a3,a5
    add a5,t3,a5
    sw a5,0(a6)
    lw a5, 8(sp) 
    add t3,a2,a5
    li a5, 2
    div s11,t3,a5
    ble	s5,s11,	if_thenBB14
    j	paracopy11
paracopy11:
    mv	a5,zero 
    sw a5, 24(sp) 
    j	if_end14
if_thenBB14:
    li a5, 2
    mul a1,s10,a5
    lui a5,%hi(ltree)
    sw a7, %lo(ltree)(a5)
    mv	a0,s2 
    mv	a3,s11 
    mv	a4,s5 
    lw a5, 12(sp) 
    call	asksum
    la a7,ltree    
    lw a7, 0(a7)
    add a5,a0,zero
    sw a5, 24(sp) 
    mv	a5,a7 
    lw a5, 24(sp) 
    j	if_end14
if_end14:
    addi a5,s11,    1
    lw t3, 12(sp) 
    bge	t3,a5,	if_thenBB15
    j	paracopy12
paracopy12:
    lw a0, 24(sp) 
    mv	a5,a7 
    mv	a5,a0 
    j	if_end15
if_thenBB15:
    li a5, 2
    mul a5,s10,a5
    addi a1,a5,    1
    addi a2,s11,    1
    lui a5,%hi(ltree)
    sw a7, %lo(ltree)(a5)
    mv	a0,s2 
    lw a3, 8(sp) 
    mv	a4,s5 
    lw a5, 12(sp) 
    call	asksum
    la a7,ltree    
    lw a7, 0(a7)
    lw a5, 24(sp) 
    add a0,a5,a0
    mv	a5,a7 
    mv	a5,a0 
    j	if_end15
if_end15:
    mv	a5,a7 
    mv	a5,a0 
    j	asksum.exitBB1
if_thenBB13:
    li a5, 4
    mul a5,s2,a5
    addi a5,a5,    4
    add a5,a7,a5
    lw a5, 0(a5)
    li t3, 20
    mul t3,s10,t3
    addi t3,t3,    4
    add a5,a5,t3
    lw a5, 0(a5)
    addi a5,a5,    8
    lw a5, 0(a5)
    add a0,a5,zero
    mv	a5,a7 
    mv	a5,a0 
    j	asksum.exitBB1
asksum.exitBB1:
    lui a5,%hi(ltree)
    sw a7, %lo(ltree)(a5)
    lw s11, 20(sp) 
    lw s10, 0(sp) 
    lw s5, 16(sp) 
    lw s2, 28(sp) 
    lw ra, 4(sp) 
    addi sp,sp,    48
    ret
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	INF					#@INF
    .p2align	2
INF:
    .word	0
     
    .globl	ltree					#@ltree
    .p2align	2
ltree:
    .word	0
     
    .globl	r					#@r
    .p2align	2
r:
    .word	0
     
    .globl	c					#@c
    .p2align	2
c:
    .word	0
     
    .globl	maxc					#@maxc
    .p2align	2
maxc:
    .word	0
     
    .globl	matrix					#@matrix
    .p2align	2
matrix:
    .word	0
     
    .globl	maxr					#@maxr
    .p2align	2
maxr:
    .word	0
     
    .globl	m					#@m
    .p2align	2
m:
    .word	0
     
    .globl	_globalStr0					#@_globalStr0
_globalStr0:
    .asciz  " "    
    .globl	_globalStr1					#@_globalStr1
_globalStr1:
    .asciz  "\n"    
