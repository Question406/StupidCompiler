    .text
    .globl	Array_Node.front				#begin
    .p2align	2
    .type	Array_Node.front,@function
Array_Node.front:
Array_Node.front.entryBB1:
    lw a7, 0(a0)
    lw a0, 4(a7)
    ret
								 # func end
    .globl	Array_Node.doubleStorage				#begin
    .p2align	2
    .type	Array_Node.doubleStorage,@function
Array_Node.doubleStorage:
Array_Node.doubleStorage.entryBB1:
    addi sp,sp,    -32
    sw ra, 4(sp) 
    sw s10, 0(sp) 
    sw s11, 8(sp) 
    sw s0, 12(sp) 
    sw s1, 16(sp) 
    mv	s1,s2 
    mv	s10,a0 
    lw a7, 0(s10)
    mv	s11,a7 
    lw a7, 4(s10)
    mv	s0,a7 
    mv	a0,s11 
    call	_arraySize
    slli s2,a0,    1
    slli a7,s2,    2
    addi a0,a7,    4
    call malloc
    sw s2,0(a0)
    sw a0,0(s10)
    li a7, 0
    sw a7,4(s10)
    j	forcondBB1
forcondBB1:
    lw a7, 4(s10)
    bne	a7,s0,	forbodyBB1
    j	afterForBB1
forbodyBB1:
    lw a7, 4(s10)
    slli a7,a7,    2
    addi a7,a7,    4
    add t5,s11,a7
    lw a1, 0(s10)
    lw a7, 4(s10)
    slli a7,a7,    2
    addi a7,a7,    4
    add a1,a1,a7
    lw a7, 0(t5)
    sw a7,0(a1)
    addi a7,s10,    4
    lw a1, 0(a7)
    addi a1,a1,    1
    sw a1,0(a7)
    j	forcondBB1
afterForBB1:
    mv	s2,s1 
    lw s1, 16(sp) 
    lw s0, 12(sp) 
    lw s11, 8(sp) 
    lw s10, 0(sp) 
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
    mv	t5,a1 
    slli a7,t5,    1
    addi a5,a7,    1
    slli a7,t5,    1
    addi ra,a7,    2
    mv	a1,t5 
    lw a7, 0(a0)
    lw a7, 4(a7)
    blt	a5,a7,	ifTrue1
    j	paracopy1
ifTrue1:
    lw a7, 0(a0)
    lw a2, 0(a7)
    slli a7,a5,    2
    addi a7,a7,    4
    add a7,a2,a7
    lw a7, 0(a7)
    addi t6,a7,    4
    lw a7, 0(t6)
    sub a2,zero,a7
    sw a7,0(t6)
    lw a7, 0(a0)
    lw t6, 0(a7)
    slli a7,a1,    2
    addi a7,a7,    4
    add a7,t6,a7
    lw a7, 0(a7)
    addi t6,a7,    4
    lw t4, 0(t6)
    sub a7,zero,t4
    sw t4,0(t6)
    bgt	a2,a7,	if_thenBB1
    j	paracopy2
if_thenBB1:
    mv	a1,a5 
    j	if_end1
if_end1:
    lw a7, 0(a0)
    lw a7, 4(a7)
    blt	ra,a7,	ifTrue2
    j	paracopy3
paracopy3:
    j	if_end2
if_end2:
    beq	a1,t5,	Heap_Node.maxHeapify.exitBB1
    j	if_end3
if_end3:
    lw a7, 0(a0)
    lw a2, 0(a7)
    slli ra,t5,    2
    addi ra,ra,    4
    add ra,a2,ra
    lw ra, 0(ra)
    lw a5, 0(a7)
    slli a2,a1,    2
    addi a2,a2,    4
    add a2,a5,a2
    lw a5, 0(a7)
    slli t5,t5,    2
    addi t5,t5,    4
    add t5,a5,t5
    lw a2, 0(a2)
    sw a2,0(t5)
    lw t5, 0(a7)
    slli a7,a1,    2
    addi a7,a7,    4
    add a7,t5,a7
    sw ra,0(a7)
    call	Heap_Node.maxHeapify
    j	Heap_Node.maxHeapify.exitBB1
Heap_Node.maxHeapify.exitBB1:
    lw ra, 0(sp) 
    addi sp,sp,    16
    ret
ifTrue2:
    lw a7, 0(a0)
    lw a2, 0(a7)
    slli a7,ra,    2
    addi a7,a7,    4
    add a7,a2,a7
    lw a7, 0(a7)
    addi a7,a7,    4
    lw a5, 0(a7)
    sub a2,zero,a5
    sw a5,0(a7)
    lw a7, 0(a0)
    lw a5, 0(a7)
    slli a7,a1,    2
    addi a7,a7,    4
    add a7,a5,a7
    lw a7, 0(a7)
    addi t6,a7,    4
    lw a5, 0(t6)
    sub a7,zero,a5
    sw a5,0(t6)
    bgt	a2,a7,	if_thenBB2
    j	paracopy4
if_thenBB2:
    mv	a1,ra 
    j	if_end2
paracopy4:
    j	if_end2
paracopy2:
    j	if_end1
paracopy1:
    j	if_end1
								 # func end
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -64
    sw ra, 24(sp) 
    sw s10, 28(sp) 
    sw s11, 8(sp) 
    sw s0, 4(sp) 
    sw s1, 20(sp) 
    sw s2, 32(sp) 
    sw s3, 36(sp) 
    sw s4, 40(sp) 
    sw s5, 52(sp) 
    sw s6, 48(sp) 
    sw s7, 0(sp) 
    sw s8, 16(sp) 
    sw s9, 12(sp) 
    call	getInt
    mv	s3,a0 
    call	getInt
    mv	s6,a0 
    li a0, 16
    call malloc
    mv	s2,a0 
    mv	s11,s2 
    mv	s7,s3 
    slli a7,s6,    2
    addi a0,a7,    4
    call malloc
    sw s6,0(a0)
    sw a0,0(s11)
    slli a7,s6,    2
    addi a0,a7,    4
    call malloc
    sw s6,0(a0)
    sw a0,4(s11)
    slli a7,s7,    2
    addi a0,a7,    4
    call malloc
    sw s7,0(a0)
    sw a0,8(s11)
    mv	a7,zero 
    j	_forcondBB1
_forcondBB1:
    blt	a7,s6,	_forbodyBB1
    j	_afterForBB1
_afterForBB1:
    mv	a7,zero 
    j	_forcondBB2
_forcondBB2:
    blt	a7,s7,	_forbodyBB2
    j	afterCallBB1
afterCallBB1:
    li a7, 0
    sw a7,12(s11)
    mv	s11,zero 
    j	__forcondBB1
__forcondBB1:
    blt	s11,s6,	__forbodyBB1
    j	_afterCallBB1
__forbodyBB1:
    call	getInt
    mv	s0,a0 
    call	getInt
    mv	s10,a0 
    call	getInt
    mv	s8,a0 
    mv	s7,s2 
    li a0, 12
    call malloc
    sw s0,0(a0)
    sw s10,4(a0)
    sw s8,8(a0)
    lw a1, 0(s7)
    lw a7, 12(s7)
    slli a7,a7,    2
    addi a7,a7,    4
    add a7,a1,a7
    sw a0,0(a7)
    lw a1, 8(s7)
    slli a7,s0,    2
    addi a7,a7,    4
    add a1,a1,a7
    lw a7, 4(s7)
    lw t5, 12(s7)
    slli t5,t5,    2
    addi t5,t5,    4
    add t5,a7,t5
    lw a7, 0(a1)
    sw a7,0(t5)
    lw a7, 8(s7)
    slli a1,s0,    2
    addi a1,a1,    4
    add a1,a7,a1
    lw a7, 12(s7)
    sw a7,0(a1)
    addi a1,s7,    12
    lw a7, 0(a1)
    addi a7,a7,    1
    sw a7,0(a1)
    addi s11,s11,    1
    j	__forcondBB1
_afterCallBB1:
    mv	s1,zero 
    j	_forcondBB3
_forcondBB3:
    blt	s1,s3,	_forbodyBB3
    j	afterCallBB2
afterCallBB2:
    lw s9, 12(sp) 
    lw s8, 16(sp) 
    lw s7, 0(sp) 
    lw s6, 48(sp) 
    lw s5, 52(sp) 
    lw s4, 40(sp) 
    lw s3, 36(sp) 
    lw s2, 32(sp) 
    lw s1, 20(sp) 
    lw s0, 4(sp) 
    lw s11, 8(sp) 
    lw s10, 28(sp) 
    lw ra, 24(sp) 
    mv	a0,zero 
    addi sp,sp,    64
    ret
_forbodyBB3:
    mv	s11,s1 
    slli a7,s3,    2
    addi a0,a7,    4
    call malloc
    sw s3,0(a0)
    mv	s10,a0 
    slli a7,s3,    2
    addi a0,a7,    4
    call malloc
    sw s3,0(a0)
    mv	s5,a0 
    mv	a7,zero 
    j	__forcondBB2
__forcondBB2:
    blt	a7,s3,	__forbodyBB2
    j	__afterForBB1
__afterForBB1:
    slli a7,s11,    2
    addi a7,a7,    4
    add a1,s5,a7
    li a7, 0
    sw a7,0(a1)
    li a0, 4
    call malloc
    mv	s7,a0 
    li a0, 8
    call malloc
    mv	s8,a0 
    li a7, 0
    sw a7,4(s8)
    li a0, 68
    call malloc
    li a7, 16
    sw a7,0(a0)
    sw a0,0(s8)
    sw s8,0(s7)
    li a0, 8
    call malloc
    li a7, 0
    sw a7,4(a0)
    sw s11,0(a0)
    lw a7, 0(s7)
    mv	s0,a7 
    mv	s8,a0 
    mv	a7,s0 
    lw s11, 4(a7)
    lw a0, 0(s0)
    call	_arraySize
    beq	s11,a0,	____if_thenBB1
    j	___afterCallBB1
____if_thenBB1:
    lw a7, 0(s0)
    mv	s6,a7 
    lw a7, 4(s0)
    mv	s9,a7 
    mv	a0,s6 
    call	_arraySize
    slli s11,a0,    1
    slli a7,s11,    2
    addi a0,a7,    4
    call malloc
    sw s11,0(a0)
    sw a0,0(s0)
    li a7, 0
    sw a7,4(s0)
    j	_forcondBB4
_forcondBB4:
    lw a7, 4(s0)
    bne	a7,s9,	_forbodyBB4
    j	___afterCallBB1
___afterCallBB1:
    lw a1, 0(s0)
    lw a7, 4(s0)
    slli a7,a7,    2
    addi a7,a7,    4
    add a7,a1,a7
    sw s8,0(a7)
    addi a1,s0,    4
    lw a7, 0(a1)
    addi a7,a7,    1
    sw a7,0(a1)
    mv	a7,s7 
    lw a7, 0(a7)
    lw a7, 4(a7)
    li a1, 1
    sub a1,a7,a1
    j	___whileCondBB1
___whileCondBB1:
    bgt	a1,zero,	___whileBodyBB1
    j	__whileCondBB1
__whileCondBB1:
    mv	a7,s7 
    lw a7, 0(a7)
    lw a7, 4(a7)
    bne	a7,zero,	__whileBodyBB1
    j	_afterCallBB2
__whileBodyBB1:
    mv	a0,s7 
    lw a7, 0(a0)
    lw a7, 0(a7)
    lw s11, 4(a7)
    lw a1, 0(a0)
    mv	a7,a1 
    lw a7, 4(a7)
    li t5, 1
    sub a7,a7,t5
    lw t5, 0(a1)
    lw t5, 4(t5)
    lw a2, 0(a1)
    slli ra,a7,    2
    addi ra,ra,    4
    add a2,a2,ra
    lw ra, 0(a1)
    lw a2, 0(a2)
    sw a2,4(ra)
    lw a1, 0(a1)
    slli a7,a7,    2
    addi a7,a7,    4
    add a7,a1,a7
    sw t5,0(a7)
    lw a7, 0(a0)
    addi t5,a7,    4
    lw ra, 0(t5)
    li a1, 1
    sub a1,ra,a1
    sw a1,0(t5)
    lw a1, 0(a7)
    lw a7, 4(a7)
    slli a7,a7,    2
    addi a7,a7,    4
    add a7,a1,a7
    lw a7, 0(a7)
    mv	a1,zero 
    call	Heap_Node.maxHeapify
    lw a7, 0(s11)
    mv	s6,a7 
    slli a7,s6,    2
    addi a7,a7,    4
    add a7,s10,a7
    lw a7, 0(a7)
    li a1, 1
    beq	a7,a1,	__whileCondBB1
    j	__if_end1
__if_end1:
    slli a7,s6,    2
    addi a7,a7,    4
    add a7,s10,a7
    li a1, 1
    sw a1,0(a7)
    lw a1, 8(s2)
    slli a7,s6,    2
    addi a7,a7,    4
    add a7,a1,a7
    lw a7, 0(a7)
    mv	s11,a7 
    j	__forcondBB3
__forcondBB3:
    li a7, -1
    bne	s11,a7,	__forbodyBB3
    j	__whileCondBB1
__forbodyBB3:
    lw a1, 0(s2)
    slli a7,s11,    2
    addi a7,a7,    4
    add a7,a1,a7
    lw a7, 0(a7)
    lw s8, 4(a7)
    lw a1, 0(s2)
    slli a7,s11,    2
    addi a7,a7,    4
    add a7,a1,a7
    lw a7, 0(a7)
    lw a7, 8(a7)
    slli a1,s6,    2
    addi a1,a1,    4
    add a1,s5,a1
    lw a1, 0(a1)
    add a7,a1,a7
    slli a1,s8,    2
    addi a1,a1,    4
    add a1,s5,a1
    lw a1, 0(a1)
    bge	a7,a1,	__forupdateBB1
    j	__if_end2
__if_end2:
    slli a1,s8,    2
    addi a1,a1,    4
    add a1,s5,a1
    sw a7,0(a1)
    li a0, 8
    call malloc
    sw s8,0(a0)
    slli a7,s8,    2
    addi a7,a7,    4
    add a7,s5,a7
    lw a7, 0(a7)
    sw a7,4(a0)
    lw a7, 0(s7)
    mv	s8,a7 
    sw a0, 44(sp) 
    mv	a7,s8 
    lw s0, 4(a7)
    lw a0, 0(s8)
    call	_arraySize
    beq	s0,a0,	____if_thenBB2
    j	___afterCallBB2
___afterCallBB2:
    lw a1, 0(s8)
    lw a7, 4(s8)
    slli a7,a7,    2
    addi a7,a7,    4
    add a1,a1,a7
    lw a7, 44(sp) 
    sw a7,0(a1)
    addi a7,s8,    4
    lw a1, 0(a7)
    addi a1,a1,    1
    sw a1,0(a7)
    mv	a7,s7 
    lw a7, 0(a7)
    lw a7, 4(a7)
    li a1, 1
    sub t5,a7,a1
    j	___whileCondBB2
___whileCondBB2:
    bgt	t5,zero,	___whileBodyBB2
    j	__forupdateBB1
___whileBodyBB2:
    li a7, 1
    sub a7,t5,a7
    srai a1,a7,    1
    lw a7, 0(s7)
    lw ra, 0(a7)
    slli a7,a1,    2
    addi a7,a7,    4
    add a7,ra,a7
    lw a7, 0(a7)
    addi ra,a7,    4
    lw a2, 0(ra)
    sub a7,zero,a2
    sw a2,0(ra)
    lw ra, 0(s7)
    lw ra, 0(ra)
    slli a2,t5,    2
    addi a2,a2,    4
    add ra,ra,a2
    lw ra, 0(ra)
    addi a5,ra,    4
    lw a2, 0(a5)
    sub ra,zero,a2
    sw a2,0(a5)
    bge	a7,ra,	__forupdateBB1
    j	___if_end1
__forupdateBB1:
    lw a1, 4(s2)
    slli a7,s11,    2
    addi a7,a7,    4
    add a7,a1,a7
    lw a7, 0(a7)
    mv	s11,a7 
    j	__forcondBB3
___if_end1:
    lw ra, 0(s7)
    lw a2, 0(ra)
    slli a7,a1,    2
    addi a7,a7,    4
    add a7,a2,a7
    lw a7, 0(a7)
    lw a5, 0(ra)
    slli a2,t5,    2
    addi a2,a2,    4
    add a5,a5,a2
    lw t6, 0(ra)
    slli a2,a1,    2
    addi a2,a2,    4
    add t6,t6,a2
    lw a2, 0(a5)
    sw a2,0(t6)
    lw ra, 0(ra)
    slli t5,t5,    2
    addi t5,t5,    4
    add t5,ra,t5
    sw a7,0(t5)
    mv	t5,a1 
    j	___whileCondBB2
____if_thenBB2:
    lw a7, 0(s8)
    mv	s0,a7 
    lw a7, 4(s8)
    mv	s4,a7 
    mv	a0,s0 
    call	_arraySize
    slli s9,a0,    1
    slli a7,s9,    2
    addi a0,a7,    4
    call malloc
    sw s9,0(a0)
    sw a0,0(s8)
    li a7, 0
    sw a7,4(s8)
    j	_forcondBB5
_forcondBB5:
    lw a7, 4(s8)
    bne	a7,s4,	_forbodyBB5
    j	___afterCallBB2
_forbodyBB5:
    lw a7, 4(s8)
    slli a7,a7,    2
    addi a7,a7,    4
    add a7,s0,a7
    lw t5, 0(s8)
    lw a1, 4(s8)
    slli a1,a1,    2
    addi a1,a1,    4
    add a1,t5,a1
    lw a7, 0(a7)
    sw a7,0(a1)
    addi a1,s8,    4
    lw a7, 0(a1)
    addi a7,a7,    1
    sw a7,0(a1)
    j	_forcondBB5
_afterCallBB2:
    mv	s7,s5 
    mv	s11,zero 
    j	_forcondBB6
_forcondBB6:
    blt	s11,s3,	_forbodyBB6
    j	_afterForBB2
_forbodyBB6:
    slli a7,s11,    2
    addi a7,a7,    4
    add a7,s7,a7
    lw a7, 0(a7)
    li a1, 10000000
    beq	a7,a1,	_if_thenBB1
    j	_if_elseBB1
_if_thenBB1:
    la a0,_globalStr2    
    call	printInt
    j	_if_end1
_if_end1:
    la a0,_globalStr1    
    call	printInt
    addi s11,s11,    1
    j	_forcondBB6
_if_elseBB1:
    slli a7,s11,    2
    addi a7,a7,    4
    add a7,s7,a7
    lw a0, 0(a7)
    call	printInt
    j	_if_end1
_afterForBB2:
    la a0,_globalStr0    
    call	println
    addi a7,s1,    1
    mv	s1,a7 
    j	_forcondBB3
___whileBodyBB1:
    li a7, 1
    sub a7,a1,a7
    srai t5,a7,    1
    lw a7, 0(s7)
    lw a7, 0(a7)
    slli ra,t5,    2
    addi ra,ra,    4
    add a7,a7,ra
    lw a7, 0(a7)
    addi a7,a7,    4
    lw a2, 0(a7)
    sub ra,zero,a2
    sw a2,0(a7)
    lw a7, 0(s7)
    lw a2, 0(a7)
    slli a7,a1,    2
    addi a7,a7,    4
    add a7,a2,a7
    lw a7, 0(a7)
    addi a5,a7,    4
    lw a2, 0(a5)
    sub a7,zero,a2
    sw a2,0(a5)
    bge	ra,a7,	__whileCondBB1
    j	___if_end2
___if_end2:
    lw a7, 0(s7)
    lw a2, 0(a7)
    slli ra,t5,    2
    addi ra,ra,    4
    add ra,a2,ra
    lw ra, 0(ra)
    lw a5, 0(a7)
    slli a2,a1,    2
    addi a2,a2,    4
    add a5,a5,a2
    lw t6, 0(a7)
    slli a2,t5,    2
    addi a2,a2,    4
    add t6,t6,a2
    lw a2, 0(a5)
    sw a2,0(t6)
    lw a2, 0(a7)
    slli a7,a1,    2
    addi a7,a7,    4
    add a7,a2,a7
    sw ra,0(a7)
    mv	a1,t5 
    j	___whileCondBB1
_forbodyBB4:
    lw a7, 4(s0)
    slli a7,a7,    2
    addi a7,a7,    4
    add a1,s6,a7
    lw a7, 0(s0)
    lw t5, 4(s0)
    slli t5,t5,    2
    addi t5,t5,    4
    add a7,a7,t5
    lw a1, 0(a1)
    sw a1,0(a7)
    addi a7,s0,    4
    lw a1, 0(a7)
    addi a1,a1,    1
    sw a1,0(a7)
    j	_forcondBB4
__forbodyBB2:
    slli a1,a7,    2
    addi a1,a1,    4
    add t5,s5,a1
    li a1, 10000000
    sw a1,0(t5)
    slli a1,a7,    2
    addi a1,a1,    4
    add a1,s10,a1
    li t5, 0
    sw t5,0(a1)
    addi a7,a7,    1
    j	__forcondBB2
_forbodyBB2:
    lw a1, 8(s11)
    slli t5,a7,    2
    addi t5,t5,    4
    add a1,a1,t5
    li t5, -1
    sw t5,0(a1)
    addi a7,a7,    1
    j	_forcondBB2
_forbodyBB1:
    lw t5, 4(s11)
    slli a1,a7,    2
    addi a1,a1,    4
    add t5,t5,a1
    li a1, -1
    sw a1,0(t5)
    addi a7,a7,    1
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
