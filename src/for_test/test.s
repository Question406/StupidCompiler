    .text
    .globl	Array_Node.front				#begin
    .p2align	2
    .type	Array_Node.front,@function
Array_Node.front:
Array_Node.front.entryBB1:
    lw a2, 0(a0)
    lw a0, 4(a2)
    ret
								 # func end
    .globl	Array_Node.doubleStorage				#begin
    .p2align	2
    .type	Array_Node.doubleStorage,@function
Array_Node.doubleStorage:
Array_Node.doubleStorage.entryBB1:
    addi sp,sp,    -32
    sw ra, 8(sp) 
    sw s11, 16(sp) 
    sw s10, 0(sp) 
    sw s9, 12(sp) 
    sw s8, 4(sp) 
    mv	s9,s7 
    mv	s10,a0 
    lw a2, 0(s10)
    mv	s8,a2 
    lw a2, 4(s10)
    mv	s11,a2 
    mv	a0,s8 
    call	_arraySize
    slli s7,a0,    1
    slli a2,s7,    2
    addi a0,a2,    4
    call malloc
    sw s7,0(a0)
    sw a0,0(s10)
    li a2, 0
    sw a2,4(s10)
    j	forcondBB1
forcondBB1:
    lw a2, 4(s10)
    bne	a2,s11,	forbodyBB1
    j	afterForBB1
forbodyBB1:
    lw a2, 4(s10)
    slli a2,a2,    2
    addi a2,a2,    4
    add a2,s8,a2
    lw t4, 0(s10)
    lw t5, 4(s10)
    slli t5,t5,    2
    addi t5,t5,    4
    add t5,t4,t5
    lw a2, 0(a2)
    sw a2,0(t5)
    addi t5,s10,    4
    lw a2, 0(t5)
    addi a2,a2,    1
    sw a2,0(t5)
    j	forcondBB1
afterForBB1:
    mv	s7,s9 
    lw s8, 4(sp) 
    lw s9, 12(sp) 
    lw s10, 0(sp) 
    lw s11, 16(sp) 
    lw ra, 8(sp) 
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
    slli a2,a1,    1
    addi t5,a2,    1
    slli a2,a1,    1
    addi t4,a2,    2
    lw a2, 0(a0)
    lw a2, 4(a2)
    blt	t5,a2,	ifTrue1
    j	paracopy1
ifTrue1:
    lw a2, 0(a0)
    lw a2, 0(a2)
    slli t1,t5,    2
    addi t1,t1,    4
    add a2,a2,t1
    lw a2, 0(a2)
    addi a2,a2,    4
    lw a6, 0(a2)
    sub t1,zero,a6
    sw a6,0(a2)
    lw a6, 0(a0)
    mv	a2,a1 
    lw a6, 0(a6)
    slli a2,a2,    2
    addi a2,a2,    4
    add a2,a6,a2
    lw a2, 0(a2)
    addi a6,a2,    4
    lw t6, 0(a6)
    sub a2,zero,t6
    sw t6,0(a6)
    bgt	t1,a2,	if_thenBB1
    j	paracopy2
paracopy2:
    mv	t5,a1 
    j	if_end1
if_end1:
    lw a2, 0(a0)
    lw a2, 4(a2)
    blt	t4,a2,	ifTrue2
    j	paracopy3
paracopy3:
    j	if_end2
if_end2:
    beq	t5,a1,	Heap_Node.maxHeapify.exitBB1
    j	if_end3
if_end3:
    lw a2, 0(a0)
    lw t1, 0(a2)
    slli t4,a1,    2
    addi t4,t4,    4
    add t4,t1,t4
    lw t4, 0(t4)
    lw a6, 0(a2)
    slli t1,t5,    2
    addi t1,t1,    4
    add t1,a6,t1
    lw t6, 0(a2)
    slli a6,a1,    2
    addi a6,a6,    4
    add a6,t6,a6
    lw t1, 0(t1)
    sw t1,0(a6)
    lw a2, 0(a2)
    slli t1,t5,    2
    addi t1,t1,    4
    add a2,a2,t1
    sw t4,0(a2)
    mv	a1,t5 
    call	Heap_Node.maxHeapify
    j	Heap_Node.maxHeapify.exitBB1
Heap_Node.maxHeapify.exitBB1:
    lw ra, 0(sp) 
    addi sp,sp,    16
    ret
ifTrue2:
    lw a2, 0(a0)
    lw t1, 0(a2)
    slli a2,t4,    2
    addi a2,a2,    4
    add a2,t1,a2
    lw a2, 0(a2)
    addi a6,a2,    4
    lw a2, 0(a6)
    sub t1,zero,a2
    sw a2,0(a6)
    lw a2, 0(a0)
    lw a2, 0(a2)
    slli a6,t5,    2
    addi a6,a6,    4
    add a2,a2,a6
    lw a2, 0(a2)
    addi t6,a2,    4
    lw a6, 0(t6)
    sub a2,zero,a6
    sw a6,0(t6)
    bgt	t1,a2,	if_thenBB2
    j	paracopy4
paracopy4:
    j	if_end2
if_thenBB2:
    mv	t5,t4 
    j	if_end2
if_thenBB1:
    j	if_end1
paracopy1:
    mv	t5,a1 
    j	if_end1
								 # func end
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -64
    sw ra, 8(sp) 
    sw s11, 24(sp) 
    sw s10, 32(sp) 
    sw s9, 40(sp) 
    sw s8, 44(sp) 
    sw s7, 52(sp) 
    sw s6, 48(sp) 
    sw s5, 28(sp) 
    sw s4, 16(sp) 
    sw s3, 20(sp) 
    sw s2, 4(sp) 
    sw s1, 0(sp) 
    sw s0, 12(sp) 
    call	getInt
    mv	s0,a0 
    call	getInt
    mv	s4,a0 
    li a0, 16
    call malloc
    mv	s7,a0 
    mv	s8,s7 
    mv	s1,s0 
    slli a2,s4,    2
    addi a0,a2,    4
    call malloc
    sw s4,0(a0)
    sw a0,0(s8)
    slli a2,s4,    2
    addi a0,a2,    4
    call malloc
    sw s4,0(a0)
    sw a0,4(s8)
    slli a2,s1,    2
    addi a0,a2,    4
    call malloc
    sw s1,0(a0)
    sw a0,8(s8)
    mv	a2,zero 
    j	_forcondBB1
_forcondBB1:
    blt	a2,s4,	_forbodyBB1
    j	_afterForBB1
_afterForBB1:
    mv	a2,zero 
    j	_forcondBB2
_forcondBB2:
    blt	a2,s1,	_forbodyBB2
    j	afterCallBB1
afterCallBB1:
    li a2, 0
    sw a2,12(s8)
    mv	s10,zero 
    j	__forcondBB1
__forcondBB1:
    blt	s10,s4,	__forbodyBB1
    j	_afterCallBB1
__forbodyBB1:
    call	getInt
    mv	s8,a0 
    call	getInt
    mv	s11,a0 
    call	getInt
    mv	s1,s7 
    mv	s2,a0 
    li a0, 12
    call malloc
    sw s8,0(a0)
    sw s11,4(a0)
    sw s2,8(a0)
    lw t5, 0(s1)
    lw a2, 12(s1)
    slli a2,a2,    2
    addi a2,a2,    4
    add a2,t5,a2
    sw a0,0(a2)
    lw t5, 8(s1)
    slli a2,s8,    2
    addi a2,a2,    4
    add t4,t5,a2
    lw t5, 4(s1)
    lw a2, 12(s1)
    slli a2,a2,    2
    addi a2,a2,    4
    add a2,t5,a2
    lw t5, 0(t4)
    sw t5,0(a2)
    lw t5, 8(s1)
    slli a2,s8,    2
    addi a2,a2,    4
    add t5,t5,a2
    lw a2, 12(s1)
    sw a2,0(t5)
    addi t5,s1,    12
    lw a2, 0(t5)
    addi a2,a2,    1
    sw a2,0(t5)
    addi s10,s10,    1
    j	__forcondBB1
_afterCallBB1:
    mv	s3,zero 
    j	_forcondBB3
_forcondBB3:
    blt	s3,s0,	_forbodyBB3
    j	afterCallBB2
afterCallBB2:
    lw s0, 12(sp) 
    lw s1, 0(sp) 
    lw s2, 4(sp) 
    lw s3, 20(sp) 
    lw s4, 16(sp) 
    lw s5, 28(sp) 
    lw s6, 48(sp) 
    lw s7, 52(sp) 
    lw s8, 44(sp) 
    lw s9, 40(sp) 
    lw s10, 32(sp) 
    lw s11, 24(sp) 
    lw ra, 8(sp) 
    mv	a0,zero 
    addi sp,sp,    64
    ret
_forbodyBB3:
    mv	s8,s3 
    slli a2,s0,    2
    addi a0,a2,    4
    call malloc
    sw s0,0(a0)
    mv	s5,a0 
    slli a2,s0,    2
    addi a0,a2,    4
    call malloc
    sw s0,0(a0)
    mv	s10,a0 
    mv	a2,zero 
    j	__forcondBB2
__forcondBB2:
    blt	a2,s0,	__forbodyBB2
    j	__afterForBB1
__afterForBB1:
    slli a2,s8,    2
    addi a2,a2,    4
    add a2,s10,a2
    li t5, 0
    sw t5,0(a2)
    li a0, 4
    call malloc
    mv	s1,a0 
    li a0, 8
    call malloc
    mv	s4,a0 
    li a2, 0
    sw a2,4(s4)
    li a0, 68
    call malloc
    li a2, 16
    sw a2,0(a0)
    sw a0,0(s4)
    sw s4,0(s1)
    li a0, 8
    call malloc
    li a2, 0
    sw a2,4(a0)
    sw s8,0(a0)
    lw a2, 0(s1)
    mv	s2,a2 
    mv	s8,a0 
    mv	a2,s2 
    lw s4, 4(a2)
    lw a0, 0(s2)
    call	_arraySize
    beq	s4,a0,	____if_thenBB1
    j	___afterCallBB1
____if_thenBB1:
    lw a2, 0(s2)
    mv	s4,a2 
    lw a2, 4(s2)
    mv	s9,a2 
    mv	a0,s4 
    call	_arraySize
    slli s11,a0,    1
    slli a2,s11,    2
    addi a0,a2,    4
    call malloc
    sw s11,0(a0)
    sw a0,0(s2)
    li a2, 0
    sw a2,4(s2)
    j	_forcondBB4
_forcondBB4:
    lw a2, 4(s2)
    bne	a2,s9,	_forbodyBB4
    j	___afterCallBB1
___afterCallBB1:
    lw t5, 0(s2)
    lw a2, 4(s2)
    slli a2,a2,    2
    addi a2,a2,    4
    add a2,t5,a2
    sw s8,0(a2)
    addi t5,s2,    4
    lw a2, 0(t5)
    addi a2,a2,    1
    sw a2,0(t5)
    mv	a2,s1 
    lw a2, 0(a2)
    lw a2, 4(a2)
    li t5, 1
    sub t5,a2,t5
    j	___whileCondBB1
___whileCondBB1:
    bgt	t5,zero,	___whileBodyBB1
    j	__whileCondBB1
__whileCondBB1:
    mv	a2,s1 
    lw a2, 0(a2)
    lw a2, 4(a2)
    bne	a2,zero,	__whileBodyBB1
    j	_afterCallBB2
__whileBodyBB1:
    mv	a0,s1 
    lw a2, 0(a0)
    lw a2, 0(a2)
    lw s8, 4(a2)
    lw t4, 0(a0)
    lw a2, 0(a0)
    lw a2, 4(a2)
    li t5, 1
    sub a2,a2,t5
    lw t5, 0(t4)
    lw t5, 4(t5)
    lw a6, 0(t4)
    slli t1,a2,    2
    addi t1,t1,    4
    add t1,a6,t1
    lw a6, 0(t4)
    lw t1, 0(t1)
    sw t1,4(a6)
    lw t4, 0(t4)
    slli a2,a2,    2
    addi a2,a2,    4
    add a2,t4,a2
    sw t5,0(a2)
    lw a2, 0(a0)
    addi t4,a2,    4
    lw t1, 0(t4)
    li t5, 1
    sub t5,t1,t5
    sw t5,0(t4)
    lw t5, 0(a2)
    lw a2, 4(a2)
    slli a2,a2,    2
    addi a2,a2,    4
    add a2,t5,a2
    lw a2, 0(a2)
    mv	a1,zero 
    call	Heap_Node.maxHeapify
    lw a2, 0(s8)
    mv	s8,a2 
    slli a2,s8,    2
    addi a2,a2,    4
    add a2,s5,a2
    lw a2, 0(a2)
    li t5, 1
    beq	a2,t5,	__whileCondBB1
    j	__if_end1
__if_end1:
    slli a2,s8,    2
    addi a2,a2,    4
    add t5,s5,a2
    li a2, 1
    sw a2,0(t5)
    lw a2, 8(s7)
    slli t5,s8,    2
    addi t5,t5,    4
    add a2,a2,t5
    lw a2, 0(a2)
    mv	s2,a2 
    j	__forcondBB3
__forcondBB3:
    li a2, -1
    bne	s2,a2,	__forbodyBB3
    j	__whileCondBB1
__forbodyBB3:
    lw t5, 0(s7)
    slli a2,s2,    2
    addi a2,a2,    4
    add a2,t5,a2
    lw a2, 0(a2)
    lw s4, 4(a2)
    lw t5, 0(s7)
    slli a2,s2,    2
    addi a2,a2,    4
    add a2,t5,a2
    lw a2, 0(a2)
    lw a2, 8(a2)
    slli t5,s8,    2
    addi t5,t5,    4
    add t5,s10,t5
    lw t5, 0(t5)
    add a2,t5,a2
    slli t5,s4,    2
    addi t5,t5,    4
    add t5,s10,t5
    lw t5, 0(t5)
    bge	a2,t5,	__forupdateBB1
    j	__if_end2
__if_end2:
    slli t5,s4,    2
    addi t5,t5,    4
    add t5,s10,t5
    sw a2,0(t5)
    li a0, 8
    call malloc
    sw s4,0(a0)
    slli a2,s4,    2
    addi a2,a2,    4
    add a2,s10,a2
    lw a2, 0(a2)
    sw a2,4(a0)
    lw a2, 0(s1)
    mv	s11,a2 
    sw a0, 36(sp) 
    mv	a2,s11 
    lw s4, 4(a2)
    lw a0, 0(s11)
    call	_arraySize
    beq	s4,a0,	____if_thenBB2
    j	___afterCallBB2
___afterCallBB2:
    lw t5, 0(s11)
    lw a2, 4(s11)
    slli a2,a2,    2
    addi a2,a2,    4
    add t5,t5,a2
    lw a2, 36(sp) 
    sw a2,0(t5)
    addi t5,s11,    4
    lw a2, 0(t5)
    addi a2,a2,    1
    sw a2,0(t5)
    mv	a2,s1 
    lw a2, 0(a2)
    lw a2, 4(a2)
    li t5, 1
    sub t4,a2,t5
    j	___whileCondBB2
___whileCondBB2:
    bgt	t4,zero,	___whileBodyBB2
    j	__forupdateBB1
___whileBodyBB2:
    li a2, 1
    sub a2,t4,a2
    srai a2,a2,    1
    lw t5, 0(s1)
    lw t5, 0(t5)
    slli t1,a2,    2
    addi t1,t1,    4
    add t5,t5,t1
    lw t5, 0(t5)
    addi t1,t5,    4
    lw a6, 0(t1)
    sub t5,zero,a6
    sw a6,0(t1)
    lw t1, 0(s1)
    lw a6, 0(t1)
    slli t1,t4,    2
    addi t1,t1,    4
    add t1,a6,t1
    lw t1, 0(t1)
    addi t6,t1,    4
    lw a6, 0(t6)
    sub t1,zero,a6
    sw a6,0(t6)
    bge	t5,t1,	__forupdateBB1
    j	___if_end1
__forupdateBB1:
    lw t5, 4(s7)
    slli a2,s2,    2
    addi a2,a2,    4
    add a2,t5,a2
    lw a2, 0(a2)
    mv	s2,a2 
    j	__forcondBB3
___if_end1:
    lw t5, 0(s1)
    lw a6, 0(t5)
    slli t1,a2,    2
    addi t1,t1,    4
    add t1,a6,t1
    lw t1, 0(t1)
    lw a6, 0(t5)
    slli t6,t4,    2
    addi t6,t6,    4
    add a6,a6,t6
    lw a0, 0(t5)
    slli t6,a2,    2
    addi t6,t6,    4
    add t6,a0,t6
    lw a6, 0(a6)
    sw a6,0(t6)
    lw t5, 0(t5)
    slli t4,t4,    2
    addi t4,t4,    4
    add t5,t5,t4
    sw t1,0(t5)
    mv	t4,a2 
    j	___whileCondBB2
____if_thenBB2:
    lw a2, 0(s11)
    mv	s4,a2 
    lw a2, 4(s11)
    mv	s6,a2 
    mv	a0,s4 
    call	_arraySize
    slli s9,a0,    1
    slli a2,s9,    2
    addi a0,a2,    4
    call malloc
    sw s9,0(a0)
    sw a0,0(s11)
    li a2, 0
    sw a2,4(s11)
    j	_forcondBB5
_forcondBB5:
    lw a2, 4(s11)
    bne	a2,s6,	_forbodyBB5
    j	___afterCallBB2
_forbodyBB5:
    lw a2, 4(s11)
    slli a2,a2,    2
    addi a2,a2,    4
    add t5,s4,a2
    lw t4, 0(s11)
    lw a2, 4(s11)
    slli a2,a2,    2
    addi a2,a2,    4
    add t4,t4,a2
    lw a2, 0(t5)
    sw a2,0(t4)
    addi a2,s11,    4
    lw t5, 0(a2)
    addi t5,t5,    1
    sw t5,0(a2)
    j	_forcondBB5
_afterCallBB2:
    mv	s1,s10 
    mv	s8,zero 
    j	_forcondBB6
_forcondBB6:
    blt	s8,s0,	_forbodyBB6
    j	_afterForBB2
_forbodyBB6:
    slli a2,s8,    2
    addi a2,a2,    4
    add a2,s1,a2
    lw t5, 0(a2)
    li a2, 10000000
    beq	t5,a2,	_if_thenBB1
    j	_if_elseBB1
_if_thenBB1:
    la a0,_globalStr2    
    call	print
    j	_if_end1
_if_end1:
    la a0,_globalStr1    
    call	print
    addi s8,s8,    1
    j	_forcondBB6
_if_elseBB1:
    slli a2,s8,    2
    addi a2,a2,    4
    add a2,s1,a2
    lw a0, 0(a2)
    call	printInt
    j	_if_end1
_afterForBB2:
    la a0,_globalStr0    
    call	println
    addi a2,s3,    1
    mv	s3,a2 
    j	_forcondBB3
___whileBodyBB1:
    li a2, 1
    sub a2,t5,a2
    srai a2,a2,    1
    lw t4, 0(s1)
    lw t1, 0(t4)
    slli t4,a2,    2
    addi t4,t4,    4
    add t4,t1,t4
    lw t4, 0(t4)
    addi t1,t4,    4
    lw a6, 0(t1)
    sub t4,zero,a6
    sw a6,0(t1)
    lw t1, 0(s1)
    lw a6, 0(t1)
    slli t1,t5,    2
    addi t1,t1,    4
    add t1,a6,t1
    lw t1, 0(t1)
    addi t6,t1,    4
    lw a6, 0(t6)
    sub t1,zero,a6
    sw a6,0(t6)
    bge	t4,t1,	__whileCondBB1
    j	___if_end2
___if_end2:
    lw t1, 0(s1)
    lw a6, 0(t1)
    slli t4,a2,    2
    addi t4,t4,    4
    add t4,a6,t4
    lw t4, 0(t4)
    lw a6, 0(t1)
    slli t6,t5,    2
    addi t6,t6,    4
    add t6,a6,t6
    lw a6, 0(t1)
    slli a0,a2,    2
    addi a0,a0,    4
    add a6,a6,a0
    lw t6, 0(t6)
    sw t6,0(a6)
    lw t1, 0(t1)
    slli t5,t5,    2
    addi t5,t5,    4
    add t5,t1,t5
    sw t4,0(t5)
    mv	t5,a2 
    j	___whileCondBB1
_forbodyBB4:
    lw a2, 4(s2)
    slli a2,a2,    2
    addi a2,a2,    4
    add t4,s4,a2
    lw a2, 0(s2)
    lw t5, 4(s2)
    slli t5,t5,    2
    addi t5,t5,    4
    add t5,a2,t5
    lw a2, 0(t4)
    sw a2,0(t5)
    addi a2,s2,    4
    lw t5, 0(a2)
    addi t5,t5,    1
    sw t5,0(a2)
    j	_forcondBB4
__forbodyBB2:
    slli t5,a2,    2
    addi t5,t5,    4
    add t5,s10,t5
    li t4, 10000000
    sw t4,0(t5)
    slli t5,a2,    2
    addi t5,t5,    4
    add t4,s5,t5
    li t5, 0
    sw t5,0(t4)
    addi a2,a2,    1
    j	__forcondBB2
_forbodyBB2:
    lw t4, 8(s8)
    slli t5,a2,    2
    addi t5,t5,    4
    add t5,t4,t5
    li t4, -1
    sw t4,0(t5)
    addi a2,a2,    1
    j	_forcondBB2
_forbodyBB1:
    lw t4, 4(s8)
    slli t5,a2,    2
    addi t5,t5,    4
    add t5,t4,t5
    li t4, -1
    sw t4,0(t5)
    addi a2,a2,    1
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
