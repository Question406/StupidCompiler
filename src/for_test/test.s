    .text
    .globl	Array_Node.front				#begin
    .p2align	2
    .type	Array_Node.front,@function
Array_Node.front:
Array_Node.front.entryBB1:
    lw t3, 0(a0)
    lw a0, 4(t3)
    ret
								 # func end
    .globl	Array_Node.doubleStorage				#begin
    .p2align	2
    .type	Array_Node.doubleStorage,@function
Array_Node.doubleStorage:
Array_Node.doubleStorage.entryBB1:
    addi sp,sp,    -32
    sw ra, 4(sp) 
    sw s0, 12(sp) 
    sw s1, 16(sp) 
    sw s2, 0(sp) 
    sw s3, 8(sp) 
    mv	s2,a0 
    lw t3, 0(s2)
    mv	s1,t3 
    lw t3, 4(s2)
    mv	s3,t3 
    mv	a0,s1 
    call	_arraySize
    slli s0,a0,    1
    slli t3,s0,    2
    addi a0,t3,    4
    call malloc
    sw s0,0(a0)
    sw a0,0(s2)
    li t3, 0
    sw t3,4(s2)
    j	forcondBB1
forcondBB1:
    lw t3, 4(s2)
    bne	t3,s3,	forbodyBB1
    j	afterForBB1
forbodyBB1:
    lw t3, 4(s2)
    slli t3,t3,    2
    addi t3,t3,    4
    add t2,s1,t3
    lw t3, 0(s2)
    lw t4, 4(s2)
    slli t4,t4,    2
    addi t4,t4,    4
    add t3,t3,t4
    lw t4, 0(t2)
    sw t4,0(t3)
    addi t3,s2,    4
    lw t4, 0(t3)
    addi t4,t4,    1
    sw t4,0(t3)
    j	forcondBB1
afterForBB1:
    lw s3, 8(sp) 
    lw s2, 0(sp) 
    lw s1, 16(sp) 
    lw s0, 12(sp) 
    lw ra, 4(sp) 
    addi sp,sp,    32
    ret
								 # func end
    .globl	Heap_Node.maxHeapify				#begin
    .p2align	2
    .type	Heap_Node.maxHeapify,@function
Heap_Node.maxHeapify:
Heap_Node.maxHeapify.entryBB1:
    addi sp,sp,    -16
    sw ra, 0(sp) 
    mv	t2,a1 
    slli t3,t2,    1
    addi t3,t3,    1
    slli t4,t2,    1
    addi a6,t4,    2
    mv	a1,t2 
    lw t4, 0(a0)
    lw t4, 4(t4)
    blt	t3,t4,	ifTrue1
    j	paracopy1
paracopy1:
    j	if_end1
if_end1:
    lw t3, 0(a0)
    lw t3, 4(t3)
    blt	a6,t3,	ifTrue2
    j	paracopy2
paracopy2:
    j	if_end2
if_end2:
    beq	a1,t2,	Heap_Node.maxHeapify.exitBB1
    j	if_end3
Heap_Node.maxHeapify.exitBB1:
    lw ra, 0(sp) 
    addi sp,sp,    16
    ret
if_end3:
    lw t4, 0(a0)
    lw a6, 0(t4)
    slli t3,t2,    2
    addi t3,t3,    4
    add t3,a6,t3
    lw t3, 0(t3)
    lw t1, 0(t4)
    slli a6,a1,    2
    addi a6,a6,    4
    add a6,t1,a6
    lw t1, 0(t4)
    slli t2,t2,    2
    addi t2,t2,    4
    add t1,t1,t2
    lw t2, 0(a6)
    sw t2,0(t1)
    lw t2, 0(t4)
    slli t4,a1,    2
    addi t4,t4,    4
    add t4,t2,t4
    sw t3,0(t4)
    call	Heap_Node.maxHeapify
    j	Heap_Node.maxHeapify.exitBB1
ifTrue2:
    lw t3, 0(a0)
    lw t3, 0(t3)
    slli t4,a6,    2
    addi t4,t4,    4
    add t3,t3,t4
    lw t3, 0(t3)
    addi t1,t3,    4
    lw t3, 0(t1)
    sub t4,zero,t3
    sw t3,0(t1)
    lw t3, 0(a0)
    lw t1, 0(t3)
    slli t3,a1,    2
    addi t3,t3,    4
    add t3,t1,t3
    lw t3, 0(t3)
    addi a2,t3,    4
    lw t1, 0(a2)
    sub t3,zero,t1
    sw t1,0(a2)
    bgt	t4,t3,	if_thenBB1
    j	paracopy3
if_thenBB1:
    mv	a1,a6 
    j	if_end2
paracopy3:
    j	if_end2
ifTrue1:
    lw t4, 0(a0)
    lw t1, 0(t4)
    slli t4,t3,    2
    addi t4,t4,    4
    add t4,t1,t4
    lw t4, 0(t4)
    addi a2,t4,    4
    lw t4, 0(a2)
    sub t1,zero,t4
    sw t4,0(a2)
    lw t4, 0(a0)
    lw t4, 0(t4)
    slli a2,a1,    2
    addi a2,a2,    4
    add t4,t4,a2
    lw t4, 0(t4)
    addi a2,t4,    4
    lw t6, 0(a2)
    sub t4,zero,t6
    sw t6,0(a2)
    bgt	t1,t4,	if_thenBB2
    j	paracopy4
paracopy4:
    j	if_end1
if_thenBB2:
    mv	a1,t3 
    j	if_end1
								 # func end
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -64
    sw ra, 4(sp) 
    sw s0, 16(sp) 
    sw s1, 20(sp) 
    sw s2, 24(sp) 
    sw s3, 32(sp) 
    sw s4, 44(sp) 
    sw s5, 36(sp) 
    sw s6, 0(sp) 
    sw s7, 12(sp) 
    sw s8, 8(sp) 
    sw s9, 52(sp) 
    sw s10, 48(sp) 
    sw s11, 28(sp) 
    call	getInt
    mv	s1,a0 
    call	getInt
    mv	s3,a0 
    li a0, 16
    call malloc
    mv	s9,a0 
    mv	s7,s9 
    mv	s0,s1 
    slli t3,s3,    2
    addi a0,t3,    4
    call malloc
    sw s3,0(a0)
    sw a0,0(s7)
    slli t3,s3,    2
    addi a0,t3,    4
    call malloc
    sw s3,0(a0)
    sw a0,4(s7)
    slli t3,s0,    2
    addi a0,t3,    4
    call malloc
    sw s0,0(a0)
    sw a0,8(s7)
    mv	t3,zero 
    j	_forcondBB1
_forcondBB1:
    blt	t3,s3,	_forbodyBB1
    j	_afterForBB1
_afterForBB1:
    mv	t3,zero 
    j	_forcondBB2
_forcondBB2:
    blt	t3,s0,	_forbodyBB2
    j	afterCallBB1
_forbodyBB2:
    lw t4, 8(s7)
    slli t2,t3,    2
    addi t2,t2,    4
    add t2,t4,t2
    li t4, -1
    sw t4,0(t2)
    addi t3,t3,    1
    j	_forcondBB2
afterCallBB1:
    li t3, 0
    sw t3,12(s7)
    mv	s8,zero 
    j	__forcondBB1
__forcondBB1:
    blt	s8,s3,	__forbodyBB1
    j	_afterCallBB1
_afterCallBB1:
    mv	s8,zero 
    j	_forcondBB3
_forcondBB3:
    blt	s8,s1,	_forbodyBB3
    j	afterCallBB2
afterCallBB2:
    lw s11, 28(sp) 
    lw s10, 48(sp) 
    lw s9, 52(sp) 
    lw s8, 8(sp) 
    lw s7, 12(sp) 
    lw s6, 0(sp) 
    lw s5, 36(sp) 
    lw s4, 44(sp) 
    lw s3, 32(sp) 
    lw s2, 24(sp) 
    lw s1, 20(sp) 
    lw s0, 16(sp) 
    lw ra, 4(sp) 
    mv	a0,zero 
    addi sp,sp,    64
    ret
_forbodyBB3:
    mv	s7,s8 
    slli t3,s1,    2
    addi a0,t3,    4
    call malloc
    sw s1,0(a0)
    mv	s11,a0 
    slli t3,s1,    2
    addi a0,t3,    4
    call malloc
    sw s1,0(a0)
    mv	s6,a0 
    mv	t3,zero 
    j	__forcondBB2
__forcondBB2:
    blt	t3,s1,	__forbodyBB2
    j	__afterForBB1
__afterForBB1:
    slli t3,s7,    2
    addi t3,t3,    4
    add t3,s6,t3
    li t4, 0
    sw t4,0(t3)
    li a0, 4
    call malloc
    mv	s0,a0 
    li a0, 8
    call malloc
    mv	s3,a0 
    li t3, 0
    sw t3,4(s3)
    li a0, 68
    call malloc
    li t3, 16
    sw t3,0(a0)
    sw a0,0(s3)
    sw s3,0(s0)
    mv	s3,s0 
    li a0, 8
    call malloc
    li t3, 0
    sw t3,4(a0)
    sw s7,0(a0)
    mv	s7,s3 
    lw t3, 0(s7)
    mv	s10,t3 
    mv	s5,a0 
    mv	t3,s10 
    lw s0, 4(t3)
    lw a0, 0(s10)
    call	_arraySize
    beq	s0,a0,	____if_thenBB1
    j	___afterCallBB1
___afterCallBB1:
    lw t4, 0(s10)
    lw t3, 4(s10)
    slli t3,t3,    2
    addi t3,t3,    4
    add t3,t4,t3
    sw s5,0(t3)
    addi t4,s10,    4
    lw t3, 0(t4)
    addi t3,t3,    1
    sw t3,0(t4)
    mv	t3,s7 
    lw t3, 0(t3)
    lw t3, 4(t3)
    li t4, 1
    sub t3,t3,t4
    j	___whileCondBB1
___whileCondBB1:
    bgt	t3,zero,	___whileBodyBB1
    j	__whileCondBB1
__whileCondBB1:
    mv	t3,s3 
    lw t3, 0(t3)
    lw t3, 4(t3)
    bne	t3,zero,	__whileBodyBB1
    j	_afterCallBB2
_afterCallBB2:
    mv	s7,s6 
    mv	s0,zero 
    j	_forcondBB4
_forcondBB4:
    blt	s0,s1,	_forbodyBB4
    j	_afterForBB2
_forbodyBB4:
    slli t3,s0,    2
    addi t3,t3,    4
    add t3,s7,t3
    lw t3, 0(t3)
    li t4, 10000000
    beq	t3,t4,	_if_thenBB1
    j	_if_elseBB1
_if_thenBB1:
    la a0,_globalStr2    
    call	print
    j	_if_end1
_if_end1:
    la a0,_globalStr1    
    call	print
    addi s0,s0,    1
    j	_forcondBB4
_if_elseBB1:
    slli t3,s0,    2
    addi t3,t3,    4
    add t3,s7,t3
    lw a0, 0(t3)
    call	printInt
    j	_if_end1
_afterForBB2:
    la a0,_globalStr0    
    call	println
    addi t3,s8,    1
    mv	s8,t3 
    j	_forcondBB3
__whileBodyBB1:
    mv	a0,s3 
    lw t3, 0(a0)
    lw t3, 0(t3)
    lw s7, 4(t3)
    lw t2, 0(a0)
    mv	t3,t2 
    lw t3, 4(t3)
    li t4, 1
    sub t4,t3,t4
    lw t3, 0(t2)
    lw t3, 4(t3)
    lw a6, 0(t2)
    slli a1,t4,    2
    addi a1,a1,    4
    add a6,a6,a1
    lw a1, 0(t2)
    lw a6, 0(a6)
    sw a6,4(a1)
    lw t2, 0(t2)
    slli t4,t4,    2
    addi t4,t4,    4
    add t4,t2,t4
    sw t3,0(t4)
    lw t3, 0(a0)
    addi a6,t3,    4
    lw t4, 0(a6)
    li t2, 1
    sub t4,t4,t2
    sw t4,0(a6)
    lw t4, 0(t3)
    lw t3, 4(t3)
    slli t3,t3,    2
    addi t3,t3,    4
    add t3,t4,t3
    lw t3, 0(t3)
    mv	a1,zero 
    call	Heap_Node.maxHeapify
    lw t3, 0(s7)
    mv	s4,t3 
    slli t3,s4,    2
    addi t3,t3,    4
    add t3,s11,t3
    lw t4, 0(t3)
    li t3, 1
    beq	t4,t3,	__whileCondBB1
    j	__if_end1
__if_end1:
    slli t3,s4,    2
    addi t3,t3,    4
    add t3,s11,t3
    li t4, 1
    sw t4,0(t3)
    lw t4, 8(s9)
    slli t3,s4,    2
    addi t3,t3,    4
    add t3,t4,t3
    lw t3, 0(t3)
    mv	s2,t3 
    j	__forcondBB3
__forcondBB3:
    li t3, -1
    bne	s2,t3,	__forbodyBB3
    j	__whileCondBB1
__forbodyBB3:
    lw t4, 0(s9)
    slli t3,s2,    2
    addi t3,t3,    4
    add t3,t4,t3
    lw t3, 0(t3)
    lw s7, 4(t3)
    lw t4, 0(s9)
    slli t3,s2,    2
    addi t3,t3,    4
    add t3,t4,t3
    lw t3, 0(t3)
    lw t3, 8(t3)
    slli t4,s4,    2
    addi t4,t4,    4
    add t4,s6,t4
    lw t4, 0(t4)
    add t3,t4,t3
    slli t4,s7,    2
    addi t4,t4,    4
    add t4,s6,t4
    lw t4, 0(t4)
    bge	t3,t4,	__forupdateBB1
    j	__if_end2
__if_end2:
    slli t4,s7,    2
    addi t4,t4,    4
    add t4,s6,t4
    sw t3,0(t4)
    li a0, 8
    call malloc
    sw s7,0(a0)
    slli t3,s7,    2
    addi t3,t3,    4
    add t3,s6,t3
    lw t3, 0(t3)
    sw t3,4(a0)
    lw t3, 0(s3)
    mv	s7,t3 
    sw a0, 40(sp) 
    mv	t3,s7 
    lw s0, 4(t3)
    lw a0, 0(s7)
    call	_arraySize
    beq	s0,a0,	____if_thenBB2
    j	___afterCallBB2
___afterCallBB2:
    lw t3, 0(s7)
    lw t4, 4(s7)
    slli t4,t4,    2
    addi t4,t4,    4
    add t4,t3,t4
    lw t3, 40(sp) 
    sw t3,0(t4)
    addi t4,s7,    4
    lw t3, 0(t4)
    addi t3,t3,    1
    sw t3,0(t4)
    mv	t3,s3 
    lw t3, 0(t3)
    lw t3, 4(t3)
    li t4, 1
    sub t4,t3,t4
    j	___whileCondBB2
___whileCondBB2:
    bgt	t4,zero,	___whileBodyBB2
    j	__forupdateBB1
___whileBodyBB2:
    li t3, 1
    sub t3,t4,t3
    srai t3,t3,    1
    lw t2, 0(s3)
    lw t2, 0(t2)
    slli a6,t3,    2
    addi a6,a6,    4
    add t2,t2,a6
    lw t2, 0(t2)
    addi a1,t2,    4
    lw t2, 0(a1)
    sub a6,zero,t2
    sw t2,0(a1)
    lw t2, 0(s3)
    lw a1, 0(t2)
    slli t2,t4,    2
    addi t2,t2,    4
    add t2,a1,t2
    lw t2, 0(t2)
    addi t1,t2,    4
    lw a1, 0(t1)
    sub t2,zero,a1
    sw a1,0(t1)
    bge	a6,t2,	__forupdateBB1
    j	___if_end1
___if_end1:
    lw a6, 0(s3)
    lw a1, 0(a6)
    slli t2,t3,    2
    addi t2,t2,    4
    add t2,a1,t2
    lw t2, 0(t2)
    lw t1, 0(a6)
    slli a1,t4,    2
    addi a1,a1,    4
    add a1,t1,a1
    lw t1, 0(a6)
    slli a2,t3,    2
    addi a2,a2,    4
    add t1,t1,a2
    lw a1, 0(a1)
    sw a1,0(t1)
    lw a6, 0(a6)
    slli t4,t4,    2
    addi t4,t4,    4
    add t4,a6,t4
    sw t2,0(t4)
    mv	t4,t3 
    j	___whileCondBB2
__forupdateBB1:
    lw t3, 4(s9)
    slli t4,s2,    2
    addi t4,t4,    4
    add t3,t3,t4
    lw t3, 0(t3)
    mv	s2,t3 
    j	__forcondBB3
____if_thenBB2:
    lw t3, 0(s7)
    mv	s0,t3 
    lw t3, 4(s7)
    mv	s5,t3 
    mv	a0,s0 
    call	_arraySize
    slli s10,a0,    1
    slli t3,s10,    2
    addi a0,t3,    4
    call malloc
    sw s10,0(a0)
    sw a0,0(s7)
    li t3, 0
    sw t3,4(s7)
    j	_forcondBB5
_forcondBB5:
    lw t3, 4(s7)
    bne	t3,s5,	_forbodyBB5
    j	___afterCallBB2
_forbodyBB5:
    lw t3, 4(s7)
    slli t3,t3,    2
    addi t3,t3,    4
    add t4,s0,t3
    lw t3, 0(s7)
    lw t2, 4(s7)
    slli t2,t2,    2
    addi t2,t2,    4
    add t3,t3,t2
    lw t4, 0(t4)
    sw t4,0(t3)
    addi t4,s7,    4
    lw t3, 0(t4)
    addi t3,t3,    1
    sw t3,0(t4)
    j	_forcondBB5
___whileBodyBB1:
    li t4, 1
    sub t4,t3,t4
    srai t2,t4,    1
    lw t4, 0(s7)
    lw t4, 0(t4)
    slli a6,t2,    2
    addi a6,a6,    4
    add t4,t4,a6
    lw t4, 0(t4)
    addi a6,t4,    4
    lw a1, 0(a6)
    sub t4,zero,a1
    sw a1,0(a6)
    lw a6, 0(s7)
    lw a1, 0(a6)
    slli a6,t3,    2
    addi a6,a6,    4
    add a6,a1,a6
    lw a6, 0(a6)
    addi t1,a6,    4
    lw a1, 0(t1)
    sub a6,zero,a1
    sw a1,0(t1)
    bge	t4,a6,	__whileCondBB1
    j	___if_end2
___if_end2:
    lw a6, 0(s7)
    lw a1, 0(a6)
    slli t4,t2,    2
    addi t4,t4,    4
    add t4,a1,t4
    lw t4, 0(t4)
    lw t1, 0(a6)
    slli a1,t3,    2
    addi a1,a1,    4
    add t1,t1,a1
    lw a2, 0(a6)
    slli a1,t2,    2
    addi a1,a1,    4
    add a2,a2,a1
    lw a1, 0(t1)
    sw a1,0(a2)
    lw a6, 0(a6)
    slli t3,t3,    2
    addi t3,t3,    4
    add t3,a6,t3
    sw t4,0(t3)
    mv	t3,t2 
    j	___whileCondBB1
____if_thenBB1:
    lw t3, 0(s10)
    mv	s4,t3 
    lw t3, 4(s10)
    mv	s0,t3 
    mv	a0,s4 
    call	_arraySize
    slli s2,a0,    1
    slli t3,s2,    2
    addi a0,t3,    4
    call malloc
    sw s2,0(a0)
    sw a0,0(s10)
    li t3, 0
    sw t3,4(s10)
    j	_forcondBB6
_forcondBB6:
    lw t3, 4(s10)
    bne	t3,s0,	_forbodyBB6
    j	___afterCallBB1
_forbodyBB6:
    lw t3, 4(s10)
    slli t3,t3,    2
    addi t3,t3,    4
    add t4,s4,t3
    lw t3, 0(s10)
    lw t2, 4(s10)
    slli t2,t2,    2
    addi t2,t2,    4
    add t3,t3,t2
    lw t4, 0(t4)
    sw t4,0(t3)
    addi t3,s10,    4
    lw t4, 0(t3)
    addi t4,t4,    1
    sw t4,0(t3)
    j	_forcondBB6
__forbodyBB2:
    slli t4,t3,    2
    addi t4,t4,    4
    add t2,s6,t4
    li t4, 10000000
    sw t4,0(t2)
    slli t4,t3,    2
    addi t4,t4,    4
    add t4,s11,t4
    li t2, 0
    sw t2,0(t4)
    addi t3,t3,    1
    j	__forcondBB2
__forbodyBB1:
    call	getInt
    mv	s6,a0 
    call	getInt
    mv	s0,a0 
    call	getInt
    mv	s2,a0 
    mv	s7,s9 
    li a0, 12
    call malloc
    sw s6,0(a0)
    sw s0,4(a0)
    sw s2,8(a0)
    lw t4, 0(s7)
    lw t3, 12(s7)
    slli t3,t3,    2
    addi t3,t3,    4
    add t3,t4,t3
    sw a0,0(t3)
    lw t4, 8(s7)
    slli t3,s6,    2
    addi t3,t3,    4
    add t4,t4,t3
    lw t3, 4(s7)
    lw t2, 12(s7)
    slli t2,t2,    2
    addi t2,t2,    4
    add t2,t3,t2
    lw t3, 0(t4)
    sw t3,0(t2)
    lw t3, 8(s7)
    slli t4,s6,    2
    addi t4,t4,    4
    add t4,t3,t4
    lw t3, 12(s7)
    sw t3,0(t4)
    addi t4,s7,    12
    lw t3, 0(t4)
    addi t3,t3,    1
    sw t3,0(t4)
    addi s8,s8,    1
    j	__forcondBB1
_forbodyBB1:
    lw t2, 4(s7)
    slli t4,t3,    2
    addi t4,t4,    4
    add t2,t2,t4
    li t4, -1
    sw t4,0(t2)
    addi t3,t3,    1
    j	_forcondBB1
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	INF					#@INF
    .p2align	2
INF:
    .word	0
     
    .globl	g					#@g
    .p2align	2
g:
    .word	0
     
    .globl	m					#@m
    .p2align	2
m:
    .word	0
     
    .globl	n					#@n
    .p2align	2
n:
    .word	0
     
    .globl	_globalStr0					#@_globalStr0
_globalStr0:
    .asciz  ""    
    .globl	_globalStr1					#@_globalStr1
_globalStr1:
    .asciz  " "    
    .globl	_globalStr2					#@_globalStr2
_globalStr2:
    .asciz  "-1"    
