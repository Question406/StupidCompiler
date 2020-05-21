    .text
    .globl	Array_Node.front				#begin
    .p2align	2
    .type	Array_Node.front,@function
Array_Node.front:
Array_Node.front.entryBB1:
    lw a3, 0(a0)
    lw a0, 4(a3)
    ret
								 # func end
    .globl	Array_Node.doubleStorage				#begin
    .p2align	2
    .type	Array_Node.doubleStorage,@function
Array_Node.doubleStorage:
Array_Node.doubleStorage.entryBB1:
    addi sp,sp,    -32
    sw ra, 0(sp) 
    sw s11, 4(sp) 
    sw s10, 8(sp) 
    sw s9, 12(sp) 
    sw s8, 16(sp) 
    mv	s10,a0 
    lw s9, 0(s10)
    lw s8, 4(s10)
    mv	a0,s9 
    call	_arraySize
    slli s11,a0,    1
    slli a3,s11,    2
    addi a0,a3,    4
    call malloc
    sw s11,0(a0)
    sw a0,0(s10)
    li a3, 0
    sw a3,4(s10)
    j	forcondBB1
forcondBB1:
    lw a3, 4(s10)
    bne	a3,s8,	forbodyBB1
    j	afterForBB1
forbodyBB1:
    lw a3, 4(s10)
    slli a3,a3,    2
    addi a3,a3,    4
    add a3,s9,a3
    lw ra, 0(s10)
    lw a2, 4(s10)
    slli a2,a2,    2
    addi a2,a2,    4
    add a2,ra,a2
    lw a3, 0(a3)
    sw a3,0(a2)
    addi a2,s10,    4
    lw a3, 0(a2)
    addi a3,a3,    1
    sw a3,0(a2)
    j	forcondBB1
afterForBB1:
    lw s8, 16(sp) 
    lw s9, 12(sp) 
    lw s10, 8(sp) 
    lw s11, 4(sp) 
    lw ra, 0(sp) 
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
    slli a3,a1,    1
    addi a3,a3,    1
    slli a2,a1,    1
    addi a2,a2,    2
    add t0,a0,zero
    lw ra, 0(t0)
    lw ra, 4(ra)
    blt	a3,ra,	ifTrue1
    j	paracopy1
paracopy1:
    mv	a3,a1 
    j	if_end1
if_end1:
    lw ra, 0(t0)
    lw ra, 4(ra)
    blt	a2,ra,	ifTrue2
    j	paracopy2
ifTrue2:
    lw ra, 0(a0)
    lw a4, 0(ra)
    slli ra,a2,    2
    addi ra,ra,    4
    add ra,a4,ra
    lw ra, 0(ra)
    addi a4,ra,    4
    lw ra, 0(a4)
    sub t0,zero,ra
    sw ra,0(a4)
    lw ra, 0(a0)
    lw ra, 0(ra)
    slli a4,a3,    2
    addi a4,a4,    4
    add ra,ra,a4
    lw ra, 0(ra)
    addi t5,ra,    4
    lw a4, 0(t5)
    sub ra,zero,a4
    sw a4,0(t5)
    bgt	t0,ra,	if_thenBB1
    j	paracopy3
if_thenBB1:
    mv	a3,a2 
    j	if_end2
if_end2:
    beq	a3,a1,	Heap_Node.maxHeapify.exitBB1
    j	if_end3
if_end3:
    lw t5, 0(a0)
    lw a2, 0(t5)
    slli ra,a1,    2
    addi ra,ra,    4
    add a2,a2,ra
    lw a4, 0(a2)
    lw ra, 0(t5)
    slli a2,a3,    2
    addi a2,a2,    4
    add a2,ra,a2
    lw t0, 0(t5)
    slli ra,a1,    2
    addi ra,ra,    4
    add ra,t0,ra
    lw a2, 0(a2)
    sw a2,0(ra)
    lw a2, 0(t5)
    slli ra,a3,    2
    addi ra,ra,    4
    add a2,a2,ra
    sw a4,0(a2)
    mv	a1,a3 
    call	Heap_Node.maxHeapify
    j	Heap_Node.maxHeapify.exitBB1
Heap_Node.maxHeapify.exitBB1:
    lw ra, 0(sp) 
    addi sp,sp,    16
    ret
paracopy3:
    j	if_end2
paracopy2:
    j	if_end2
ifTrue1:
    lw ra, 0(a0)
    lw ra, 0(ra)
    slli a4,a3,    2
    addi a4,a4,    4
    add ra,ra,a4
    lw ra, 0(ra)
    addi ra,ra,    4
    lw a4, 0(ra)
    sub t5,zero,a4
    sw a4,0(ra)
    lw ra, 0(a0)
    lw a4, 0(ra)
    slli ra,a1,    2
    addi ra,ra,    4
    add ra,a4,ra
    lw ra, 0(ra)
    addi a4,ra,    4
    lw ra, 0(a4)
    sub a5,zero,ra
    sw ra,0(a4)
    bgt	t5,a5,	if_thenBB2
    j	paracopy4
paracopy4:
    mv	a3,a1 
    j	if_end1
if_thenBB2:
    j	if_end1
								 # func end
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -80
    sw ra, 4(sp) 
    sw s11, 52(sp) 
    sw s10, 48(sp) 
    sw s9, 20(sp) 
    sw s8, 60(sp) 
    sw s7, 0(sp) 
    sw s6, 56(sp) 
    sw s5, 8(sp) 
    sw s4, 44(sp) 
    sw s3, 36(sp) 
    sw s2, 32(sp) 
    sw s1, 24(sp) 
    sw s0, 40(sp) 
    call	getInt
    mv	s9,a0 
    call	getInt
    mv	s3,a0 
    li a0, 16
    call malloc
    mv	s11,a0 
    slli a3,s3,    2
    addi a0,a3,    4
    call malloc
    sw s3,0(a0)
    sw a0,0(s11)
    slli a3,s3,    2
    addi a0,a3,    4
    call malloc
    sw s3,0(a0)
    sw a0,4(s11)
    slli a3,s9,    2
    addi a0,a3,    4
    call malloc
    sw s9,0(a0)
    sw a0,8(s11)
    mv	a3,zero 
    j	_forcondBB1
_forcondBB1:
    blt	a3,s3,	_forbodyBB1
    j	_afterForBB1
_afterForBB1:
    mv	a3,zero 
    j	_forcondBB2
_forcondBB2:
    blt	a3,s9,	_forbodyBB2
    j	afterCallBB1
afterCallBB1:
    li a3, 0
    sw a3,12(s11)
    mv	s6,zero 
    j	__forcondBB1
__forcondBB1:
    blt	s6,s3,	__forbodyBB1
    j	_afterCallBB1
__forbodyBB1:
    call	getInt
    mv	s4,a0 
    call	getInt
    mv	s0,a0 
    call	getInt
    mv	s5,a0 
    li a0, 12
    call malloc
    sw s4,0(a0)
    sw s0,4(a0)
    sw s5,8(a0)
    lw a2, 0(s11)
    lw a3, 12(s11)
    slli a3,a3,    2
    addi a3,a3,    4
    add a3,a2,a3
    sw a0,0(a3)
    lw a2, 8(s11)
    slli a3,s4,    2
    addi a3,a3,    4
    add ra,a2,a3
    lw a2, 4(s11)
    lw a3, 12(s11)
    slli a3,a3,    2
    addi a3,a3,    4
    add a3,a2,a3
    lw a2, 0(ra)
    sw a2,0(a3)
    lw a2, 8(s11)
    slli a3,s4,    2
    addi a3,a3,    4
    add a2,a2,a3
    lw a3, 12(s11)
    sw a3,0(a2)
    addi a2,s11,    12
    lw a3, 0(a2)
    addi a3,a3,    1
    sw a3,0(a2)
    addi s6,s6,    1
    j	__forcondBB1
_afterCallBB1:
    mv	s8,zero 
    j	_forcondBB3
_forcondBB3:
    blt	s8,s9,	_forbodyBB3
    j	afterCallBB2
afterCallBB2:
    lw s0, 40(sp) 
    lw s1, 24(sp) 
    lw s2, 32(sp) 
    lw s3, 36(sp) 
    lw s4, 44(sp) 
    lw s5, 8(sp) 
    lw s6, 56(sp) 
    lw s7, 0(sp) 
    lw s8, 60(sp) 
    lw s9, 20(sp) 
    lw s10, 48(sp) 
    lw s11, 52(sp) 
    lw ra, 4(sp) 
    mv	a0,zero 
    addi sp,sp,    80
    ret
_forbodyBB3:
    slli a3,s9,    2
    addi a0,a3,    4
    call malloc
    mv	s10,a0 
    sw s9,0(s10)
    slli a3,s9,    2
    addi a0,a3,    4
    call malloc
    mv	s3,a0 
    sw s9,0(s3)
    mv	a3,zero 
    j	__forcondBB2
__forcondBB2:
    blt	a3,s9,	__forbodyBB2
    j	__afterForBB1
__afterForBB1:
    slli a3,s8,    2
    addi a3,a3,    4
    add a3,s3,a3
    li a2, 0
    sw a2,0(a3)
    li a0, 4
    call malloc
    mv	s5,a0 
    li a0, 8
    call malloc
    mv	s0,a0 
    li a3, 0
    sw a3,4(s0)
    li a0, 68
    call malloc
    li a3, 16
    sw a3,0(a0)
    sw a0,0(s0)
    sw s0,0(s5)
    li a0, 8
    call malloc
    mv	s1,a0 
    li a3, 0
    sw a3,4(s1)
    sw s8,0(s1)
    add a3,s5,zero
    sw a3, 12(sp) 
    lw s6, 0(a3)
    lw s0, 4(s6)
    lw a0, 0(s6)
    call	_arraySize
    beq	s0,a0,	____if_thenBB1
    j	___afterCallBB1
____if_thenBB1:
    lw s0, 0(s6)
    lw s4, 4(s6)
    mv	a0,s0 
    call	_arraySize
    slli s2,a0,    1
    slli a3,s2,    2
    addi a0,a3,    4
    call malloc
    sw s2,0(a0)
    sw a0,0(s6)
    li a3, 0
    sw a3,4(s6)
    j	_forcondBB4
_forcondBB4:
    lw a3, 4(s6)
    bne	a3,s4,	_forbodyBB4
    j	___afterCallBB1
___afterCallBB1:
    lw a2, 0(s6)
    lw a3, 4(s6)
    slli a3,a3,    2
    addi a3,a3,    4
    add a3,a2,a3
    sw s1,0(a3)
    addi a2,s6,    4
    lw a3, 0(a2)
    addi a3,a3,    1
    sw a3,0(a2)
    add s6,s5,zero
    lw a3, 0(s6)
    lw a3, 4(a3)
    li a2, 1
    sub a3,a3,a2
    j	___whileCondBB1
___whileCondBB1:
    bgt	a3,zero,	___whileBodyBB1
    j	__whileCondBB1
__whileCondBB1:
    lw a3, 0(s6)
    lw a3, 4(a3)
    bne	a3,zero,	__whileBodyBB1
    j	_afterCallBB2
__whileBodyBB1:
    lw a3, 0(s5)
    lw a3, 0(a3)
    lw s0, 4(a3)
    lw t0, 0(s5)
    lw a3, 0(s6)
    lw a2, 4(a3)
    li a3, 1
    sub a4,a2,a3
    lw a3, 0(t0)
    lw a3, 4(a3)
    lw ra, 0(t0)
    slli a2,a4,    2
    addi a2,a2,    4
    add a2,ra,a2
    lw ra, 0(t0)
    lw a2, 0(a2)
    sw a2,4(ra)
    lw ra, 0(t0)
    slli a2,a4,    2
    addi a2,a2,    4
    add a2,ra,a2
    sw a3,0(a2)
    lw a3, 0(s5)
    addi ra,a3,    4
    lw a4, 0(ra)
    li a2, 1
    sub a2,a4,a2
    sw a2,0(ra)
    lw a2, 0(a3)
    lw a3, 4(a3)
    slli a3,a3,    2
    addi a3,a3,    4
    add a3,a2,a3
    lw a3, 0(a3)
    mv	a0,s5 
    mv	a1,zero 
    call	Heap_Node.maxHeapify
    lw s1, 0(s0)
    slli a3,s1,    2
    addi a3,a3,    4
    add a3,s10,a3
    lw a2, 0(a3)
    li a3, 1
    beq	a2,a3,	__whileCondBB1
    j	__if_end1
__if_end1:
    slli a3,s1,    2
    addi a3,a3,    4
    add a2,s10,a3
    li a3, 1
    sw a3,0(a2)
    lw a3, 8(s11)
    slli a2,s1,    2
    addi a2,a2,    4
    add a3,a3,a2
    lw a3, 0(a3)
    mv	s4,a3 
    j	__forcondBB3
__forcondBB3:
    li a3, -1
    bne	s4,a3,	__forbodyBB3
    j	__whileCondBB1
__forbodyBB3:
    lw a2, 0(s11)
    slli a3,s4,    2
    addi a3,a3,    4
    add a3,a2,a3
    lw a3, 0(a3)
    lw s0, 4(a3)
    lw a2, 0(s11)
    slli a3,s4,    2
    addi a3,a3,    4
    add a3,a2,a3
    lw a3, 0(a3)
    lw a2, 8(a3)
    slli a3,s1,    2
    addi a3,a3,    4
    add a3,s3,a3
    lw a3, 0(a3)
    add a2,a3,a2
    slli a3,s0,    2
    addi a3,a3,    4
    add a3,s3,a3
    lw a3, 0(a3)
    bge	a2,a3,	__forupdateBB1
    j	__if_end2
__if_end2:
    slli a3,s0,    2
    addi a3,a3,    4
    add a3,s3,a3
    sw a2,0(a3)
    li a0, 8
    call malloc
    mv	s2,a0 
    sw s0,0(s2)
    slli a3,s0,    2
    addi a3,a3,    4
    add a3,s3,a3
    lw a3, 0(a3)
    sw a3,4(s2)
    lw a3, 12(sp) 
    lw s0, 0(a3)
    lw s7, 4(s0)
    lw a0, 0(s0)
    call	_arraySize
    beq	s7,a0,	____if_thenBB2
    j	___afterCallBB2
___afterCallBB2:
    lw a2, 0(s0)
    lw a3, 4(s0)
    slli a3,a3,    2
    addi a3,a3,    4
    add a3,a2,a3
    sw s2,0(a3)
    addi a2,s0,    4
    lw a3, 0(a2)
    addi a3,a3,    1
    sw a3,0(a2)
    lw a3, 0(s6)
    lw a3, 4(a3)
    li a2, 1
    sub a3,a3,a2
    j	___whileCondBB2
___whileCondBB2:
    bgt	a3,zero,	___whileBodyBB2
    j	__forupdateBB1
___whileBodyBB2:
    li a2, 1
    sub a2,a3,a2
    srai a2,a2,    1
    lw ra, 0(s5)
    lw ra, 0(ra)
    slli a4,a2,    2
    addi a4,a4,    4
    add ra,ra,a4
    lw ra, 0(ra)
    addi ra,ra,    4
    lw a4, 0(ra)
    sub t0,zero,a4
    sw a4,0(ra)
    lw ra, 0(s5)
    lw a4, 0(ra)
    slli ra,a3,    2
    addi ra,ra,    4
    add ra,a4,ra
    lw ra, 0(ra)
    addi a4,ra,    4
    lw ra, 0(a4)
    sub t5,zero,ra
    sw ra,0(a4)
    bge	t0,t5,	__forupdateBB1
    j	___if_end1
__forupdateBB1:
    lw a2, 4(s11)
    slli a3,s4,    2
    addi a3,a3,    4
    add a3,a2,a3
    lw a3, 0(a3)
    mv	s4,a3 
    j	__forcondBB3
___if_end1:
    lw a4, 0(s5)
    lw t0, 0(a4)
    slli ra,a2,    2
    addi ra,ra,    4
    add ra,t0,ra
    lw t5, 0(ra)
    lw ra, 0(a4)
    slli t0,a3,    2
    addi t0,t0,    4
    add ra,ra,t0
    lw a5, 0(a4)
    slli t0,a2,    2
    addi t0,t0,    4
    add t0,a5,t0
    lw ra, 0(ra)
    sw ra,0(t0)
    lw ra, 0(a4)
    slli a3,a3,    2
    addi a3,a3,    4
    add a3,ra,a3
    sw t5,0(a3)
    mv	a3,a2 
    j	___whileCondBB2
____if_thenBB2:
    lw s7, 0(s0)
    lw a3, 4(s0)
    sw a3, 28(sp) 
    mv	a0,s7 
    call	_arraySize
    slli a3,a0,    1
    sw a3, 16(sp) 
    slli a3,a3,    2
    addi a0,a3,    4
    call malloc
    lw a3, 16(sp) 
    sw a3,0(a0)
    sw a0,0(s0)
    li a3, 0
    sw a3,4(s0)
    j	_forcondBB5
_forcondBB5:
    lw a2, 4(s0)
    lw a3, 28(sp) 
    bne	a2,a3,	_forbodyBB5
    j	___afterCallBB2
_forbodyBB5:
    lw a3, 4(s0)
    slli a3,a3,    2
    addi a3,a3,    4
    add a2,s7,a3
    lw ra, 0(s0)
    lw a3, 4(s0)
    slli a3,a3,    2
    addi a3,a3,    4
    add ra,ra,a3
    lw a3, 0(a2)
    sw a3,0(ra)
    addi a3,s0,    4
    lw a2, 0(a3)
    addi a2,a2,    1
    sw a2,0(a3)
    j	_forcondBB5
_afterCallBB2:
    mv	s5,zero 
    j	_forcondBB6
_forcondBB6:
    blt	s5,s9,	_forbodyBB6
    j	_afterForBB2
_forbodyBB6:
    slli a3,s5,    2
    addi a3,a3,    4
    add a3,s3,a3
    lw a3, 0(a3)
    li a2, 10000000
    beq	a3,a2,	_if_thenBB1
    j	_if_elseBB1
_if_thenBB1:
    la a0,_globalStr2    
    call	print
    j	_if_end1
_if_end1:
    la a0,_globalStr1    
    call	print
    addi s5,s5,    1
    j	_forcondBB6
_if_elseBB1:
    slli a3,s5,    2
    addi a3,a3,    4
    add a3,s3,a3
    lw a0, 0(a3)
    call	printInt
    j	_if_end1
_afterForBB2:
    la a0,_globalStr0    
    call	println
    addi a3,s8,    1
    mv	s8,a3 
    j	_forcondBB3
___whileBodyBB1:
    li a2, 1
    sub a2,a3,a2
    srai a2,a2,    1
    lw ra, 0(s5)
    lw a4, 0(ra)
    slli ra,a2,    2
    addi ra,ra,    4
    add ra,a4,ra
    lw ra, 0(ra)
    addi ra,ra,    4
    lw a4, 0(ra)
    sub t0,zero,a4
    sw a4,0(ra)
    lw ra, 0(s5)
    lw a4, 0(ra)
    slli ra,a3,    2
    addi ra,ra,    4
    add ra,a4,ra
    lw ra, 0(ra)
    addi t5,ra,    4
    lw ra, 0(t5)
    sub a4,zero,ra
    sw ra,0(t5)
    bge	t0,a4,	__whileCondBB1
    j	___if_end2
___if_end2:
    lw t0, 0(s5)
    lw a4, 0(t0)
    slli ra,a2,    2
    addi ra,ra,    4
    add ra,a4,ra
    lw ra, 0(ra)
    lw a4, 0(t0)
    slli t5,a3,    2
    addi t5,t5,    4
    add t5,a4,t5
    lw a4, 0(t0)
    slli a5,a2,    2
    addi a5,a5,    4
    add a4,a4,a5
    lw t5, 0(t5)
    sw t5,0(a4)
    lw a4, 0(t0)
    slli a3,a3,    2
    addi a3,a3,    4
    add a3,a4,a3
    sw ra,0(a3)
    mv	a3,a2 
    j	___whileCondBB1
_forbodyBB4:
    lw a3, 4(s6)
    slli a3,a3,    2
    addi a3,a3,    4
    add ra,s0,a3
    lw a3, 0(s6)
    lw a2, 4(s6)
    slli a2,a2,    2
    addi a2,a2,    4
    add a2,a3,a2
    lw a3, 0(ra)
    sw a3,0(a2)
    addi a3,s6,    4
    lw a2, 0(a3)
    addi a2,a2,    1
    sw a2,0(a3)
    j	_forcondBB4
__forbodyBB2:
    slli a2,a3,    2
    addi a2,a2,    4
    add a2,s3,a2
    li ra, 10000000
    sw ra,0(a2)
    slli a2,a3,    2
    addi a2,a2,    4
    add ra,s10,a2
    li a2, 0
    sw a2,0(ra)
    addi a3,a3,    1
    j	__forcondBB2
_forbodyBB2:
    lw ra, 8(s11)
    slli a2,a3,    2
    addi a2,a2,    4
    add a2,ra,a2
    li ra, -1
    sw ra,0(a2)
    addi a3,a3,    1
    j	_forcondBB2
_forbodyBB1:
    lw ra, 4(s11)
    slli a2,a3,    2
    addi a2,a2,    4
    add ra,ra,a2
    li a2, -1
    sw a2,0(ra)
    addi a3,a3,    1
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
