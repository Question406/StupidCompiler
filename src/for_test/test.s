    .text
    .globl	qsrt				#begin
    .p2align	2
    .type	qsrt,@function
qsrt:
qsrt.entryBB1:
    addi sp,sp,    -16
    sw ra, 4(sp) 
    sw s0, 8(sp) 
    sw s1, 0(sp) 
    mv	s1,a1 
    la t1,a    
    lw a5, 0(t1)
    mv	a1,s1 
    add t1,a0,s1
    srai t1,t1,    1
    slli t1,t1,    2
    addi t1,t1,    4
    add t1,a5,t1
    lw a3, 0(t1)
    mv	s0,a0 
    mv	t1,a1 
    mv	t1,s0 
    j	whileCondBB1
whileCondBB1:
    ble	s0,a1,	paracopy1
    j	afterWhileBB1
afterWhileBB1:
    blt	a0,a1,	if_thenBB1
    j	paracopy2
paracopy2:
    j	if_end1
if_end1:
    blt	s0,s1,	if_thenBB2
    j	paracopy3
paracopy3:
    j	if_end2
if_end2:
    lui t1,%hi(a)
    sw a5, %lo(a)(t1)
    lw s1, 0(sp) 
    lw s0, 8(sp) 
    lw ra, 4(sp) 
    mv	a0,zero 
    addi sp,sp,    16
    ret
if_thenBB2:
    lui t1,%hi(a)
    sw a5, %lo(a)(t1)
    mv	a0,s0 
    mv	a1,s1 
    call	qsrt
    la t1,a    
    lw a5, 0(t1)
    j	if_end2
if_thenBB1:
    lui t1,%hi(a)
    sw a5, %lo(a)(t1)
    call	qsrt
    la t1,a    
    lw a5, 0(t1)
    j	if_end1
paracopy1:
    mv	t1,s0 
    j	whileCondBB2
whileCondBB2:
    slli t4,t1,    2
    addi t4,t4,    4
    add t4,a5,t4
    lw t4, 0(t4)
    blt	t4,a3,	whileBodyBB1
    j	paracopy4
whileBodyBB1:
    addi t1,t1,    1
    j	whileCondBB2
paracopy4:
    j	whileCondBB3
whileCondBB3:
    slli t4,a1,    2
    addi t4,t4,    4
    add t4,a5,t4
    lw t4, 0(t4)
    bgt	t4,a3,	whileBodyBB2
    j	afterWhileBB2
afterWhileBB2:
    ble	t1,a1,	if_thenBB3
    j	paracopy5
paracopy5:
    mv	s0,t1 
    mv	t1,a1 
    mv	t1,s0 
    j	whileCondBB1
if_thenBB3:
    slli t4,t1,    2
    addi t4,t4,    4
    add t4,a5,t4
    lw t4, 0(t4)
    slli t3,a1,    2
    addi t3,t3,    4
    add t0,a5,t3
    slli t3,t1,    2
    addi t3,t3,    4
    add t3,a5,t3
    lw t0, 0(t0)
    sw t0,0(t3)
    slli t3,a1,    2
    addi t3,t3,    4
    add t3,a5,t3
    sw t4,0(t3)
    addi t1,t1,    1
    li t4, 1
    sub a1,a1,t4
    mv	s0,t1 
    mv	t1,a1 
    mv	t1,s0 
    j	whileCondBB1
whileBodyBB2:
    li t4, 1
    sub a1,a1,t4
    j	whileCondBB3
								 # func end
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -16
    sw ra, 8(sp) 
    sw s0, 0(sp) 
    sw s1, 4(sp) 
    li a0, 40404
    call malloc
    li t1, 10100
    sw t1,0(a0)
    li t1, 1
    j	_forcondBB1
_forcondBB1:
    li a3, 10000
    ble	t1,a3,	_forbodyBB1
    j	_afterForBB1
_afterForBB1:
    lui t1,%hi(a)
    sw a0, %lo(a)(t1)
    li a0, 1
    li a1, 10000
    call	qsrt
    la t1,a    
    lw s1, 0(t1)
    li s0, 1
    j	_forcondBB2
_forcondBB2:
    li t1, 10000
    ble	s0,t1,	_forbodyBB2
    j	afterCallBB1
afterCallBB1:
    la a0,_globalStr1    
    call	print
    lui t1,%hi(a)
    sw s1, %lo(a)(t1)
    lw s1, 4(sp) 
    lw s0, 0(sp) 
    lw ra, 8(sp) 
    mv	a0,zero 
    addi sp,sp,    16
    ret
_forbodyBB2:
    slli t1,s0,    2
    addi t1,t1,    4
    add t1,s1,t1
    lw a0, 0(t1)
    call	toString
    call	print
    la a0,_globalStr0    
    call	print
    addi t1,s0,    1
    mv	s0,t1 
    mv	t1,s0 
    j	_forcondBB2
_forbodyBB1:
    li a3, 10001
    sub t4,a3,t1
    slli a3,t1,    2
    addi a3,a3,    4
    add a3,a0,a3
    sw t4,0(a3)
    addi t1,t1,    1
    j	_forcondBB1
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	a					#@a
    .p2align	2
a:
    .word	0
     
    .globl	n					#@n
    .p2align	2
n:
    .word	0
     
    .globl	_globalStr0					#@_globalStr0
_globalStr0:
    .asciz  " "    
    .globl	_globalStr1					#@_globalStr1
_globalStr1:
    .asciz  "\n"    
