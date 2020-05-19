    .text
    .globl	Array_Node.front						 # func begin 
    .p2align	2
    .type	Array_Node.front,@function
Array_Node.front:
Array_Node.front.entryBB1:
    add t5,a0,zero
    lw t5, 0(t5)
    addi t5,t5,    4
    lw a0, 0(t5)
    ret
								 # func end
    .globl	Array_Node.doubleStorage						 # func begin 
    .p2align	2
    .type	Array_Node.doubleStorage,@function
Array_Node.doubleStorage:
Array_Node.doubleStorage.entryBB1:
    addi sp,sp,    -32
    sw ra, 16(sp) 
    sw s7, 4(sp) 
    sw s5, 8(sp) 
    sw s4, 0(sp) 
    mv	s7,a0 
    add t5,s7,zero
    lw s4, 0(t5)
    addi t5,s7,    4
    lw t5, 0(t5)
    sw t5, 12(sp) 
    mv	a0,s4 
    call	_arraySize
    li t5, 2
    mul s5,a0,t5
    li t5, 8
    mul t5,s5,t5
    addi a0,t5,    4
    call malloc
    sw s5,0(a0)
    add t5,s7,zero
    sw a0,0(t5)
    addi ra,s7,    4
    li t5, 0
    sw t5,0(ra)
    j	forcondBB1
forcondBB1:
    addi t5,s7,    4
    lw ra, 0(t5)
    lw t5, 12(sp) 
    bne	ra,t5,	forbodyBB1
    j	afterForBB1
afterForBB1:
    lw s4, 0(sp) 
    lw s5, 8(sp) 
    lw s7, 4(sp) 
    lw ra, 16(sp) 
    addi sp,sp,    32
    ret
forbodyBB1:
    addi t5,s7,    4
    lw ra, 0(t5)
    li t5, 8
    mul t5,ra,t5
    addi t5,t5,    4
    add ra,s4,t5
    add a6,s7,zero
    addi t5,s7,    4
    lw a6, 0(a6)
    lw a1, 0(t5)
    li t5, 8
    mul t5,a1,t5
    addi t5,t5,    4
    add a6,a6,t5
    lw t5, 0(ra)
    sw t5,0(a6)
    addi t5,s7,    4
    lw ra, 0(t5)
    addi ra,ra,    1
    sw ra,0(t5)
    j	forcondBB1
								 # func end
    .globl	Heap_Node.maxHeapify						 # func begin 
    .p2align	2
    .type	Heap_Node.maxHeapify,@function
Heap_Node.maxHeapify:
Heap_Node.maxHeapify.entryBB1:
    addi sp,sp,    -16
    sw ra, 0(sp) 
    li t5, 2
    mul t5,a1,t5
    addi a6,t5,    1
    li t5, 2
    mul t5,a1,t5
    addi ra,t5,    2
    add t5,a0,zero
    lw t5, 0(t5)
    addi t5,t5,    4
    lw t5, 0(t5)
    blt	a6,t5,	ifTrue1
    j	paracopy1
ifTrue1:
    add t5,a0,zero
    lw t5, 0(t5)
    add t5,t5,zero
    lw a3, 0(t5)
    li t5, 8
    mul t5,a6,t5
    addi t5,t5,    4
    add t5,a3,t5
    lw t5, 0(t5)
    addi a5,t5,    4
    lw t5, 0(a5)
    sub a3,zero,t5
    sw t5,0(a5)
    add t5,a0,zero
    lw t5, 0(t5)
    mv	a5,a1 
    add t5,t5,zero
    lw t2, 0(t5)
    li t5, 8
    mul t5,a5,t5
    addi t5,t5,    4
    add t5,t2,t5
    lw t5, 0(t5)
    addi a5,t5,    4
    lw t2, 0(a5)
    sub t5,zero,t2
    sw t2,0(a5)
    bgt	a3,t5,	if_thenBB1
    j	paracopy2
if_thenBB1:
    j	if_end1
if_end1:
    add t5,a0,zero
    lw t5, 0(t5)
    addi t5,t5,    4
    lw t5, 0(t5)
    blt	ra,t5,	ifTrue2
    j	paracopy3
ifTrue2:
    add t5,a0,zero
    lw t5, 0(t5)
    add t5,t5,zero
    lw a3, 0(t5)
    li t5, 8
    mul t5,ra,t5
    addi t5,t5,    4
    add t5,a3,t5
    lw t5, 0(t5)
    addi t5,t5,    4
    lw a5, 0(t5)
    sub a3,zero,a5
    sw a5,0(t5)
    add t5,a0,zero
    lw t5, 0(t5)
    add t5,t5,zero
    lw a5, 0(t5)
    li t5, 8
    mul t5,a6,t5
    addi t5,t5,    4
    add t5,a5,t5
    lw t5, 0(t5)
    addi t2,t5,    4
    lw a5, 0(t2)
    sub t5,zero,a5
    sw a5,0(t2)
    bgt	a3,t5,	if_thenBB2
    j	paracopy4
paracopy4:
    mv	ra,a6 
    j	if_end2
if_end2:
    beq	ra,a1,	Heap_Node.maxHeapify.exitBB1
    j	if_end3
Heap_Node.maxHeapify.exitBB1:
    lw ra, 0(sp) 
    addi sp,sp,    16
    ret
if_end3:
    add t5,a0,zero
    lw a6, 0(t5)
    add t5,a6,zero
    lw a3, 0(t5)
    li t5, 8
    mul t5,a1,t5
    addi t5,t5,    4
    add t5,a3,t5
    lw t5, 0(t5)
    add a3,a6,zero
    lw a3, 0(a3)
    li a5, 8
    mul a5,ra,a5
    addi a5,a5,    4
    add a5,a3,a5
    add a3,a6,zero
    lw a3, 0(a3)
    li t2, 8
    mul a1,a1,t2
    addi a1,a1,    4
    add a1,a3,a1
    lw a3, 0(a5)
    sw a3,0(a1)
    add a6,a6,zero
    lw a6, 0(a6)
    li a1, 8
    mul a1,ra,a1
    addi a1,a1,    4
    add a6,a6,a1
    sw t5,0(a6)
    mv	a1,ra 
    call	Heap_Node.maxHeapify
    j	Heap_Node.maxHeapify.exitBB1
if_thenBB2:
    j	if_end2
paracopy3:
    mv	ra,a6 
    j	if_end2
paracopy2:
    mv	a6,a1 
    j	if_end1
paracopy1:
    mv	a6,a1 
    j	if_end1
								 # func end
    .globl	main						 # func begin 
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -80
    sw ra, 8(sp) 
    sw s10, 44(sp) 
    sw s7, 20(sp) 
    sw s4, 12(sp) 
    sw s3, 56(sp) 
    sw s1, 60(sp) 
    call	getInt
    sw a0, 48(sp) 
    call	getInt
    mv	s1,a0 
    li a0, 16
    call malloc
    sw a0, 4(sp) 
    lw s10, 4(sp) 
    lw s3, 48(sp) 
    li t5, 12
    mul t5,s1,t5
    addi a0,t5,    4
    call malloc
    sw s1,0(a0)
    add t5,s10,zero
    sw a0,0(t5)
    li t5, 4
    mul t5,s1,t5
    addi a0,t5,    4
    call malloc
    sw s1,0(a0)
    addi t5,s10,    4
    sw a0,0(t5)
    li t5, 4
    mul t5,s3,t5
    addi a0,t5,    4
    call malloc
    sw s3,0(a0)
    addi t5,s10,    8
    sw a0,0(t5)
    mv	t5,zero 
    j	_forcondBB1
_forcondBB1:
    blt	t5,s1,	_forbodyBB1
    j	_afterForBB1
_forbodyBB1:
    addi ra,s10,    4
    lw a6, 0(ra)
    li ra, 4
    mul ra,t5,ra
    addi ra,ra,    4
    add ra,a6,ra
    li a6, -1
    sw a6,0(ra)
    addi t5,t5,    1
    j	_forcondBB1
_afterForBB1:
    mv	t5,zero 
    j	_forcondBB2
_forcondBB2:
    blt	t5,s3,	_forbodyBB2
    j	afterCallBB1
_forbodyBB2:
    addi ra,s10,    8
    lw ra, 0(ra)
    li a6, 4
    mul a6,t5,a6
    addi a6,a6,    4
    add a6,ra,a6
    li ra, -1
    sw ra,0(a6)
    addi t5,t5,    1
    j	_forcondBB2
afterCallBB1:
    addi t5,s10,    12
    li ra, 0
    sw ra,0(t5)
    mv	s4,zero 
    j	__forcondBB1
__forcondBB1:
    blt	s4,s1,	__forbodyBB1
    j	_afterCallBB1
_afterCallBB1:
    mv	t5,zero 
    sw t5, 40(sp) 
    j	_forcondBB3
_forcondBB3:
    lw t5, 40(sp) 
    lw ra, 48(sp) 
    blt	t5,ra,	_forbodyBB3
    j	afterCallBB2
afterCallBB2:
    lw s1, 60(sp) 
    lw s3, 56(sp) 
    lw s4, 12(sp) 
    lw s7, 20(sp) 
    lw s10, 44(sp) 
    lw ra, 8(sp) 
    mv	a0,zero 
    addi sp,sp,    80
    ret
_forbodyBB3:
    lw s1, 40(sp) 
    li t5, 4
    lw ra, 48(sp) 
    mul t5,ra,t5
    addi a0,t5,    4
    call malloc
    lw t5, 48(sp) 
    sw t5,0(a0)
    sw a0, 16(sp) 
    li ra, 4
    lw t5, 48(sp) 
    mul t5,t5,ra
    addi a0,t5,    4
    call malloc
    lw t5, 48(sp) 
    sw t5,0(a0)
    sw a0, 28(sp) 
    mv	t5,zero 
    j	__forcondBB2
__forcondBB2:
    lw ra, 48(sp) 
    blt	t5,ra,	__forbodyBB2
    j	__afterForBB1
__afterForBB1:
    li t5, 4
    mul t5,s1,t5
    addi t5,t5,    4
    lw ra, 28(sp) 
    add t5,ra,t5
    li ra, 0
    sw ra,0(t5)
    li a0, 4
    call malloc
    mv	s3,a0 
    li a0, 8
    call malloc
    mv	s10,a0 
    addi t5,s10,    4
    li ra, 0
    sw ra,0(t5)
    li a0, 132
    call malloc
    li t5, 16
    sw t5,0(a0)
    add t5,s10,zero
    sw a0,0(t5)
    add t5,s3,zero
    sw s10,0(t5)
    mv	s7,s3 
    li a0, 8
    call malloc
    addi ra,a0,    4
    li t5, 0
    sw t5,0(ra)
    add t5,a0,zero
    sw s1,0(t5)
    add t5,s7,zero
    lw t5, 0(t5)
    sw t5, 36(sp) 
    sw a0, 64(sp) 
    lw t5, 36(sp) 
    addi t5,t5,    4
    lw s3, 0(t5)
    lw t5, 36(sp) 
    add t5,t5,zero
    lw a0, 0(t5)
    call	_arraySize
    beq	s3,a0,	____if_thenBB1
    j	___afterCallBB1
___afterCallBB1:
    lw t5, 36(sp) 
    add t5,t5,zero
    lw ra, 36(sp) 
    addi ra,ra,    4
    lw a6, 0(t5)
    lw t5, 0(ra)
    li ra, 8
    mul t5,t5,ra
    addi t5,t5,    4
    add ra,a6,t5
    lw t5, 64(sp) 
    sw t5,0(ra)
    lw t5, 36(sp) 
    addi t5,t5,    4
    lw ra, 0(t5)
    addi ra,ra,    1
    sw ra,0(t5)
    mv	t5,s7 
    add t5,t5,zero
    lw t5, 0(t5)
    addi t5,t5,    4
    lw t5, 0(t5)
    li ra, 1
    sub ra,t5,ra
    j	___whileCondBB1
___whileCondBB1:
    bgt	ra,zero,	___whileBodyBB1
    j	__whileCondBB1
__whileCondBB1:
    mv	t5,s7 
    add t5,t5,zero
    lw t5, 0(t5)
    addi t5,t5,    4
    lw t5, 0(t5)
    bne	t5,zero,	__whileBodyBB1
    j	_afterCallBB2
_afterCallBB2:
    lw s1, 28(sp) 
    mv	s3,zero 
    j	_forcondBB4
_forcondBB4:
    lw t5, 48(sp) 
    blt	s3,t5,	_forbodyBB4
    j	_afterForBB2
_forbodyBB4:
    li t5, 4
    mul t5,s3,t5
    addi t5,t5,    4
    add t5,s1,t5
    lw ra, 0(t5)
    li t5, 10000000
    beq	ra,t5,	_if_thenBB1
    j	_if_elseBB1
_if_elseBB1:
    li t5, 4
    mul t5,s3,t5
    addi t5,t5,    4
    add t5,s1,t5
    lw a0, 0(t5)
    call	toString
    call	print
    j	_if_end1
_if_end1:
    la a0,_globalStr1    
    call	print
    addi s3,s3,    1
    j	_forcondBB4
_if_thenBB1:
    la a0,_globalStr2    
    call	print
    j	_if_end1
_afterForBB2:
    la a0,_globalStr0    
    call	println
    lw t5, 40(sp) 
    addi t5,t5,    1
    sw t5, 40(sp) 
    lw t5, 40(sp) 
    j	_forcondBB3
__whileBodyBB1:
    mv	a0,s7 
    add t5,a0,zero
    lw t5, 0(t5)
    add t5,t5,zero
    lw t5, 0(t5)
    addi t5,t5,    4
    lw s3, 0(t5)
    add t5,a0,zero
    lw t5, 0(t5)
    add ra,a0,zero
    lw ra, 0(ra)
    addi ra,ra,    4
    lw ra, 0(ra)
    li a6, 1
    sub a6,ra,a6
    add ra,t5,zero
    lw ra, 0(ra)
    addi ra,ra,    4
    lw ra, 0(ra)
    add a1,t5,zero
    lw a3, 0(a1)
    li a1, 8
    mul a1,a6,a1
    addi a1,a1,    4
    add a3,a3,a1
    add a1,t5,zero
    lw a1, 0(a1)
    addi a1,a1,    4
    lw a3, 0(a3)
    sw a3,0(a1)
    add t5,t5,zero
    lw a1, 0(t5)
    li t5, 8
    mul t5,a6,t5
    addi t5,t5,    4
    add t5,a1,t5
    sw ra,0(t5)
    add t5,a0,zero
    lw t5, 0(t5)
    addi a6,t5,    4
    lw ra, 0(a6)
    li a1, 1
    sub ra,ra,a1
    sw ra,0(a6)
    add ra,t5,zero
    addi t5,t5,    4
    lw a6, 0(ra)
    lw t5, 0(t5)
    li ra, 8
    mul t5,t5,ra
    addi t5,t5,    4
    add t5,a6,t5
    lw t5, 0(t5)
    mv	a1,zero 
    call	Heap_Node.maxHeapify
    add t5,s3,zero
    lw t5, 0(t5)
    sw t5, 24(sp) 
    li ra, 4
    lw t5, 24(sp) 
    mul t5,t5,ra
    addi t5,t5,    4
    lw ra, 16(sp) 
    add t5,ra,t5
    lw t5, 0(t5)
    li ra, 1
    beq	t5,ra,	__whileCondBB1
    j	__if_end1
__if_end1:
    li ra, 4
    lw t5, 24(sp) 
    mul t5,t5,ra
    addi ra,t5,    4
    lw t5, 16(sp) 
    add ra,t5,ra
    li t5, 1
    sw t5,0(ra)
    lw t5, 4(sp) 
    addi t5,t5,    8
    lw ra, 0(t5)
    li a6, 4
    lw t5, 24(sp) 
    mul t5,t5,a6
    addi t5,t5,    4
    add t5,ra,t5
    lw t5, 0(t5)
    sw t5, 32(sp) 
    lw t5, 32(sp) 
    j	__forcondBB3
__forcondBB3:
    li ra, -1
    lw t5, 32(sp) 
    bne	t5,ra,	__forbodyBB3
    j	__whileCondBB1
__forbodyBB3:
    lw t5, 4(sp) 
    add t5,t5,zero
    lw ra, 0(t5)
    li t5, 12
    lw a6, 32(sp) 
    mul t5,a6,t5
    addi t5,t5,    4
    add t5,ra,t5
    lw t5, 0(t5)
    addi t5,t5,    4
    lw s3, 0(t5)
    lw t5, 4(sp) 
    add t5,t5,zero
    lw a6, 0(t5)
    li t5, 12
    lw ra, 32(sp) 
    mul t5,ra,t5
    addi t5,t5,    4
    add t5,a6,t5
    lw t5, 0(t5)
    addi t5,t5,    8
    lw t5, 0(t5)
    li a6, 4
    lw ra, 24(sp) 
    mul ra,ra,a6
    addi ra,ra,    4
    lw a6, 28(sp) 
    add ra,a6,ra
    lw ra, 0(ra)
    add t5,ra,t5
    li ra, 4
    mul ra,s3,ra
    addi ra,ra,    4
    lw a6, 28(sp) 
    add ra,a6,ra
    lw ra, 0(ra)
    bge	t5,ra,	__forupdateBB1
    j	__if_end2
__forupdateBB1:
    lw t5, 4(sp) 
    addi t5,t5,    4
    lw a6, 0(t5)
    li t5, 4
    lw ra, 32(sp) 
    mul t5,ra,t5
    addi t5,t5,    4
    add t5,a6,t5
    lw t5, 0(t5)
    sw t5, 32(sp) 
    lw t5, 32(sp) 
    j	__forcondBB3
__if_end2:
    li ra, 4
    mul ra,s3,ra
    addi a6,ra,    4
    lw ra, 28(sp) 
    add ra,ra,a6
    sw t5,0(ra)
    li a0, 8
    call malloc
    add t5,a0,zero
    sw s3,0(t5)
    li t5, 4
    mul t5,s3,t5
    addi ra,t5,    4
    lw t5, 28(sp) 
    add t5,t5,ra
    addi ra,a0,    4
    lw t5, 0(t5)
    sw t5,0(ra)
    add t5,s7,zero
    lw t5, 0(t5)
    mv	s4,t5 
    mv	s10,a0 
    mv	t5,s4 
    addi t5,t5,    4
    lw s3, 0(t5)
    add t5,s4,zero
    lw a0, 0(t5)
    call	_arraySize
    beq	s3,a0,	____if_thenBB2
    j	___afterCallBB2
___afterCallBB2:
    add t5,s4,zero
    addi ra,s4,    4
    lw t5, 0(t5)
    lw a6, 0(ra)
    li ra, 8
    mul ra,a6,ra
    addi ra,ra,    4
    add t5,t5,ra
    sw s10,0(t5)
    addi ra,s4,    4
    lw t5, 0(ra)
    addi t5,t5,    1
    sw t5,0(ra)
    mv	t5,s7 
    add t5,t5,zero
    lw t5, 0(t5)
    addi t5,t5,    4
    lw t5, 0(t5)
    li ra, 1
    sub ra,t5,ra
    j	___whileCondBB2
___whileCondBB2:
    bgt	ra,zero,	___whileBodyBB2
    j	__forupdateBB1
___whileBodyBB2:
    li t5, 1
    sub t5,ra,t5
    li a6, 2
    div t5,t5,a6
    add a6,s7,zero
    lw a6, 0(a6)
    add a6,a6,zero
    lw a1, 0(a6)
    li a6, 8
    mul a6,t5,a6
    addi a6,a6,    4
    add a6,a1,a6
    lw a6, 0(a6)
    addi a6,a6,    4
    lw a3, 0(a6)
    sub a1,zero,a3
    sw a3,0(a6)
    add a6,s7,zero
    lw a6, 0(a6)
    add a6,a6,zero
    lw a3, 0(a6)
    li a6, 8
    mul a6,ra,a6
    addi a6,a6,    4
    add a6,a3,a6
    lw a6, 0(a6)
    addi a3,a6,    4
    lw a5, 0(a3)
    sub a6,zero,a5
    sw a5,0(a3)
    bge	a1,a6,	__forupdateBB1
    j	___if_end1
___if_end1:
    add a6,s7,zero
    lw a1, 0(a6)
    add a6,a1,zero
    lw a3, 0(a6)
    li a6, 8
    mul a6,t5,a6
    addi a6,a6,    4
    add a6,a3,a6
    lw a6, 0(a6)
    add a3,a1,zero
    lw a3, 0(a3)
    li a5, 8
    mul a5,ra,a5
    addi a5,a5,    4
    add a5,a3,a5
    add a3,a1,zero
    lw t2, 0(a3)
    li a3, 8
    mul a3,t5,a3
    addi a3,a3,    4
    add a3,t2,a3
    lw a5, 0(a5)
    sw a5,0(a3)
    add a1,a1,zero
    lw a1, 0(a1)
    li a3, 8
    mul ra,ra,a3
    addi ra,ra,    4
    add ra,a1,ra
    sw a6,0(ra)
    mv	ra,t5 
    j	___whileCondBB2
____if_thenBB2:
    add t5,s4,zero
    lw t5, 0(t5)
    mv	s1,t5 
    addi t5,s4,    4
    lw t5, 0(t5)
    mv	s3,t5 
    mv	a0,s1 
    call	_arraySize
    li t5, 2
    mul t5,a0,t5
    sw t5, 52(sp) 
    li t5, 8
    lw ra, 52(sp) 
    mul t5,ra,t5
    addi a0,t5,    4
    call malloc
    lw t5, 52(sp) 
    sw t5,0(a0)
    add t5,s4,zero
    sw a0,0(t5)
    addi ra,s4,    4
    li t5, 0
    sw t5,0(ra)
    j	_forcondBB5
_forcondBB5:
    addi t5,s4,    4
    lw t5, 0(t5)
    bne	t5,s3,	_forbodyBB5
    j	___afterCallBB2
_forbodyBB5:
    addi t5,s4,    4
    lw t5, 0(t5)
    li ra, 8
    mul t5,t5,ra
    addi t5,t5,    4
    add a6,s1,t5
    add ra,s4,zero
    addi t5,s4,    4
    lw ra, 0(ra)
    lw a1, 0(t5)
    li t5, 8
    mul t5,a1,t5
    addi t5,t5,    4
    add ra,ra,t5
    lw t5, 0(a6)
    sw t5,0(ra)
    addi ra,s4,    4
    lw t5, 0(ra)
    addi t5,t5,    1
    sw t5,0(ra)
    j	_forcondBB5
___whileBodyBB1:
    li t5, 1
    sub t5,ra,t5
    li a6, 2
    div a6,t5,a6
    add t5,s7,zero
    lw t5, 0(t5)
    add t5,t5,zero
    lw t5, 0(t5)
    li a1, 8
    mul a1,a6,a1
    addi a1,a1,    4
    add t5,t5,a1
    lw t5, 0(t5)
    addi a3,t5,    4
    lw t5, 0(a3)
    sub a1,zero,t5
    sw t5,0(a3)
    add t5,s7,zero
    lw t5, 0(t5)
    add t5,t5,zero
    lw t5, 0(t5)
    li a3, 8
    mul a3,ra,a3
    addi a3,a3,    4
    add t5,t5,a3
    lw t5, 0(t5)
    addi a3,t5,    4
    lw a5, 0(a3)
    sub t5,zero,a5
    sw a5,0(a3)
    bge	a1,t5,	__whileCondBB1
    j	___if_end2
___if_end2:
    add t5,s7,zero
    lw a1, 0(t5)
    add t5,a1,zero
    lw a3, 0(t5)
    li t5, 8
    mul t5,a6,t5
    addi t5,t5,    4
    add t5,a3,t5
    lw t5, 0(t5)
    add a3,a1,zero
    lw a5, 0(a3)
    li a3, 8
    mul a3,ra,a3
    addi a3,a3,    4
    add a5,a5,a3
    add a3,a1,zero
    lw t2, 0(a3)
    li a3, 8
    mul a3,a6,a3
    addi a3,a3,    4
    add t2,t2,a3
    lw a3, 0(a5)
    sw a3,0(t2)
    add a1,a1,zero
    lw a3, 0(a1)
    li a1, 8
    mul ra,ra,a1
    addi ra,ra,    4
    add ra,a3,ra
    sw t5,0(ra)
    mv	ra,a6 
    j	___whileCondBB1
____if_thenBB1:
    lw t5, 36(sp) 
    mv	s10,t5 
    add t5,s10,zero
    lw t5, 0(t5)
    mv	s3,t5 
    addi t5,s10,    4
    lw t5, 0(t5)
    mv	s1,t5 
    mv	a0,s3 
    call	_arraySize
    li t5, 2
    mul s4,a0,t5
    li t5, 8
    mul t5,s4,t5
    addi a0,t5,    4
    call malloc
    sw s4,0(a0)
    add t5,s10,zero
    sw a0,0(t5)
    addi t5,s10,    4
    li ra, 0
    sw ra,0(t5)
    j	_forcondBB6
_forcondBB6:
    addi t5,s10,    4
    lw t5, 0(t5)
    bne	t5,s1,	_forbodyBB6
    j	___afterCallBB1
_forbodyBB6:
    addi t5,s10,    4
    lw ra, 0(t5)
    li t5, 8
    mul t5,ra,t5
    addi t5,t5,    4
    add a6,s3,t5
    add t5,s10,zero
    addi ra,s10,    4
    lw t5, 0(t5)
    lw a1, 0(ra)
    li ra, 8
    mul ra,a1,ra
    addi ra,ra,    4
    add ra,t5,ra
    lw t5, 0(a6)
    sw t5,0(ra)
    addi ra,s10,    4
    lw t5, 0(ra)
    addi t5,t5,    1
    sw t5,0(ra)
    j	_forcondBB6
__forbodyBB2:
    li ra, 4
    mul ra,t5,ra
    addi a6,ra,    4
    lw ra, 28(sp) 
    add a6,ra,a6
    li ra, 10000000
    sw ra,0(a6)
    li ra, 4
    mul ra,t5,ra
    addi a6,ra,    4
    lw ra, 16(sp) 
    add ra,ra,a6
    li a6, 0
    sw a6,0(ra)
    addi t5,t5,    1
    j	__forcondBB2
__forbodyBB1:
    call	getInt
    mv	s7,a0 
    call	getInt
    mv	s3,a0 
    call	getInt
    lw s10, 4(sp) 
    sw s7, 0(sp) 
    mv	s7,a0 
    li a0, 12
    call malloc
    add t5,a0,zero
    lw ra, 0(sp) 
    sw ra,0(t5)
    addi t5,a0,    4
    sw s3,0(t5)
    addi t5,a0,    8
    sw s7,0(t5)
    add ra,s10,zero
    addi t5,s10,    12
    lw a6, 0(ra)
    lw ra, 0(t5)
    li t5, 12
    mul t5,ra,t5
    addi t5,t5,    4
    add t5,a6,t5
    sw a0,0(t5)
    addi t5,s10,    8
    lw a6, 0(t5)
    li t5, 4
    lw ra, 0(sp) 
    mul t5,ra,t5
    addi t5,t5,    4
    add a6,a6,t5
    addi t5,s10,    4
    addi ra,s10,    12
    lw a1, 0(t5)
    lw ra, 0(ra)
    li t5, 4
    mul t5,ra,t5
    addi t5,t5,    4
    add t5,a1,t5
    lw ra, 0(a6)
    sw ra,0(t5)
    addi ra,s10,    12
    addi t5,s10,    8
    lw a6, 0(t5)
    li a1, 4
    lw t5, 0(sp) 
    mul t5,t5,a1
    addi t5,t5,    4
    add a6,a6,t5
    lw t5, 0(ra)
    sw t5,0(a6)
    addi t5,s10,    12
    lw ra, 0(t5)
    addi ra,ra,    1
    sw ra,0(t5)
    addi s4,s4,    1
    j	__forcondBB1
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
